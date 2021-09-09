Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5B2405F72
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346083AbhIIW0q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345643AbhIIW0i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:38 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B8AC061574;
        Thu,  9 Sep 2021 15:25:28 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so4549633otg.11;
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=COFijmkBIWZf2LFD9bYNkKbzuh96VAJr7qSkbGV27Zc=;
        b=dCwz/OsGRMMfsXzab8kkv8acI7tYG3eF3XFL0zEO7W+Rf+wiIMdnQlVgzN/1ZRilps
         JTcHsYdC0reLhCgpGXVB5Y8YUvXWKGIBwm1ciNWMX+2ay2sLbvD37DfjI+Z8ytpbdlkS
         AnsTEs4lzf5kpOVlvnFMYUEmGPmKJAlIQw4MPQHQqw7dgk5VXZlFdnPw/HiLWguliJvS
         BrjmS2vTQKs6RERHjgfwnVPFm5tmKTJwqnEy0ymA/rPnDK52YZfjxWfPSu9d9avONgjy
         sGBBruIkXiivuDqPafPnCJ3mBJ/HBPGhFl88vUu7MJjCBW4YzjF0qW5krVnWD6YLYOj1
         beQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COFijmkBIWZf2LFD9bYNkKbzuh96VAJr7qSkbGV27Zc=;
        b=SVyRpLwXz6R7U3C0/dffG2pWIrmF7pWiFr/dC8KV5V6jqnj5stSk1a+a9Vdvo8MmH1
         fYyszFV8lodlPKiFOzPYl2ezNnKf1dnyPoA7soEIK01n3gEYXnqHkugQFlvdzf9OC+cU
         LmmvIQ0K62FWijYWDqlJKAwMbRtAbfF03k6mnU1XHBo8jK0exvv8Uv2W+2oqxLcavcsu
         ivbHBTwITyr3kbjR1p66c6uVmBQkUo87rnQnMiuo8Fm9gX87Y2PKb/dcJA/hUfJX9dFX
         AaKMJ5HWYvaGySm2jU2Vh6oe+62FUaqRXcCr+Xkv+hXyH7f0CAKe8yWPkd0xTcNeZTrd
         Imhg==
X-Gm-Message-State: AOAM532v2MiDwCjAwUU41SHGe3Y18UnM6W6X0A6oZfENwTS3NJqFX/rf
        jzdiSWzOJH29SBVFi2j833s=
X-Google-Smtp-Source: ABdhPJz2vBOzC/+pORZicjpgHAegun4f/ToWb78SnRYCh3qpiJTSmYNdcAxABsNexxNqVcXY5Q9ahA==
X-Received: by 2002:a05:6830:2108:: with SMTP id i8mr1957526otc.336.1631226328166;
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:27 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 11/15] leds: trigger: blkdev: Enable linking block devices to LEDs
Date:   Thu,  9 Sep 2021 17:25:09 -0500
Message-Id: <20210909222513.2184795-12-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add /sys/class/leds/<led>/link_device sysfs attribute

If this is the first LED associated with the device, create the
/sys/block/<disk>/blkdev_leds directory.  Otherwise, increment its
reference count.

Create symlinks in /sys/class/leds/<led>/block_devices and
/sys/block/<disk>/blkdev_leds

If this the first device associated with *any* LED, schedule delayed work
to periodically check associated devices and blink LEDs

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 160 ++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 6f78a9515976..26509837f037 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -71,6 +71,9 @@ static unsigned int ledtrig_blkdev_interval;
 static void blkdev_process(struct work_struct *const work);
 static DECLARE_DELAYED_WORK(ledtrig_blkdev_work, blkdev_process);
 
