Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C7B381E31
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhEPKzM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229628AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD3AA611BE;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=wcuh0LMsWu8QO2eXqeB4nI5u/nWk2rByYu1mqtWA8ck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VCPRYBUMnp7CtDxIWoBGv3i/+roQ2BPBV5cISQQeRwy4+Xc5BP9Iw9/bX8ReJbkdx
         EfWCcwScc9HWBUMVkz/KYbTO/aMQGS23XvnhFFhXUJkpeUcesBJF0OUCJAy9UYTKi/
         ROsLFmHl7H9iFpkx4W95tR954jOPqXf6xLJuAT830LtQXra0n4m/pIRJpmoATWAdvp
         DaCBlK6aEtagf4zckuHZVo9oi/9Qq2dLUQVCOUC+tHxAILmshs4eFbYbV61ueFF4y9
         GJTDM79redNqGNhTy1X6Fb6idSQxIjzPJnDXten4Ivd1Wl9oMp4Ov+YekUKJCtVNFQ
         7++GE+m56XMzg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s8K-Sa; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 06/17] staging: nuc-wmi: add support for WMI API version 1.0
Date:   Sun, 16 May 2021 12:53:34 +0200
Message-Id: <41692e55621f75a75b52ad3ed2f341833ebf3a78.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The control indicators for WMI version 1.0 (used on NUCi10
and above) are on different locations.

The main difference is on single color LEDs.

Also, the Power State brightness names are defined on a
different way, and there are 3 groups instead of 4.

