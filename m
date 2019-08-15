Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 761168F16E
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2019 19:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbfHORAm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Aug 2019 13:00:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34977 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbfHORAm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Aug 2019 13:00:42 -0400
Received: by mail-pg1-f195.google.com with SMTP id n4so1560730pgv.2;
        Thu, 15 Aug 2019 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oqX/UKin0oQTLnMVUUl0S4gSZge29Cs03GMZoH5D3LE=;
        b=dR08MjwtGtpznDDXZ2Expju7lK8AHauc1wGGw2dymY5yb9L0m1C+CGHlb1W3dFUcqO
         TOvfpcX3SOIKN5wyJl2MuyxZEPZqu0kaXsyMRoQ9lD+s94U5O8xq+t6PG92k27WpQI1z
         T5QMOmr0AR8OyLE8wSBR48gEtPu3Cz+r1Sbt5yZn0+NHHSsUzCT61B4b0fRGgZmq5Prm
         9zSWmIeyiXBKu45Mt8xhzawbfzWBLL8XxAEXDYmmZc02T4mHPQcNUiZoYOdqypVZUXZf
         rNfbGKlLfky8DeqnNfImAaFV6nxYnZSe95wSGbZK4PxsE7n57MhtVw9rnV2PKcASk21X
         L9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oqX/UKin0oQTLnMVUUl0S4gSZge29Cs03GMZoH5D3LE=;
        b=uUnJTNOUS0rfGqeiyBuz2AVc/JKpCSoS18NIKnmTzrL/SQynP2cf/FRsyjlyWkC5Of
         UtRP7FTrIN7sqi2TreWmhm4WR3jeHoRmgZxSPuWPoAfSzxbMJ6A5M19ZKskJ0bLJCPcY
         5cUpqnraF35HSUC63EsGSwv6BXE0wGkoUshYsO74KIp419PCZVwr/Uxbxui1fX3mitdu
         CnHI+Ovy0V7AQqU4c9S4xWmpnzYqgTOv8QaWuRQaPBY2qdc6frfybat5iK1bUlnwxAvY
         J4v2eulWNRUJyy3xavdoaQOX8ngxpqciS3qTpV/LVfCN/G3g+Q9AjwFDgkHsRMJFZMm8
         igBg==
X-Gm-Message-State: APjAAAVfAi7N2rYMqY48M5sPe50KPiqCKNREV+LgaTNlp9KgaLVvU9dj
        jXaGdoOz6Nc4k8xjgK2fthkYjMHGnhY=
X-Google-Smtp-Source: APXvYqxavwfOIRXB4UmKThL9Gs1o9ti0I/aFI9gvYeNTorrYJu2bOEZCpiIPbbAPX3532fR6oKcbeg==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr6335375pfa.95.1565888440835;
        Thu, 15 Aug 2019 10:00:40 -0700 (PDT)
Received: from mita-MS-7A45.lan ([240f:34:212d:1:12:b19f:559d:7305])
        by smtp.gmail.com with ESMTPSA id b30sm3943942pfr.117.2019.08.15.10.00.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 10:00:40 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Subject: [PATCH v4 4/5] block: introduce LED block device activity trigger
Date:   Fri, 16 Aug 2019 01:59:58 +0900
Message-Id: <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This allows LEDs to be controlled by block device activity.

We already have ledtrig-disk (LED disk activity trigger), but the lower
level disk drivers need to utilize ledtrig_disk_activity() to make the
LED blink.

The LED block device trigger doesn't require the lower level drivers to
have any instrumentation. The activity is collected by polling the disk
stats.

Example:

echo block-nvme0n1 > /sys/class/leds/diy/trigger

The LED block device activity trigger periodically polls the disk stats
to collect the activity.  However, it is pointless to poll while the
block device is in quiescent state.  So there is an optional interface to
stop and restart polling disk stats for the lower-level block drivers.

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Hannes Reinecke <hare@suse.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* v4
- Squash patch 'add interface to stop and restart polling disk stats' into
  the ledtrig-blk introduction patch
