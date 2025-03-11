Return-Path: <linux-leds+bounces-4225-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736BA5BC9F
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 10:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5BF3A7013
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 09:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFE922576C;
	Tue, 11 Mar 2025 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="G6y+/L8s"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA51222F384
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686498; cv=pass; b=eXqYKaba3W3qFD8IHWrB/tU2il8TEqwV+ESuFxw3IGo/P5X7wyvjzl7ub/TQ2Uapg2GjOT1nVIX/1X6Rz0rEmq9vsyXAHBcKx70NhxSsl8qAgdBOPA70eHceOO83g3FlO9DiGNfHCbAQ5OBVLb/xjG9AdFvO+voMpkXjqvGXXhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686498; c=relaxed/simple;
	bh=WhY6HgoYHnSsBr1saBLHsiLDUs3zfdrtktFsbndceCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rARaKuo2uXl6trCAQv+vqC8H2+XDArpOwfJjAcYJZsG9Dhiuwp0FBvWDRWPeWdyrwmcDvHRk2lPPENH5S/VPJufIr8Ay/bvSUECc4FpfJIf+8E54XI4aB+M+eY7Fhczd/oBR54gEZrNGSMHW6VW5r73nQu76sYpSTAsyhxLJdow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=G6y+/L8s; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741686493; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dYpW+isJQAQ0nkAw3l4gTXSfzYLsBgATaJ+hdxE0VpjQ8LZK80rEMJ61saCqqxUQKwI4z9pU+lMqdmD7IlSAG8u7NTwAM4YXEhn3H2OeRXwb9rdtegjjHuk9WCtraJZSazgVA2lx6BoID1A1ofKO0HUsaG+wlxn56KROTTrusFM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741686493; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=enIgdSTc3twHtbGxiYn14iOtZlaVY9/GV9vMbsEcdKM=; 
	b=NqXouICHVjJFp6ShUcLS52r+2qlEmUXg8A1liHAzi0jLIkFOJwnJD9siaPRAxot9QPOMiBdLb+BjCBXaMuYWiuhzevo3LEDWZsym1SYXl1DM/37jc88y4dI49bX1FznUz0wWH2kF+pQlYBZqrUwfeOOCB6DAOiutEJyJK6tR55o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741686493;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=enIgdSTc3twHtbGxiYn14iOtZlaVY9/GV9vMbsEcdKM=;
	b=G6y+/L8s8E3+BfI244ic6+VZUAKP2U+CFPdMSJdmSOMWhKL+AMEr20j1DgbxyYrd
	osW7k7Z8i7BHioQ12QlhUCWYI2wKi3XSwFtYw35Nkl2VRpvhu7v+3ADK9oFJDYgQ5F+
	HH8TCGpD0ZXd2RkIEFgCvFv+qGojKA3hpHzliy88=
Received: by mx.zohomail.com with SMTPS id 1741686489753407.95326069971395;
	Tue, 11 Mar 2025 02:48:09 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v2] leds: Add some setup ioctls to uleds driver
Date: Tue, 11 Mar 2025 20:48:02 +1100
Message-ID: <20250311094803.376360-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

* Add an ioctl for setup as an alternative to doing a write.
  This is similar to the ioctl that was added to uinput for setup.
* Add an ioctl to set a default trigger for the LED.
---
 Documentation/leds/uleds.rst |   6 ++
 drivers/leds/uleds.c         | 124 ++++++++++++++++++++++++++++-------
 include/uapi/linux/uleds.h   |  30 ++++++++-
 3 files changed, 136 insertions(+), 24 deletions(-)

diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
index 4077745dae00..0512e577d63a 100644
--- a/Documentation/leds/uleds.rst
+++ b/Documentation/leds/uleds.rst
@@ -24,6 +24,12 @@ A new LED class device will be created with the name given. The name can be
 any valid sysfs device node name, but consider using the LED class naming
 convention of "devicename:color:function".
 
+Alternatively, setup can be done with an ioctl call, passing a pointer to
+the structure.
+
+There is also an ioctl call to configure a default trigger for the LED, by
+passing a pointer to a structure containing the name of a trigger.
+
 The current brightness is found by reading an int value from the character
 device. Reading will block until the brightness changes. The device node can
 also be polled to notify when the brightness value changes.
diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
index 374a841f18c3..2674c7491542 100644
--- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -6,6 +6,7 @@
  *
  * Based on uinput.c: Aristeu Sergio Rozanski Filho <aris@cathedrallabs.org>
  */
+#include <linux/ctype.h>
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/leds.h>
@@ -25,13 +26,14 @@ enum uleds_state {
 };
 
 struct uleds_device {
-	struct uleds_user_dev	user_dev;
-	struct led_classdev	led_cdev;
-	struct mutex		mutex;
-	enum uleds_state	state;
-	wait_queue_head_t	waitq;
-	int			brightness;
-	bool			new_data;
+	struct uleds_user_dev		user_dev;
+	struct uleds_user_trigger	default_trigger;
+	struct led_classdev		led_cdev;
+	struct mutex			mutex;
+	enum uleds_state		state;
+	wait_queue_head_t		waitq;
+	int				brightness;
+	bool				new_data;
 };
 
 static struct miscdevice uleds_misc;
@@ -70,15 +72,17 @@ static int uleds_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t uleds_write(struct file *file, const char __user *buffer,
-			   size_t count, loff_t *ppos)
+static bool is_led_name_valid(const char *name)
 {
-	struct uleds_device *udev = file->private_data;
-	const char *name;
-	int ret;
+	return ((name[0] != '\0') &&
+		(strcmp(name, ".") != 0) &&
+		(strcmp(name, "..") != 0) &&
+		(strchr(name, '/') == NULL));
+}
 
