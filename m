Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37860ACCCA
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 14:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfIHMlq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 08:41:46 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44833 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729253AbfIHMlp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 08:41:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so7427343pfn.11;
        Sun, 08 Sep 2019 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HE5U6JyUtqT3NwRJE4X3ABoBrrcNMdRzk5t7Av4Ksr4=;
        b=ojor0RFQjJ3aC1+TuGbHXGEcRyAJvS0s7Ai4gnw5Sp2nooNT/WeP/AqcYQTvivLpqZ
         1lMKPpEjTw3sxdtMfwUCU34uX5THV+xAOYz6pf3TEQDeAcsmkATMaT89TEyQTuRtSljy
         rW5hsJf0wsVsmJUTwXrOyLvKAiwtFdcYVuCl24+Z1ZoIZf9eFkKrmyif4/ooU4I4IM9v
         qyr4rPhOjkCM8N0Cd4CaO2Bz5/TCI5C1cLOTlnYmlLWOL14V+G8c6WPxP4JOJ+BCi18v
         RXycl2orxebm6xpuzGQbaxJG5e6CoyIWDS4iQJna1iq3uGWyvak4zbq3/i4nXXbZJZol
         15aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HE5U6JyUtqT3NwRJE4X3ABoBrrcNMdRzk5t7Av4Ksr4=;
        b=hSC5wnVLmYW0T0jyIP3FGRe1lNFjcCmBIX2iS/xQ5UewqgYN/qKPk1z4GMH4jP49h1
         2vyD4R4CMilntMkv+GV2VOIBNH35B1z23jRGbtXvrOLYFlrbY37kA1EWuKYgdpKlAD6q
         N1kiQh88xqme9i1XbFTyIw+8FQoAeAL7ouWwdxcecybcoMZVhBeiMObJv4jbHdL2/ExZ
         gqRWZ+8D7ocMvmnk0oB76Nz/kvo2KF5CBoGcQX0UL3Z5CFuSs7PxX2vcEzdFdMwXX8lz
         RW3yzmXVQ1PossIhuR25h6zguD0Ffe7fSBmxUI+xUfjIIBQR5Mxlv8Wwzj/7NxZ1qfyT
         pzRQ==
X-Gm-Message-State: APjAAAU5FByIbIu7EzfNeBl1JTAFiFdphdvDfOkn8CotU9cW6aam7PqV
        91i1shgmpXZ7F6EJ/25WYKR9LCyH
X-Google-Smtp-Source: APXvYqy5CNRues1jzvCxwJW6vneg1z60b8kB1MvTx3KVxguzCzTOMp0MT4LRM4zL+4jmDrCfMppUXA==
X-Received: by 2002:a17:90a:65c9:: with SMTP id i9mr3146246pjs.54.1567946504608;
        Sun, 08 Sep 2019 05:41:44 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:cae:1d92:a912:df67])
        by smtp.gmail.com with ESMTPSA id s7sm10879582pjn.8.2019.09.08.05.41.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 05:41:44 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 5/5] leds: add /sys/class/leds/<led>/current-trigger
Date:   Sun,  8 Sep 2019 21:41:12 +0900
Message-Id: <1567946472-10075-6-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, this violates the "one value per file" rule of sysfs.

This provides /sys/class/leds/<led>/current-trigger which is almost
identical to /sys/class/leds/<led>/trigger.  The only difference is that
'current-trigger' only shows the current trigger name.

This new file follows the "one value per file" rule of sysfs.
We can use the /sys/class/triggers directory to get the list of available
LED triggers.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
 drivers/leds/led-class.c                  |  7 ++++++
 drivers/leds/led-triggers.c               | 38 +++++++++++++++++++++++++++----
 drivers/leds/leds.h                       |  5 ++++
 4 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 14d91af..1a1be10 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -70,3 +70,16 @@ Description:
 		This directory contains a number of sub-directories, each
 		representing an LED trigger. The name of the sub-directory
 		matches the LED trigger name.
+
+What:		/sys/class/leds/<led>/current-trigger
+Date:		September 2019
+KernelVersion:	5.5
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Set the trigger for this LED. A trigger is a kernel based source
+		of LED events.
+		Writing the trigger name to this file will change the current
+		trigger. Trigger specific parameters can appear in
+		/sys/class/leds/<led> once a given trigger is selected. For
+		their documentation see sysfs-class-led-trigger-*.
+		Reading this file will return the current LED trigger name.
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 04e6c14..388500b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -73,12 +73,19 @@ static ssize_t max_brightness_show(struct device *dev,
 static DEVICE_ATTR_RO(max_brightness);
 
 #ifdef CONFIG_LEDS_TRIGGERS
+static DEVICE_ATTR(current_trigger, 0644, led_current_trigger_show,
+		   led_current_trigger_store);
+static struct attribute *led_current_trigger_attrs[] = {
+	&dev_attr_current_trigger.attr,
+	NULL,
+};
 static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
 static struct bin_attribute *led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
 static const struct attribute_group led_trigger_group = {
+	.attrs = led_current_trigger_attrs,
 	.bin_attrs = led_trigger_bin_attrs,
 };
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 4a86964..41bcc508 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -27,11 +27,9 @@ LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
-ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-			  struct bin_attribute *bin_attr, char *buf,
-			  loff_t pos, size_t count)
+static ssize_t led_trigger_store(struct device *dev, const char *buf,
+				 size_t count)
 {
-	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_trigger *trig;
 	int ret = count;
@@ -67,8 +65,25 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
+
+ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
+			  struct bin_attribute *bin_attr, char *buf,
+			  loff_t pos, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	return led_trigger_store(dev, buf, count);
+}
 EXPORT_SYMBOL_GPL(led_trigger_write);
 
+ssize_t led_current_trigger_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	return led_trigger_store(dev, buf, count);
+}
+EXPORT_SYMBOL_GPL(led_current_trigger_store);
+
 __printf(4, 5)
 static int led_trigger_snprintf(char *buf, size_t size, bool query,
 				const char *fmt, ...)
@@ -146,6 +161,21 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 }
 EXPORT_SYMBOL_GPL(led_trigger_read);
 
+ssize_t led_current_trigger_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	int len;
+
+	down_read(&led_cdev->trigger_lock);
+	len = scnprintf(buf, PAGE_SIZE, "%s\n", led_cdev->trigger ?
+			led_cdev->trigger->name : "none");
+	up_read(&led_cdev->trigger_lock);
+
+	return len;
+}
+EXPORT_SYMBOL_GPL(led_current_trigger_show);
+
 /* Caller must ensure led_cdev->trigger_lock held */
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 {
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 52debe0..e3d04c2 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -29,6 +29,11 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
+ssize_t led_current_trigger_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count);
+ssize_t led_current_trigger_show(struct device *dev,
+				struct device_attribute *attr, char *buf);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
-- 
2.7.4