- Rename 'led' to 'led_trig' in struct ledtrig_blk

 .../ABI/testing/sysfs-class-led-trigger-blk        |  37 +++
 block/genhd.c                                      |   2 +
 drivers/leds/trigger/Kconfig                       |   9 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-blk.c                 | 259 +++++++++++++++++++++
 include/linux/genhd.h                              |   3 +
 include/linux/leds.h                               |  38 +++
 7 files changed, 349 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blk
 create mode 100644 drivers/leds/trigger/ledtrig-blk.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-blk b/Documentation/ABI/testing/sysfs-class-led-trigger-blk
new file mode 100644
index 0000000..73472c3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-blk
@@ -0,0 +1,37 @@
+What:		/sys/class/leds/<led>/interval
+Date:		Aug 2019
+KernelVersion:	5.4
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Specifies the duration of the LED blink in milliseconds.
+		Defaults to 50 ms.
+
+What:		/sys/class/leds/<led>/read
+Date:		Aug 2019
+KernelVersion:	5.4
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Signal data read on the block device.
+		If set to 0, the LED will not blink on data read.
+		If set to 1 (default), the LED will blink for the milliseconds
+		specified in interval to signal data read.
+
+What:		/sys/class/leds/<led>/write
+Date:		Aug 2019
+KernelVersion:	5.4
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Signal data written on the block device.
+		If set to 0, the LED will not blink on data written.
+		If set to 1 (default), the LED will blink for the milliseconds
+		specified in interval to signal data written.
+
+What:		/sys/class/leds/<led>/discard
+Date:		Aug 2019
+KernelVersion:	5.4
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Signal data discarded on the block device.
+		If set to 0, the LED will not blink on data discarded.
+		If set to 1 (default), the LED will blink for the milliseconds
+		specified in interval to signal data discarded.
diff --git a/block/genhd.c b/block/genhd.c
index 54f1f0d3..1c68861 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -745,6 +745,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 
 	disk_add_events(disk);
 	blk_integrity_add(disk);
