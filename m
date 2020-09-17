Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2543726E8A1
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIQWfG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:06 -0400
Received: from mail.nic.cz ([217.31.204.67]:35610 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbgIQWeO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:14 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D5654142061;
        Fri, 18 Sep 2020 00:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382041; bh=0KVIVwBwEdjiOA3ZbJRB3ki9LPpAzNlds5sDz/L7rmI=;
        h=From:To:Date;
        b=cjDZMrC7M34OWVTVBS17ThFU/4ydlnuSBwFKgVihIHw3FsXynKyNi1V//iyh+MUV8
         tPPGVprwImenOO6Fq/Ebjojzl7i0PKI5dqDzoO1cJxmZ6TpJLaJQLBEqZ9g5lJbvYS
         7vdQyAmtBskU9x84L7PQjo8dJ4BfbV9WPrCXzJqo=
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
Subject: [PATCH leds v2 41/50] leds: ns2: cosmetic structure rename
Date:   Fri, 18 Sep 2020 00:33:29 +0200
Message-Id: <20200917223338.14164-42-marek.behun@nic.cz>
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

Rename structures:
  ns2_led      -> ns2_led_of_one
  ns2_led_data -> ns2_led.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index fa06ab40ee143..6dba6208433ca 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -30,7 +30,7 @@ struct ns2_led_modval {
 	int			slow_level;
 };
 
-struct ns2_led {
+struct ns2_led_of_one {
 	const char	*name;
 	const char	*default_trigger;
 	struct gpio_desc *cmd;
@@ -40,8 +40,8 @@ struct ns2_led {
 };
 
 struct ns2_led_of {
-	int		num_leds;
-	struct ns2_led	*leds;
+	int			num_leds;
+	struct ns2_led_of_one	*leds;
 };
 
 /*
@@ -51,7 +51,7 @@ struct ns2_led_of {
  * for the command/slow GPIOs corresponds to a LED mode.
  */
 
-struct ns2_led_data {
+struct ns2_led {
 	struct led_classdev	cdev;
 	struct gpio_desc	*cmd;
 	struct gpio_desc	*slow;
@@ -62,7 +62,7 @@ struct ns2_led_data {
 	struct ns2_led_modval	*modval;
 };
 
-static int ns2_led_get_mode(struct ns2_led_data *led_dat,
+static int ns2_led_get_mode(struct ns2_led *led_dat,
 			    enum ns2_led_modes *mode)
 {
 	int i;
@@ -85,7 +85,7 @@ static int ns2_led_get_mode(struct ns2_led_data *led_dat,
 	return ret;
 }
 
-static void ns2_led_set_mode(struct ns2_led_data *led_dat,
+static void ns2_led_set_mode(struct ns2_led *led_dat,
 			     enum ns2_led_modes mode)
 {
 	int i;
@@ -121,8 +121,8 @@ static void ns2_led_set_mode(struct ns2_led_data *led_dat,
 static void ns2_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
-	struct ns2_led_data *led_dat =
-		container_of(led_cdev, struct ns2_led_data, cdev);
+	struct ns2_led *led_dat =
+		container_of(led_cdev, struct ns2_led, cdev);
 	enum ns2_led_modes mode;
 
 	if (value == LED_OFF)
@@ -147,8 +147,8 @@ static ssize_t ns2_led_sata_store(struct device *dev,
 				  const char *buff, size_t count)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led_data *led_dat =
-		container_of(led_cdev, struct ns2_led_data, cdev);
+	struct ns2_led *led_dat =
+		container_of(led_cdev, struct ns2_led, cdev);
 	int ret;
 	unsigned long enable;
 
@@ -179,8 +179,8 @@ static ssize_t ns2_led_sata_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led_data *led_dat =
-		container_of(led_cdev, struct ns2_led_data, cdev);
+	struct ns2_led *led_dat =
+		container_of(led_cdev, struct ns2_led, cdev);
 
 	return sprintf(buf, "%d\n", led_dat->sata);
 }
@@ -194,8 +194,8 @@ static struct attribute *ns2_led_attrs[] = {
 ATTRIBUTE_GROUPS(ns2_led);
 
 static int
-create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
-	       const struct ns2_led *template)
+create_ns2_led(struct platform_device *pdev, struct ns2_led *led_dat,
+	       const struct ns2_led_of_one *template)
 {
 	int ret;
 	enum ns2_led_modes mode;
@@ -231,7 +231,7 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 }
 
 static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
-			      struct ns2_led *led)
+			      struct ns2_led_of_one *led)
 {
 	struct ns2_led_modval *modval;
 	int nmodes, ret, i;
@@ -289,7 +289,7 @@ ns2_leds_parse_of(struct device *dev, struct ns2_led_of *ofdata)
 {
 	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
-	struct ns2_led *led, *leds;
+	struct ns2_led_of_one *led, *leds;
 	int ret, num_leds = 0;
 
 	num_leds = of_get_available_child_count(np);
@@ -325,7 +325,7 @@ MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct ns2_led_of *ofdata;
-	struct ns2_led_data *leds;
+	struct ns2_led *leds;
 	int i;
 	int ret;
 
-- 
2.26.2

