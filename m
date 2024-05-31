Return-Path: <linux-leds+bounces-1767-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E98D63E3
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54B21C23CC5
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B43C15AAB6;
	Fri, 31 May 2024 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DToAMIzY"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260F15B106
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163966; cv=none; b=tL5hKpHoRiOb7E66JMBAirEvqYf4tJEm9oGmKBrbf9eSuWOoKUa0p+0WKp3/aDrZlKRR6q+NhlL3r1v6zU1HKrbYBAN0OTlpRIZ8BaVBkZzsHSL2PVR6jBPJ/uWwtgv4dgHUi3qVDiX7e1wXFdNhhFfmjg2fIJy1Wf/OCJpQsIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163966; c=relaxed/simple;
	bh=yvzgHRkUTJynQnJYX5dmjCXyitJ2FkQyvJidZMnEbJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uumV/mumvie8DQZZNVRVWvDiVMNrSvm9gsz7Dt3wlZ+Jz7EAMSX0yMMjftFg4HgZAul7K1dSf/dF9irFh3RWTVYatqYDWZokIyTh4Z2RwI4RM9FymiqBfLHHMv+4eYv/4tqnxNoTxP5Uo+/Q1jyG8cnah4wmLSoeOhYGghuAIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DToAMIzY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717163964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yshjNme2EprsTNY+3o/nTrna3AGYl8KHAhILrgDXWtc=;
	b=DToAMIzYsvv3KZFmhouVbsmGMTGbTccmEGZ1H067RQwfM6R+fP/58GcV7uGvhEMQatmaKX
	h8iqUJJpcwJLDe3mktte5CPGTmFMsCbc3pB7cxrrXmVgv+GmLpmaqO1jUPl6HBu8HCk12q
	7LtHXaHck+qAJ7S4V4lCYOAJljgUt5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-FaoDRyV2MK-qyrtyyXPyFA-1; Fri, 31 May 2024 09:59:20 -0400
X-MC-Unique: FaoDRyV2MK-qyrtyyXPyFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E38185A78E;
	Fri, 31 May 2024 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4946740F;
	Fri, 31 May 2024 13:59:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 1/1] leds: trigger: Add new LED Input events trigger
Date: Fri, 31 May 2024 15:59:10 +0200
Message-ID: <20240531135910.168965-2-hdegoede@redhat.com>
In-Reply-To: <20240531135910.168965-1-hdegoede@redhat.com>
References: <20240531135910.168965-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Add a new trigger which turns LEDs on when there is input
(/dev/input/event*) activity and turns them back off again after there has
been no activity for 5 seconds.

This is primarily intended to control LED devices which are a backlight for
capacitive touch-buttons, such as e.g. the menu / home / back buttons found
on the bottom bezel of many somewhat older smartphones and tablets.

This can also be used to turn on the keyboard backlight LED on input
events and turn the keyboard backlight off again when idle.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Use kzalloc(sizeof(*handle), ...)

Changes in v2:
- Add MODULE_ALIAS() for module auto-loading
- Stop using the led-trigger.c private trigger->led_cdevs list
---
 drivers/leds/trigger/Kconfig                |  16 ++
 drivers/leds/trigger/Makefile               |   1 +
 drivers/leds/trigger/ledtrig-input-events.c | 233 ++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-input-events.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 31576952e181..c11282a74b5a 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -145,4 +145,20 @@ config LEDS_TRIGGER_TTY
 
 	  When build as a module this driver will be called ledtrig-tty.
 
+config LEDS_TRIGGER_INPUT_EVENTS
+	tristate "LED Input events trigger"
+	depends on INPUT
+	help
+	  Turn LEDs on when there is input (/dev/input/event*) activity and turn
+	  them back off again after there has been no activity for 5 seconds.
+
+	  This is primarily intended to control LEDs which are a backlight for
+	  capacitive touch-buttons, such as e.g. the menu / home / back buttons
+	  found on the bottom bezel of many older smartphones and tablets.
+
+	  This can also be used to turn on the keyboard backlight LED on
+	  input events and turn the keyboard backlight off again when idle.
+
+	  When build as a module this driver will be called ledtrig-input-events.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 242f6c4e3453..3b3628889f68 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
 obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
