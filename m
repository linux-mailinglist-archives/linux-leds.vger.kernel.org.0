Return-Path: <linux-leds+bounces-4161-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB989A549EA
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 12:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A291B18872D8
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 11:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5242040BD;
	Thu,  6 Mar 2025 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="ME/KzrKH"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6801FC7E7
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741261615; cv=pass; b=RNV2PFoEoZ1mVZL9cOmO0nOjirBVH7z5xhQa86eRk/umnXO5VBn9Ci7EGLH7WWV4ebDjKUQoiOPgmP6+juLrgPgfUEB9Jp6U5RqwdH9WkLrg4n23fmegBOz1zTbcrRxr382NRSbjHHX+9kpF+kA9YUzJIF1qt3ssvQ++5xAkVMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741261615; c=relaxed/simple;
	bh=zavRmVxYjPhQYJnj0OajdbN1d68PVP9o1DujpIFCayU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dc2sSb4dYR3ikctagBUnj9TrUfPUGacBADmEumWbT7MKkl6qcfJu0FzlWW3nRjzjcZlGLfWVL9q+9Qw3il3lCsZ6hbRtmAq5aj1yRtLCPN6KWlorfH6/25relFs+3Og1VWIfzmfotn0EGFgocoVZVo620PuoTqSl3KZqSMWEd3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=ME/KzrKH; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741261609; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a38A1kAv0hYqPmgHYh5O3FlYMIoEHnOvpruRaCfSitFbVGn0j05KyTJAYvKF4RclAepNkzrer4HogJaMC1GZ0RQUVxcGkpyN7aMT9yQMzvpfnOLehDH7yGpzEWwOElxiQURV3O+gcgjxKP8muEp6wmPvMEI1bQ/RtTww4AP+6YY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741261609; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VI7ET+T2b7Xrf6C1ejtNtFR2SWrHW9Q9WoyguAEr9FM=; 
	b=kCIkV+4bDX8vC+9VaJSu29m0n3J68JyvVGc5u6hxpMtEv8S4va9mYe5TvNmfnCz8d5oS3l8lJ1gIP0kUEO4nGfRfqhNxen109gu4RCYoj6AU0h/5l/vucLT00sx/tGQ/jzqFCFdmPrqIn93DUpXE153Wqk6D6YO8snt3bDU/h1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741261609;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VI7ET+T2b7Xrf6C1ejtNtFR2SWrHW9Q9WoyguAEr9FM=;
	b=ME/KzrKHNhMVVY6mikwgUN5KvWbxmA+ZSry+IdD4jUbU0BYDZEj0pJdQLm5e6EnZ
	EIOBYkPdLENK/RsVmXV8m0j4H5VUJtvsyumdqecFvMgtAljaBvELXTtoyod62S7/coZ
	+MHutr9CX66DlmQdANY+7ZNdhHhJSz680LgKeyoE=
Received: by mx.zohomail.com with SMTPS id 1741261607676118.49704133724515;
	Thu, 6 Mar 2025 03:46:47 -0800 (PST)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH] leds: Introduce userspace LED triggers driver
Date: Thu,  6 Mar 2025 22:46:39 +1100
Message-ID: <20250306114640.313793-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
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

New LED triggers s are created by opening /dev/uledtriggers and writing
a uledtriggers_user_dev struct. A new LED trigger is registered with the
name given in the struct.

After the initial setup, writing an int value will set the trigger's
brightness, equivalent to calling led_trigger_event().

Alternatively, there are ioctls for setup, changing trigger brightness,
or doing blinking.

Closing the file handle to /dev/uledtriggers will remove the LED
trigger.
---
 Documentation/leds/uledtriggers.rst |  36 +++
 drivers/leds/Kconfig                |   9 +
 drivers/leds/Makefile               |   1 +
 drivers/leds/uledtriggers.c         | 384 ++++++++++++++++++++++++++++
 include/uapi/linux/uledtriggers.h   | 123 +++++++++
 5 files changed, 553 insertions(+)
 create mode 100644 Documentation/leds/uledtriggers.rst
 create mode 100644 drivers/leds/uledtriggers.c
 create mode 100644 include/uapi/linux/uledtriggers.h

diff --git a/Documentation/leds/uledtriggers.rst b/Documentation/leds/uledtriggers.rst
new file mode 100644
index 000000000000..6ec5cbf8f13e
--- /dev/null
+++ b/Documentation/leds/uledtriggers.rst
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
+    #define LED_TRIGGER_MAX_NAME_SIZE 50
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
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2b27d043921c..7cd2fbcb1aa5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -921,6 +921,15 @@ config LEDS_USER
 	  support in kernel. To compile this driver as a module, choose 'm' here:
 	  the module will be called uleds.
 
+config LED_TRIGGERS_USER
+	tristate "Userspace LED triggers support"
+	depends on LEDS_CLASS
+	select LEDS_TRIGGERS
+	help
+	  This option enables support for userspace LED triggers. Say 'y' to enable
+	  this support in kernel. To compile this driver as a module, choose 'm'
+	  here: the module will be called uledtriggers.
+
 config LEDS_NIC78BX
 	tristate "LED support for NI PXI NIC78bx devices"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 6ad52e219ec6..c71569a59b15 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
 
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
+obj-$(CONFIG_LED_TRIGGERS_USER)			+= uledtriggers.o
 
 # Flash and Torch LED Drivers
 obj-$(CONFIG_LEDS_CLASS_FLASH)		+= flash/
