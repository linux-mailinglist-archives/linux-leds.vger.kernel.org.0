Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7037DB1147
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 16:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732727AbfILOkV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 10:40:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36635 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732592AbfILOkU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 10:40:20 -0400
Received: by mail-pf1-f196.google.com with SMTP id y22so16171647pfr.3;
        Thu, 12 Sep 2019 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9AgdMynI1ZAA7JeCF/sT/EVViwMRnFrt1eKXKnGAHwk=;
        b=SbJm17Uk9xDJ8+HUu1bt3jYYPPs+1souh/nhp2HtTf8drQ41Pw8MQdkb9ltSQifAv0
         AOa0W8+VmtNmns7NwCkE04Kq2JVi5YVUbrW3k0qNpRWamqUhJ9ELNDRiGdEc4Y/IxqEo
         zDOgdw/ZhF+nTzj+z5fN39L9t4BgUlMqDo5r/J+DBoRwOu8hglAbuvfEXn/fXH2u47+7
         FcV0LLHSnfzawH9wKB2uS+1HYgf8Eoc7lMYsA+YHUHSCM/vf5df8/tcNdqyiynRF7mwM
         KPIw8zw3KSHBNsEKTpLNLbM/1Xn232n5Y7PruUi5yk7mv8DbUakKcqvJRfepRVFfbLYS
         LWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9AgdMynI1ZAA7JeCF/sT/EVViwMRnFrt1eKXKnGAHwk=;
        b=KRrSZhvXulrx7hwAx/BK+Rsk661jRqmBylnBlUMWDiuWgzIIQOYWXBnRIphla5BKtB
         1gPesTREKqO/MOTuHu3vADSC2+4vrrm0/wIKx26ol69RatRgs2TyxQ5KOZdcGn9ZEOQD
         5INmp/ls/6NdFQLKDnBK8fEtRK/ZPtmU/XEF4mnqHrDrl/kII1NLZ2VzGXLKnkQrUq8W
         OpPQQjbhq9OiTB54FI251wqZVFH3SkRpeCQ8O8BrjMRiPAlk51c8ciIUq3N/UtSC4q41
         CMeSx6GCrWtwD2we0FflcnHvbuHdUQbuVxHA8/C7mwyKAXaPU+2MGqARZi0TsyWKjAVP
         htUw==
X-Gm-Message-State: APjAAAX9xgmNOlk4X8QRsHSSd2qXks8u/9MKQknBa6N0BL7+vDzvZ+6z
        rLxnjnEpSDgjrTYqaIKecIAlBWnK
X-Google-Smtp-Source: APXvYqx8ytoFqcf8SFiVf1zxmEx1E1wgooqSfRsNpLSZN0qyOok9P0qmJ1M1U2Lw+ssAy2160Qgjvw==
X-Received: by 2002:aa7:980c:: with SMTP id e12mr47789354pfl.79.1568299219838;
        Thu, 12 Sep 2019 07:40:19 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:a9d6:f377:69:9ad0])
        by smtp.gmail.com with ESMTPSA id b3sm42125514pfp.65.2019.09.12.07.40.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:40:18 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
Date:   Thu, 12 Sep 2019 23:39:49 +0900
Message-Id: <1568299189-11074-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568299189-11074-1-git-send-email-akinobu.mita@gmail.com>
References: <1568299189-11074-1-git-send-email-akinobu.mita@gmail.com>
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

