Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE56387C05
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345128AbhERPKn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:10:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245316AbhERPK2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 243DB6135B;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=OF31wuskOSGZ57gBcSDnyeKus3wSQ2N85viq/571JTI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=twerRVXPU/LJX87CKzUJMXURoFYahwyv/qetsHkE59uBky39byvpggqF9t6aWKlfv
         HGiFDJdh3favyPvXevyxMOlteRw68MN/Qi3XiGPoEXDdTSeO6Jz2OlgUZqSCNbOtTJ
         lmEOT46qes5BcvLHJ95bk+MtdztOF682UCtR0mdeuftFh4gNDYadsPf+UxkkZ9DgaP
         +kQ1pK1MdxAi2LjQXA+/h7FSn5uz6IgdYuBt9SMd0IuiDxHMjym8s/BeJkuVFysQFj
         3TVbIp3WKhk1utPBdqv1Vet38XkmF1zecN1+YKBUo34O5O36/regF4PrBXgb/9y/JK
         iRAKzeddE8VZw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOU-Ae; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 09/17] leds: leds-nuc: add brightness and color for NUC6 API
Date:   Tue, 18 May 2021 17:08:58 +0200
Message-Id: <b216ffbc458606a1058d353bd0ea409b135a58f1.1621349814.git.mchehab+huawei@kernel.org>
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

The NUC6 WMI API is really simple: it has just 2 messages,
that retrieves everything for a LED, and it has just 2 LEDs.