+	ledtrig_blk_register(disk);
 }
 
 void device_add_disk(struct device *parent, struct gendisk *disk,
@@ -766,6 +767,7 @@ void del_gendisk(struct gendisk *disk)
 	struct disk_part_iter piter;
 	struct hd_struct *part;
 
+	ledtrig_blk_unregister(disk);
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index ce9429c..e399a11 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -144,4 +144,13 @@ config LEDS_TRIGGER_AUDIO
 	  the audio mute and mic-mute changes.
 	  If unsure, say N
 
+config LEDS_TRIGGER_BLOCK
+	bool "LED Block device Trigger"
+	depends on BLOCK
+	help
+	  This allows LEDs to be controlled by block device activity.
+	  This trigger doesn't require the lower level drivers to have any
+	  instrumentation. The activity is collected by polling the disk stats.
+	  If unsure, say Y.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 733a83e..60200eb 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
 obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
 obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
+obj-$(CONFIG_LEDS_TRIGGER_BLOCK)	+= ledtrig-blk.o
diff --git a/drivers/leds/trigger/ledtrig-blk.c b/drivers/leds/trigger/ledtrig-blk.c
new file mode 100644
index 0000000..de05e92
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-blk.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+// LED Kernel Blockdev Trigger
+// Derived from ledtrig-netdev.c
+
+#include <linux/atomic.h>
+#include <linux/genhd.h>
+#include <linux/leds.h>
+#include <linux/workqueue.h>
+#include "../leds.h"
+
+enum ledtrig_blk_attr {
+	LEDTRIG_BLK_READ,
+	LEDTRIG_BLK_WRITE,
+	LEDTRIG_BLK_DISCARD
+};
+
+struct ledtrig_blk_data {
+	struct delayed_work work;
+	struct led_classdev *led_cdev;
+
+	atomic_t interval;
+	u64 last_activity;
+
+	unsigned long mode;
+};
+
+static ssize_t ledtrig_blk_attr_show(struct device *dev, char *buf,
+				     enum ledtrig_blk_attr attr)
+{
+	struct ledtrig_blk_data *trig_data = led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", test_bit(attr, &trig_data->mode));
+}
+
+static ssize_t ledtrig_blk_attr_store(struct device *dev, const char *buf,
+				      size_t size, enum ledtrig_blk_attr attr)
+{
+	struct ledtrig_blk_data *trig_data = led_trigger_get_drvdata(dev);
+	unsigned long state;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	if (state)
+		set_bit(attr, &trig_data->mode);
+	else
+		clear_bit(attr, &trig_data->mode);
+
+	return size;
+}
+
+static ssize_t read_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return ledtrig_blk_attr_show(dev, buf, LEDTRIG_BLK_READ);
+}
+static ssize_t read_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t size)
+{
+	return ledtrig_blk_attr_store(dev, buf, size, LEDTRIG_BLK_READ);
+}
+static DEVICE_ATTR_RW(read);
+
+static ssize_t write_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	return ledtrig_blk_attr_show(dev, buf, LEDTRIG_BLK_WRITE);
+}
+static ssize_t write_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	return ledtrig_blk_attr_store(dev, buf, size, LEDTRIG_BLK_WRITE);
+}
+static DEVICE_ATTR_RW(write);
+
+static ssize_t discard_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	return ledtrig_blk_attr_show(dev, buf, LEDTRIG_BLK_DISCARD);
+}
+static ssize_t discard_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	return ledtrig_blk_attr_store(dev, buf, size, LEDTRIG_BLK_DISCARD);
+}
+static DEVICE_ATTR_RW(discard);
+
+static ssize_t interval_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct ledtrig_blk_data *trig_data = led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n",
+		       jiffies_to_msecs(atomic_read(&trig_data->interval)));
+}
+static ssize_t interval_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct ledtrig_blk_data *trig_data = led_trigger_get_drvdata(dev);
+	unsigned long value;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &value);
+	if (ret)
+		return ret;
+
+	/* impose some basic bounds on the timer interval */
+	if (value >= 5 && value <= 10000) {
+		cancel_delayed_work_sync(&trig_data->work);
+		atomic_set(&trig_data->interval, msecs_to_jiffies(value));
+		schedule_delayed_work(&trig_data->work,
+				      atomic_read(&trig_data->interval) * 2);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(interval);
+
+static struct attribute *ledtrig_blk_attrs[] = {
+	&dev_attr_read.attr,
+	&dev_attr_write.attr,
+	&dev_attr_discard.attr,
+	&dev_attr_interval.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ledtrig_blk);
+
+static void ledtrig_blk_work(struct work_struct *work)
+{
+	struct ledtrig_blk_data *trig_data =
+		container_of(work, struct ledtrig_blk_data, work.work);
+	struct gendisk *disk = container_of(trig_data->led_cdev->trigger,
+					    struct gendisk, led_trig.trig);
+	u64 activity = 0;
+
+	if (test_bit(LEDTRIG_BLK_READ, &trig_data->mode))
+		activity += part_stat_read(&disk->part0, ios[STAT_READ]);
+	if (test_bit(LEDTRIG_BLK_WRITE, &trig_data->mode))
+		activity += part_stat_read(&disk->part0, ios[STAT_WRITE]);
+	if (test_bit(LEDTRIG_BLK_DISCARD, &trig_data->mode))
+		activity += part_stat_read(&disk->part0, ios[STAT_DISCARD]);
+
+	if (trig_data->last_activity != activity) {
+		unsigned long interval;
+
+		led_stop_software_blink(trig_data->led_cdev);
+		interval = jiffies_to_msecs(atomic_read(&trig_data->interval));
+		led_blink_set_oneshot(trig_data->led_cdev, &interval, &interval,
+				      0);
+
+		trig_data->last_activity = activity;
+	}
+
+	if (atomic_read(&disk->led_trig.enable_count))
+		schedule_delayed_work(&trig_data->work,
+				      atomic_read(&trig_data->interval) * 2);
+}
+
+static int ledtrig_blk_activate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_blk_data *trig_data;
+
+	trig_data = kzalloc(sizeof(*trig_data), GFP_KERNEL);
+	if (!trig_data)
+		return -ENOMEM;
+
+	trig_data->mode = BIT(LEDTRIG_BLK_READ) | BIT(LEDTRIG_BLK_WRITE) |
+			  BIT(LEDTRIG_BLK_DISCARD);
+
+	atomic_set(&trig_data->interval, msecs_to_jiffies(50));
+	trig_data->last_activity = 0;
+	trig_data->led_cdev = led_cdev;
+
+	INIT_DELAYED_WORK(&trig_data->work, ledtrig_blk_work);
+
+	led_set_trigger_data(led_cdev, trig_data);
+
+	schedule_delayed_work(&trig_data->work,
+			      atomic_read(&trig_data->interval) * 2);
+
+	return 0;
+}
+
+static void ledtrig_blk_deactivate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_blk_data *trig_data = led_get_trigger_data(led_cdev);
+
+	cancel_delayed_work_sync(&trig_data->work);
+	kfree(trig_data);
+}
+
+void ledtrig_blk_disable(struct gendisk *disk)
+{
+	if (disk)
+		atomic_dec(&disk->led_trig.enable_count);
+}
+EXPORT_SYMBOL_GPL(ledtrig_blk_disable);
+
+void ledtrig_blk_enable(struct gendisk *disk)
+{
+	struct led_classdev *led_cdev;
+
+	if (!disk)
+		return;
+
+	atomic_inc(&disk->led_trig.enable_count);
+
+	read_lock(&disk->led_trig.trig.leddev_list_lock);
+
+	list_for_each_entry(led_cdev, &disk->led_trig.trig.led_cdevs,
+			    trig_list) {
+		struct ledtrig_blk_data *trig_data =
+			led_get_trigger_data(led_cdev);
+
+		schedule_delayed_work(&trig_data->work,
+				      atomic_read(&trig_data->interval) * 2);
+	}
+
+	read_unlock(&disk->led_trig.trig.leddev_list_lock);
+}
+EXPORT_SYMBOL_GPL(ledtrig_blk_enable);
+
+int ledtrig_blk_register(struct gendisk *disk)
+{
+	int ret;
+
+	disk->led_trig.trig.name = kasprintf(GFP_KERNEL, "block-%s",
+					disk->disk_name);
+	if (!disk->led_trig.trig.name)
+		return -ENOMEM;
+
+	disk->led_trig.trig.activate = ledtrig_blk_activate;
+	disk->led_trig.trig.deactivate = ledtrig_blk_deactivate;
+	disk->led_trig.trig.groups = ledtrig_blk_groups;
+
+	atomic_set(&disk->led_trig.enable_count, 1);
+
+	ret = led_trigger_register(&disk->led_trig.trig);
+	if (ret) {
+		kfree(disk->led_trig.trig.name);
+		disk->led_trig.trig.name = NULL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ledtrig_blk_register);
+
+void ledtrig_blk_unregister(struct gendisk *disk)
+{
+	if (!disk->led_trig.trig.name)
+		return;
+
+	led_trigger_unregister(&disk->led_trig.trig);
+	kfree(disk->led_trig.trig.name);
+	disk->led_trig.trig.name = NULL;
+}
+EXPORT_SYMBOL_GPL(ledtrig_blk_unregister);
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 8b5330d..d4fdb21 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -17,6 +17,7 @@
 #include <linux/percpu-refcount.h>
 #include <linux/uuid.h>
 #include <linux/blk_types.h>
+#include <linux/leds.h>
 #include <asm/local.h>
 
 #ifdef CONFIG_BLOCK
@@ -219,6 +220,8 @@ struct gendisk {
 	int node_id;
 	struct badblocks *bb;
 	struct lockdep_map lockdep_map;
+
+	struct ledtrig_blk led_trig;
 };
 
 static inline struct gendisk *part_to_disk(struct hd_struct *part)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf57..fd2eb7c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -517,4 +517,42 @@ static inline void ledtrig_audio_set(enum led_audio type,
 }
 #endif
 
+struct gendisk;
+
+#ifdef CONFIG_LEDS_TRIGGER_BLOCK
+
+struct ledtrig_blk {
+	struct led_trigger trig;
+	atomic_t enable_count;
+};
+
+void ledtrig_blk_enable(struct gendisk *disk);
+void ledtrig_blk_disable(struct gendisk *disk);
+int ledtrig_blk_register(struct gendisk *disk);
+void ledtrig_blk_unregister(struct gendisk *disk);
+
+#else
+
+struct ledtrig_blk {
+};
+
+static inline void ledtrig_blk_enable(struct gendisk *disk)
+{
+}
+
+static inline void ledtrig_blk_disable(struct gendisk *disk)
+{
+}
+
+static inline int ledtrig_blk_register(struct gendisk *disk)
+{
+	return 0;
+}
+
+static inline void ledtrig_blk_unregister(struct gendisk *disk)
+{
+}
+
+#endif /* CONFIG_LEDS_TRIGGER_BLOCK */
+
 #endif		/* __LINUX_LEDS_H_INCLUDED */
-- 
2.7.4

