Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544D1381E2D
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhEPKzL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:47738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229891AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB02461155;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=Citw8kcHjBqb4RX/1vLsy0daJP7QuWPWuADaCtqEKTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YXC0WIuoGpkjkt4xUxii7ReuYuTwmBzlyjp6QtY/oKZ4vLKGxliAfn6VtEUsbkVF0
         FPjPwghyupmN3KbzCMK15C2elFYVJgkH45Wr82IXrrLdiRmY7G5uSGJHP7NJqfEKpl
         DaGI/DDwgJZ++Ixdk9s3v3KWxtIaESLf6JIY1Ar5mwkw2U/oD3SEQOqNGnOu3JcJJM
         Oy7t0iNxSA3Cay2sr7t9/5Z9l4Anb6R4LbeYBYHPmWzlrYUw95LSaPNwYIzxywJFaE
         4HpOXh8xdj2tkJw571RzBygP8sIfEivO75Up1bqn5e2/xXWv3yGECY/euxnT2UA4uv
         L0q93YByeKSBg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP9-003s8W-0o; Sun, 16 May 2021 12:53:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 09/17] staging: nuc-wmi: Add support to blink behavior for NUC8/10
Date:   Sun, 16 May 2021 12:53:37 +0200
Message-Id: <9f7b5e0f3fd726802a9cd3b9b921cc2bb13101ef.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The hardware blink logic works for both Power State and Software
controlled LEDs.

Just like brightness, there is one different blink behavior
per different power state. Due to that, the logic is somewhat
more complex than what it would be expected otherwise.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 347 +++++++++++++++++++++++++++---
 1 file changed, 322 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index a365a8603182..8967c8d54dac 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -527,18 +527,30 @@ static ssize_t nuc_wmi_set_brightness_offset(struct device *dev,
 #define LED_ATTR_RW(_name) \
 	DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
 
-#define LED_ATTR_POWER_STATE_RW(_name, offset)				       \
+#define LED_ATTR_POWER_STATE_RW(_name, _offname, _offset)		       \
 	static ssize_t show_##_name(struct device *dev,			       \
 				    struct device_attribute *attr,	       \
 				    char *buf)				       \
 	{								       \
-		return show_brightness_offset(dev, attr, offset, buf);	       \
+		struct led_classdev *cdev = dev_get_drvdata(dev);	       \
+		struct nuc_nmi_led *led;				       \
+									       \
+		led = container_of(cdev, struct nuc_nmi_led, cdev);	       \
+		if (led->indicator != LED_IND_POWER_STATE)		       \
+			return -ENODEV;					       \
+		return offset_show_##_offname(dev, attr, _offset, buf);	       \
 	}								       \
 	static ssize_t store_##_name(struct device *dev,		       \
-				    struct device_attribute *attr,	       \
-				    const char *buf, size_t len)	       \
+				     struct device_attribute *attr,	       \
+				     const char *buf, size_t len)	       \
 	{								       \
-		return store_brightness_offset(dev, attr, offset, buf, len);   \
+		struct led_classdev *cdev = dev_get_drvdata(dev);	       \
+		struct nuc_nmi_led *led;				       \
+									       \
+		led = container_of(cdev, struct nuc_nmi_led, cdev);	       \
+		if (led->indicator != LED_IND_POWER_STATE)		       \
+			return -ENODEV;					       \
+		return offset_store_##_offname(dev, attr, _offset, buf, len);  \
 	}								       \
 	static DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
 
