Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 685EFC15BC
	for <lists+linux-leds@lfdr.de>; Sun, 29 Sep 2019 16:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbfI2OTM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Sep 2019 10:19:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43795 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfI2OTM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Sep 2019 10:19:12 -0400
Received: by mail-pg1-f196.google.com with SMTP id v27so5824226pgk.10;
        Sun, 29 Sep 2019 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GWVmon7ssB0uuITFe2bBCfeRidxeNfTrMso/H8aAwhQ=;
        b=rbOvKSairizR+P/rHoAlq+Sy2ek1VHohcLx3BvzSi2lNJwE/gcEsJGzxf994X8UR5S
         6nzZiGv8h3FC7zL0/gVonWZcjklrSe2pEI3a/+25W6j1PucQ/AzjUqBhRQ/0jkA2CPdy
         Nls0DreyTyI7cf6LSAp87tqpkzD4StLja4oZw+aM6sqCFIGzvxLWYgikJtFO1jeF2hQY
         SvOimE6P+oJ88J0kihMpvfcX+W7E4N8FSDbO4aSZvbpSzlzbBa6+ichWogcXgpO6yU+L
         x2ZnxpOMulkWfd/qOOF7BhHGJBCfv+TTKaH5O36gqlBYyVmJplfcfp86Cm9aCUkHMeq8
         56xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GWVmon7ssB0uuITFe2bBCfeRidxeNfTrMso/H8aAwhQ=;
        b=KYwKfcfNRxiN9ihtrXQF2FrRqggFXkKGhKk6kf65yO7ABsHUctPGGrYra8urwO5QvL
         rWACRZBC8SvYv7yQ/FJrQ0l7xgrsodWhetlavHjY80R5ykbkJj/zvFnFUp1YHYTVzkco
         RDSuX0/BEYMWSEbxzTsL7A1DYz7GXWcaWa6ctVShiMrM6ecXYkkrz7i811CcJmZH21UQ
         BA6h4m9gUzmCY38K+iW11GpXDh57X5Evkm8e1s/X1NmyQKaQA8ae7t05ZSsJHdk9RAS6
         Iv3Y2E3/v3N1IBTDsxPLzvAoziUTeTXC3th9M6C48YvL1hcY3ADtMrZvHR/UWkxmdgbS
         okHQ==
X-Gm-Message-State: APjAAAVi5GXuTpAJ9NJAmrDFLxD12kOq1591f17puh7XKp1FoLxJDSbj
        qMjquGa6M9UGmHsNmmlvjwJpS0p7
X-Google-Smtp-Source: APXvYqwaqAQpJoqcisrKfz1WY9gAJDrFsIw4UQN+ZUk6yZ4giCEOvJQAlTpDDlf9ET9ZmAC6bgGHGQ==
X-Received: by 2002:a63:441b:: with SMTP id r27mr19487414pga.357.1569766750665;
        Sun, 29 Sep 2019 07:19:10 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:20:6ca:d990:a8a2])
        by smtp.gmail.com with ESMTPSA id fa24sm10833336pjb.13.2019.09.29.07.19.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 29 Sep 2019 07:19:09 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 1/1] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
Date:   Sun, 29 Sep 2019 23:18:49 +0900
Message-Id: <1569766729-8433-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569766729-8433-1-git-send-email-akinobu.mita@gmail.com>
References: <1569766729-8433-1-git-send-email-akinobu.mita@gmail.com>
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
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/led-class.c    |  8 ++--
 drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
 drivers/leds/leds.h         |  6 +++
 include/linux/leds.h        |  5 ---
 4 files changed, 78 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 647b126..3f04334 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -74,13 +74,13 @@ static ssize_t max_brightness_show(struct device *dev,
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
index 23963e5c..79e30d2 100644
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
@@ -64,39 +67,82 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(led_trigger_store);
+EXPORT_SYMBOL_GPL(led_trigger_write);
 
-ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
-		char *buf)
+__printf(3, 4)
+static int led_trigger_snprintf(char *buf, ssize_t size, const char *fmt, ...)
+{
+	va_list args;
+	int i;
+
+	va_start(args, fmt);
+	if (size <= 0)
+		i = vsnprintf(NULL, 0, fmt, args);
+	else
+		i = vscnprintf(buf, size, fmt, args);
+	va_end(args);
+
+	return i;
+}
+
+static int led_trigger_format(char *buf, size_t size,
+			      struct led_classdev *led_cdev)
 {
-	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_trigger *trig;
-	int len = 0;
+	int len = led_trigger_snprintf(buf, size, "%s",
+				       led_cdev->trigger ? "none" : "[none]");
+
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		bool hit = led_cdev->trigger &&
+			!strcmp(led_cdev->trigger->name, trig->name);
+
+		len += led_trigger_snprintf(buf + len, size - len,
+					    " %s%s%s", hit ? "[" : "",
+					    trig->name, hit ? "]" : "");
+	}
+
+	len += led_trigger_snprintf(buf + len, size - len, "\n");
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
-	else
-		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
-
-	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
-							trig->name))
-			len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ",
-					 trig->name);
-		else
-			len += scnprintf(buf+len, PAGE_SIZE - len, "%s ",
-					 trig->name);
+	len = led_trigger_format(NULL, 0, led_cdev);
+	data = kvmalloc(len + 1, GFP_KERNEL);
+	if (!data) {
+		up_read(&led_cdev->trigger_lock);
+		up_read(&triggers_list_lock);
+		return -ENOMEM;
 	}
+	len = led_trigger_format(data, len + 1, led_cdev);
+
 	up_read(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
 
-	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
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
index 0b577ce..2d9eb48 100644
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
index 5c8f3c5..da78b27 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -361,11 +361,6 @@ struct led_trigger {
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

