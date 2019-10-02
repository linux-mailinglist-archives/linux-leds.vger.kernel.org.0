Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20780C8C7A
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbfJBPNX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:13:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43796 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfJBPNX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 11:13:23 -0400
Received: by mail-pg1-f195.google.com with SMTP id v27so11973772pgk.10;
        Wed, 02 Oct 2019 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3FqLvYfuaoKXbyP0A5kLIz64ep9FrXLqoZM44num0xE=;
        b=PKJZdL5Sa/gpM+j1M3Pm6olFhgJLFzyZOm50+SvkpzzlgHcnZm0giPQ9Y/pCNMHhDn
         Y+QRvzfW1qeIgUhY4I6exl4LOwdfOgydffmtUintP1ozB8hwBSvzl9F37odohaGgd4nw
         X7TRW04x760u7YU7F9QkN2UfYd329g0BM2Oeig2Sbu3Rx5Jngm2Dvs0Q7WnieqS6JQ6y
         Q6X6jGp1G1h+F+I55xx274fmoZXlpcIfWoQzqZs2DqF8mhMPjjbi4+lVLwBbyu0+S/Ky
         RDbHf3INgYykWxqQTkL3sqwFMei5+WMk+4soKMRY/LbcNwlPsN/KxPVEXU1aqe8mDikp
         99jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3FqLvYfuaoKXbyP0A5kLIz64ep9FrXLqoZM44num0xE=;
        b=bp6u15XdWVn0UU+96fihjoxi/kDN2hIDwDTWkG2zC4r2w3TsfcSzypacfarpNf2N39
         gjF0WqCHN376wmfGyxP4YooA62BEkMFaDXbmolELOId8wglGbiLIkFNIUg2AYHonpY5P
         fNY/t/68qz6hwqj4oPBxTXNPCuT/8L1MO74lIBKDbwy6HiyOebVGrg+pejdN9/yceXCf
         5pJqOuchN7Uuv6c2Wr7ncuaZ+vV8qDvpUxftA7svMWDYa8UDkvWRUsD0J7SAkpYZ1LdH
         2HcP7VxipUPTnA154JcgzZEVCK8fScZxU1wWvWfRKH85aPUWSN6UK5pW+WjIiVW3ider
         h3Bw==
X-Gm-Message-State: APjAAAV/umrQVDAeKxlNUMFChUe5dQ7Cbios9ksbQS9WK700xKhelV2J
        4+2UH3hMiU4FjX/yJ7byC1mN8lXF
X-Google-Smtp-Source: APXvYqylA+HssXlU40obBKzlgg8iDzvdZ649/qVE7d+n1yVt7hEvSh6jJk3KLDQWxIImpcNuprChXw==
X-Received: by 2002:aa7:85d0:: with SMTP id z16mr5244861pfn.206.1570029202254;
        Wed, 02 Oct 2019 08:13:22 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:8161:a821:b9aa:cfb2])
        by smtp.gmail.com with ESMTPSA id k23sm21397937pgg.73.2019.10.02.08.13.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 02 Oct 2019 08:13:21 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH -next 2/2] leds: add /sys/class/leds/<led>/current-trigger
Date:   Thu,  3 Oct 2019 00:13:01 +0900
Message-Id: <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
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
We can find all available LED triggers by listing the
/sys/devices/virtual/led-trigger/ directory.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
 drivers/leds/led-class.c                  | 10 ++++++++
 drivers/leds/led-triggers.c               | 38 +++++++++++++++++++++++++++----
 drivers/leds/leds.h                       |  5 ++++
 4 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 5f67f7a..fdfed3f 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -61,3 +61,16 @@ Description:
 		gpio and backlight triggers. In case of the backlight trigger,
 		it is useful when driving a LED which is intended to indicate
 		a device in a standby like state.
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
index 3f04334..3cb0d8a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -74,12 +74,22 @@ static ssize_t max_brightness_show(struct device *dev,
 static DEVICE_ATTR_RO(max_brightness);
 
 #ifdef CONFIG_LEDS_TRIGGERS
+
+static DEVICE_ATTR(current_trigger, 0644, led_current_trigger_show,
+		   led_current_trigger_store);
+
+static struct attribute *led_current_trigger_attrs[] = {
+	&dev_attr_current_trigger.attr,
+	NULL,
+};
+
 static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
 static struct bin_attribute *led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
 static const struct attribute_group led_trigger_group = {
+	.attrs = led_current_trigger_attrs,
 	.bin_attrs = led_trigger_bin_attrs,
 };
 #endif
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 0b810cf..a2ef674 100644
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
 __printf(3, 4)
 static int led_trigger_snprintf(char *buf, ssize_t size, const char *fmt, ...)
 {
@@ -144,6 +159,21 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
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
index 2d9eb48..c581690 100644
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

