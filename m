Return-Path: <linux-leds+bounces-4221-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40417A5B5E4
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 02:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCC018928AF
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 01:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B071E25F2;
	Tue, 11 Mar 2025 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="CeMpfn6v"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B635258
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741656736; cv=pass; b=YoQwMjPGtf3c2ELT/9OTTXyv54OEdP2Zu1iHjnabEmNanI8aczZEtZiveN0DeKwHNUNlt6LfG7ng1SYvefdXcFTsDrx9ODFB0SkWMuz3PrDQBx2W6VrTNV7E8epD+Vq6NKIfr/mrJn0jvMzF/jXV0JTf7bnI0qi2UAkua0b75mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741656736; c=relaxed/simple;
	bh=VatJmL5OiOD3R/HPX7W5ghBgSgCc63nIhpjjXCvviO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hq4YCi555h2KFpvbxFNxsHw9dwfFkRzB7Ion4ZB2Zm6EuDIRj/KxN70pFf8BSQe9ZFmsKM/0lx8QwGpbRdAWOP699aITzUWsc9lF8Dh7svwwG7bo0HxSqoMv3H1uhEM1PaGyzQJSp2io8z1uSyP+Wj3azCjF0GsIjy35+sTQxvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=CeMpfn6v; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741656729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m42OneskmBjvc6LgDYFw546v+A6gJpW192tJqDjTy1l148XKaR8yEt8uupdUwoVAKnT/UKKo/ZWB+KRx2qwhlCJ2wtTk/oHES3tOxDUMZVKv+uILRg9PR7JW8xif5FDAmmyqXPOZK/M4E1SaXwlRD+SGUWPkp6GHCcT7hOS2Vr4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741656729; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M8L5bUR1dCGDr3OrbZc7p+CXFNdPa0RuHOCcH4NiF0k=; 
	b=aHMB7J/+thLD4vq0Si6YLXhGzauKtcQ4J96NVa0HN1YUMcGGbvLFcM6Q7T8bjvue0tGRs2dZb3x1hbdBveI6si0S/DvSwD/V9UVREwW3mAcptS8K9AqRyApKVbgYNJZaDH5jsUnN+6pXlBMT7A/fN37coc2miJFRjlh125iAYnA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741656729;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M8L5bUR1dCGDr3OrbZc7p+CXFNdPa0RuHOCcH4NiF0k=;
	b=CeMpfn6v+BKXkDjDQ+7BQkp/YFyfXuzJCunutIyR40AFtFdtMdMHyOhPxZx+iCph
	bWJr08Ps7jKqSQmOofUdtS7EifNzskORfTdkWJN/IRPoXw4rePKbmJsZKWpH+F1NZUX
	GJ0Coj+rTvH+CBvDdNG/0ACQqYc95hPMS1EtJUmQ=
Received: by mx.zohomail.com with SMTPS id 1741656726230892.0215873508523;
	Mon, 10 Mar 2025 18:32:06 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v2 1/1] leds: Introduce userspace LED triggers driver
Date: Tue, 11 Mar 2025 12:28:07 +1100
Message-ID: <20250311013143.371930-2-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311013143.371930-1-craig@mcqueen.au>
References: <20250311013143.371930-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This driver creates a userspace LED triggers driver similar to
uleds and uinput.

New LED triggers are created by opening /dev/uledtriggers and writing
a uledtriggers_user_dev struct. A new LED trigger is registered with the
name given in the struct.

After the initial setup, writing an int value will set the trigger's
brightness, equivalent to calling led_trigger_event().

Alternatively, there are ioctls for setup, changing trigger brightness,
or doing blinking.

Closing the file handle to /dev/uledtriggers will remove the LED
trigger.
---
 Documentation/leds/index.rst        |   1 +
 Documentation/leds/ledtrig-user.rst |  36 +++
 drivers/leds/trigger/Kconfig        |  10 +
 drivers/leds/trigger/Makefile       |   1 +
 drivers/leds/trigger/ledtrig-user.c | 348 ++++++++++++++++++++++++++++
 include/uapi/linux/uledtriggers.h   | 123 ++++++++++
 6 files changed, 519 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-user.rst
 create mode 100644 drivers/leds/trigger/ledtrig-user.c
 create mode 100644 include/uapi/linux/uledtriggers.h

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 0ab0a2128a11..6139b9fc0b41 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -13,6 +13,7 @@ LEDs
    ledtrig-oneshot
    ledtrig-transient
    ledtrig-usbport
+   ledtrig-user
 
    uleds
 
