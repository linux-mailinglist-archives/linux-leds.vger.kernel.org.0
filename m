Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426A4387C07
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350008AbhERPKz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:10:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:49524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343506AbhERPK3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26C536135C;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=0tES3bdt7Dfa21iZsJYbWnuV6/yUytq3HPpPGDOjRv4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hs46N4bQAY7ZbnQVgpgngh5EM1mhlWEFqutwHEtsW9UDx0nGkbmP5r830gV39wgUs
         2B1VOEbazklk+VgHzys2eA/Aj7SDHaTzf6oxlMVCxmwHQ/ZM9boCHKCB1F9oPbDYFH
         8DHFsvmkW58Ge/6JnZwU5c8pkdWV/NnYCiOoEmRZ7j1RMrOJV3grFS0P1IGdPaCBof
         msVhokcehbDeg1d05yCSpCz8BOXcvhAJobsKlHmZPEQMHbzBYPgAexD5vz4vzNqgvn
         HzyGWy+Rp4PV/fmLdGXDBgI2xaLCxmY9f2GFplYZ1EjKAMndxOsvqS4Uc/6s1RDBf1
         vdUDt28s+kgiw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOI-6d; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 06/17] leds: leds-nuc: allow changing the LED colors
Date:   Tue, 18 May 2021 17:08:55 +0200
Message-Id: <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621349813.git.mchehab+huawei@kernel.org>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add routines to allow seeing and changing the LED colors.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 244 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 228 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index df65bf17e0e6..415031d344c6 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -58,8 +58,6 @@ enum led_new_get_subcmd {
 enum led_function {
 	LED_FUNC_BRIGHTNESS,
 	LED_FUNC_COLOR1,
-	LED_FUNC_COLOR_GREEN,
-	LED_FUNC_COLOR_BLUE,
 
 	LED_FUNC_BLINK_BEHAVIOR,
 	LED_FUNC_BLINK_FREQ,
@@ -92,43 +90,31 @@ static const u8 led_func_rev_0_64[MAX_IND][MAX_LED_FUNC] = {
 		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
 		[LED_FUNC_BLINK_FREQ]		= 0x02,
 		[LED_FUNC_COLOR1]		= 0x03,
-		[LED_FUNC_COLOR_GREEN]		= 0x04,
-		[LED_FUNC_COLOR_BLUE]		= 0x05
 	},
 	[LED_IND_HDD_ACTIVITY] = {
 		[LED_FUNC_BRIGHTNESS]		= 0x00,
 		[LED_FUNC_COLOR1]		= 0x01,
-		[LED_FUNC_COLOR_GREEN]		= 0x02,
-		[LED_FUNC_COLOR_BLUE]		= 0x03,
 		[LED_FUNC_HDD_BEHAVIOR]		= 0x04
 	},
 	[LED_IND_ETHERNET] = {
 		[LED_FUNC_ETH_TYPE]		= 0x00,
 		[LED_FUNC_BRIGHTNESS]		= 0x01,
 		[LED_FUNC_COLOR1]		= 0x02,
-		[LED_FUNC_COLOR_GREEN]		= 0x03,
-		[LED_FUNC_COLOR_BLUE]		= 0x04
 	},
 	[LED_IND_WIFI] = {
 		[LED_FUNC_BRIGHTNESS]		= 0x00,
 		[LED_FUNC_COLOR1]		= 0x01,
-		[LED_FUNC_COLOR_GREEN]		= 0x02,
-		[LED_FUNC_COLOR_BLUE]		= 0x03
 	},
 	[LED_IND_SOFTWARE] = {
 		[LED_FUNC_BRIGHTNESS]		= 0x00,
 		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
 		[LED_FUNC_BLINK_FREQ]		= 0x02,
 		[LED_FUNC_COLOR1]		= 0x03,
-		[LED_FUNC_COLOR_GREEN]		= 0x04,
-		[LED_FUNC_COLOR_BLUE]		= 0x05
 	},
 	[LED_IND_POWER_LIMIT] = {
 		[LED_FUNC_POWER_LIMIT_SCHEME]	= 0x00,
 		[LED_FUNC_BRIGHTNESS]		= 0x01,
 		[LED_FUNC_COLOR1]		= 0x02,
-		[LED_FUNC_COLOR_GREEN]		= 0x03,
-		[LED_FUNC_COLOR_BLUE]		= 0x04
 	},
 };
 
@@ -462,6 +448,8 @@ static ssize_t nuc_wmi_set_brightness_offset(struct device *dev,
 	}								       \
 	static DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
 
+/* Show/change the LED indicator */
+
 static const char * const led_indicators[] = {
 	"Power State",
 	"HDD Activity",
@@ -534,7 +522,220 @@ static ssize_t store_indicator(struct device *dev,
 	return -EINVAL;
 }
 
-/* Get brightness */
+/* Show/change the LED color */
+
+enum led_colors {
+	LED_COLOR_BLUE,
+	LED_COLOR_AMBER,
+	LED_COLOR_WHITE
+};
+
+struct led_color_name {
+	const char *name;
+	u8 r, g, b;
+};
+
+static const struct led_color_name led_colors[] = {
+	/* The first colors should match the dual-LED colorset */
+	[LED_COLOR_BLUE]  = { "blue",  0,       0, 0xff },
+	[LED_COLOR_AMBER] = { "amber", 0xff, 0xbf,    0 },
+	[LED_COLOR_WHITE] = { "white", 0xff, 0xff, 0xff },
+
+	/* Let's add a couple of common color names as well */
+	{ "red",     0xff,    0,    0 },
+	{ "green",      0, 0xff,    0 },
+	{ "yellow",  0xff, 0xff,    0 },
+	{ "cyan",       0, 0xff, 0xff },
+	{ "magenta", 0xff,    0, 0xff },
+};
+
+static ssize_t show_color(struct device *dev,
+			  struct device_attribute *attr,				 char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS];
+	u8 output[NUM_OUTPUT_ARGS];
+	int ret, ctrl;
+	int size = PAGE_SIZE;
+	char *p = buf;
+	int color, r, g, b;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_COLOR1];
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	input[0] = LED_NEW_GET_CONTROL_ITEM;
+	input[1] = led->id;
+	input[2] = led->indicator;
+	input[3] = ctrl;
+
+	ret = nuc_nmi_cmd(dev, LED_NEW_GET_STATUS, input, output);
+	if (ret)
+		return ret;
+
+	if (led->color_type & LED_RGB) {
+		r = output[0];
+
+		input[3]++;
+		ret = nuc_nmi_cmd(dev, LED_NEW_GET_STATUS, input, output);
+		if (ret)
+			return ret;
+
+		g = output[0];
+
+		input[3]++;
+		ret = nuc_nmi_cmd(dev, LED_NEW_GET_STATUS, input, output);
+		if (ret)
+			return ret;
+
+		b = output[0];
+
+		for (color = 0; color < ARRAY_SIZE(led_colors); color++)
+			if (led_colors[color].r == r &&
+			    led_colors[color].g == g &&
+			    led_colors[color].b == b)
+				    return scnprintf(p, size, "%s\n",
+						     led_colors[color].name);
+
+		return scnprintf(p, size, "%d,%d,%d\n", r, g, b);
+	}
+
+	if (!output[0])
+		return scnprintf(p, size, "%s\n",
+				 led_colors[LED_COLOR_BLUE].name);
+
+	if (led->color_type & LED_BLUE_AMBER)
+		return scnprintf(p, size, "%s\n",
+				 led_colors[LED_COLOR_AMBER].name);
+
+	return scnprintf(p, size, "%s\n", led_colors[LED_COLOR_WHITE].name);
+}
+
+static ssize_t store_color(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	int ret, ctrl, color;
+	const char *tmp;
+	u8 r, g, b, val;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+	tmp = strsep((char **)&buf, ",\n");
+
+	for (color = 0; color < ARRAY_SIZE(led_colors); color++)
+		if (!strcasecmp(tmp, led_colors[color].name))
+			    break;
+
+	if (color < ARRAY_SIZE(led_colors)) {
+		r = led_colors[color].r;
+		g = led_colors[color].g;
+		b = led_colors[color].b;
+	} else {
+		if (kstrtou8(tmp, 0, &r) || r > 255)
+			return -EINVAL;
+
+		tmp = strsep((char **)&buf, ",\n");
+		if (kstrtou8(tmp, 0, &g) || g > 255)
+			return -EINVAL;
+
+		tmp = strsep((char **)&buf, " \n");
+		if (kstrtou8(tmp, 0, &b) || b > 255)
+			return -EINVAL;
+
+		if (led->color_type & LED_SINGLE_COLOR) {
+			for (color = 0; color <= LED_COLOR_WHITE; color++)
+				if (led_colors[color].r == r &&
+				    led_colors[color].g == g &&
+				    led_colors[color].b == b)
+					    break;
+		}
+	}
+
+	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_COLOR1];
+
+	/* Dual color LEDs */
+	if (!(led->color_type & LED_RGB)) {
+		if (color == LED_COLOR_BLUE)
+			val = 0;
+		else {
+			if (led->color_type & LED_BLUE_AMBER &&
+			    color != LED_COLOR_AMBER)
+				return -EINVAL;
+			else if (color != LED_COLOR_WHITE)
+				return -EINVAL;
+			val =1;
+		}
+
+		input[0] = led->id;
+		input[1] = led->indicator;
+		input[2] = ctrl;
+		input[3] = val;
+
+		ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+		if (ret)
+			return ret;
+
+		return len;
+	}
+
+	/* RGB LEDs */
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2] = ctrl;
+	input[3] = r;
+
+	ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+	if (ret)
+		return ret;
+
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2]++;
+	input[3] = g;
+
+	ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+	if (ret)
+		return ret;
+
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2]++;
+	input[3] = b;
+
+	ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+	if (ret)
+		return ret;
+
+	return len;
+
+	return -EINVAL;
+}
+
+static umode_t nuc_wmi_led_color_is_visible(struct kobject *kobj,
+					    struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	umode_t mode = attr->mode;
+
+	if (led->color_type & LED_SINGLE_COLOR)
+		return 0;
+
+	return mode;
+}
+
+/* Show/store brightness */
 static ssize_t show_brightness_offset(struct device *dev,
 				      struct device_attribute *attr,
 				      u8 offset,
@@ -554,7 +755,6 @@ static ssize_t show_brightness_offset(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
 }
 
-/* Change brightness */
 static ssize_t store_brightness_offset(struct device *dev,
 				       struct device_attribute *attr,
 				       u8 offset,
@@ -600,6 +800,7 @@ static int nuc_wmi_set_brightness(struct led_classdev *cdev,
 }
 
 static LED_ATTR_RW(indicator);
+static LED_ATTR_RW(color);
 
 LED_ATTR_POWER_STATE_RW(s0_brightness, 0x00);
 LED_ATTR_POWER_STATE_RW(s3_brightness, 0x06);
@@ -623,8 +824,19 @@ static const struct attribute_group nuc_wmi_led_attribute_group = {
 	.attrs = nuc_wmi_led_attr,
 };
 
+static struct attribute *nuc_wmi_led_color_attr[] = {
+	&dev_attr_color.attr,
+	NULL,
+};
+
+static const struct attribute_group nuc_wmi_led_color_attribute_group = {
+	.is_visible = nuc_wmi_led_color_is_visible,
+	.attrs = nuc_wmi_led_color_attr,
+};
+
 static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
 	&nuc_wmi_led_attribute_group,
+	&nuc_wmi_led_color_attribute_group,
 	NULL
 };
 
-- 
2.31.1

