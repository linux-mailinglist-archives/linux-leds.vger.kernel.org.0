Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDC3A1D99
	for <lists+linux-leds@lfdr.de>; Thu, 29 Aug 2019 16:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfH2Otk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Aug 2019 10:49:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36900 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2Otj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Aug 2019 10:49:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id y9so2221687pfl.4;
        Thu, 29 Aug 2019 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3DWdaVqSU5hTd7PKNLQkz13wKvdDrYECuFK41iAvopc=;
        b=U+VtjXTUo3mYcnKLvwc5JI/CvlZ/Rji1wMfiTS9LcbRydX+ylFPPzwTrV97l8qgpp5
         if50I/TbpxWbYUoXGA3C2jw0QcY3mBFDEjLF8Kd0cn1WdS5Oy5QWbIaU1p/yr4VysaaZ
         8tZeNbGH9kE7RC3jklpvKj9TDfvTBlBymHEleZHJJO3tPh6rqCGy44ssf7ll0MV2xlEr
         wabT9I37jefqytlTdOq4lxbRDtzgkgYAwQZRhfHgzlFQA4NZEhqZq7HJuhkdMudR+esL
         Q+68oE/XVS1GGIJCx4/OSx4LQW04qGdnbV5bcVKAOha1nCQBqflNL+JIqt3kstYz+LDm
         eQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3DWdaVqSU5hTd7PKNLQkz13wKvdDrYECuFK41iAvopc=;
        b=s9/hgS03Jh8LjzBnF4JaZ0w0rubY5a0kg8QThSoFts0viV52E/Ed+JoZHggD2b95bj
         9MBTwh8zTiOOk6mgs51Le1rslwktu/4wGnWlGG+QBd6eX+g1C9aomjE9vmdu578OCfWL
         qjS9ySO1uOoFrBmhoQF22NYWG1pTPlO4J1NNLr1TEV4p63OP1FmdqQio8WAlGSUAVYfR
         HZhj7JMNv/fwMnAF1ij9oSDW03mulydd5wbWl6Ga3ImCYhOIfT8P6UekkbAZ7XHjhjqZ
         DvwmVNGuU89iKBYJ9vZWwyeWIqFsBo0FW6VmCz6juYQ/oFIQQRRCKylZNqTTAmbM8BfN
         OzPA==
X-Gm-Message-State: APjAAAWl0owQq9qZ6SHtwYy+VBQ1H+HSeDQBhktZrCBC5VKcF7fHU7cQ
        HEb/hhtle1gxn9TIi+AXW1tUREDpz90=
X-Google-Smtp-Source: APXvYqz+rahvc5QoV1ysPPR+BAG95AwIa6+c6bR4QqlRLGmlB5VMyQ6Q9z9A4dcp99XAUzP/22w80A==
X-Received: by 2002:a62:7912:: with SMTP id u18mr12530753pfc.254.1567090178713;
        Thu, 29 Aug 2019 07:49:38 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:d95c:e506:38d:ac4b])
        by smtp.gmail.com with ESMTPSA id fa14sm2297430pjb.12.2019.08.29.07.49.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Aug 2019 07:49:37 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
Date:   Thu, 29 Aug 2019 23:49:24 +0900
Message-Id: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, the size of this file is limited to PAGE_SIZE because of the
limitation for sysfs attribute.

Enabling LED CPU trigger on systems with thousands of CPUs easily hits
PAGE_SIZE limit, and makes it impossible to see all available LED triggers
and which trigger is currently activated.

This converts /sys/class/leds/<led>/trigger to bin attribute and removes
the PAGE_SIZE limitation.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/led-class.c    |  8 ++---
 drivers/leds/led-triggers.c | 84 ++++++++++++++++++++++++++++++++++-----------
 drivers/leds/leds.h         |  6 ++++
 include/linux/leds.h        |  5 ---
 4 files changed, 74 insertions(+), 29 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4793e77..8b5a1d1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -73,13 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
 static DEVICE_ATTR_RO(max_brightness);
 
 #ifdef CONFIG_LEDS_TRIGGERS
