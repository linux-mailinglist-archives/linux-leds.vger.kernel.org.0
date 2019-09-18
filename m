Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC75B5999
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 04:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbfIRCUF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 22:20:05 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:35230 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfIRCUE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Sep 2019 22:20:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 5F2C2FB08;
        Wed, 18 Sep 2019 04:20:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0FNKDifricr6; Wed, 18 Sep 2019 04:20:01 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 3741449245; Tue, 17 Sep 2019 19:19:58 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] leds: lm3692x: Handle failure to probe the regulator
Date:   Tue, 17 Sep 2019 19:19:56 -0700
Message-Id: <8491e5df20f4672a242c9072f58c243291cfe752.1568772964.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1568772964.git.agx@sigxcpu.org>
References: <cover.1568772964.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Instead use devm_regulator_get_optional since the regulator
is optional and check for errors.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/leds/leds-lm3692x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index f394669ad8f2..9972c932d51e 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -333,9 +333,14 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		return ret;
 	}
 
-	led->regulator = devm_regulator_get(&led->client->dev, "vled");
-	if (IS_ERR(led->regulator))
-		led->regulator = NULL;
+	led->regulator = devm_regulator_get_optional(&led->client->dev, "vled");
+	if (IS_ERR(led->regulator)) {
+		ret = PTR_ERR(led->regulator);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&led->client->dev,
+				"Failed to get vled regulator: %d\n", ret);
+		return ret;
+	}
 
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
-- 
2.23.0.rc1