+obj-$(CONFIG_LEDS_TRIGGER_INPUT_EVENTS)	+= ledtrig-input-events.o
diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
new file mode 100644
index 000000000000..1de0176799f9
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Input Events LED trigger
+ *
+ * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
+ * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
+ */
+
+#include <linux/input.h>
+#include <linux/jiffies.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include "../leds.h"
+
+#define DEFAULT_LED_OFF_DELAY_MS			5000
+
+struct input_events_data {
+	struct input_handler handler;
+	struct delayed_work work;
+	spinlock_t lock;
+	struct led_classdev *led_cdev;
+	int led_cdev_saved_flags;
+	/* To avoid repeatedly setting the brightness while there are events */
+	bool led_on;
+	unsigned long led_off_time;
+	unsigned long led_off_delay;
+};
+
+static void led_input_events_work(struct work_struct *work)
+{
+	struct input_events_data *data =
+		container_of(work, struct input_events_data, work.work);
+
+	spin_lock_irq(&data->lock);
+
+	/*
+	 * This time_after_eq() check avoids a race where this work starts
+	 * running before a new event pushed led_off_time back.
+	 */
+	if (time_after_eq(jiffies, data->led_off_time)) {
+		led_set_brightness_nosleep(data->led_cdev, LED_OFF);
+		data->led_on = false;
+	}
+
+	spin_unlock_irq(&data->lock);
+}
+
+static ssize_t delay_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%lu\n", input_events_data->led_off_delay);
+}
+
+static ssize_t delay_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
+	unsigned long delay;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &delay);
+	if (ret)
+		return ret;
+
+	/* Clamp between 0.5 and 1000 seconds */
+	delay = clamp_val(delay, 500UL, 1000000UL);
+	input_events_data->led_off_delay = msecs_to_jiffies(delay);
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(delay);
+
+static struct attribute *input_events_led_attrs[] = {
+	&dev_attr_delay.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(input_events_led);
+
+static void input_events_event(struct input_handle *handle, unsigned int type,
+			       unsigned int code, int val)
+{
+	struct input_events_data *data =
+		container_of(handle->handler, struct input_events_data, handler);
+	unsigned long led_off_delay = READ_ONCE(data->led_off_delay);
+	struct led_classdev *led_cdev = data->led_cdev;
+	unsigned long flags;
+
+	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
+		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	if (!data->led_on) {
+		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
+		data->led_on = true;
+	}
+	data->led_off_time = jiffies + led_off_delay;
+
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	mod_delayed_work(system_wq, &data->work, led_off_delay);
+}
+
+static int input_events_connect(struct input_handler *handler, struct input_dev *dev,
+				const struct input_device_id *id)
+{
+	struct input_handle *handle;
+	int ret;
+
+	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	handle->dev = dev;
+	handle->handler = handler;
+	handle->name = "input-events";
+
+	ret = input_register_handle(handle);
+	if (ret)
+		goto err_free_handle;
+
+	ret = input_open_device(handle);
+	if (ret)
+		goto err_unregister_handle;
+
+	return 0;
+
+err_unregister_handle:
+	input_unregister_handle(handle);
+err_free_handle:
+	kfree(handle);
+	return ret;
+}
+
+static void input_events_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(handle);
+}
+
+static const struct input_device_id input_events_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+	},
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_REL) },
+	},
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_ABS) },
+	},
+	{ }
+};
+
+static int input_events_activate(struct led_classdev *led_cdev)
+{
+	struct input_events_data *data;
+	int ret;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->handler.name = "input-events";
+	data->handler.event = input_events_event;
+	data->handler.connect = input_events_connect;
+	data->handler.disconnect = input_events_disconnect;
+	data->handler.id_table = input_events_ids;
+
+	INIT_DELAYED_WORK(&data->work, led_input_events_work);
+	spin_lock_init(&data->lock);
+
+	data->led_cdev = led_cdev;
+	data->led_cdev_saved_flags = led_cdev->flags;
+	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
+
+	/*
+	 * Use led_cdev->blink_brightness + LED_BLINK_SW flag so that sysfs
+	 * brightness writes will change led_cdev->new_blink_brightness for
+	 * configuring the on state brightness (like ledtrig-heartbeat).
+	 */
+	if (!led_cdev->blink_brightness)
+		led_cdev->blink_brightness = led_cdev->max_brightness;
+
+	/* Start with LED off */
+	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
+
+	ret = input_register_handler(&data->handler);
+	if (ret) {
+		kfree(data);
+		return ret;
+	}
+
+	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
+
+	/* Turn LED off during suspend, original flags are restored on deactivate() */
+	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
+
+	led_set_trigger_data(led_cdev, data);
+	return 0;
+}
+
+static void input_events_deactivate(struct led_classdev *led_cdev)
+{
+	struct input_events_data *data = led_get_trigger_data(led_cdev);
+
+	led_cdev->flags = data->led_cdev_saved_flags;
+	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
+	input_unregister_handler(&data->handler);
+	cancel_delayed_work_sync(&data->work);
+	kfree(data);
+}
+
+static struct led_trigger input_events_led_trigger = {
+	.name       = "input-events",
+	.activate   = input_events_activate,
+	.deactivate = input_events_deactivate,
+	.groups     = input_events_led_groups,
+};
+module_led_trigger(input_events_led_trigger);
+
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_DESCRIPTION("Input Events LED trigger");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("ledtrig:input-events");
-- 
2.45.1