-static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
-static struct attribute *led_trigger_attrs[] = {
-	&dev_attr_trigger.attr,
+static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
+static struct bin_attribute *led_trigger_bin_attrs[] = {
+	&bin_attr_trigger,
 	NULL,
 };
 static const struct attribute_group led_trigger_group = {
-	.attrs = led_trigger_attrs,
+	.bin_attrs = led_trigger_bin_attrs,
 };
 #endif
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 8d11a5e..4788e00 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -16,6 +16,7 @@
 #include <linux/rwsem.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
+#include <linux/mm.h>
 #include "leds.h"
 
 /*
@@ -26,9 +27,11 @@ LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
-ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
+			  struct bin_attribute *bin_attr, char *buf,
+			  loff_t pos, size_t count)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_trigger *trig;
 	int ret = count;
@@ -64,39 +67,80 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(led_trigger_store);
+EXPORT_SYMBOL_GPL(led_trigger_write);
 
-ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
-		char *buf)
+__printf(4, 5)
+static int led_trigger_snprintf(char *buf, size_t size, bool query,
+				const char *fmt, ...)
+{
+	va_list args;
+	int i;
+
+	va_start(args, fmt);
+	if (query)
+		i = vsnprintf(NULL, 0, fmt, args);
+	else
+		i = vscnprintf(buf, size, fmt, args);
+	va_end(args);
+
+	return i;
+}
+
+static int led_trigger_format(char *buf, size_t size, bool query,
+			      struct led_classdev *led_cdev)
 {
-	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_trigger *trig;
 	int len = 0;
 
+	len += led_trigger_snprintf(buf + len, size - len, query, "%s",
+				    led_cdev->trigger ? "none" : "[none]");
+
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		bool hit = led_cdev->trigger &&
+			!strcmp(led_cdev->trigger->name, trig->name);
+
+		len += led_trigger_snprintf(buf + len, size - len, query,
+					    " %s%s%s", hit ? "[" : "",
+					    trig->name, hit ? "]" : "");
+	}
+
+	len += led_trigger_snprintf(buf + len, size - len, query, "\n");
+
+	return len;
+}
+
+ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
+			struct bin_attribute *attr, char *buf,
+			loff_t pos, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	void *data;
+	int len;
+
 	down_read(&triggers_list_lock);
 	down_read(&led_cdev->trigger_lock);
 
-	if (!led_cdev->trigger)
-		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
+	len = led_trigger_format(NULL, 0, true, led_cdev);
+	data = kvmalloc(len + 1, GFP_KERNEL);
+	if (data)
+		len = led_trigger_format(data, len + 1, false, led_cdev);
 	else
-		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
+		len = -ENOMEM;
 
-	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
-							trig->name))
-			len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ",
-					 trig->name);
-		else
-			len += scnprintf(buf+len, PAGE_SIZE - len, "%s ",
-					 trig->name);
-	}
 	up_read(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
 
-	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
+	if (len < 0)
+		return len;
+
+	len = memory_read_from_buffer(buf, count, &pos, data, len);
+
+	kvfree(data);
+
 	return len;
 }
-EXPORT_SYMBOL_GPL(led_trigger_show);
+EXPORT_SYMBOL_GPL(led_trigger_read);
 
 /* Caller must ensure led_cdev->trigger_lock held */
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 47b2294..a0ee33c 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -23,6 +23,12 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 				enum led_brightness value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 				enum led_brightness value);
+ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
+			struct bin_attribute *attr, char *buf,
+			loff_t pos, size_t count);
+ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
+			struct bin_attribute *bin_attr, char *buf,
+			loff_t pos, size_t count);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index fd2eb7c..33ae825 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -290,11 +290,6 @@ struct led_trigger {
 #define led_trigger_get_led(dev)	((struct led_classdev *)dev_get_drvdata((dev)))
 #define led_trigger_get_drvdata(dev)	(led_get_trigger_data(led_trigger_get_led(dev)))
 
-ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count);
-ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
-			char *buf);
-
 /* Registration functions for complex triggers */
 extern int led_trigger_register(struct led_trigger *trigger);
 extern void led_trigger_unregister(struct led_trigger *trigger);
-- 
2.7.4

