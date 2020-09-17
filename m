Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A3C26E88A
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgIQWef (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:35 -0400
Received: from mail.nic.cz ([217.31.204.67]:35700 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgIQWeS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:18 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 3675414206C;
        Fri, 18 Sep 2020 00:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382042; bh=E+ZKKlISSwDQf/4ZiNjvyLvW12BvjFajZwQ6LoiY+JE=;
        h=From:To:Date;
        b=bZ19GVVCbIEI75Z/bxdlit47JBgBBfNr2aPy6Y/N8k4nDzjA4weJfaHTTZRk4YRDA
         szuGCMu52h1PpTtP0RJrjkZQiFhX1GWzroHsNpJ7VjwwZnr/mYIfrnK0EC3+N6QWdT
         75J8thrYcEbyEbOFMz82E5p+KimKFsRKYqZZtRxM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 47/50] leds: ns2: cosmetic: use reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:35 +0200
Message-Id: <20200917223338.14164-48-marek.behun@nic.cz>
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
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index e94bb8535f0a7..40f36c53d9e87 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -50,9 +50,9 @@ struct ns2_led {
 
 static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mode)
 {
-	int i;
-	int cmd_level;
 	int slow_level;
+	int cmd_level;
+	int i;
 
 	cmd_level = gpiod_get_value_cansleep(led->cmd);
 	slow_level = gpiod_get_value_cansleep(led->slow);
@@ -70,8 +70,8 @@ static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mode)
 
 static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mode)
 {
-	int i;
 	unsigned long flags;
+	int i;
 
 	for (i = 0; i < led->num_modes; i++)
 		if (mode == led->modval[i].mode)
@@ -123,9 +123,11 @@ static ssize_t ns2_led_sata_store(struct device *dev,
 				  const char *buff, size_t count)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
-	int ret;
 	unsigned long enable;
+	struct ns2_led *led;
+	int ret;
+
+	led = container_of(led_cdev, struct ns2_led, cdev);
 
 	ret = kstrtoul(buff, 10, &enable);
 	if (ret < 0)
@@ -154,7 +156,9 @@ static ssize_t ns2_led_sata_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
+	struct ns2_led *led;
+
+	led = container_of(led_cdev, struct ns2_led, cdev);
 
 	return sprintf(buf, "%d\n", led->sata);
 }
-- 
2.26.2