diff --git a/drivers/leds/uledtriggers.c b/drivers/leds/uledtriggers.c
new file mode 100644
index 000000000000..4fdb8cf4c82d
--- /dev/null
+++ b/drivers/leds/uledtriggers.c
@@ -0,0 +1,384 @@
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
+static int set_led_trigger(struct uledtriggers_device *udev)
+{
+	int retval = 0;
+	enum uledtriggers_trig_state trig_state;
+
+	retval = mutex_lock_interruptible(&udev->mutex);
+	if (retval)
+		return retval;
+
+	trig_state = udev->trig_state;
+	switch (trig_state) {
+	default:
+	case TRIG_STATE_EVENT:
+		led_trigger_event(&udev->led_trigger, udev->brightness);
+		break;
+	case TRIG_STATE_BLINK:
+		led_trigger_blink(&udev->led_trigger, udev->trig_delay_on, udev->trig_delay_off);
+		break;
+	}
+	mutex_unlock(&udev->mutex);
+
+	return retval;
+}
+
+/*
+ * When an LED is connected to the trigger, this 'activate' function runs and
+ * sets the initial state of the LED.
+ */
+static int uledtriggers_trig_activate(struct led_classdev *led_cdev)
+{
+	struct led_trigger		*trig;
+	struct uledtriggers_device	*udev;
+
+	trig = led_cdev->trigger;
+	udev = container_of(trig, struct uledtriggers_device, led_trigger);
+	return set_led_trigger(udev);
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
+static int dev_setup(struct uledtriggers_device *udev, const char __user *buffer)
+{
+	const char *name;
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
+	name = udev->user_dev.name;
+	if (!is_trigger_name_valid(name)) {
+		retval = -EINVAL;
+		goto out;
+	}
+
+	udev->led_trigger.name = udev->user_dev.name;
+	udev->led_trigger.activate = uledtriggers_trig_activate;
+	retval = led_trigger_register(&udev->led_trigger);
+	if (retval < 0) {
+		udev->led_trigger.name = NULL;
+		goto out;
+	}
+
+	udev->state = ULEDTRIGGERS_STATE_REGISTERED;
+
+out:
+	mutex_unlock(&udev->mutex);
+
+	return retval;
+}
+
+static int write_brightness(struct uledtriggers_device *udev, const char __user *buffer)
+{
+	int retval;
+	int brightness;
+
+	retval = mutex_lock_interruptible(&udev->mutex);
+	if (retval)
+		return retval;
+
+	if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+		retval = -EBUSY;
+		goto out;
+	}
+
+	if (copy_from_user(&brightness, buffer,
+			   sizeof(brightness))) {
+		retval = -EFAULT;
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
+		retval = write_brightness(udev, buffer);
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
+	int brightness;
+	int retval = 0;
+
+	/*
+	 * the direction is a bitmask, and VERIFY_WRITE catches R/W
+	 * transfers. `Direction' is user-oriented, while
+	 * access_ok is kernel-oriented, so the concept of "read" and
+	 * "write" is reversed
+	 */
+	retval = 0;
+	if (_IOC_DIR(cmd) & _IOC_READ)
+		retval = !access_ok((void __user *)arg, _IOC_SIZE(cmd));
+	else if (_IOC_DIR(cmd) & _IOC_WRITE)
+		retval = !access_ok((void __user *)arg, _IOC_SIZE(cmd));
+	if (retval)
+		return -EFAULT;
+
+	switch (cmd) {
+	case ULEDTRIGGERS_IOC_DEV_SETUP:
+		retval = dev_setup(udev, (const char __user *)arg);
+		break;
+
+	case ULEDTRIGGERS_IOC_OFF:
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+		if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+			mutex_unlock(&udev->mutex);
+			return -EINVAL;
+		}
+		udev->trig_delay_on = 0u;
+		udev->trig_delay_off = 0u;
+		udev->brightness = 0;
+		udev->trig_state = TRIG_STATE_EVENT;
+		led_trigger_event(&udev->led_trigger, LED_OFF);
+		mutex_unlock(&udev->mutex);
+		break;
+
+	case ULEDTRIGGERS_IOC_ON:
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+		if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+			mutex_unlock(&udev->mutex);
+			return -EINVAL;
+		}
+		udev->trig_delay_on = 0u;
+		udev->trig_delay_off = 0u;
+		udev->brightness = LED_FULL;
+		udev->trig_state = TRIG_STATE_EVENT;
+		led_trigger_event(&udev->led_trigger, LED_FULL);
+		mutex_unlock(&udev->mutex);
+		break;
+
+	case ULEDTRIGGERS_IOC_EVENT:
+		retval = copy_from_user(&brightness,
+			(int __user *)arg,
+			sizeof(brightness));
+		if (retval)
+			return retval;
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+		if (udev->state != ULEDTRIGGERS_STATE_REGISTERED) {
+			mutex_unlock(&udev->mutex);
+			return -EINVAL;
+		}
+		udev->trig_delay_on = 0u;
+		udev->trig_delay_off = 0u;
+		udev->brightness = brightness;
+		udev->trig_state = TRIG_STATE_EVENT;
+		led_trigger_event(&udev->led_trigger, brightness);
+		mutex_unlock(&udev->mutex);
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
index 000000000000..251fa0a31861
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
+#define LED_TRIGGER_MAX_NAME_SIZE	50
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


