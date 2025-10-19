Return-Path: <linux-leds+bounces-5816-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06420BEE240
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 11:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B36584034CA
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 09:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8024C2E54DB;
	Sun, 19 Oct 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3svXWsf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706492E62B1
	for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865865; cv=none; b=eLKekbAsWsrgil1Bz3236S88+tvGChc4Kneaab+s9KpttEJCOJ3Hzrp/EbAzxUZfYqdgSp1XjZG9SJT7RihceuX7ZmyDI0Fu6IOAw1OOTDU+EBGM77FheSX53FTQb89TdGFQxWnTYALALYh4+xk9DC5XGDnjUm9nnbCtcAcRDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865865; c=relaxed/simple;
	bh=d2j7NxlV9omc78wZTn08BPA6DouKAaOjv1HfRXDwyrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfP+dwAWg1hn9/K7lhbW1X6xr/BNDSJhptXk7sA0sLp82l9ny5jVsQhjliFsb9Cq8LIcVVq1svB67+O0qrKpFmvvWPvpVYlJZ3UbCYe3x6bkS5rfukXxcyon+6vTL+xiT1XmxedYL3AmzcPJYNZcpnOT+B0ZfaOJQPA53Jkh0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3svXWsf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-290c2b6a6c2so28463105ad.1
        for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865863; x=1761470663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhO7MCB3KH4LVHf2spmD2QY+NVBeLZ0tKA7UruoI/6I=;
        b=c3svXWsfAb4My5ECEskzZJE5dD4x7kR31McufytyLix7YrEhy47vCnBxpwPRVETk8t
         sRxYm5wWPjODYieZoMVExc+OA3CNaDI0bT4wwUNpvRIecHbQ7946YXL4RoRDWAZfINVC
         iy96O9dXR8ywyN4+LgpDuaWlKZKTLkPgWyrtCoM9JlzpcNsCR+W8TOIJB7fKmuGJSX/0
         /SN1WU0KnhqZBZC52l2rSVDOBfKet9n531CQqIP8V1lutWtLokam437r1okmiVte6T4c
         Hlitq83I+4inHBIiZpMhQvsSfmrBgqlD1bSJHAW126GZiQdwYO5VH+7YNTSjMQa1T50I
         El0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865863; x=1761470663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhO7MCB3KH4LVHf2spmD2QY+NVBeLZ0tKA7UruoI/6I=;
        b=jXLU22mwDMbfXNLCr8sNiXzpaJjG/Jfqno2lvz9ly3aXqDdDtdcjkWiGT8SeInGXmV
         5hSJoCwnrHFXk8lKZ0emNWJ+rpOAiDuCjM8lA1xZXKNBR6X938paounI2QHkuyDYlSke
         DVwg5di6xUPL/nK30gmSTc1hfZU9sSOF7uMa7wU82mM9Hb+IPn3KTPF5mo4+7a6Yvgw1
         CfStgnidDSKpuFlhZtB1S6Bg6XZAzMzQpspO/7XxcxcQ23O4vRxkmJAwjQeDLH98D0Ku
         XbwpbGT70w1gdVCutH89GNkvcOlHwqtQHMJwiNg83jiaW01WfeLzhOYEBqpMvGXN34fz
         W1cw==
X-Forwarded-Encrypted: i=1; AJvYcCVCIlLo36jTD8o6BkF7Zen5UL0kBE7nObpPd+DOerhWlIPzwN/7zaevhsdjPV2ZHiZcFKq0b4xilW1a@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/YkoVPxvtOijeaoOCdAoN1fG7bjVmI9fQGbn6kTmw1EDjvAJW
	PvTCO0FTUnZCSrCRTETCtGVv8e5Rih+bSwb2knJZH10oJSupX3VNZaEI
