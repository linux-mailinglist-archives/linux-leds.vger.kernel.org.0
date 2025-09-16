Return-Path: <linux-leds+bounces-5511-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAEB594A0
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 13:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E647AFD5E
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 11:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579A329B237;
	Tue, 16 Sep 2025 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnYu2Vbm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA7246BA9
	for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020552; cv=none; b=Nk27F0Z7cQkwuh2myIgV9Qr1gZAElPbG6XxyNu177KY5SZBDdjN5Sw0tiHbac5ByQtBKQyFyBDB5X3ojXkHOxfteCnNKg3cQO6b1H78aZd3yCpfm0JI9Ns4a6cVhw9Tma+9G7nYgOFNV33zdpFkFOOmm++0pf//noU4RpKfm8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020552; c=relaxed/simple;
	bh=UZtz5b/uUgoUD1UwpAGVyYuThc4jme+i123H5BliUBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fus1TBCjntuZjQ9HdF3ISKxnAzZZB0DzXBb9wRzzHoWXx9lHYlayMDc3TDMUXFq8Tri5bgd0OL/KwEg45qMykOtdihdLIZ6ylhqzWzK5nm/0H+trW+03lIq7MLEVDWk1JaQwe+lVhXYVzzpHgryfuTsOzXeNaBN1pqXeC9e0AUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnYu2Vbm; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so3548612a12.0
        for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758020550; x=1758625350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuvxZ5Qbf3VnowqeNrmAPCbnKQuU23fVm2H12Ns0vlk=;
        b=MnYu2VbmJiwO3syDHIURg24jZb/DlyMboHV9l8wdi/mFw5y8kQvRBNur0voJp1nZ5G
         f5/uXg6jYIqOv7VEGGM9R4/9ZQThOVC3zkGftm05nhIAPR+y4Jfq2s8uTi7dVc3GkcDv
         rbGlzTxzHbade19Rvzo+5+IGElUd/ZPxUf1Fy8Lb4mF2590CtVWn7xGuPd2sjh+5DgTN
         +bzFzEAh6W1CqURbr1nsFak5EW4iGc+G4MYP31UYvITlAS1+/weBtmq+UjRWzboCGS1b
         OYYnkEihz5cmTqjOdY3vEnooRTrFckB/fhANjRLC5HNOzbtV3M6fsi7zBTGlgjiF3zwt
         lYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020550; x=1758625350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuvxZ5Qbf3VnowqeNrmAPCbnKQuU23fVm2H12Ns0vlk=;
        b=HqI4qXLyY4L8kOI8fO/MenJ6tpXTjMEsxq6TwRJaTGiu8nFO2Zs0ZdM9v6gPdSs3/W
         WUOCX80z1o07duyKaa1eJrBbAKSygmgz2c3fksMhL0CVgZC1fLcjH98HELOUAsncQcMn
         8WetzBuyA1y06ffhPhwyEzmwsvGim709jCIpxSu2zKfI45TVSIs03GGqDbG8wvTlf6Dt
         aP8Fj4P77JcpyrhheR8xmXsChQEl9x9F9YxSP9KsWftEo+XCSEmWnbVqqklmHwTEa3uO
         pke+NRVuhAAH30h/08cL1MenZT3QK1xtxRPWglrV5YyZC48BG+BmX2ng8mSRDOpaMdbk
         KH6A==
X-Forwarded-Encrypted: i=1; AJvYcCUBo2kXVZ/5fHMdMbYpJPLFxaPL/ulIB67GMQZl4rFe8uEqNNpgmEYxiUOmXKmPnf5MzNT4uv2Gk2Zo@vger.kernel.org
X-Gm-Message-State: AOJu0YzgaidKAQcek+B0MDBMaOifg2M7ErVnez2w+zO1hfXCpXH1SdIo
	4pfnPf3OIqfSV5FY1JH4nnehVSnVy6WgKcmdFiq1RF80weazANjzkQdV
X-Gm-Gg: ASbGncv3WJ3GAYS3NI8nxthp3IS2qUzD2yxS1Mx9sEMRyAR3uOoFbk9jxJaihZS5jgu
	p4bPjyZ9RLDrk/YFoK19oXr/vr8nS/ul8DbNeXFig6rYhXVYhdvCRamCJEpsyifrGqO4rkmyEBJ
	zrVvCSC+OJ6LY2H+8y8jz3v7aj95VkmSR0gLQpUlOJc7/YB9q8E6XKy8Rea1CAbp/5ou43p9vlB
	H/OZlqGuJzvm1Plvd5K/yatqq9KCdExz6iEm22r4IPtNlNnoBu4A2VhWx5FZ80kB/UYO2bz/obj
	2LqycF3n8739+Q3/CRQjy7FNQRfGPseGpbYJuupOnr1tfnmdADfcF4KqVQBujMWjpDvR8tWp2Uf
	NpVmAMPmuulNIoXvT7fxHPgFZixGZa41dHKZny7BsWaoZ
