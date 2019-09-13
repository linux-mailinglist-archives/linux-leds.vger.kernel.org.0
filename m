Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6038B22E5
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 17:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390607AbfIMPDp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 11:03:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34851 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390420AbfIMPDp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Sep 2019 11:03:45 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so15421673pgv.2;
        Fri, 13 Sep 2019 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9AgdMynI1ZAA7JeCF/sT/EVViwMRnFrt1eKXKnGAHwk=;
        b=PygegN81pCfS4E/Pqa8TUHpYPGKUuJLvYB4pEk2nFM6d3pbFjsDTWKWUntN5iCQ4J7
         GrB01m7PowUriITElxjXKIne7z7FD0X6K/JfsE1+WWphfLO8A1FGDlrctJf4vvxtpLAY
         CxfIw0kXgGk668JcTeN4PonqDD479DcUE89TLoKamY6SQC6N/nXb5WfGImZS+07fRBlJ
         aXEFiu6NOdb6wqfxCtb2CvkydFvFTnlyHwbSL0zd7bd5yIOHGBxQxhMP1EqfZI9jY/kk
         HsbBr4EdNpGUZzCstIt2gFK02DImTERBc/FGLH4dYghKU3/ZxP9hFZWK10AQTh8G8pbA
         YphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9AgdMynI1ZAA7JeCF/sT/EVViwMRnFrt1eKXKnGAHwk=;
        b=mqS49/IGd8liwypsqEe4IOE8IHfFK/uWMLZBo6SbUmvsbnUniOA7wnZZkeAcsOlL+a
         A+DunP/mUyt1C2ep7g56nSVBv0H7YPw6VyrHkUuA0PXCb6iWTpYes4rBY2hUsJRsDurW
         u6lbGQcYplnWUTLhcIiccGAlaG7fsvJqXQj8qaMn9vv5WtWiVpmZwCCRLVthjX+Aqyly
         O7NtkYIlVcXw3sM8NAShDzxCGMrBthUtn4glGwkBT+H0Ml0XVsOuPCYR/g3QxShNpjnT
         fkiVjwQQymVxPGfDs7dVT+1OAoPoxgakkrIqNAsT1QApnzYPLL0iRKYWus3RMdhLfBQl
         PAUQ==
X-Gm-Message-State: APjAAAXOqPx1fd2b29rGLGc0OEETDEByC6JmavPpnkHBO8PEGmCTANj6
        kMfS4NegB5ZKZBrE7RYBDkwjtyum
X-Google-Smtp-Source: APXvYqxKNgmuq7zF8zn2f/JK+m7Z1NNlSOHf1lmRpOGPjw0DfNNuARa1iGRwdws+6A+ZJ0RUOYGtAA==
X-Received: by 2002:a17:90a:c70c:: with SMTP id o12mr5649782pjt.50.1568387024140;
        Fri, 13 Sep 2019 08:03:44 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:a4da:99f6:4d93:495b])
        by smtp.gmail.com with ESMTPSA id c8sm9551899pgw.37.2019.09.13.08.03.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:03:43 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 1/1] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
Date:   Sat, 14 Sep 2019 00:03:24 +0900
Message-Id: <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
References: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
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

We work around it here by converting /sys/class/leds/<led>/trigger to
binary attribute, which is not limited by length. This is _not_ good
design, do not copy it.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/led-class.c    |  8 ++--
 drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
 drivers/leds/leds.h         |  6 +++
 include/linux/leds.h        |  5 ---
 4 files changed, 79 insertions(+), 30 deletions(-)

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
index 8d11a5e..ed5a311 100644
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
@@ -64,39 +67,84 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
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
-	int len = 0;
+	int len = led_trigger_snprintf(buf, size, query, "%s",
+				       led_cdev->trigger ? "none" : "[none]");
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
+/*
+ * It was stupid to create 10000 cpu triggers, but we are stuck with it now.
+ * Don't make that mistake again. We work around it here by creating binary
+ * attribute, which is not limited by length. This is _not_ good design, do not
+ * copy it.
+ */
+ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
+			struct bin_attribute *attr, char *buf,
+			loff_t pos, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	void *data;
+	int len;
 
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