X-Gm-Gg: ASbGncuFx2onqwSKnAYqAf5gdDuJ2OXFvKm7gf2CC2f3e/ao3Y/MKvZEs8Oma68a0Rk
	zFvw856lEwMYLRgLTqAQBOMJ2cbOEGsCyIMhaO7xjRJCyw5nQ5mPg9rGZDLKCnseonEAUApMZCU
	S6vG+uEdYmV++EhKpOogr+YsT4InD4zNIQ5h0p6dIcBMklgEA1jpXjvXXz65u5yz2WpxFkg0fYk
	ZjYaJpts4tPxKHsfP0xu62uakwajwQqQL5YmDGHdEEu73jPEsHgVaxg+/urJUTKOTOj+kLB1vDE
	byl3VgF+/4oQPOcxzTzCcDGn8hBOvffoE55xkVvPXtIzbG2Zf3UZdTeyu2M3us4qRUj3hAhQhrw
	Pu3gap3z3vbu8ZPLFbnDqacMWekWwU5VrveD/X01qg/gjZ2nbh37bdgy5gaVcdVm/i+XF0TPxVh
	iaJw9r62voMiGFAR1wTDo=
X-Google-Smtp-Source: AGHT+IF9dWfAKn2dpR4POK743I+/yqjEHsSr9P5UpG7nJNAr+rfSu+fgoiAxZlEqwlWkmmDiqWnMFg==
X-Received: by 2002:a17:903:32c9:b0:249:3efa:3c99 with SMTP id d9443c01a7336-290cba4e6cdmr116696265ad.61.1760865862631;
        Sun, 19 Oct 2025 02:24:22 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.99.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebd215sm48313115ad.14.2025.10.19.02.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:24:22 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Date: Sun, 19 Oct 2025 22:23:27 +1300
Message-ID: <20251019092331.49531-5-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019092331.49531-1-professorjonny98@gmail.com>
References: <20251019092331.49531-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Introduces a new driver that implements virtual LED groups,
aggregating multiple monochromatic LEDs into virtual groups and providing
priority-based control for concurrent state management.

This driver is a work in progress, I am unable to get the read-only diagnostic
sysfs attributes to show under the led framework.

Author: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Co Author: Jonathan Brophy <professor_jonny@hotmail.com>
Copyright (C) 2024 Jonathan Brophy <professor_jonny@hotmail.com>

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Tested-by: Jonathan Brophy <professor_jonny@hotmail.com>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 drivers/leds/rgb/Kconfig                   |  17 +
 drivers/leds/rgb/Makefile                  |   1 +
 drivers/leds/rgb/leds-group-virtualcolor.c | 513 +++++++++++++++++++++
 3 files changed, 531 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-group-virtualcolor.c

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 222d943d826a..70a80fd46b9c 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -75,4 +75,21 @@ config LEDS_MT6370_RGB
 	  This driver can also be built as a module. If so, the module
 	  will be called "leds-mt6370-rgb".

+config LEDS_GROUP_VIRTUALCOLOR
+	tristate "Virtual LED Group Driver with Priority Control"
+	depends on OF || COMPILE_TEST
+	help
+	  This option enables support for virtual LED groups that aggregate
+	  multiple monochromatic LEDs with priority-based control. It allows
+	  managing concurrent LED activation requests by ensuring only the
+	  highest-priority LED state is active at any given time.
+
+	  Multiple LEDs can be grouped together and controlled as a single
+	  virtual LED with priority levels and blinking support. This is
+	  useful for systems that need to manage multiple LED indicators
+	  with different priority levels.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-group-virtualcolor.
+
 endif # LEDS_CLASS_MULTICOLOR
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index a501fd27f179..693fd300b849 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
 obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
