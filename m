Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E2226E877
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgIQWeM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:12 -0400
Received: from mail.nic.cz ([217.31.204.67]:35812 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbgIQWeJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:09 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 7772A140A77;
        Fri, 18 Sep 2020 00:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382037; bh=NfiKEaEUAJO2bf4FPxglihEBwosP24Qc7Px6/FPjqjo=;
        h=From:To:Date;
        b=TjMBLYd9ZwxWUxikfygf7/XJq3tMys5NcxULPRx90XroUUj4XPZeGvopUF+Vzlmxx
         /TaoiaFUjBm4IDDXQeidcUyioZMVRZixmqF/0ExR8IUhiJtFQbV38FoBHfdlxXhvoa
         XyAETDA/JN3b3ge7g/oHFpfwAqd/BxQ74hV5NdQA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH leds v2 23/50] leds: pm8058: cosmetic: use reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:11 +0200
Message-Id: <20200917223338.14164-24-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Only a cosmetic change: use reverse christmas tree variables
declaration.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index 193780a8c0522..80db7e2de420c 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -29,9 +29,9 @@ static void pm8058_led_set(struct led_classdev *cled,
 	enum led_brightness value)
 {
 	struct pm8058_led *led;
-	int ret = 0;
 	unsigned int mask = 0;
 	unsigned int val = 0;
+	int ret = 0;
 
 	led = container_of(cled, struct pm8058_led, cdev);
 	switch (led->ledtype) {
@@ -56,8 +56,8 @@ static void pm8058_led_set(struct led_classdev *cled,
 static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 {
 	struct pm8058_led *led;
-	int ret;
 	unsigned int val;
+	int ret;
 
 	led = container_of(cled, struct pm8058_led, cdev);
 
@@ -89,12 +89,12 @@ static int pm8058_led_probe(struct platform_device *pdev)
 {
 	struct led_init_data init_data = {};
 	struct device *dev = &pdev->dev;
+	enum led_brightness maxbright;
 	struct pm8058_led *led;
 	struct device_node *np;
-	int ret;
 	struct regmap *map;
 	const char *state;
-	enum led_brightness maxbright;
+	int ret;
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
-- 
2.26.2

