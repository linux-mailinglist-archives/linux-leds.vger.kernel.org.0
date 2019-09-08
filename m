Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDC9ACCC9
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 14:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729248AbfIHMlo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 08:41:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44828 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfIHMlm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 08:41:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so7427316pfn.11;
        Sun, 08 Sep 2019 05:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6mQWtJ8RCa85NYb/NHarETCgw7xiqRuTUbpNaBTvJn8=;
        b=BmuEx2QZbNmGw93q6oqX//YX+2SAearpPvZUnRKNR9UiJ0VBaK6ZUK+aFuglcyoYfp
         X25vv+i+LxQSNuMGVOcIJFh95X1+VnNhl7bcpc2UtgYtBhC7JANrK4dBcNYnkUyeEiXa
         BTHtNvvjImh/S5j/fiGGlU136iEgo3ChioIuVj7SYfOgOp1rdEGnZD8dGCvb6CcSijIk
         lL8ZpENwzg2ZIFyiKbF1YM4LF8nt1yeGVBn6ZgJEu8UvtpIstoM7fJaXECZovuByAd+/
         J8FSWrJ2eaCNK4bfBiNiNbcVJ2TS9Cwq0biHFdjO8j9TOC95uaYxq3smMGk+HO7stQz5
         U6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6mQWtJ8RCa85NYb/NHarETCgw7xiqRuTUbpNaBTvJn8=;
        b=NUzuP1W+NTQd6rH7vudLhwa/NghU6U8JzMBY7CKsZQ9YAslJYlgzPafepWa4Y3+52h
         JJQXFSmrYMcLP+ahf+DnY7KpwUQZ/aAJFXvl7oYbItgZkDai2TCxa+nRBOrJcZib5Enf
         WbusHSDUQdlAAN8sWsOsHs3xtjlYVPG2omBgWcXmGrTR5MYfB/021eUtQrkXMwNwTbJu
         aemZxe26vWBnOuGKxvClUTiHQtobbwwj3TWJldjP/Sof8WLWbehZHViOsHbvXdjpc+Gq
         oh7hPvxDCb6jsAV0FQP9XVKvjScpwEPNBvs7/fK2Ie81aInA1tBD9A5AVnUfceg0W9AG
         6zYA==
X-Gm-Message-State: APjAAAW1KGBYgPblAq7ZUDByjlCg6IyhXFbAj5I/WpEKEYDFMNpIpVt9
        fBIQjw7RHfQ+2BBeNILpO19CzfJr
X-Google-Smtp-Source: APXvYqyOXirM+P7yHtDwGfULSuKMuoZRPRfYzG3wtf4jqKl+nlF3wtBLo04exmhUs5z3dBR/IEuGTg==
X-Received: by 2002:a17:90a:c706:: with SMTP id o6mr15631670pjt.56.1567946501844;
        Sun, 08 Sep 2019 05:41:41 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:cae:1d92:a912:df67])
        by smtp.gmail.com with ESMTPSA id s7sm10879582pjn.8.2019.09.08.05.41.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 05:41:41 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 4/5] leds: add /sys/class/triggers/ that contains trigger sub-directories
Date:   Sun,  8 Sep 2019 21:41:11 +0900
Message-Id: <1567946472-10075-5-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, this violates the "one value per file" rule of sysfs.

This provides /sys/class/leds/triggers directory that contains a number of
sub-directories, each representing an LED trigger. The name of the
sub-directory matches the LED trigger name.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led |  9 +++++++++
 drivers/leds/led-class.c                  | 32 +++++++++++++++++++++++++++++++
 drivers/leds/led-triggers.c               | 19 ++++++++++++++++++
 drivers/leds/leds.h                       |  1 +
 include/linux/leds.h                      |  1 +
 5 files changed, 62 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 5f67f7a..14d91af 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -61,3 +61,12 @@ Description:
 		gpio and backlight triggers. In case of the backlight trigger,
 		it is useful when driving a LED which is intended to indicate
 		a device in a standby like state.