diff --git a/Documentation/leds/ledtrig-user.rst b/Documentation/leds/ledtrig-user.rst
new file mode 100644
index 000000000000..afd21b44da90
--- /dev/null
+++ b/Documentation/leds/ledtrig-user.rst
@@ -0,0 +1,36 @@
+======================
+Userspace LED Triggers
+======================
+
+The uledtriggers driver supports userspace LED triggers. This can be useful
+to create a more flexible architecture for applications to control LEDs.
+
+
+Usage
+=====
+
+When the driver is loaded, a character device is created at /dev/uledtriggers.
+To create a new LED trigger, open /dev/uledtriggers and write a
+uledtriggers_user_dev structure to it (found in kernel public header file
+linux/uledtriggers.h)::
+
+    #define LED_TRIGGER_MAX_NAME_SIZE 64
+
+    struct uledtriggers_user_dev {
+	char name[LED_TRIGGER_MAX_NAME_SIZE];
+    };
+
+A new LED trigger will be created with the name given. The name can consist of
+alphanumeric, hyphen and underscore characters.
+
+After the initial setup, writing an int value will set the trigger's
+brightness, equivalent to calling led_trigger_event().
+
+Alternatively, there are ioctls (defined in the public header file) for setup,
+changing trigger brightness, or doing blinking.
+
+The LED trigger will be removed when the open file handle to /dev/uledtriggers
+is closed.
+
+Multiple LED triggers are created by opening additional file handles to
+/dev/uledtriggers.
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index c11282a74b5a..f8d05dbb5367 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -161,4 +161,14 @@ config LEDS_TRIGGER_INPUT_EVENTS
 
 	  When build as a module this driver will be called ledtrig-input-events.
 
+config LEDS_TRIGGER_USER
+	tristate "Userspace LED triggers"
+	help
+	  This option enables support for userspace LED triggers.
+
+	  Userspace programs can create triggers via an interface at the char
+	  device /dev/uledtriggers.
+
+	  When build as a module this driver will be called ledtrig-user.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 3b3628889f68..352cd3c5f9db 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
 obj-$(CONFIG_LEDS_TRIGGER_INPUT_EVENTS)	+= ledtrig-input-events.o