+obj-$(CONFIG_LEDS_GROUP_VIRTUALCOLOR)	+= leds-group-virtualcolor.o
diff --git a/drivers/leds/rgb/leds-group-virtualcolor.c b/drivers/leds/rgb/leds-group-virtualcolor.c
new file mode 100644
index 000000000000..035985174743
--- /dev/null
+++ b/drivers/leds/rgb/leds-group-virtualcolor.c
@@ -0,0 +1,513 @@
+// PWM RGB LED driver with per-color grouped LED arrays
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/list.h>
+
+#define MAX_LEDS_PER_COLOR 5
+
+enum led_color_channel {
+	LED_RED = 0,
+	LED_GREEN = 1,
+	LED_BLUE = 2,
+	LED_COLOR_MAX
+};
+
+struct color_channel {
+	struct led_classdev **leds;      // Array of LEDs for this color
+	int num_leds;                     // Count of LEDs in this color
+	enum led_brightness brightness;   // Current brightness for this color
+	char *color_name;
+};
+
+struct virtual_led {
+	struct led_classdev cdev;
+	struct led_classdev **monochromatics;     // Regular monochromatic LEDs
+	struct color_channel colors[LED_COLOR_MAX];  // RGB color channels
+	int num_monochromatics;
+	struct leds_virtualcolor *vc_data;
+	int priority;
+	struct list_head list;
+};
+
+struct leds_virtualcolor {
+	struct virtual_led *vleds;
+	int num_vleds;
+	struct list_head active_leds;
+	struct mutex lock;
+};
+
+/**
+ * Apply brightness to all LEDs of a specific color
+ */
+static void color_set_brightness(struct color_channel *color,
+				  enum led_brightness brightness)
+{
+	int i;
+
+	for (i = 0; i < color->num_leds; i++)
+		led_set_brightness(color->leds[i], brightness);
+
+	color->brightness = brightness;
+}
+
+/**
+ * Apply brightness to monochromatic LEDs
+ */
+static void virtual_set_monochromatic_brightness(struct virtual_led *vled,
+						  enum led_brightness brightness)
+{
+	int i;
+
+	for (i = 0; i < vled->num_monochromatics; i++)
+		led_set_brightness(vled->monochromatics[i], brightness);
+}
+
+/**
+ * Apply brightness to all RGB color channels
+ */
+static void virtual_set_rgb_brightness(struct virtual_led *vled,
+				       enum led_brightness brightness)
+{
+	int i;
+
+	for (i = 0; i < LED_COLOR_MAX; i++) {
+		if (vled->colors[i].num_leds > 0)
+			color_set_brightness(&vled->colors[i], brightness);
+	}
+}
+
+/**
+ * Set independent brightness per color (R, G, B)
+ */
+static void virtual_set_rgb_independent(struct virtual_led *vled,
+					 enum led_brightness r,
+					 enum led_brightness g,
+					 enum led_brightness b)
+{
+	if (vled->colors[LED_RED].num_leds > 0)
+		color_set_brightness(&vled->colors[LED_RED], r);
+
+	if (vled->colors[LED_GREEN].num_leds > 0)
+		color_set_brightness(&vled->colors[LED_GREEN], g);
+
+	if (vled->colors[LED_BLUE].num_leds > 0)
+		color_set_brightness(&vled->colors[LED_BLUE], b);
+}
+
+static ssize_t priority_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	int priority;
+
+	mutex_lock(&vled->vc_data->lock);
+	priority = vled->priority;
+	mutex_unlock(&vled->vc_data->lock);
+
+	return sysfs_emit(buf, "%d\n", priority);
+}
+
+static ssize_t priority_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	int new_priority;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &new_priority);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&vled->vc_data->lock);
+	vled->priority = new_priority;
+	mutex_unlock(&vled->vc_data->lock);
+
+	return count;
+}
+
+/**
+ * Per-color brightness sysfs attributes
+ */
+static ssize_t red_brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	return sysfs_emit(buf, "%d\n", vled->colors[LED_RED].brightness);
+}
+
+static ssize_t red_brightness_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	int brightness;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &brightness);
+	if (ret < 0)
+		return ret;
+
+	if (brightness < 0 || brightness > LED_FULL)
+		return -EINVAL;
+
+	mutex_lock(&vled->vc_data->lock);
+	color_set_brightness(&vled->colors[LED_RED], brightness);
+	mutex_unlock(&vled->vc_data->lock);
+
+	return count;
+}
+
+static ssize_t green_brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	return sysfs_emit(buf, "%d\n", vled->colors[LED_GREEN].brightness);
+}
+
+static ssize_t green_brightness_store(struct device *dev, struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	int brightness;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &brightness);
+	if (ret < 0)
+		return ret;
+
+	if (brightness < 0 || brightness > LED_FULL)
+		return -EINVAL;
+
+	mutex_lock(&vled->vc_data->lock);
+	color_set_brightness(&vled->colors[LED_GREEN], brightness);
+	mutex_unlock(&vled->vc_data->lock);
+
+	return count;
+}
+
+static ssize_t blue_brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	return sysfs_emit(buf, "%d\n", vled->colors[LED_BLUE].brightness);
+}
+
+static ssize_t blue_brightness_store(struct device *dev, struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	int brightness;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &brightness);
+	if (ret < 0)
+		return ret;
+
+	if (brightness < 0 || brightness > LED_FULL)
+		return -EINVAL;
+
+	mutex_lock(&vled->vc_data->lock);
+	color_set_brightness(&vled->colors[LED_BLUE], brightness);
+	mutex_unlock(&vled->vc_data->lock);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(priority);
+static DEVICE_ATTR_RW(red_brightness);
+static DEVICE_ATTR_RW(green_brightness);
+static DEVICE_ATTR_RW(blue_brightness);
+
+static struct attribute *virtual_led_attrs[] = {
+	&dev_attr_priority.attr,
+	&dev_attr_red_brightness.attr,
+	&dev_attr_green_brightness.attr,
+	&dev_attr_blue_brightness.attr,
+	NULL,
+};
+
+static const struct attribute_group virtual_led_attr_group = {
+	.attrs = virtual_led_attrs,
+};
+
+static bool virtual_led_is_active(struct list_head *head, struct virtual_led *vled)
+{
+	struct virtual_led *entry;
+
+	list_for_each_entry(entry, head, list) {
+		if (entry == vled)
+			return true;
+	}
+
+	return false;
+}
+
+static int virtual_led_brightness_set(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct virtual_led *vled = container_of(cdev, struct virtual_led, cdev);
+	struct leds_virtualcolor *vc_data = vled->vc_data;
+	struct virtual_led *active;
+
+	mutex_lock(&vc_data->lock);
+
+	active = list_first_entry_or_null(&vc_data->active_leds, struct virtual_led, list);
+	if (active) {
+		if (active->priority > vled->priority)
+			goto out_unlock;
+
+		virtual_set_monochromatic_brightness(active, LED_OFF);
+		virtual_set_rgb_brightness(active, LED_OFF);
+	}
+
+	if (brightness == LED_OFF) {
+		if (virtual_led_is_active(&vc_data->active_leds, vled))
+			list_del(&vled->list);
+
+		active = list_first_entry_or_null(&vc_data->active_leds, struct virtual_led, list);
+		if (active) {
+			virtual_set_monochromatic_brightness(active, active->cdev.brightness);
+			/* Restore each color to its saved brightness */
+			virtual_set_rgb_independent(active,
+						    active->colors[LED_RED].brightness,
+						    active->colors[LED_GREEN].brightness,
+						    active->colors[LED_BLUE].brightness);
+		}
+	} else {
+		if (!virtual_led_is_active(&vc_data->active_leds, vled))
+			list_add(&vled->list, &vc_data->active_leds);
+
+		active = list_first_entry_or_null(&vc_data->active_leds, struct virtual_led, list);
+		if (active) {
+			virtual_set_monochromatic_brightness(active, brightness);
+			virtual_set_rgb_brightness(active, brightness);
+		}
+	}
+
+out_unlock:
+	mutex_unlock(&vc_data->lock);
+
+	return 0;
+}
+
+/**
+ * Parse monochromatic LEDs from device tree
+ */
+static int parse_monochromatic_leds(struct device *dev, struct device_node *child,
+				    struct virtual_led *vled)
+{
+	u32 mono_count;
+	int ret, i;
+
+	mono_count = of_property_count_elems_of_size(child, "leds", sizeof(u32));
+	if (mono_count <= 0) {
+		vled->num_monochromatics = 0;
+		return 0;
+	}
+
+	vled->num_monochromatics = mono_count;
+	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
+					    sizeof(*vled->monochromatics), GFP_KERNEL);
+	if (!vled->monochromatics)
+		return -ENOMEM;
+
+	for (i = 0; i < vled->num_monochromatics; i++) {
+		struct led_classdev *led_cdev;
+
+		led_cdev = devm_of_led_get(dev, i);
+		if (IS_ERR(led_cdev)) {
+			ret = PTR_ERR(led_cdev);
+			return dev_err_probe(dev, ret,
+					     "Failed to get monochromatic LED %d\n", i);
+		}
+
+		vled->monochromatics[i] = led_cdev;
+	}
+
+	return 0;
+}
+
+/**
+ * Parse color-grouped PWM LEDs from device tree
+ * Format:
+ *   pwm-leds-red = <&pwm_r0 &pwm_r1>;
+ *   pwm-leds-green = <&pwm_g0 &pwm_g1>;
+ *   pwm-leds-blue = <&pwm_b0>;
+ */
+static int parse_pwm_color_leds(struct device *dev, struct device_node *child,
+				struct virtual_led *vled)
+{
+	const char *color_props[] = {"pwm-leds-red", "pwm-leds-green", "pwm-leds-blue"};
+	const char *color_names[] = {"Red", "Green", "Blue"};
+	int ret, c, i, count;
+
+	for (c = 0; c < LED_COLOR_MAX; c++) {
+		count = of_property_count_elems_of_size(child, color_props[c], sizeof(u32));
+		if (count < 0) {
+			vled->colors[c].num_leds = 0;
+			continue;
+		}
+
+		if (count > MAX_LEDS_PER_COLOR) {
+			return dev_err_probe(dev, -EINVAL,
+					     "Too many %s LEDs (%d), max %d\n",
+					     color_names[c], count, MAX_LEDS_PER_COLOR);
+		}
+
+		vled->colors[c].num_leds = count;
+		vled->colors[c].color_name = (char *)color_names[c];
+		vled->colors[c].brightness = LED_OFF;
+
+		vled->colors[c].leds = devm_kcalloc(dev, count,
+						    sizeof(*vled->colors[c].leds), GFP_KERNEL);
+		if (!vled->colors[c].leds)
+			return -ENOMEM;
+
+		for (i = 0; i < count; i++) {
+			struct led_classdev *led_cdev;
+
+			led_cdev = devm_of_led_get(dev, i);
+			if (IS_ERR(led_cdev)) {
+				ret = PTR_ERR(led_cdev);
+				return dev_err_probe(dev, ret,
+						     "Failed to get %s LED %d\n",
+						     color_names[c], i);
+			}
+
+			vled->colors[c].leds[i] = led_cdev;
+		}
+
+		dev_dbg(dev, "Parsed %d %s LEDs\n", count, color_names[c]);
+	}
+
+	return 0;
+}
+
+static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
+				       struct virtual_led *vled,
+				       struct leds_virtualcolor *vc_data)
+{
+	struct led_init_data init_data = {};
+	u32 max_brightness;
+	int ret, total_rgb_leds = 0, c;
+
+	ret = of_property_read_u32(child, "priority", &vled->priority);
+	if (ret)
+		vled->priority = 0;
+
+	INIT_LIST_HEAD(&vled->list);
+
+	/* Parse monochromatic LEDs */
+	ret = parse_monochromatic_leds(dev, child, vled);
+	if (ret)
+		return ret;
+
+	/* Parse color-grouped PWM LEDs */
+	ret = parse_pwm_color_leds(dev, child, vled);
+	if (ret)
+		return ret;
+
+	/* Count total RGB LEDs */
+	for (c = 0; c < LED_COLOR_MAX; c++)
+		total_rgb_leds += vled->colors[c].num_leds;
+
+	/* At least one type of LED must be present */
+	if (vled->num_monochromatics == 0 && total_rgb_leds == 0) {
+		return dev_err_probe(dev, -EINVAL,
+				     "No LEDs specified for virtual LED\n");
+	}
+
+	ret = of_property_read_u32(child, "max-brightness", &max_brightness);
+	if (ret)
+		vled->cdev.max_brightness = LED_FULL;
+	else
+		vled->cdev.max_brightness = max_brightness;
+
+	vled->cdev.brightness_set_blocking = virtual_led_brightness_set;
+	vled->cdev.flags = LED_CORE_SUSPENDRESUME;
+
+	ret = devm_led_classdev_register_ext(dev, &vled->cdev, &init_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register virtual LED\n");
+
+	dev_set_drvdata(vled->cdev.dev, vled);
+
+	ret = devm_device_add_group(vled->cdev.dev, &virtual_led_attr_group);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create sysfs attributes\n");
+
+	vled->vc_data = vc_data;
+
+	dev_info(dev, "Virtual LED: %d mono, %d red, %d green, %d blue\n",
+		 vled->num_monochromatics, vled->colors[LED_RED].num_leds,
+		 vled->colors[LED_GREEN].num_leds, vled->colors[LED_BLUE].num_leds);
+
+	return 0;
+}
+
+static int leds_virtualcolor_probe(struct platform_device *pdev)
+{
+	struct leds_virtualcolor *vc_data;
+	struct device *dev = &pdev->dev;
+	int count = 0;
+	int ret;
+
+	vc_data = devm_kzalloc(dev, sizeof(*vc_data), GFP_KERNEL);
+	if (!vc_data)
+		return -ENOMEM;
+
+	mutex_init(&vc_data->lock);
+
+	ret = devm_add_action_or_reset(dev, (void (*)(void *))mutex_destroy,
+				       &vc_data->lock);
+	if (ret)
+		return ret;
+
+	INIT_LIST_HEAD(&vc_data->active_leds);
+
+	vc_data->num_vleds = of_get_child_count(dev->of_node);
+	if (vc_data->num_vleds == 0) {
+		dev_err(dev, "No virtual LEDs defined\n");
+		return -EINVAL;
+	}
+
+	vc_data->vleds = devm_kcalloc(dev, vc_data->num_vleds, sizeof(*vc_data->vleds), GFP_KERNEL);
+	if (!vc_data->vleds)
+		return -ENOMEM;
+
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
+		struct virtual_led *vled = &vc_data->vleds[count];
+
+		ret = leds_virtualcolor_init_vled(dev, child, vled, vc_data);
+		if (ret)
+			return ret;
+
+		count++;
+	}
+
+	platform_set_drvdata(pdev, vc_data);
+
+	return 0;
+}
+
+static const struct of_device_id leds_virtualcolor_of_match[] = {
+	{ .compatible = "leds-group-virtualcolor" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, leds_virtualcolor_of_match);
+
+static struct platform_driver leds_virtualcolor_driver = {
+	.probe  = leds_virtualcolor_probe,
+	.driver = {
+		.name           = "leds_virtualcolor",
+		.of_match_table = leds_virtualcolor_of_match,
+	},
+};
+
+module_platform_driver(leds_virtualcolor_driver);
+
+MODULE_AUTHOR("Radoslav Tsvetkov <rtsvetkov@gradotech.eu>");
+MODULE_DESCRIPTION("Virtual Color LED Driver with RGB Color Grouping");
+MODULE_LICENSE("GPL");
--
2.43.0

