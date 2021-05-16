Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C70381E2F
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhEPKzM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhEPKzH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE18A61166;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=YP1YAY7I8I6NWkfNmQO/5LZ0R2YCNPseIPrt3I7n3BI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n2PeIr3gvyxTJwX9s/pPzzm1GxAO7c39uDSrmIYnhmnoKBiHN8KWtX5tndE9V/ilL
         X4JxS9L0K4vtiOgQajbo0QEG+Qe6GxNUss5hILTIQ3sS5PP8IQl78aEJVeDxuKu8z7
         9SsOh6QUWSpzZOqe6mXT5ZZ2qcYUCtEYq7y71MINr7zvuNaEZxqeKqcwXqyWNlRuzv
         FpoMKGznBXy5uIDQaCc9FowgrP3sMNjoTc0opucFwW4/tqtmZIIMymMwiO9Ah4JiKc
         UG7KYj0mZZQoTFpWKjvSMY30eJGv4J826IIXomdkOHtv4zjXZpHAIJiM297DMfIDOm
         HcwYhP5G0PL0A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s8C-Q7; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 04/17] staging: nuc-wmi: add all types of brightness
Date:   Sun, 16 May 2021 12:53:32 +0200
Message-Id: <1eca814da18f7261286dc2c08a009bf42ad1e31a.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Improve the logic in order to support not only S0 brightness,
but also the brightness for other indicators and for all
power states.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 369 ++++++++++++++++++++----------
 1 file changed, 249 insertions(+), 120 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 62c2764814dd..711897ba4666 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -55,21 +55,89 @@ enum led_new_get_subcmd {
 	LED_NEW_GET_CONTROL_ITEM	= 0x01,
 };
 
+enum led_function {
+	LED_FUNC_BRIGHTNESS,
+	LED_FUNC_COLOR1,
+	LED_FUNC_COLOR_GREEN,
+	LED_FUNC_COLOR_BLUE,
+
+	LED_FUNC_BLINK_BEHAVIOR,
+	LED_FUNC_BLINK_FREQ,
+
+	LED_FUNC_HDD_BEHAVIOR,
+	LED_FUNC_ETH_TYPE,
+	LED_FUNC_POWER_LIMIT_SCHEME,
+
+	MAX_LED_FUNC
+};
+
+enum led_indicators {
+	LED_IND_POWER_STATE,
+	LED_IND_HDD_ACTIVITY,
+	LED_IND_ETHERNET,
+	LED_IND_WIFI,
+	LED_IND_SOFTWARE,
+	LED_IND_POWER_LIMIT,
+	LED_IND_DISABLE,
+
+	MAX_IND = LED_IND_DISABLE
+};
+
+/*
+ * control items ID for each of the valid indicators on spec Rev 0.64.
+ */
+static const u8 led_func_rev_0_64[MAX_IND][MAX_LED_FUNC] = {
+	[LED_IND_POWER_STATE] = {	/* Offsets for each power state */
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
+		[LED_FUNC_BLINK_FREQ]		= 0x02,
+		[LED_FUNC_COLOR1]		= 0x03,
+		[LED_FUNC_COLOR_GREEN]		= 0x04,
+		[LED_FUNC_COLOR_BLUE]		= 0x05
+	},
+	[LED_IND_HDD_ACTIVITY] = {
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_COLOR1]		= 0x01,
+		[LED_FUNC_COLOR_GREEN]		= 0x02,
+		[LED_FUNC_COLOR_BLUE]		= 0x03,
+		[LED_FUNC_HDD_BEHAVIOR]		= 0x04
+	},
+	[LED_IND_ETHERNET] = {
+		[LED_FUNC_ETH_TYPE]		= 0x00,
+		[LED_FUNC_BRIGHTNESS]		= 0x01,
+		[LED_FUNC_COLOR1]		= 0x02,
+		[LED_FUNC_COLOR_GREEN]		= 0x03,
+		[LED_FUNC_COLOR_BLUE]		= 0x04
+	},
+	[LED_IND_WIFI] = {
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_COLOR1]		= 0x01,
+		[LED_FUNC_COLOR_GREEN]		= 0x02,
+		[LED_FUNC_COLOR_BLUE]		= 0x03
+	},
+	[LED_IND_SOFTWARE] = {
+		[LED_FUNC_BRIGHTNESS]		= 0x00,
+		[LED_FUNC_BLINK_BEHAVIOR]	= 0x01,
+		[LED_FUNC_BLINK_FREQ]		= 0x02,
+		[LED_FUNC_COLOR1]		= 0x03,
+		[LED_FUNC_COLOR_GREEN]		= 0x04,
+		[LED_FUNC_COLOR_BLUE]		= 0x05
+	},
+	[LED_IND_POWER_LIMIT] = {
+		[LED_FUNC_POWER_LIMIT_SCHEME]	= 0x00,
+		[LED_FUNC_BRIGHTNESS]		= 0x01,
+		[LED_FUNC_COLOR1]		= 0x02,
+		[LED_FUNC_COLOR_GREEN]		= 0x03,
+		[LED_FUNC_COLOR_BLUE]		= 0x04
+	},
+};
+
 /* LED color indicator */
 #define LED_BLUE_AMBER		BIT(0)
 #define LED_BLUE_WHITE		BIT(1)
 #define LED_RGB			BIT(2)
 #define	LED_SINGLE_COLOR	BIT(3)
 