+/* Total number of device-to-LED associations */
+static unsigned int ledtrig_blkdev_count;
+
 
 /*
  *
@@ -220,6 +223,162 @@ static int blkdev_activate(struct led_classdev *const led_dev)
 }
 
 
+/*
+ *
+ *	link_device sysfs attribute - assocate a block device with this LED
+ *
+ */
+
+/* Gets or allocs & initializes the blkdev disk for a gendisk */
+static int blkdev_get_disk(struct gendisk *const gd)
+{
+	struct ledtrig_blkdev_disk *disk;
+	struct kobject *dir;
+
+	if (gd->ledtrig != NULL) {
+		kobject_get(gd->ledtrig->dir);
+		return 0;
+	}
+
+	disk = kmalloc(sizeof(*disk), GFP_KERNEL);
+	if (disk == NULL)
+		return -ENOMEM;
+
+	dir = kobject_create_and_add("linked_leds", &disk_to_dev(gd)->kobj);
+	if (dir == NULL) {
+		kfree(disk);
+		return -ENOMEM;
+	}
+
+	INIT_HLIST_HEAD(&disk->leds);
+	disk->gd = gd;
+	disk->dir = dir;
+	disk->read_ios = 0;
+	disk->write_ios = 0;
+
+	gd->ledtrig = disk;
+
+	return 0;
+}
+
+static void blkdev_put_disk(struct ledtrig_blkdev_disk *const disk)
+{
+	kobject_put(disk->dir);
+
+	if (hlist_empty(&disk->leds)) {
+		disk->gd->ledtrig = NULL;
+		kfree(disk);
+	}
+}
+
+static int blkdev_disk_link_locked(struct ledtrig_blkdev_led *const led,
+				   struct gendisk *const gd)
+{
+	struct ledtrig_blkdev_link *link;
+	struct ledtrig_blkdev_disk *disk;
+	unsigned long delay;
+	int ret;
+
+	link = kmalloc(sizeof(*link), GFP_KERNEL);
+	if (link == NULL) {
+		ret = -ENOMEM;
+		goto error_return;
+	}
+
+	ret = blkdev_get_disk(gd);
+	if (ret != 0)
+		goto error_free_link;
+
+	disk = gd->ledtrig;
+
+	ret = sysfs_create_link(disk->dir, &led->led_dev->dev->kobj,
+				led->led_dev->name);
+	if (ret != 0)
+		goto error_put_disk;
+
+	ret = sysfs_create_link(led->dir, &disk_to_dev(gd)->kobj,
+				gd->disk_name);
+	if (ret != 0)
+		goto error_remove_link;
+
+	link->disk = disk;
+	link->led = led;
+	hlist_add_head(&link->led_disks_node, &led->disks);
+	hlist_add_head(&link->disk_leds_node, &disk->leds);
+
+	if (ledtrig_blkdev_count == 0) {
+		delay = READ_ONCE(ledtrig_blkdev_interval);
+		WARN_ON(!schedule_delayed_work(&ledtrig_blkdev_work, delay));
+	}
+
+	++ledtrig_blkdev_count;
+
+	return 0;
+
+error_remove_link:
+	sysfs_remove_link(disk->dir, led->led_dev->name);
+error_put_disk:
+	blkdev_put_disk(disk);
+error_free_link:
+	kfree(link);
+error_return:
+	return ret;
+}
+
+static bool blkdev_already_linked(const struct ledtrig_blkdev_led *const led,
+				  const struct gendisk *const gd)
+{
+	const struct ledtrig_blkdev_link *link;
+
+	if (gd->ledtrig == NULL)
+		return false;
+
+	hlist_for_each_entry(link, &gd->ledtrig->leds, disk_leds_node) {
+
+		if (link->led == led)
+			return true;
+	}
+
+	return false;
+}
+
+static ssize_t link_device_store(struct device *const dev,
+				 struct device_attribute *const attr,
+				 const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	struct gendisk *gd;
+	int ret;
+
+	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
+	if (ret != 0)
+		goto exit_return;
+
+	gd = ledtrig_blkdev_get_disk(buf);
+	if (gd == NULL) {
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	if (blkdev_already_linked(led, gd)) {
+		ret = -EEXIST;
+		goto exit_put_disk;
+	}
+
+	ret = blkdev_disk_link_locked(led, gd);
+
+exit_put_disk:
+	if (ret != 0)
+		put_disk(gd);
+exit_unlock:
+	mutex_unlock(&ledtrig_blkdev_mutex);
+exit_return:
+	return (ret == 0) ? count : ret;
+}
+
+static DEVICE_ATTR_WO(link_device);
+
+
 /*
  *
  *	Initialization - register the trigger
@@ -227,6 +386,7 @@ static int blkdev_activate(struct led_classdev *const led_dev)
  */
 
 static struct attribute *ledtrig_blkdev_attrs[] = {
+	&dev_attr_link_device.attr,
 	NULL
 };
 
-- 
2.31.1