Add support for retrieving and set brightness and color.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 198 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 191 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index cd15ed824234..03fa8bafc5de 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -302,14 +302,13 @@ static int nuc_wmi_query_leds_nuc6(struct device *dev)
 {
 	// FIXME: add a check for the specific models that are known to work
 	struct nuc_wmi *priv = dev_get_drvdata(dev);
-	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	u8 input[NUM_INPUT_ARGS] = { 0 };
 	u8 output[NUM_OUTPUT_ARGS];
 	struct nuc_nmi_led *led;
 	int ret;
 
-	cmd = LED_OLD_GET_STATUS;
 	input[0] = LED_OLD_GET_S0_POWER;
-	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	ret = nuc_nmi_cmd(dev, LED_OLD_GET_STATUS, input, output);
 	if (ret) {
 		dev_warn(dev, "Get S0 Power: error %d\n", ret);
 		return ret;
@@ -322,9 +321,8 @@ static int nuc_wmi_query_leds_nuc6(struct device *dev)
 	led->indicator = fls(led->avail_indicators);
 	priv->num_leds++;
 
-	cmd = LED_OLD_GET_STATUS;
 	input[0] = LED_OLD_GET_S0_RING;
-	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	ret = nuc_nmi_cmd(dev, LED_OLD_GET_STATUS, input, output);
 	if (ret) {
 		dev_warn(dev, "Get S0 Ring: error %d\n", ret);
 		return ret;
@@ -547,6 +545,167 @@ static ssize_t nuc_wmi_set_brightness_offset(struct device *dev,
 	}								       \
 	static DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
 
+/*
+ * NUC6 specific logic
+ */
+
+static int nuc_wmi_nuc6_led_get_set(struct device *dev,
+				    struct nuc_nmi_led *led, int *brightness,
+				    int *blink_fade, int *color_state)
+{
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	int ret;
+
+	if (led->id == POWER_LED)
+		input[0] = LED_OLD_GET_S0_POWER;
+	else
+		input[0] = LED_OLD_GET_S0_RING;
+
+	ret = nuc_nmi_cmd(dev, LED_OLD_GET_STATUS, input, output);
+	if (ret) {
+		dev_warn(dev, "Get %s: error %d\n", led_names[led->id], ret);
+		return ret;
+	}
+
+	if (brightness && *brightness >= 0)
+		input[1] = *brightness;
+	else
+		input[1] = output[0];
+
+	if (blink_fade && *blink_fade >= 0)
+		input[2] = *blink_fade;
+	else
+		input[2] = output[1];
+
+	if (color_state && *color_state >= 0)
+		input[3] = *color_state;
+	else
+		input[3] = output[2];
+
+	ret = nuc_nmi_cmd(dev, LED_OLD_SET_LED, input, output);
+	if (ret) {
+		dev_warn(dev, "Get %s: error %d\n", led_names[led->id], ret);
+		return ret;
+	}
+
+	if (brightness)
+		*brightness = output[0];
+	if (blink_fade)
+		*blink_fade = output[1];
+	if (color_state)
+		*color_state = output[2];
+
+	return 0;
+}
+
+static enum led_brightness nuc_wmi_nuc6_get_brightness(struct led_classdev *cdev)
+{
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	int ret, brightness = -1;
+
+	ret = nuc_wmi_nuc6_led_get_set(cdev->dev, led, &brightness, NULL, NULL);
+	if (ret)
+		return ret;
+
+	return brightness;
+}
+
+static int nuc_wmi_nuc6_set_brightness(struct led_classdev *cdev,
+				       enum led_brightness bright)
+{
+	int brightness = bright;
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	return nuc_wmi_nuc6_led_get_set(cdev->dev, led, &brightness,
+					NULL, NULL);
+}
+
+static const char * const nuc6_power_colors[] = {
+	"disable",
+	"blue",
+	"amber"
+};
+
+static const char * const nuc6_ring_colors[] = {
+	"disable",
+	"cyan",
+	"pink",
+	"yellow",
+	"blue",
+	"red",
+	"green",
+	"white"
+};
+
+static ssize_t nuc6_show_color(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	int color = -1, ret, arr_size, i, n;
+	const char * const*color_names;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	ret = nuc_wmi_nuc6_led_get_set(dev, led, NULL, NULL, &color);
+	if (ret)
+		return ret;
+
+	if (led->id == POWER_LED) {
+		color_names = nuc6_power_colors;
+		arr_size = ARRAY_SIZE(nuc6_power_colors);
+	} else {
+		color_names = nuc6_ring_colors;
+		arr_size = ARRAY_SIZE(nuc6_ring_colors);
+	}
+
+	for (i = 0; i < arr_size; i++) {
+		if (i == color)
+			n = scnprintf(p, size, "[%s]  ", color_names[i]);
+		else
+			n = scnprintf(p, size, "%s  ", color_names[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+
+}
+
+static ssize_t nuc6_store_color(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	const char *tmp;
+	int ret, color;
+
+	tmp = strsep((char **)&buf, ",\n");
+
+	if (led->id == POWER_LED) {
+		for (color = ARRAY_SIZE(nuc6_power_colors)+1; color >= 0; color--)
+			if (!strcasecmp(tmp, nuc6_power_colors[color]))
+				    break;
+	} else {
+		for (color = ARRAY_SIZE(nuc6_ring_colors)+1; color >= 0; color--)
+			if (!strcasecmp(tmp, nuc6_ring_colors[color]))
+				    break;
+	}
+
+	if (color < 0)
+		return -EINVAL;
+
+	ret = nuc_wmi_nuc6_led_get_set(dev, led, NULL, NULL, &color);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 /* Show/change the LED indicator */
 
 static const char * const led_indicators[] = {
@@ -660,6 +819,9 @@ static ssize_t show_color(struct device *dev,
 	char *p = buf;
 	int color, r, g, b;
 
+	if (led->api_rev == LED_API_NUC6)
+		return nuc6_show_color(dev, attr, buf);
+
 	if (led->indicator == LED_IND_DISABLE)
 		return -ENODEV;
 
@@ -726,6 +888,9 @@ static ssize_t store_color(struct device *dev,
 	const char *tmp;
 	u8 r, g, b, val;
 
+	if (led->api_rev == LED_API_NUC6)
+		return nuc6_store_color(dev, attr, buf, len);
+
 	if (led->indicator == LED_IND_DISABLE)
 		return -ENODEV;
 
@@ -828,6 +993,9 @@ static umode_t nuc_wmi_led_color_is_visible(struct kobject *kobj,
 	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
 	umode_t mode = attr->mode;
 
+	if (led->api_rev == LED_API_NUC6)
+		return mode;
+
 	if (led->color_type & LED_SINGLE_COLOR)
 		return 0;
 
@@ -981,17 +1149,33 @@ static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
 	NULL
 };
 
+static const struct attribute_group *nuc_wmi_nuc6_led_attribute_groups[] = {
+	&nuc_wmi_led_color_attribute_group,
+	NULL
+};
+
 static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led,
 				enum led_api_rev api_rev)
 {
-	int brightness;
+	int ret, brightness;
 
 	led->cdev.name = led_names[led->id];
 	led->dev = dev;
 	led->api_rev = api_rev;
 
 	if (led->api_rev == LED_API_NUC6) {
-		// FIXME: add NUC6-specific API bits here
+		brightness = -1;
+		ret = nuc_wmi_nuc6_led_get_set(dev, led, &brightness,
+					       NULL, NULL);
+		if (ret)
+			return ret;
+
+		led->cdev.groups = nuc_wmi_nuc6_led_attribute_groups;
+		led->cdev.delayed_set_value = brightness;
+		led->cdev.max_brightness = 100;
+		led->cdev.brightness_get = nuc_wmi_nuc6_get_brightness;
+		led->cdev.brightness_set_blocking = nuc_wmi_nuc6_set_brightness;
+
 		return devm_led_classdev_register(dev, &led->cdev);
 	}
 
-- 
2.31.1

