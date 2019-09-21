Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23C7FBA1CD
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2019 12:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfIVKYb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Sep 2019 06:24:31 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:36246 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbfIVKYb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 22 Sep 2019 06:24:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 331B0FB03;
        Sun, 22 Sep 2019 12:24:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ztD1R8-a_Uuj; Sun, 22 Sep 2019 12:24:29 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id C2A9C48648; Sat, 21 Sep 2019 14:12:12 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] leds: lm3692x: Don't overwrite return value in error path
Date:   Sat, 21 Sep 2019 14:12:09 -0700
Message-Id: <be4c3e89e6285d8d1529967e6198abb51d28fe8b.1569100154.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1569100154.git.agx@sigxcpu.org>
References: <cover.1569100154.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver currently reports successful initialization on every failure
as long as it's able to power off the regulator. Don't check the return
value of regulator_disable to avoid that.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 487228c2bed2..ad76e34455ff 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -198,7 +198,7 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
 static int lm3692x_init(struct lm3692x_led *led)
 {
 	int enable_state;
-	int ret;
+	int ret, reg_ret;
 
 	if (led->regulator) {
 		ret = regulator_enable(led->regulator);
@@ -313,14 +313,15 @@ static int lm3692x_init(struct lm3692x_led *led)
 		gpiod_direction_output(led->enable_gpio, 0);
 
 	if (led->regulator) {
-		ret = regulator_disable(led->regulator);
-		if (ret)
+		reg_ret = regulator_disable(led->regulator);
+		if (reg_ret)
 			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
+				"Failed to disable regulator: %d\n", reg_ret);
 	}
 
 	return ret;
 }
+
 static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
-- 
2.23.0.rc1