As the driver was written with some tables to map the
control option values, it is easy to extend it to support
the new definitions: all we need to do is to add the
V1.0 tables and ensure that the right table will be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 119 +++++++++++++++++++++++++-----
 1 file changed, 99 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 07cf18e6f4c4..e9c59f656283 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -62,6 +62,7 @@ enum led_function {
 	LED_FUNC_BLINK_BEHAVIOR,
 	LED_FUNC_BLINK_FREQ,
 
+	LED_FUNC_POWER_STATE_NUM_CTRLS,
 	LED_FUNC_HDD_BEHAVIOR,
 	LED_FUNC_ETH_TYPE,
 	LED_FUNC_POWER_LIMIT_SCHEME,
@@ -84,8 +85,11 @@ enum led_indicators {
 /*
  * control items ID for each of the valid indicators on spec Rev 0.64.
  */
-static const u8 led_func_rev_0_64[MAX_IND][MAX_LED_FUNC] = {
-	[LED_IND_POWER_STATE] = {	/* Offsets for each power state */
+static const u8 led_func_multicolor[MAX_IND][MAX_LED_FUNC] = {
+	[LED_IND_POWER_STATE] = {
+		[LED_FUNC_POWER_STATE_NUM_CTRLS] = 0x06,
+
+		/* Offsets for each power state */
 		[LED_FUNC_BRIGHTNESS]		= 0x00,
 		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
 		[LED_FUNC_BLINK_FREQ]		= 0x02,
@@ -118,6 +122,24 @@ static const u8 led_func_rev_0_64[MAX_IND][MAX_LED_FUNC] = {
 	},
 };
 
+static const u8 led_func_rev_1_0_singlecolor[MAX_IND][MAX_LED_FUNC] = {
+	[LED_IND_POWER_STATE] = {
+		[LED_FUNC_POWER_STATE_NUM_CTRLS] = 0x02,
+
+		/* Offsets for each power state */
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
+	},
+	[LED_IND_HDD_ACTIVITY] = {
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_HDD_BEHAVIOR]		= 0x01
+	},
+	[LED_IND_SOFTWARE] = {
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
+	},
+};
+
 /* LED color indicator */
 #define LED_BLUE_AMBER		BIT(0)
 #define LED_BLUE_WHITE		BIT(1)
@@ -141,6 +163,9 @@ struct nuc_nmi_led {
 	u8 indicator;
 	u32 color_type;
 	u32 avail_indicators;
+	enum led_api_rev api_rev;
+
+	const u8 (*reg_table)[MAX_LED_FUNC];
 };
 
 struct nuc_wmi {
@@ -251,7 +276,7 @@ static int nuc_nmi_cmd(struct device *dev,
 	return ret;
 }
 
-static int nuc_wmi_query_leds(struct device *dev)
+static int nuc_wmi_query_leds(struct device *dev, enum led_api_rev *api_rev)
 {
 	struct nuc_wmi *priv = dev_get_drvdata(dev);
 	u8 input[NUM_INPUT_ARGS] = { 0 };
@@ -288,9 +313,11 @@ static int nuc_wmi_query_leds(struct device *dev)
 	}
 
 	/* Currently, only API Revision 0.64 is supported */
-	if (ver != LED_API_REV_0_64)
+	if (ver != LED_API_REV_0_64 && ver != LED_API_REV_1_0)
 		return -ENODEV;
 
+	*api_rev = ver;
+
 	if (!leds) {
 		dev_warn(dev, "No LEDs found\n");
 		return -ENODEV;
@@ -379,7 +406,7 @@ static int nuc_wmi_get_brightness_offset(struct device *dev,
 	if (led->indicator == LED_IND_DISABLE)
 		return -ENODEV;
 
-	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_BRIGHTNESS] + offset;
+	ctrl = led->reg_table[led->indicator][LED_FUNC_BRIGHTNESS] + offset;
 
 	if (!nuc_wmi_test_control(dev, led, ctrl))
 		return -ENODEV;
@@ -410,7 +437,7 @@ static ssize_t nuc_wmi_set_brightness_offset(struct device *dev,
 	if (led->indicator == LED_IND_DISABLE)
 		return -ENODEV;
 
-	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_BRIGHTNESS] + offset;
+	ctrl = led->reg_table[led->indicator][LED_FUNC_BRIGHTNESS] + offset;
 
 	if (!nuc_wmi_test_control(dev, led, ctrl))
 		return -ENODEV;
@@ -561,7 +588,7 @@ static ssize_t show_color(struct device *dev,
 	if (led->indicator == LED_IND_DISABLE)
 		return -ENODEV;
 
-	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_COLOR1];
+	ctrl = led->reg_table[led->indicator][LED_FUNC_COLOR1];
 
 	if (!nuc_wmi_test_control(dev, led, ctrl))
 		return -ENODEV;
@@ -658,7 +685,7 @@ static ssize_t store_color(struct device *dev,
 		}
 	}
 
-	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_COLOR1];
+	ctrl = led->reg_table[led->indicator][LED_FUNC_COLOR1];
 
 	/* Dual color LEDs */
 	if (!(led->color_type & LED_RGB)) {
@@ -745,6 +772,8 @@ static ssize_t show_brightness_offset(struct device *dev,
 	if (led->indicator != LED_IND_POWER_STATE)
 		return -ENODEV;
 
+	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+
 	ret = nuc_wmi_get_brightness_offset(dev, led, offset);
 	if (ret < 0)
 		return ret;
@@ -768,6 +797,8 @@ static ssize_t store_brightness_offset(struct device *dev,
 	if (kstrtou8(buf, 0, &val) || val > 100)
 		return -EINVAL;
 
+	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+
 	ret = nuc_wmi_set_brightness_offset(dev, led, offset, val);
 	if (ret)
 		return ret;
@@ -796,13 +827,40 @@ static int nuc_wmi_set_brightness(struct led_classdev *cdev,
 	return nuc_wmi_set_brightness_offset(cdev->dev, led, 0, brightness);
 }
 
+static umode_t nuc_wmi_led_power_state_is_visible(struct kobject *kobj,
+						  struct attribute *attr,
+						  int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	umode_t mode = attr->mode;
+
+	if (!strcmp(attr->name, "s0_brightness") ||
+	    !strcmp(attr->name, "s3_brightness"))
+		return mode;
+
+	if (led->api_rev == LED_API_REV_0_64) {
+		if (!strcmp(attr->name, "s5_brightness") ||
+		    !strcmp(attr->name, "ready_mode_brightness"))
+			return mode;
+	} else {
+		if (!strcmp(attr->name, "standby_brightness"))
+			return mode;
+	}
+
+	return 0;
+}
+
 static LED_ATTR_RW(indicator);
 static LED_ATTR_RW(color);
 
-LED_ATTR_POWER_STATE_RW(s0_brightness, 0x00);
-LED_ATTR_POWER_STATE_RW(s3_brightness, 0x06);
-LED_ATTR_POWER_STATE_RW(s5_brightness, 0x0c);
-LED_ATTR_POWER_STATE_RW(ready_mode_brightness, 0x12);
+LED_ATTR_POWER_STATE_RW(s0_brightness, 0);
+LED_ATTR_POWER_STATE_RW(s3_brightness, 1);
+LED_ATTR_POWER_STATE_RW(s5_brightness, 2);		// Rev 0.64
+LED_ATTR_POWER_STATE_RW(standby_brightness, 2);		// Rev 1.0
+LED_ATTR_POWER_STATE_RW(ready_mode_brightness, 3);	// Rev 1.0
 
 /*
  * Attributes for LEDs
@@ -810,15 +868,25 @@ LED_ATTR_POWER_STATE_RW(ready_mode_brightness, 0x12);
 
 static struct attribute *nuc_wmi_led_attr[] = {
 	&dev_attr_indicator.attr,
+	NULL,
+};
+
+static const struct attribute_group nuc_wmi_led_attribute_group = {
+	.attrs = nuc_wmi_led_attr,
+};
+
+static struct attribute *nuc_wmi_led_power_state_attr[] = {
 	&dev_attr_s0_brightness.attr,
 	&dev_attr_s3_brightness.attr,
+	&dev_attr_standby_brightness.attr,
 	&dev_attr_s5_brightness.attr,
 	&dev_attr_ready_mode_brightness.attr,
 	NULL,
 };
 
-static const struct attribute_group nuc_wmi_led_attribute_group = {
-	.attrs = nuc_wmi_led_attr,
+static const struct attribute_group nuc_wmi_led_power_state_group = {
+	.is_visible = nuc_wmi_led_power_state_is_visible,
+	.attrs = nuc_wmi_led_power_state_attr,
 };
 
 static struct attribute *nuc_wmi_led_color_attr[] = {
@@ -833,26 +901,36 @@ static const struct attribute_group nuc_wmi_led_color_attribute_group = {
 
 static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
 	&nuc_wmi_led_attribute_group,
+	&nuc_wmi_led_power_state_group,
 	&nuc_wmi_led_color_attribute_group,
 	NULL
 };
 
-static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led)
+static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led,
+				enum led_api_rev api_rev)
 {
-	int brightness = nuc_wmi_get_brightness_offset(dev, led, 0);
+	int brightness;
 
 	led->cdev.name = led_names[led->id];
 	led->dev = dev;
 	led->cdev.groups = nuc_wmi_led_attribute_groups;
 	led->cdev.brightness_get = nuc_wmi_get_brightness;
 	led->cdev.brightness_set_blocking = nuc_wmi_set_brightness;
+	led->api_rev = api_rev;
 
-	if (led->color_type & LED_SINGLE_COLOR)
+	if (led->color_type & LED_SINGLE_COLOR) {
+		if (led->api_rev == LED_API_REV_1_0)
+			led->reg_table = led_func_rev_1_0_singlecolor;
+		else
+			led->reg_table = led_func_multicolor;
 		led->cdev.max_brightness = 2;
-	else
+	} else {
 		led->cdev.max_brightness = 100;
+		led->reg_table = led_func_multicolor;
+	}
 
 	/* Ensure that the current bright will be preserved */
+	brightness = nuc_wmi_get_brightness_offset(dev, led, 0);
 	if (brightness >= 0)
 		led->cdev.delayed_set_value = brightness;
 
@@ -865,14 +943,15 @@ static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led)
 static int nuc_wmi_leds_setup(struct device *dev)
 {
 	struct nuc_wmi *priv = dev_get_drvdata(dev);
+	enum led_api_rev api_rev;
 	int ret, i;
 
-	ret = nuc_wmi_query_leds(dev);
+	ret = nuc_wmi_query_leds(dev, &api_rev);
 	if (ret)
 		return ret;
 
 	for (i = 0; i < priv->num_leds; i++) {
-		ret = nuc_wmi_led_register(dev, &priv->led[i]);
+		ret = nuc_wmi_led_register(dev, &priv->led[i], api_rev);
 		if (ret) {
 			dev_err(dev, "Failed to register led %d: %s\n",
 				i, led_names[priv->led[i].id]);
-- 
2.31.1