@@ -681,7 +693,7 @@ static ssize_t nuc6_store_color(struct device *dev,
 	const char *tmp;
 	int ret, color;
 
-	tmp = strsep((char **)&buf, ",\n");
+	tmp = strsep((char **)&buf, "\n");
 
 	if (led->id == POWER_LED) {
 		for (color = ARRAY_SIZE(nuc6_power_colors)+1; color >= 0; color--)
@@ -1000,7 +1012,7 @@ static umode_t nuc_wmi_led_color_is_visible(struct kobject *kobj,
 }
 
 /* Show/store brightness */
-static ssize_t show_brightness_offset(struct device *dev,
+static ssize_t offset_show_brightness(struct device *dev,
 				      struct device_attribute *attr,
 				      u8 offset,
 				      char *buf)
@@ -1009,9 +1021,6 @@ static ssize_t show_brightness_offset(struct device *dev,
 	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
 	int ret;
 
-	if (led->indicator != LED_IND_POWER_STATE)
-		return -ENODEV;
-
 	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
 
 	ret = nuc_wmi_get_brightness_offset(dev, led, offset);
@@ -1021,7 +1030,7 @@ static ssize_t show_brightness_offset(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
 }
 
-static ssize_t store_brightness_offset(struct device *dev,
+static ssize_t offset_store_brightness(struct device *dev,
 				       struct device_attribute *attr,
 				       u8 offset,
 				       const char *buf, size_t len)
@@ -1031,9 +1040,6 @@ static ssize_t store_brightness_offset(struct device *dev,
 	int ret;
 	u8 val;
 
-	if (led->indicator != LED_IND_POWER_STATE)
-		return -ENODEV;
-
 	if (kstrtou8(buf, 0, &val) || val > 100)
 		return -EINVAL;
 
@@ -1067,6 +1073,8 @@ static int nuc_wmi_set_brightness(struct led_classdev *cdev,
 	return nuc_wmi_set_brightness_offset(cdev->dev, led, 0, brightness);
 }
 
+#define cmp_attr_prefix(a, b)     strncmp(a, b, strlen(b))
+
 static umode_t nuc_wmi_led_power_state_is_visible(struct kobject *kobj,
 						  struct attribute *attr,
 						  int idx)
@@ -1074,33 +1082,297 @@ static umode_t nuc_wmi_led_power_state_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
-
 	umode_t mode = attr->mode;
 
-	if (!strcmp(attr->name, "s0_brightness") ||
-	    !strcmp(attr->name, "s3_brightness"))
+	if (!cmp_attr_prefix(attr->name, "s0_") ||
+	    !cmp_attr_prefix(attr->name, "s3_"))
 		return mode;
 
 	if (led->api_rev == LED_API_REV_0_64) {
-		if (!strcmp(attr->name, "s5_brightness") ||
-		    !strcmp(attr->name, "ready_mode_brightness"))
+		if (!cmp_attr_prefix(attr->name, "s5_") ||
+		    !cmp_attr_prefix(attr->name, "ready_mode_"))
 			return mode;
 	} else {
-		if (!strcmp(attr->name, "standby_brightness"))
+		if (!cmp_attr_prefix(attr->name, "standby_"))
 			return mode;
 	}
 
 	return 0;
 }
 
+/* Blink */
+static const char * const led_blink_behaviors[] = {
+	"solid",
+	"breathing",
+	"pulsing",
+	"strobing"
+};
+
+static const char * const led_blink_frequencies[] = {
+	"0.1",
+	"0.2",
+	"0.3",
+	"0.4",
+	"0.5",
+	"0.6",
+	"0.7",
+	"0.8",
+	"0.9",
+	"1.0",
+};
+
+static ssize_t offset_show_blink_behavior(struct device *dev,
+					  struct device_attribute *attr,
+					  u8 offset,
+					  char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS];
+	u8 output[NUM_OUTPUT_ARGS];
+	int ret, ctrl, val, i, n;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+	ctrl = led->reg_table[led->indicator][LED_FUNC_BLINK_BEHAVIOR] + offset;
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
+	val = output[0];
+
+	for (i = 0; i < ARRAY_SIZE(led_blink_behaviors); i++) {
+		if (i == val)
+			n = scnprintf(p, size, "[%s]  ", led_blink_behaviors[i]);
+		else
+			n = scnprintf(p, size, "%s  ", led_blink_behaviors[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+}
+
+static ssize_t offset_store_blink_behavior(struct device *dev,
+					   struct device_attribute *attr,
+					   u8 offset,
+					   const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	int ctrl, val, ret;
+	const char *tmp;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+
+	if (led->id != LED_IND_SOFTWARE && led->id != LED_IND_POWER_STATE)
+		return -ENODEV;
+
+	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+	ctrl = led->reg_table[led->indicator][LED_FUNC_BLINK_BEHAVIOR] + offset;
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	tmp = strsep((char **)&buf, "\n");
+
+	for (val = 0; val < ARRAY_SIZE(led_blink_behaviors); val++)
+		if (!strcasecmp(tmp, led_blink_behaviors[val]))
+			break;
+
+	if (val >= ARRAY_SIZE(led_blink_behaviors))
+		return -EINVAL;
+
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2] = ctrl;
+	input[3] = val;
+
+	ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static ssize_t show_blink_behavior(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	return offset_show_blink_behavior(dev, attr, 0, buf);
+}
+
+static ssize_t store_blink_behavior(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t len)
+{
+	return offset_store_blink_behavior(dev, attr, 0, buf, len);
+}
+
+static ssize_t offset_show_blink_frequency(struct device *dev,
+					  struct device_attribute *attr,
+					  u8 offset,
+					  char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS];
+	u8 output[NUM_OUTPUT_ARGS];
+	int ret, ctrl, val, i, n;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+	ctrl = led->reg_table[led->indicator][LED_FUNC_BLINK_BEHAVIOR] + offset;
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
+	val = output[0];
+
+	for (i = 0; i < ARRAY_SIZE(led_blink_frequencies); i++) {
+		if (i == val)
+			n = scnprintf(p, size, "[%s]  ", led_blink_frequencies[i]);
+		else
+			n = scnprintf(p, size, "%s  ", led_blink_frequencies[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+}
+
+static ssize_t offset_store_blink_frequency(struct device *dev,
+					   struct device_attribute *attr,
+					   u8 offset,
+					   const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	int ctrl, val, ret;
+	const char *tmp;
+
+	if (led->indicator == LED_IND_DISABLE)
+		return -ENODEV;
+
+
+	if (led->id != LED_IND_SOFTWARE && led->id != LED_IND_POWER_STATE)
+		return -ENODEV;
+
+	offset *= led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+	ctrl = led->reg_table[led->indicator][LED_FUNC_BLINK_BEHAVIOR] + offset;
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	tmp = strsep((char **)&buf, "\n");
+
+	for (val = 0; val < ARRAY_SIZE(led_blink_frequencies); val++)
+		if (!strcasecmp(tmp, led_blink_frequencies[val]))
+			break;
+
+	if (val >= ARRAY_SIZE(led_blink_frequencies))
+		return -EINVAL;
+
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2] = ctrl;
+	input[3] = val + 1;
+
+	ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static ssize_t show_blink_frequency(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	return offset_show_blink_frequency(dev, attr, 0, buf);
+}
+
+static ssize_t store_blink_frequency(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t len)
+{
+	return offset_store_blink_frequency(dev, attr, 0, buf, len);
+}
+
+static umode_t nuc_wmi_led_blink_is_visible(struct kobject *kobj,
+					    struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	umode_t mode = attr->mode;
+
+	// TODO: implement for NUC6 API
+	if (led->api_rev == LED_API_NUC6)
+		return 0;
+
+	if (led->id == LED_IND_SOFTWARE)
+		return mode;
+
+	return 0;
+}
+
 static LED_ATTR_RW(indicator);
 static LED_ATTR_RW(color);
+static LED_ATTR_RW(blink_behavior);
+static LED_ATTR_RW(blink_frequency);
 
-LED_ATTR_POWER_STATE_RW(s0_brightness, 0);
-LED_ATTR_POWER_STATE_RW(s3_brightness, 1);
-LED_ATTR_POWER_STATE_RW(s5_brightness, 2);		// Rev 0.64
-LED_ATTR_POWER_STATE_RW(standby_brightness, 2);		// Rev 1.0
-LED_ATTR_POWER_STATE_RW(ready_mode_brightness, 3);	// Rev 1.0
+LED_ATTR_POWER_STATE_RW(s0_brightness, brightness, 0);
+LED_ATTR_POWER_STATE_RW(s0_blink_behavior, blink_behavior, 0);
+LED_ATTR_POWER_STATE_RW(s0_blink_frequency, blink_frequency, 0);
+LED_ATTR_POWER_STATE_RW(s3_brightness, brightness, 1);
+LED_ATTR_POWER_STATE_RW(s3_blink_behavior, blink_behavior, 1);
+LED_ATTR_POWER_STATE_RW(s3_blink_frequency, blink_frequency, 1);
+
+/* Rev 0.64 */
+LED_ATTR_POWER_STATE_RW(s5_brightness, brightness, 2);
+LED_ATTR_POWER_STATE_RW(s5_blink_behavior, blink_behavior, 2);
+LED_ATTR_POWER_STATE_RW(s5_blink_frequency, blink_frequency, 2);
+LED_ATTR_POWER_STATE_RW(ready_mode_brightness, brightness, 3);
+LED_ATTR_POWER_STATE_RW(ready_mode_blink_behavior, blink_behavior, 3);
+LED_ATTR_POWER_STATE_RW(ready_mode_blink_frequency, blink_frequency, 3);
+
+/* Rev 1.0 */
+LED_ATTR_POWER_STATE_RW(standby_brightness, brightness, 2);
+LED_ATTR_POWER_STATE_RW(standby_blink_behavior, blink_behavior, 2);
+LED_ATTR_POWER_STATE_RW(standby_blink_frequency, blink_frequency, 2);
 
 /*
  * Attributes for LEDs
@@ -1121,6 +1393,19 @@ static struct attribute *nuc_wmi_led_power_state_attr[] = {
 	&dev_attr_standby_brightness.attr,
 	&dev_attr_s5_brightness.attr,
 	&dev_attr_ready_mode_brightness.attr,
+
+	&dev_attr_s0_blink_behavior.attr,
+	&dev_attr_s3_blink_behavior.attr,
+	&dev_attr_standby_blink_behavior.attr,
+	&dev_attr_s5_blink_behavior.attr,
+	&dev_attr_ready_mode_blink_behavior.attr,
+
+	&dev_attr_s0_blink_frequency.attr,
+	&dev_attr_s3_blink_frequency.attr,
+	&dev_attr_standby_blink_frequency.attr,
+	&dev_attr_s5_blink_frequency.attr,
+	&dev_attr_ready_mode_blink_frequency.attr,
+
 	NULL,
 };
 
@@ -1139,10 +1424,22 @@ static const struct attribute_group nuc_wmi_led_color_attribute_group = {
 	.attrs = nuc_wmi_led_color_attr,
 };
 
+static struct attribute *nuc_wmi_led_blink_behavior_attr[] = {
+	&dev_attr_blink_behavior.attr,
+	&dev_attr_blink_frequency.attr,
+	NULL,
+};
+
+static const struct attribute_group nuc_wmi_led_blink_attribute_group = {
+	.is_visible = nuc_wmi_led_blink_is_visible,
+	.attrs = nuc_wmi_led_blink_behavior_attr,
+};
+
 static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
 	&nuc_wmi_led_attribute_group,
 	&nuc_wmi_led_power_state_group,
 	&nuc_wmi_led_color_attribute_group,
+	&nuc_wmi_led_blink_attribute_group,
 	NULL
 };
 
-- 
2.31.1