-/* LED indicator options */
-#define LED_IND_POWER_STATE	BIT(0)
-#define LED_IND_HDD_ACTIVITY	BIT(1)
-#define LED_IND_ETHERNET	BIT(2)
-#define LED_IND_WIFI		BIT(3)
-#define LED_IND_SOFTWARE	BIT(4)
-#define LED_IND_POWER_LIMIT	BIT(5)
-#define LED_IND_DISABLE		BIT(6)
-
 static const char * const led_names[] = {
 	"nuc::power",
 	"nuc::hdd",
@@ -87,7 +155,6 @@ struct nuc_nmi_led {
 	u8 indicator;
 	u32 color_type;
 	u32 avail_indicators;
-	u32 control_items;
 };
 
 struct nuc_wmi {
@@ -201,9 +268,9 @@ static int nuc_nmi_cmd(struct device *dev,
 static int nuc_wmi_query_leds(struct device *dev)
 {
 	struct nuc_wmi *priv = dev_get_drvdata(dev);
-	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	u8 input[NUM_INPUT_ARGS] = { 0 };
 	u8 output[NUM_OUTPUT_ARGS];
-	int i, id, ret, ver = LED_API_UNKNOWN;
+	int id, ret, ver = LED_API_UNKNOWN;
 	u8 leds;
 
 	/*
@@ -214,9 +281,8 @@ static int nuc_wmi_query_leds(struct device *dev)
 	 * FIXME: Should add a fallback code for it to work with older NUCs,
 	 * as LED_QUERY returns an error on older devices like Skull Canyon.
 	 */
-	cmd = LED_QUERY;
 	input[0] = LED_QUERY_LIST_ALL;
-	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	ret = nuc_nmi_cmd(dev, LED_QUERY, input, output);
 	if (ret == -ENOENT) {
 		ver = LED_API_NUC6;
 	} else if (ret) {
@@ -252,12 +318,11 @@ static int nuc_wmi_query_leds(struct device *dev)
 
 		led->id = id;
 
-		cmd = LED_QUERY;
 		input[0] = LED_QUERY_COLOR_TYPE;
 		input[1] = id;
-		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		ret = nuc_nmi_cmd(dev, LED_QUERY, input, output);
 		if (ret) {
-			dev_warn(dev, "error %d on led %i\n", ret, i);
+			dev_warn(dev, "error %d on led %i\n", ret, id);
 			return ret;
 		}
 
@@ -265,23 +330,11 @@ static int nuc_wmi_query_leds(struct device *dev)
 				  output[1] << 8 |
 				  output[2] << 16;
 
-		cmd = LED_NEW_GET_STATUS;
-		input[0] = LED_NEW_GET_CURRENT_INDICATOR;
-		input[1] = i;
-		ret = nuc_nmi_cmd(dev, cmd, input, output);
-		if (ret) {
-			dev_warn(dev, "error %d on led %i\n", ret, i);
-			return ret;
-		}
-
-		led->indicator = output[0];
-
-		cmd = LED_QUERY;
 		input[0] = LED_QUERY_INDICATOR_OPTIONS;
-		input[1] = i;
-		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		input[1] = id;
+		ret = nuc_nmi_cmd(dev, LED_QUERY, input, output);
 		if (ret) {
-			dev_warn(dev, "error %d on led %i\n", ret, i);
+			dev_warn(dev, "error %d on led %i\n", ret, id);
 			return ret;
 		}
 
@@ -289,23 +342,18 @@ static int nuc_wmi_query_leds(struct device *dev)
 					output[1] << 8 |
 					output[2] << 16;
 
-		cmd = LED_QUERY;
-		input[0] = LED_QUERY_CONTROL_ITEMS;
-		input[1] = i;
-		input[2] = led->indicator;
-		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		input[0] = LED_NEW_GET_CURRENT_INDICATOR;
+		input[1] = id;
+		ret = nuc_nmi_cmd(dev, LED_NEW_GET_STATUS, input, output);
 		if (ret) {
-			dev_warn(dev, "error %d on led %i\n", ret, i);
+			dev_warn(dev, "error %d on led %i\n", ret, id);
 			return ret;
 		}
+		led->indicator = output[0];
 
-		led->control_items = output[0]      |
-				     output[1] << 8 |
-				     output[2] << 16;
-
-		dev_dbg(dev, "%s: id: %02x, color type: %06x, indicator: %06x, control items: %06x\n",
-			led_names[led->id], led->id,
-			led->color_type, led->indicator, led->control_items);
+		dev_dbg(dev, "%s: id: %02x, color type: %06x, indicator: %02x (avail %06x)\n",
+			led_names[led->id], led->id, led->color_type,
+			led->indicator, led->avail_indicators);
 
 		priv->num_leds++;
 	}
@@ -313,6 +361,82 @@ static int nuc_wmi_query_leds(struct device *dev)
 	return 0;
 }
 
+static bool nuc_wmi_test_control(struct device *dev,
+				 struct nuc_nmi_led *led, u8 ctrl)
+{
+	int ret, avail_ctrls;
+	u8 output[NUM_OUTPUT_ARGS];
+	u8 input[NUM_INPUT_ARGS] = {
+		LED_QUERY_CONTROL_ITEMS,
+		led->id,
+		led->indicator
+	};
+
+	ret = nuc_nmi_cmd(dev, LED_QUERY, input, output);
+	if (ret)
+		return false;
+
+	avail_ctrls = output[0]      |
+		      output[1] << 8 |
+		      output[2] << 16;
+
+	return avail_ctrls & BIT(ctrl);
+}
+
+static int nuc_wmi_get_brightness_offset(struct device *dev,
+					 struct nuc_nmi_led *led, u8 offset)
+{
+	u8 input[NUM_INPUT_ARGS];
+	u8 output[NUM_OUTPUT_ARGS];
+	int ret, ctrl;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_BRIGHTNESS] + offset;
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
+	dev_dbg(dev, "%s: id: %02x, brightness: %02x\n",
+		led_names[led->id], led->id, output[0]);
+
+	return output[0];
+}
+
+static ssize_t nuc_wmi_set_brightness_offset(struct device *dev,
+					     struct nuc_nmi_led *led,
+					     u8 offset,
+					     u8 val)
+{
+	u8 input[NUM_INPUT_ARGS];
+	int ctrl;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+	ctrl = led_func_rev_0_64[led->indicator][LED_FUNC_BRIGHTNESS] + offset;
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2] = ctrl;
+	input[3] = val;
+
+	return nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+}
+
 /*
  * LED show/store routines
  */
@@ -320,6 +444,21 @@ static int nuc_wmi_query_leds(struct device *dev)
 #define LED_ATTR_RW(_name) \
 	DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
 
+#define LED_ATTR_POWER_STATE_RW(_name, offset)				       \
+	static ssize_t show_##_name(struct device *dev,			       \
+				    struct device_attribute *attr,	       \
+				    char *buf)				       \
+	{								       \
+		return show_brightness_offset(dev, attr, offset, buf);	       \
+	}								       \
+	static ssize_t store_##_name(struct device *dev,		       \
+				    struct device_attribute *attr,	       \
+				    const char *buf, size_t len)	       \
+	{								       \
+		return store_brightness_offset(dev, attr, offset, buf, len);   \
+	}								       \
+	static DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
+
 static const char * const led_indicators[] = {
 	"Power State",
 	"HDD Activity",
@@ -392,98 +531,93 @@ static ssize_t store_indicator(struct device *dev,
 	return -EINVAL;
 }
 
-/* Get S0 brightness */
-static ssize_t show_s0_brightness(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buf)
+/* Get brightness */
+static ssize_t show_brightness_offset(struct device *dev,
+				      struct device_attribute *attr,
+				      u8 offset,
+				      char *buf)
 {
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
-	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
-	u8 output[NUM_OUTPUT_ARGS];
 	int ret;
 
-	cmd = LED_NEW_GET_STATUS;
-	input[0] = LED_NEW_GET_CONTROL_ITEM;
-	input[1] = led->id;
-	input[2] = led->indicator;
-	input[3] = 0;
+	if (led->indicator != LED_IND_POWER_STATE)
+		return -ENODEV;
 
-	ret = nuc_nmi_cmd(dev, cmd, input, output);
-	if (ret)
+	ret = nuc_wmi_get_brightness_offset(dev, led, offset);
+	if (ret < 0)
 		return ret;
 
-	/* Multicolor uses a scale from 0 to 100 */
-	if (led->color_type & (LED_BLUE_AMBER | LED_BLUE_WHITE | LED_RGB))
-		return scnprintf(buf, PAGE_SIZE, "%d%%\n", output[0]);
-
-	/* single color uses 0, 50% and 100% */
-	return scnprintf(buf, PAGE_SIZE, "%d%%\n", output[0] * 50);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
 }
 
-/* Change S0 brightness */
-static ssize_t store_s0_brightness(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t len)
+/* Change brightness */
+static ssize_t store_brightness_offset(struct device *dev,
+				       struct device_attribute *attr,
+				       u8 offset,
+				       const char *buf, size_t len)
 {
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
-	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
 	int ret;
 	u8 val;
 
-	if (led->indicator == LED_IND_DISABLE) {
-		dev_dbg(dev, "Led %s is disabled. ignoring it.\n", cdev->name);
-		return -EACCES;
-	}
+	if (led->indicator != LED_IND_POWER_STATE)
+		return -ENODEV;
 
 	if (kstrtou8(buf, 0, &val) || val > 100)
 		return -EINVAL;
 
-	/*
-	 * For single-color LEDs, the value should be between 0 to 2, but,
-	 * in order to have a consistent API, let's always handle it as if
-	 * it is a percentage, for both multicolor and single color LEDs.
-	 * So:
-	 *	value == 0 will disable the LED
-	 * 	value up to 74% will set it the brightness to 50%
-	 * 	value equal or above 75% will use the maximum brightness.
-	 */
-	if (!(led->color_type & (LED_BLUE_AMBER | LED_BLUE_WHITE | LED_RGB))) {
-		if (val > 0 && val < 75)
-			val = 1;
-		if (val >= 75)
-			val = 2;
-	}
-
-	cmd = LED_SET_VALUE;
-	input[0] = led->id;
-	input[1] = led->indicator;
-	input[2] = 0;		/* FIXME: replace by an enum */
-	input[3] = val;
-
-	ret = nuc_nmi_cmd(dev, cmd, input, NULL);
+	ret = nuc_wmi_set_brightness_offset(dev, led, offset, val);
 	if (ret)
 		return ret;
 
 	return len;
 }
 
+static enum led_brightness nuc_wmi_get_brightness(struct led_classdev *cdev)
+{
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	if (led->indicator == LED_IND_POWER_STATE)
+		return -ENODEV;
+
+	return nuc_wmi_get_brightness_offset(cdev->dev, led, 0);
+}
+
+static int nuc_wmi_set_brightness(struct led_classdev *cdev,
+				  enum led_brightness brightness)
+{
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	if (led->indicator == LED_IND_POWER_STATE)
+		return -ENODEV;
+
+	return nuc_wmi_set_brightness_offset(cdev->dev, led, 0, brightness);
+}
+
 static LED_ATTR_RW(indicator);
-static LED_ATTR_RW(s0_brightness);
+
+LED_ATTR_POWER_STATE_RW(s0_brightness, 0x00);
+LED_ATTR_POWER_STATE_RW(s3_brightness, 0x06);
+LED_ATTR_POWER_STATE_RW(s5_brightness, 0x0c);
+LED_ATTR_POWER_STATE_RW(ready_mode_brightness, 0x12);
 
 /*
- * Attributes for multicolor LEDs
+ * Attributes for LEDs
  */
 
-static struct attribute *nuc_wmi_multicolor_led_attr[] = {
+static struct attribute *nuc_wmi_led_attr[] = {
 	&dev_attr_indicator.attr,
 	&dev_attr_s0_brightness.attr,
+	&dev_attr_s3_brightness.attr,
+	&dev_attr_s5_brightness.attr,
+	&dev_attr_ready_mode_brightness.attr,
 	NULL,
 };
 
 static const struct attribute_group nuc_wmi_led_attribute_group = {
-	.attrs		= nuc_wmi_multicolor_led_attr,
+	.attrs = nuc_wmi_led_attr,
 };
 
 static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
@@ -493,30 +627,25 @@ static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
 
 static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led)
 {
+	int brightness = nuc_wmi_get_brightness_offset(dev, led, 0);
+
 	led->cdev.name = led_names[led->id];
-
 	led->dev = dev;
 	led->cdev.groups = nuc_wmi_led_attribute_groups;
+	led->cdev.brightness_get = nuc_wmi_get_brightness;
+	led->cdev.brightness_set_blocking = nuc_wmi_set_brightness;
 
-	/*
-	 * It can't let the classdev to manage the brightness due to several
-	 * reasons:
-	 *
-	 * 1) classdev has some internal logic to manage the brightness,
-	 *    at set_brightness_delayed(), which starts disabling the LEDs;
-	 *    While this makes sense on most cases, here, it would appear
-	 *    that the NUC was powered off, which is not what happens;
-	 * 2) classdev unconditionally tries to set brightness for all
-	 *    leds, including the ones that were software-disabled or
-	 *    disabled disabled via BIOS menu;
-	 * 3) There are 3 types of brightness values for each LED, depending
-	 *    on the CPU power state: S0, S3 and S5.
-	 *
-	 * So, the best seems to export everything via sysfs attributes
-	 * directly. This would require some further changes at the
-	 * LED class, though, or we would need to create our own LED
-	 * class, which seems wrong.
-	 */
+	if (led->color_type & LED_SINGLE_COLOR)
+		led->cdev.max_brightness = 2;
+	else
+		led->cdev.max_brightness = 100;
+
+	/* Ensure that the current bright will be preserved */
+	if (brightness >= 0)
+		led->cdev.delayed_set_value = brightness;
+
+	/* Suppress warnings for the LED(s) indicating the power state */
+	led->cdev.flags = LED_HW_PLUGGABLE | LED_UNREGISTERING;
 
 	return devm_led_classdev_register(dev, &led->cdev);
 }
-- 
2.31.1