X-Google-Smtp-Source: AGHT+IHm7P16AkmvE9Ap6smzkwxN5DL0cMYK6QWf4VMyRep6FnevitN+4+XVPxTgGmxiX5YBjKXnhQ==
X-Received: by 2002:a17:903:2ac6:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-25d27c1c8c4mr186394785ad.55.1758020549491;
        Tue, 16 Sep 2025 04:02:29 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304ce8sm158761725ad.128.2025.09.16.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:02:29 -0700 (PDT)
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
Subject: [PATCH 1/5] leds: Add Virtual Color LED Group driver
Date: Tue, 16 Sep 2025 23:02:13 +1200
Message-ID: <20250916110217.45894-1-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

This commit introduces a new driver that implements virtual LED groups
by aggregating multiple monochromatic LEDs. The driver provides
priority-based control to manage concurrent LED activation requests,
ensuring that only the highest-priority LED group's state is active at
any given time.

This driver is useful for systems that require coordinated control over
multiple LEDs, such as RGB indicators or status LEDs that reflect
complex system states.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 drivers/leds/rgb/leds-group-virtualcolor.c | 441 +++++++++++++++++++++
 1 file changed, 441 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-group-virtualcolor.c

diff --git a/drivers/leds/rgb/leds-group-virtualcolor.c b/drivers/leds/rgb/leds-group-virtualcolor.c
new file mode 100644
index 000000000000..248ac69d6515
--- /dev/null
+++ b/drivers/leds/rgb/leds-group-virtualcolor.c
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Virtual LED Group Driver with Priority Control
+ *
+ * This driver implements virtual LED groups by aggregating multiple
+ * monochromatic LEDs. It provides priority-based control for managing
+ * concurrent LED activation requests, ensuring only the highest-priority
+ * LED state is active at any given time.
+ *
+ * Code create by Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+ * Copyright (C) 2024 Jonathan Brophy <professor_jonny@hotmail.com>
+ *
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct virtual_led {
+	struct led_classdev cdev;
+	struct led_classdev **monochromatics;
+	struct leds_virtualcolor *vc_data;
+	int num_monochromatics;
+	int priority;
+	unsigned long blink_delay_on;
+	unsigned long blink_delay_off;
+	struct list_head list;
+};
+
+struct leds_virtualcolor {
+	struct virtual_led *vleds;
+	int num_vleds;
+	struct list_head active_leds;
+	struct mutex lock; // Protects access to active LEDs
+};
+
+static void virtual_set_monochromatic_brightness(struct virtual_led *vled,
+						 enum led_brightness brightness)
+{
+	int i;
+
+	if (vled->blink_delay_on || vled->blink_delay_off) {
+		unsigned long blink_mask = (BIT(LED_BLINK_SW) | BIT(LED_BLINK_ONESHOT) |
+					    BIT(LED_SET_BLINK));
+
+		/*
+		 * Make sure the LED is not already blinking.
+		 * We don't want to call led_blink_set multiple times.
+		 */
+		if (!(vled->cdev.work_flags & blink_mask))
+			led_blink_set(&vled->cdev, &vled->blink_delay_on, &vled->blink_delay_off);
+
+		/* Update the blink delays if they have changed */
+		if (vled->blink_delay_on != vled->cdev.blink_delay_on ||
+		    vled->blink_delay_off != vled->cdev.blink_delay_off) {
+			vled->cdev.blink_delay_on = vled->blink_delay_on;
+			vled->cdev.blink_delay_off = vled->blink_delay_off;
+		}
+	}
+
+	for (i = 0; i < vled->num_monochromatics; i++)
+		led_set_brightness(vled->monochromatics[i], brightness);
+}
+
+static ssize_t priority_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", vled->priority);
+}
+
+static ssize_t priority_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			      size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	int new_priority;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &new_priority);
+	if (ret < 0)
+		return ret;
+
+	vled->priority = new_priority;
+	return count;
+}
+
+static DEVICE_ATTR_RW(priority);
+
+static ssize_t blink_delay_on_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%lu\n", vled->blink_delay_on);
+}
+
+static ssize_t blink_delay_on_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	unsigned long new_delay;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &new_delay);
+	if (ret < 0)
+		return ret;
+
+	/* Apply new delay immediately */
+	vled->blink_delay_on = new_delay;
+	virtual_set_monochromatic_brightness(vled, vled->cdev.brightness);
+
+	return count;
+}
+
+static ssize_t blink_delay_off_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%lu\n", vled->blink_delay_off);
+}
+
+static ssize_t blink_delay_off_store(struct device *dev, struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct virtual_led *vled = dev_get_drvdata(dev);
+	unsigned long new_delay;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &new_delay);
+	if (ret < 0)
+		return ret;
+
+	/* Apply new delay immediately */
+	vled->blink_delay_off = new_delay;
+	virtual_set_monochromatic_brightness(vled, vled->cdev.brightness);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(blink_delay_on);
+static DEVICE_ATTR_RW(blink_delay_off);
+
+static void restore_sysfs_write_access(void *data)
+{
+	struct led_classdev *led_cdev = data;
+
+	mutex_lock(&led_cdev->led_access);
+	led_sysfs_enable(led_cdev);
+	mutex_unlock(&led_cdev->led_access);
+}
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
+static int virtual_led_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
+{
+	struct virtual_led *vled = container_of(cdev, struct virtual_led, cdev);
+	struct leds_virtualcolor *vc_data = vled->vc_data;
+	struct virtual_led *active;
+
+	mutex_lock(&vc_data->lock);
+
+	active = list_first_entry_or_null(&vc_data->active_leds, struct virtual_led, list);
+	if (active) {
+		/*
+		 * If the currently active LED has a higher priority,
+		 * ignore the new request.
+		 */
+		if (active->priority > vled->priority)
+			goto out_unlock;
+
+		/*
+		 * The currently active LED is going to be replaced,
+		 * turn off it's monochromatic LEDs.
+		 */
+		virtual_set_monochromatic_brightness(active, LED_OFF);
+	}
+
+	if (brightness == LED_OFF) {
+		/*
+		 * If the LED is already active, remove it from the active list
+		 * and update the brightness of the next highest priority LED.
+		 */
+		if (virtual_led_is_active(&vc_data->active_leds, vled))
+			list_del(&vled->list);
+
+		active = list_first_entry_or_null(&vc_data->active_leds, struct virtual_led, list);
+		if (active)
+			virtual_set_monochromatic_brightness(active, active->cdev.brightness);
+	} else {
+		/* Add the LED to the active list and update the brightness */
+		if (!virtual_led_is_active(&vc_data->active_leds, vled))
+			list_add(&vled->list, &vc_data->active_leds);
+
+		active = list_first_entry_or_null(&vc_data->active_leds, struct virtual_led, list);
+		if (active)
+			virtual_set_monochromatic_brightness(active, brightness);
+	}
+
+out_unlock:
+	mutex_unlock(&vc_data->lock);
+
+	return 0;
+}
+
+static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
+				       struct virtual_led *vled, struct leds_virtualcolor *vc_data)
+{
+	struct fwnode_handle *child_fwnode = of_fwnode_handle(child);
+	struct led_init_data init_data = {};
+	u32 blink_interval;
+	u32 phandle_count;
+	u32 max_brightness;
+	int ret, i;
+
+	ret = of_property_read_u32(child, "priority", &vled->priority);
+	if (ret)
+		vled->priority = 0;
+
+	ret = of_property_read_u32(child, "blink", &blink_interval);
+	if (!ret) {
+		vled->blink_delay_on = blink_interval;
+		vled->blink_delay_off = blink_interval;
+	}
+
+	phandle_count = fwnode_property_count_u32(child_fwnode, "leds");
+	if (phandle_count <= 0) {
+		dev_err(dev, "No monochromatic LEDs specified for virtual LED %s\n",
+			vled->cdev.name);
+		return -EINVAL;
+	}
+
+	vled->num_monochromatics = phandle_count;
+	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
+					    sizeof(*vled->monochromatics), GFP_KERNEL);
+	if (!vled->monochromatics)
+		return -ENOMEM;
+
+	for (i = 0; i < vled->num_monochromatics; i++) {
+		struct led_classdev *led_cdev;
+
+		led_cdev = of_led_get(child, i);
+		if (IS_ERR_OR_NULL(led_cdev)) {
+			/*
+			 * If the LED is not available yet, defer the probe.
+			 * The probe will be retried when the it becomes available.
+			 */
+			if (PTR_ERR(led_cdev) == -EPROBE_DEFER || !led_cdev) {
+				return -EPROBE_DEFER;
+			} else {
+				ret = PTR_ERR(led_cdev);
+				dev_err(dev, "Failed to get monochromatic LED for %s, error %d\n",
+					vled->cdev.name, ret);
+				return ret;
+			}
+		}
+
+		vled->monochromatics[i] = led_cdev;
+	}
+
+	ret = of_property_read_u32(child, "max-brightness", &max_brightness);
+	if (ret)
+		vled->cdev.max_brightness = LED_FULL;
+	else
+		vled->cdev.max_brightness = max_brightness;
+
+	vled->cdev.brightness_set_blocking = virtual_led_brightness_set;
+	vled->cdev.max_brightness = LED_FULL;
+	vled->cdev.flags = LED_CORE_SUSPENDRESUME;
+
+	init_data.fwnode = child_fwnode;
+	ret = devm_led_classdev_register_ext(dev, &vled->cdev, &init_data);
+	if (ret) {
+		dev_err(dev, "Failed to register virtual LED %s\n", vled->cdev.name);
+		return ret;
+	}
+
+	ret = device_create_file(vled->cdev.dev, &dev_attr_priority);
+	if (ret) {
+		dev_err(dev, "Failed to create sysfs attribute for priority\n");
+		return ret;
+	}
+
+	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_on);
+	if (ret) {
+		dev_err(dev, "Failed to create sysfs attribute for blink_delay_on\n");
+		return ret;
+	}
+
+	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_off);
+	if (ret) {
+		dev_err(dev, "Failed to create sysfs attribute for blink_delay_off\n");
+		return ret;
+	}
+
+	vled->vc_data = vc_data;
+
+	return 0;
+}
+
+static int leds_virtualcolor_disable_sysfs_access(struct device *dev, struct virtual_led *vled)
+{
+	int i;
+
+	for (i = 0; i < vled->num_monochromatics; i++) {
+		struct led_classdev *led_cdev = vled->monochromatics[i];
+
+		mutex_lock(&led_cdev->led_access);
+		led_sysfs_disable(led_cdev);
+		mutex_unlock(&led_cdev->led_access);
+
+		devm_add_action_or_reset(dev, restore_sysfs_write_access, led_cdev);
+	}
+
+	return 0;
+}
+
+static int leds_virtualcolor_probe(struct platform_device *pdev)
+{
+	struct leds_virtualcolor *vc_data;
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	int count = 0;
+	int ret;
+
+	vc_data = devm_kzalloc(dev, sizeof(*vc_data), GFP_KERNEL);
+	if (!vc_data)
+		return -ENOMEM;
+
+	mutex_init(&vc_data->lock);
+	INIT_LIST_HEAD(&vc_data->active_leds);
+
+	vc_data->num_vleds = of_get_child_count(dev->of_node);
+	if (vc_data->num_vleds == 0) {
+		dev_err(dev, "No virtual LEDs defined in device tree\n");
+		ret = -EINVAL;
+		goto err_mutex_destroy;
+	}
+
+	vc_data->vleds = devm_kcalloc(dev, vc_data->num_vleds, sizeof(*vc_data->vleds), GFP_KERNEL);
+	if (!vc_data->vleds) {
+		ret = -ENOMEM;
+		goto err_mutex_destroy;
+	}
+
+	for_each_child_of_node(dev->of_node, child) {
+		struct virtual_led *vled = &vc_data->vleds[count];
+
+		ret = leds_virtualcolor_init_vled(dev, child, vled, vc_data);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to initialize virtual LED %d\n", count);
+
+			of_node_put(child);
+			goto err_node_put;
+		}
+
+		count++;
+	}
+
+	platform_set_drvdata(pdev, vc_data);
+
+	if (of_property_read_bool(dev->of_node, "monochromatics-ro")) {
+		int i;
+
+		for (i = 0; i < count; i++) {
+			struct virtual_led *vled = &vc_data->vleds[i];
+
+			ret = leds_virtualcolor_disable_sysfs_access(dev, vled);
+			if (ret)
+				goto err_node_put;
+		}
+	}
+
+	return 0;
+
+err_node_put:
+	of_node_put(child);
+err_mutex_destroy:
+	mutex_destroy(&vc_data->lock);
+
+	return ret;
+}
+
+static void leds_virtualcolor_remove(struct platform_device *pdev)
+{
+	struct leds_virtualcolor *vc_data = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < vc_data->num_vleds; i++) {
+		struct virtual_led *vled = &vc_data->vleds[i];
+		int j;
+
+		device_remove_file(vled->cdev.dev, &dev_attr_priority);
+		device_remove_file(vled->cdev.dev, &dev_attr_blink_delay_on);
+		device_remove_file(vled->cdev.dev, &dev_attr_blink_delay_off);
+
+		for (j = 0; j < vled->num_monochromatics; j++) {
+			if (vled->monochromatics[j]) {
+				led_put(vled->monochromatics[j]);
+				vled->monochromatics[j] = NULL;
+			}
+		}
+	}
+
+	mutex_destroy(&vc_data->lock);
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
+	.remove = leds_virtualcolor_remove,
+	.driver = {
+		.name           = "leds_virtualcolor",
+		.of_match_table = leds_virtualcolor_of_match,
+	},
+};
+
+module_platform_driver(leds_virtualcolor_driver);
+
+MODULE_AUTHOR("Radoslav Tsvetkov <rtsvetkov@gradotech.eu>");
+MODULE_DESCRIPTION("LEDs Virtual Color Driver with Priority Handling");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:leds-group-virtualcolor");
--
2.43.0