+
+What:		/sys/class/leds/triggers/
+Date:		September 2019
+KernelVersion:	5.5
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This directory contains a number of sub-directories, each
+		representing an LED trigger. The name of the sub-directory
+		matches the LED trigger name.
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 7d85181..04e6c14 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -81,6 +81,28 @@ static struct bin_attribute *led_trigger_bin_attrs[] = {
 static const struct attribute_group led_trigger_group = {
 	.bin_attrs = led_trigger_bin_attrs,
 };
+
+static int led_triggers_kobj_create(void)
+{
+	led_triggers_kobj = class_kobject_create_and_add("triggers",
+							 leds_class);
+
+	return led_triggers_kobj ? 0 : -ENOMEM;
+}
+
+static void led_triggers_kobj_destroy(void)
+{
+	kobject_put(led_triggers_kobj);
+}
+
+#else
+static inline int led_triggers_kobj_create(void)
+{
+	return 0;
+}
+static void led_triggers_kobj_destroy(void)
+{
+}
 #endif
 
 static struct attribute *led_class_attrs[] = {
@@ -411,16 +433,26 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
 
 static int __init leds_init(void)
 {
+	int ret;
+
 	leds_class = class_create(THIS_MODULE, "leds");
 	if (IS_ERR(leds_class))
 		return PTR_ERR(leds_class);
 	leds_class->pm = &leds_class_dev_pm_ops;
 	leds_class->dev_groups = led_groups;
+
+	ret = led_triggers_kobj_create();
+	if (ret) {
+		class_unregister(leds_class);
+		return ret;
+	}
+
 	return 0;
 }
 
 static void __exit leds_exit(void)
 {
+	led_triggers_kobj_destroy();
 	class_destroy(leds_class);
 }
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index ed5a311..4a86964 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -268,16 +268,26 @@ void led_trigger_rename_static(const char *name, struct led_trigger *trig)
 }
 EXPORT_SYMBOL_GPL(led_trigger_rename_static);
 
+static struct kobj_type led_trigger_kobj_type = {
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+struct kobject *led_triggers_kobj;
+EXPORT_SYMBOL_GPL(led_triggers_kobj);
+
 /* LED Trigger Interface */
 
 int led_trigger_register(struct led_trigger *trig)
 {
 	struct led_classdev *led_cdev;
 	struct led_trigger *_trig;
+	int ret;
 
 	rwlock_init(&trig->leddev_list_lock);
 	INIT_LIST_HEAD(&trig->led_cdevs);
 
+	kobject_init(&trig->kobj, &led_trigger_kobj_type);
+
 	down_write(&triggers_list_lock);
 	/* Make sure the trigger's name isn't already in use */
 	list_for_each_entry(_trig, &trigger_list, next_trig) {
@@ -286,6 +296,14 @@ int led_trigger_register(struct led_trigger *trig)
 			return -EEXIST;
 		}
 	}
+
+	WARN_ON_ONCE(!led_triggers_kobj);
+	ret = kobject_add(&trig->kobj, led_triggers_kobj, "%s", trig->name);
+	if (ret) {
+		up_write(&triggers_list_lock);
+		return ret;
+	}
+
 	/* Add to the list of led triggers */
 	list_add_tail(&trig->next_trig, &trigger_list);
 	up_write(&triggers_list_lock);
@@ -316,6 +334,7 @@ void led_trigger_unregister(struct led_trigger *trig)
 
 	/* Remove from the list of led triggers */
 	down_write(&triggers_list_lock);
+	kobject_put(&trig->kobj);
 	list_del_init(&trig->next_trig);
 	up_write(&triggers_list_lock);
 
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index a0ee33c..52debe0 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -33,5 +33,6 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
 extern struct list_head trigger_list;
+extern struct kobject *led_triggers_kobj;
 
 #endif	/* __LEDS_H_INCLUDED */
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 33ae825..379f282 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -279,6 +279,7 @@ struct led_trigger {
 	struct list_head  next_trig;
 
 	const struct attribute_group **groups;
+	struct kobject kobj;
 };
 
 /*
-- 
2.7.4