+obj-$(CONFIG_LEDS_TRIGGER_USER)		+= ledtrig-user.o
diff --git a/drivers/leds/trigger/ledtrig-user.c b/drivers/leds/trigger/ledtrig-user.c
new file mode 100644
index 000000000000..793903d0ef51
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-user.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Userspace LED triggers driver
+ *
+ * Copyright (C) 2025 Craig McQueen <craig@mcqueen.au>
+ */
+#include <linux/ctype.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+
+#include <uapi/linux/uledtriggers.h>
+
+#define ULEDTRIGGERS_NAME	"uledtriggers"
+
+enum uledtriggers_state {
+	ULEDTRIGGERS_STATE_UNKNOWN,
+	ULEDTRIGGERS_STATE_REGISTERED,
+};
+
+enum uledtriggers_trig_state {
+	TRIG_STATE_EVENT,
+	TRIG_STATE_BLINK,
+};
+
+struct uledtriggers_device {
+	struct uledtriggers_user_dev	user_dev;
+	struct led_trigger	led_trigger;
+	struct mutex		mutex;
+	enum uledtriggers_state	state;
+	enum uledtriggers_trig_state	trig_state;
+	int			brightness;
+	unsigned long		trig_delay_on;
+	unsigned long		trig_delay_off;
+};
+
+static struct miscdevice uledtriggers_misc;
+
+/*
+ * When an LED is connected to the trigger, this 'activate' function runs and
+ * sets the initial state of the LED.
+ */
+static int uledtriggers_trig_activate(struct led_classdev *led_cdev)
+{
+	struct led_trigger		*trig;
+	struct uledtriggers_device	*udev;
+	enum uledtriggers_trig_state	trig_state;
+	unsigned long			delay_on;
+	unsigned long			delay_off;
+	int				retval = 0;
+
+	trig = led_cdev->trigger;
+	udev = container_of(trig, struct uledtriggers_device, led_trigger);
+
+	retval = mutex_lock_interruptible(&udev->mutex);
+	if (retval)
+		return retval;
+
+	trig_state = udev->trig_state;
+	switch (trig_state) {
+	default:
+	case TRIG_STATE_EVENT:
+		led_set_brightness(led_cdev, udev->brightness);
+		break;
+	case TRIG_STATE_BLINK:
+		delay_on = udev->trig_delay_on;
+		delay_off = udev->trig_delay_off;
+		led_blink_set(led_cdev, &delay_on, &delay_off);
+		break;
+	}
+	mutex_unlock(&udev->mutex);
+	return retval;
+}
+
+static int uledtriggers_open(struct inode *inode, struct file *file)
+{
+	struct uledtriggers_device *udev;
+
+	udev = kzalloc(sizeof(*udev), GFP_KERNEL);
+	if (!udev)
+		return -ENOMEM;
+
+	mutex_init(&udev->mutex);
+	udev->state = ULEDTRIGGERS_STATE_UNKNOWN;
+
+	file->private_data = udev;
+	stream_open(inode, file);
+
+	return 0;
+}
+
+/*
+ * Name validation: Allow only alphanumeric, hyphen or underscore.
+ */
+static bool is_trigger_name_valid(const char * name)
+{
+	size_t i;
+
+	if (name[0] == '\0')
+		return false;
+
+	for (i = 0; i < TRIG_NAME_MAX; i++) {
+		if (name[i] == '\0')
+			break;
+		if (!isalnum(name[i]) && name[i] != '-' && name[i] != '_')
+			return false;
+	}
+	/* Length check. */
+	return (i < TRIG_NAME_MAX);
+}
+
+/*
+ * Common setup code that can be called from either the write function or the
+ * ioctl ULEDTRIGGERS_IOC_DEV_SETUP.
+ */
+static int dev_setup(struct uledtriggers_device *udev, const char __user *buffer)
+{
+	int retval;
+
+	retval = mutex_lock_interruptible(&udev->mutex);
+	if (retval)
+		return retval;
+
+	if (udev->state == ULEDTRIGGERS_STATE_REGISTERED) {
+		retval = -EBUSY;
+		goto out;
+	}
+
+	if (copy_from_user(&udev->user_dev, buffer,
+			   sizeof(struct uledtriggers_user_dev))) {
+		retval = -EFAULT;
+		goto out;
+	}
+
+	if (!is_trigger_name_valid(udev->user_dev.name)) {
+		retval = -EINVAL;
+		goto out;
+	}
+
+	udev->led_trigger.name = udev->user_dev.name;
+	retval = led_trigger_register(&udev->led_trigger);
+	if (retval < 0) {
+		udev->led_trigger.name = NULL;
+		goto out;
+	}
+	/* To avoid mutex recursion, set _after_ led_trigger_register().
+	 * led_trigger_register() will immediately connect any LEDs that specify
+	 * this trigger as the default trigger, _and_ call the activate function
+	 * if set. But uledtriggers_trig_activate() will lock the mutex, but
+	 * we're already holding it. Kernel doesn't support mutex recursion. */
+	udev->led_trigger.activate = uledtriggers_trig_activate;
+
+	udev->state = ULEDTRIGGERS_STATE_REGISTERED;
+
+out:
+	mutex_unlock(&udev->mutex);
+
+	return retval;
+}
+
+/*
+ * Common code to set brightness.
+ * It's called via write_user_buf_brightness() for the case of a brightness
+ * value in a userspace buffer (write function or ioctl ULEDTRIGGERS_IOC_EVENT).
+ * It's called directly for ioctl ULEDTRIGGERS_IOC_OFF and ULEDTRIGGERS_IOC_ON.
+ */
+static int write_brightness(struct uledtriggers_device *udev, int brightness)
+{
+	int retval;
+
+	retval = mutex_lock_interruptible(&udev->mutex);
+	if (retval)
+		return retval;
+
+	if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+		retval = -EINVAL;
+		goto out;
+	}
+
+	udev->trig_delay_on = 0u;
+	udev->trig_delay_off = 0u;
+	udev->brightness = brightness;
+	udev->trig_state = TRIG_STATE_EVENT;
+	led_trigger_event(&udev->led_trigger, brightness);
+
+out:
+	mutex_unlock(&udev->mutex);
+
+	return retval;
+}
+
+/*
+ * Common code to set brightness from a value stored in a userspace buffer.
+ * This can be called from either the write function or the
+ * ioctl ULEDTRIGGERS_IOC_EVENT.
+ */
+static int write_user_buf_brightness(struct uledtriggers_device *udev, const char __user *buffer)
+{
+	int brightness;
+
+	if (copy_from_user(&brightness, buffer, sizeof(brightness))) {
+		return -EFAULT;
+	}
+
+	return write_brightness(udev, brightness);
+}
+
+static ssize_t uledtriggers_write(struct file *file, const char __user *buffer,
+	size_t count, loff_t *ppos)
+{
+	struct uledtriggers_device *udev = file->private_data;
+	int retval;
+
+	if (count == 0)
+		return 0;
+
+	switch (udev->state) {
+	case ULEDTRIGGERS_STATE_UNKNOWN:
+		if (count != sizeof(struct uledtriggers_user_dev)) {
+			return -EINVAL;
+		}
+		retval = dev_setup(udev, buffer);
+		if (retval < 0)
+			return retval;
+		return count;
+	case ULEDTRIGGERS_STATE_REGISTERED:
+		if (count != sizeof(int)) {
+			return -EINVAL;
+		}
+		retval = write_user_buf_brightness(udev, buffer);
+		if (retval < 0)
+			return retval;
+		return count;
+	default:
+		return -EBADFD;
+	}
+}
+
+static long uledtriggers_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct uledtriggers_device *udev = file->private_data;
+	struct uledtriggers_blink blink;
+	struct uledtriggers_blink_oneshot blink_oneshot;
+	int retval = 0;
+
+	switch (cmd) {
+	case ULEDTRIGGERS_IOC_DEV_SETUP:
+		retval = dev_setup(udev, (const char __user *)arg);
+		break;
+
+	case ULEDTRIGGERS_IOC_OFF:
+		retval = write_brightness(udev, LED_OFF);
+		break;
+
+	case ULEDTRIGGERS_IOC_ON:
+		retval = write_brightness(udev, LED_FULL);
+		break;
+
+	case ULEDTRIGGERS_IOC_EVENT:
+		retval = write_user_buf_brightness(udev, (const char __user *)arg);
+		break;
+
+	case ULEDTRIGGERS_IOC_BLINK:
+		retval = copy_from_user(&blink,
+			(struct uledtriggers_blink __user *)arg,
+			sizeof(blink));
+		if (retval)
+			return retval;
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+		if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+			mutex_unlock(&udev->mutex);
+			return -EINVAL;
+		}
+		udev->trig_delay_on = blink.delay_on;
+		udev->trig_delay_off = blink.delay_off;
+		udev->brightness = LED_FULL;
+		udev->trig_state = TRIG_STATE_BLINK;
+		led_trigger_blink(&udev->led_trigger, blink.delay_on, blink.delay_off);
+		mutex_unlock(&udev->mutex);
+		break;
+
+	case ULEDTRIGGERS_IOC_BLINK_ONESHOT:
+		retval = copy_from_user(&blink_oneshot,
+			(struct uledtriggers_blink_oneshot __user *)arg,
+			sizeof(blink_oneshot));
+		if (retval)
+			return retval;
+		if (blink_oneshot.__unused)
+			return -EINVAL;
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+		if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+			mutex_unlock(&udev->mutex);
+			return -EINVAL;
+		}
+		udev->trig_delay_on = 0u;
+		udev->trig_delay_off = 0u;
+		udev->brightness = blink_oneshot.invert ? LED_FULL : LED_OFF;
+		udev->trig_state = TRIG_STATE_EVENT;
+		led_trigger_blink_oneshot(&udev->led_trigger, blink_oneshot.delay_on, blink_oneshot.delay_off, blink_oneshot.invert);
+		mutex_unlock(&udev->mutex);
+		break;
+
+	default:
+		retval = -ENOIOCTLCMD;
+		break;
+	}
+
+	return retval;
+}
+
+static int uledtriggers_release(struct inode *inode, struct file *file)
+{
+	struct uledtriggers_device *udev = file->private_data;
+
+	if (udev->state == ULEDTRIGGERS_STATE_REGISTERED) {
+		udev->state = ULEDTRIGGERS_STATE_UNKNOWN;
+		led_trigger_unregister(&udev->led_trigger);
+	}
+	kfree(udev);
+
+	return 0;
+}
+
+static const struct file_operations uledtriggers_fops = {
+	.owner		= THIS_MODULE,
+	.open		= uledtriggers_open,
+	.release	= uledtriggers_release,
+	.write		= uledtriggers_write,
+	.unlocked_ioctl	= uledtriggers_ioctl,
+};
+
+static struct miscdevice uledtriggers_misc = {
+	.fops		= &uledtriggers_fops,
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= ULEDTRIGGERS_NAME,
+};
+
+module_misc_device(uledtriggers_misc);
+
+MODULE_AUTHOR("Craig McQueen <craig@mcqueen.au>");
+MODULE_DESCRIPTION("Userspace LED triggers driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/uledtriggers.h b/include/uapi/linux/uledtriggers.h
new file mode 100644
index 000000000000..beb859dc4edc
--- /dev/null
+++ b/include/uapi/linux/uledtriggers.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Userspace LED triggers driver support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef _UAPI__ULEDTRIGGERS_H_
+#define _UAPI__ULEDTRIGGERS_H_
+
+/* See TRIG_NAME_MAX in linux/leds.h */
+#define LED_TRIGGER_MAX_NAME_SIZE	64
+
+/*
+ * Struct for initial write to setup, or ioctl ULEDTREGGERS_IOC_DEV_SETUP.
+ */
+struct uledtriggers_user_dev {
+	char name[LED_TRIGGER_MAX_NAME_SIZE];
+};
+
+/*
+ * Brightness levels for writes of int values, or for use with ULEDTRIGGERS_IOC_EVENT.
+ * These correspond to Linux kernel internal enum led_brightness in linux/leds.h.
+ */
+enum uledtriggers_brightness {
+	ULEDTRIGGERS_OFF		= 0,
+	ULEDTRIGGERS_ON			= 1,
+	ULEDTRIGGERS_HALF		= 127,
+	ULEDTRIGGERS_FULL		= 255,
+};
+
+/*
+ * Struct for ioctl ULEDTRIGGERS_IOC_BLINK.
+ */
+struct uledtriggers_blink {
+	unsigned long delay_on;
+	unsigned long delay_off;
+};
+
+/*
+ * Struct for ioctl ULEDTRIGGERS_IOC_BLINK_ONESHOT.
+ * Note padding at the end due to alignment (for 64-bit kernels). Ensure it's set to 0.
+ */
+struct uledtriggers_blink_oneshot {
+	unsigned long delay_on;
+	unsigned long delay_off;
+	int invert;
+	int __unused;
+};
+
+
+/* ioctl commands */
+
+#define ULEDTRIGGERS_IOC_MAGIC			't'
+
+/*
+ * Initial setup.
+ * E.g.:
+ *	int retval;
+ *	struct uledtriggers_user_dev dev_setup = { "transmogrifier" };
+ *	retval = ioctl(fd, ULEDTRIGGERS_IOC_DEV_SETUP, &dev_setup);
+ */
+#define ULEDTRIGGERS_IOC_DEV_SETUP	_IOW(ULEDTRIGGERS_IOC_MAGIC, 0x01, struct uledtriggers_user_dev)
+
+/*
+ * Turn the trigger off.
+ * E.g.:
+ *	int retval;
+ *	retval = ioctl(fd, ULEDTRIGGERS_IOC_OFF);
+ */
+#define ULEDTRIGGERS_IOC_OFF		_IO(ULEDTRIGGERS_IOC_MAGIC, 0x10)
+
+/*
+ * Turn the trigger on.
+ * E.g.:
+ *	int retval;
+ *	retval = ioctl(fd, ULEDTRIGGERS_IOC_ON);
+ */
+#define ULEDTRIGGERS_IOC_ON		_IO(ULEDTRIGGERS_IOC_MAGIC, 0x11)
+
+/*
+ * Set the LED trigger to a specified brightness.
+ * Refer to enum uledtriggers_brightness.
+ * E.g.:
+ *	int retval;
+ *	int brightness = ULEDTRIGGERS_FULL;
+ *	retval = ioctl(fd, ULEDTRIGGERS_IOC_EVENT, &brightness);
+ */
+#define ULEDTRIGGERS_IOC_EVENT		_IOW(ULEDTRIGGERS_IOC_MAGIC, 0x12, int)
+
+/*
+ * Set the LED trigger to blink continuously.
+ * E.g.:
+ *	int retval;
+ *	struct uledtriggers_blink blink;
+ *      blink.delay_on = 100;
+ *      blink.delay_off = 400;
+ *	retval = ioctl(fd, ULEDTRIGGERS_IOC_BLINK, &blink);
+ */
+#define ULEDTRIGGERS_IOC_BLINK		_IOW(ULEDTRIGGERS_IOC_MAGIC, 0x20, struct uledtriggers_blink)
+
+/*
+ * Set the LED trigger to blink once.
+ * E.g.:
+ *	int retval;
+ *	struct uledtriggers_blink_oneshot blink_oneshot;
+ *      blink_oneshot.delay_on = 100;
+ *      blink_oneshot.delay_off = 400;
+ *      blink_oneshot.invert = false;
+ *      blink_oneshot.__unused = 0;
+ *	retval = ioctl(fd, ULEDTRIGGERS_IOC_BLINK_ONESHOT, &blink_oneshot);
+ */
+#define ULEDTRIGGERS_IOC_BLINK_ONESHOT	_IOW(ULEDTRIGGERS_IOC_MAGIC, 0x21, struct uledtriggers_blink_oneshot)
+
+
+#endif /* _UAPI__ULEDTRIGGERS_H_ */
-- 
2.48.1


