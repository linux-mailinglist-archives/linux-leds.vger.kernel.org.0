Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A038C8C78
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfJBPNV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:13:21 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37356 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfJBPNU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 11:13:20 -0400
Received: by mail-pl1-f196.google.com with SMTP id u20so7172758plq.4;
        Wed, 02 Oct 2019 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WF06h6Z4y9HlCvfE9POtx7739uPO4m+a8tJQ0lXuv8Y=;
        b=edA7D5wgWDwI7YF2LpcW2zVST5DycbiLD+M48JfxPfB83zK/DcidfnvFmj1BQw6G1k
         wnCW0TYjYB9avsIv2WDia8s0sDVKNlYjD3KZQDF6U5//omleyS+6TOQrwS34QeP3AmYl
         7vAylH/Do7Gy6j3pFxJTO091oW3v/UFGqMvnXHTuNHh5O1e2c0WoxKc4LSIuMq/ljerf
         NN2rYzWo7PZW4lWVEVWgfNhOWIiaKrlMV722ANIzMpHbzvZ7EARhtfZNojPRUV5TiqXV
         ZeA3XmMOk/rQl8t6Rwyi14CZvQqp0+GmhSfP9WoReMZ3x2wYd8m1gVZG1r/skt06eAHb
         pfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WF06h6Z4y9HlCvfE9POtx7739uPO4m+a8tJQ0lXuv8Y=;
        b=rH/W9A9cIxdWIJZeJmNyinHd46l4Q9MmWYAZX2FYUupK1mRPSZt2krEE/ZFpHH/cCG
         8hCtbZ4UFPTaWMudTPIN1kEHaO9LRxNaNSv1aQCvoN0NaL7G4zudas4o51ITAZd496VN
         rVVnb8I1wBjWKEEaLjsdzXlHcskiZHlufq3YFPk/sEBbaemI/6otHpkbthcq/S47YHF5
         S/aiWxvpE5l8gsMbr6iCrEIAOgHWF9x/iK4ayz1LH0X4cfuLcCO0ZOZ63qmUbi1w0qLY
         hT5wJjxVMf97IYa0NykPABavIjJNEF8oa/7owaHDllaUT82nvTZF8KZIWdLvcNszWMn3
         fHbQ==
X-Gm-Message-State: APjAAAU3Ebwu3h6S6Vef8vGhqmWkMLi2u9o0qmNKbRW0+UkOtnq0dQhl
        q362TrxUGHOZBPJftC3K9bwdp2BB
X-Google-Smtp-Source: APXvYqxLVbtZUQT7T6305Alx6quszF4v/CAHZ+s+k6ZHP+dLsihLur+fNZBxSQqtIH5DH3KMIljevg==
X-Received: by 2002:a17:902:ba87:: with SMTP id k7mr4256642pls.244.1570029199415;
        Wed, 02 Oct 2019 08:13:19 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:8161:a821:b9aa:cfb2])
        by smtp.gmail.com with ESMTPSA id k23sm21397937pgg.73.2019.10.02.08.13.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 02 Oct 2019 08:13:18 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH -next 1/2] leds: add /sys/devices/virtual/led-trigger/
Date:   Thu,  3 Oct 2019 00:13:00 +0900
Message-Id: <1570029181-11102-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, this violates the "one value per file" rule of sysfs.

This makes led_triggers "real" devices and provides an
/sys/devices/virtual/led-trigger/ directory that contains a sub-directoriy
for each LED trigger device. The name of the sub-directory matches the LED
trigger name.

We can find all available LED triggers by listing this directory contents.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 .../ABI/testing/sysfs-devices-virtual-led-trigger  |  8 +++
 drivers/leds/led-triggers.c                        | 57 ++++++++++++++++++++++
 include/linux/leds.h                               |  3 ++
 3 files changed, 68 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-led-trigger

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-led-trigger b/Documentation/ABI/testing/sysfs-devices-virtual-led-trigger
new file mode 100644
index 0000000..b8eb8f3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-led-trigger
@@ -0,0 +1,8 @@
+What:		/sys/devices/virtual/leds-trigger/
+Date:		September 2019
+KernelVersion:	5.5
+Contact:	linux-leds@vger.kernel.org
+Description:
+		This directory contains a sub-directoriy for each LED trigger
+		device. The name of the sub-directory matches the LED trigger
+		name.
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 79e30d2..0b810cf 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -267,21 +267,76 @@ void led_trigger_rename_static(const char *name, struct led_trigger *trig)
 }
 EXPORT_SYMBOL_GPL(led_trigger_rename_static);
 
+struct ledtrig_device {
+	struct device dev;
+};
+
+static void ledtrig_device_release(struct device *dev)
+{
+	struct ledtrig_device *trig_dev =
+		container_of(dev, struct ledtrig_device, dev);
+
+	kfree(trig_dev);
+}
+
+static struct bus_type led_trigger_subsys = {
+	.name = "led-trigger",
+};
+
+static int led_trigger_subsys_init(void)
+{
+	static DEFINE_MUTEX(init_mutex);
+	static bool init_done;
+	int ret = 0;
+
+	mutex_lock(&init_mutex);
+	if (!init_done) {
+		ret = subsys_virtual_register(&led_trigger_subsys, NULL);
+		if (!ret)
+			init_done = true;
+	}
+	mutex_unlock(&init_mutex);
+
+	return ret;
+}
+
 /* LED Trigger Interface */
 
 int led_trigger_register(struct led_trigger *trig)
 {
 	struct led_classdev *led_cdev;
 	struct led_trigger *_trig;
+	struct ledtrig_device *trig_dev;
+	int ret;
 
 	rwlock_init(&trig->leddev_list_lock);
 	INIT_LIST_HEAD(&trig->led_cdevs);
 
+	ret = led_trigger_subsys_init();
+	if (ret)
+		return ret;
+	trig_dev = kzalloc(sizeof(*trig_dev), GFP_KERNEL);
+	if (!trig_dev)
+		return -ENOMEM;
+
+	trig_dev->dev.bus = &led_trigger_subsys;
+	trig_dev->dev.release = ledtrig_device_release;
+	dev_set_name(&trig_dev->dev, "%s", trig->name);
+
+	ret = device_register(&trig_dev->dev);
+	if (ret) {
+		put_device(&trig_dev->dev);
+		return ret;
+	}
+
+	trig->trig_dev = trig_dev;
+
 	down_write(&triggers_list_lock);
 	/* Make sure the trigger's name isn't already in use */
 	list_for_each_entry(_trig, &trigger_list, next_trig) {
 		if (!strcmp(_trig->name, trig->name)) {
 			up_write(&triggers_list_lock);
+			device_unregister(&trig_dev->dev);
 			return -EEXIST;
 		}
 	}
@@ -327,6 +382,8 @@ void led_trigger_unregister(struct led_trigger *trig)
 		up_write(&led_cdev->trigger_lock);
 	}
 	up_read(&leds_list_lock);
+
+	device_unregister(&trig->trig_dev->dev);
 }
 EXPORT_SYMBOL_GPL(led_trigger_unregister);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index da78b27..d63c8e7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -336,6 +336,8 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
 
 #define TRIG_NAME_MAX 50
 
+struct ledtrig_device;
+
 struct led_trigger {
 	/* Trigger Properties */
 	const char	 *name;
@@ -350,6 +352,7 @@ struct led_trigger {
 	struct list_head  next_trig;
 
 	const struct attribute_group **groups;
+	struct ledtrig_device *trig_dev;
 };
 
 /*
-- 
2.7.4