-	if (count == 0)
-		return 0;
+static int dev_setup(struct uleds_device *udev, const char __user *buffer)
+{
+	int ret;
 
 	ret = mutex_lock_interruptible(&udev->mutex);
 	if (ret)
@@ -89,20 +93,13 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
 		goto out;
 	}
 
-	if (count != sizeof(struct uleds_user_dev)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	if (copy_from_user(&udev->user_dev, buffer,
 			   sizeof(struct uleds_user_dev))) {
 		ret = -EFAULT;
 		goto out;
 	}
 
-	name = udev->user_dev.name;
-	if (!name[0] || !strcmp(name, ".") || !strcmp(name, "..") ||
-	    strchr(name, '/')) {
+	if (!is_led_name_valid(udev->user_dev.name)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -120,7 +117,6 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
 
 	udev->new_data = true;
 	udev->state = ULEDS_STATE_REGISTERED;
-	ret = count;
 
 out:
 	mutex_unlock(&udev->mutex);
@@ -128,6 +124,23 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
 	return ret;
 }
 
+static ssize_t uleds_write(struct file *file, const char __user *buffer,
+	size_t count, loff_t *ppos)
+{
+	struct uleds_device *udev = file->private_data;
+	int ret;
+
+	if (count == 0)
+		return 0;
+	if (count != sizeof(struct uleds_user_dev)) {
+		return -EINVAL;
+	}
+	ret = dev_setup(udev, buffer);
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
 static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
 			  loff_t *ppos)
 {
@@ -179,6 +192,70 @@ static __poll_t uleds_poll(struct file *file, poll_table *wait)
 	return 0;
 }
 
+/*
+ * Trigger name validation: Allow only alphanumeric, hyphen or underscore.
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
+static long uleds_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct uleds_device *udev = file->private_data;
+	struct uleds_user_trigger default_trigger;
+	int retval = 0;
+
+	switch (cmd) {
+	case ULEDS_IOC_DEV_SETUP:
+		retval = dev_setup(udev, (const char __user *)arg);
+		break;
+
+	case ULEDS_IOC_SET_DEFAULT_TRIGGER:
+		retval = copy_from_user(&default_trigger,
+			(struct uleds_user_trigger __user *)arg,
+			sizeof(default_trigger));
+		if (retval)
+			return retval;
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+		if (default_trigger.name[0] == '\0') {
+			udev->led_cdev.default_trigger = NULL;
+		} else {
+			if (!is_trigger_name_valid(default_trigger.name)) {
+				mutex_unlock(&udev->mutex);
+				return -EINVAL;
+			}
+			memcpy(&udev->default_trigger, &default_trigger, sizeof(udev->default_trigger));
+			udev->led_cdev.default_trigger = udev->default_trigger.name;
+		}
+		if (udev->state == ULEDS_STATE_REGISTERED) {
+			led_trigger_set_default(&udev->led_cdev);
+		}
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
 static int uleds_release(struct inode *inode, struct file *file)
 {
 	struct uleds_device *udev = file->private_data;
@@ -200,6 +277,7 @@ static const struct file_operations uleds_fops = {
 	.read		= uleds_read,
 	.write		= uleds_write,
 	.poll		= uleds_poll,
+	.unlocked_ioctl	= uleds_ioctl,
 };
 
 static struct miscdevice uleds_misc = {
diff --git a/include/uapi/linux/uleds.h b/include/uapi/linux/uleds.h
index 4d32a39965f8..0e9861a8c31f 100644
--- a/include/uapi/linux/uleds.h
+++ b/include/uapi/linux/uleds.h
@@ -15,11 +15,39 @@
 #ifndef _UAPI__ULEDS_H_
 #define _UAPI__ULEDS_H_
 
-#define LED_MAX_NAME_SIZE	64
+#define LED_MAX_NAME_SIZE		64
+#define ULEDS_TRIGGER_MAX_NAME_SIZE	64
 
 struct uleds_user_dev {
 	char name[LED_MAX_NAME_SIZE];
 	int max_brightness;
 };
 
+struct uleds_user_trigger {
+	char name[ULEDS_TRIGGER_MAX_NAME_SIZE];
+};
+
+
+/* ioctl commands */
+
+#define ULEDS_IOC_MAGIC		'l'
+
+/*
+ * Initial setup.
+ * E.g.:
+ *	int retval;
+ *	struct uleds_user_dev dev_setup = { "mainboard:green:battery", 255 };
+ *	retval = ioctl(fd, ULEDS_IOC_DEV_SETUP, &dev_setup);
+ */
+#define ULEDS_IOC_DEV_SETUP		_IOW(ULEDS_IOC_MAGIC, 0x01, struct uleds_user_dev)
+
+/*
+ * Set the default trigger.
+ * E.g.:
+ *	int retval;
+ *	struct uleds_user_trigger default_trigger = { "battery" };
+ *	retval = ioctl(fd, ULEDS_IOC_SET_DEFAULT_TRIGGER, &default_trigger);
+ */
+#define ULEDS_IOC_SET_DEFAULT_TRIGGER	_IOW(ULEDS_IOC_MAGIC, 0x02, struct uleds_user_trigger)
+
 #endif /* _UAPI__ULEDS_H_ */
-- 
2.48.1


