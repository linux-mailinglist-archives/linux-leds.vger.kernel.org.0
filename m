Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E4E3F10B2
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236124AbhHSCwG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236143AbhHSCvz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:55 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B69C06129E;
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso6795537oth.12;
        Wed, 18 Aug 2021 19:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CHR8GEyHKCZ6Ukss9VRJCG5gxZXrolsRZXMVOL6995E=;
        b=a+E/hwq57irPKDH3Yx0253HMNP6ebrgBa3XT5+xMpZqo2G6bKFVh8HsaPRs3OqSaPE
         A5CY6TXhP/4ChaZuTbVk18v9B3XvC/kNBGp1/CWfQMpw4yGIQoX/QO/UifLarYqeRKTp
         FW8um0kWWK7/Jd2+fCIWvYNIY/5NbTzBwsvyYHHd2g66ey8phNLuC0D7QDKaSwkYa/ZU
         bDVaoic0k6lkTIqEomRQglTir16F9fzNpfBuCG7j3YpC0VSnPI4BEhd/qPRU+2FdpYnI
         qTvtDaTIlzWAKaYayzNsah7H716cWM8spf/8L3iSMEC4EtDvpCqvVnIcXIWi5keK3ZhN
         JL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CHR8GEyHKCZ6Ukss9VRJCG5gxZXrolsRZXMVOL6995E=;
        b=XK7Y0av1dZAeB3xjcj+R/rqFmASuoTsSzStMqANAjmICBfOOEY9rXlxiUXOw2mb7Yz
         a3HfH2bMDuvFdb3n88D+q0Eosh1LUXs8ucC6KBWytb/QDyJY05AjBJVIKOMDGKxDgmyQ
         ZXmVntsf0h23xHp8AgHK6zMAsWZ4qFNlLc06DZc1Y+J4bpyrLMqeRmYdZ7pgO3p4Uu1+
         5vWnLFdYclFZfekNyRnPdZHitB9tMhzspEPJ3LCqSlLk7wtrizyHKUfRZ3WPwHxm9Q/2
         n2cFJ32dkB+6l+fdNYIqPuhxfqsogwRtDqvySARZ3c4ABzDDY4wmPuDPyzvLNL42x5Bw
         +cBg==
X-Gm-Message-State: AOAM531Cu6UN2TnGc4kefY+J21ArO4bXsflg9d2hR177YU52cQqm/BAa
        nni3CMhRePVJDHvnoNHB/ahfj2IF7XItjFsR
X-Google-Smtp-Source: ABdhPJwYn0zhky0T0oFkOw81AF80BaiHQyx4j85uT/pQJYNmeMUXQeqiBjX8nbS0H3WwNh8cwZOD6w==
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr7709660otf.144.1629341472243;
        Wed, 18 Aug 2021 19:51:12 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:11 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 11/18] ledtrig-blkdev: Add function to associate a device with an LED
Date:   Wed, 18 Aug 2021 21:50:46 -0500
Message-Id: <20210819025053.222710-12-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If this is the first LED associated with the device, create the
/sys/block/<disk>/blkdev_leds directory.  Otherwise, increment its
reference count.

Create symlinks in /sys/class/leds/<led>/block_devices and
/sys/block/<disk>/blkdev_leds

If this the first device associated with any LED, schedule delayed work
to periodically check associated devices and blink LEDs

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 168 ++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 2072cc904616..a1646752b9a0 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -312,3 +312,171 @@ void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
 	mutex_unlock(&ledtrig_blkdev_mutex);
 }
 EXPORT_SYMBOL_GPL(ledtrig_blkdev_disk_cleanup);
+
+
+/*
+ *
+ *	Associate a block device with an LED
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
+	dir = blkdev_mkdir("blkdev_leds", &disk_to_dev(gd)->kobj);
+	if (IS_ERR(dir)) {
+		kfree(disk);
+		return PTR_ERR(dir);
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
+static int blkdev_disk_add_locked(struct ledtrig_blkdev_led *const led,
+				  struct gendisk *const gd)
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
+		if (link->led == led) {
+			pr_info("blkdev LED: %s already associated with %s\n",
+				gd->disk_name, led->led_dev->name);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int blkdev_disk_add(struct ledtrig_blkdev_led *const led,
+			   const char *const disk_name, const size_t name_len)
+{
+	static char name[DISK_NAME_LEN];	/* only used w/ mutex locked */
+	struct gendisk *gd;
+	int ret;
+
+	if (name_len >= DISK_NAME_LEN) {
+		pr_info("blkdev LED: invalid device name %.*s\n",
+			(int)name_len, disk_name);
+		ret = -EINVAL;
+		goto exit_return;
+	}
+
+	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
+	if (ret != 0)
+		goto exit_return;
+
+	memcpy(name, disk_name, name_len);
+	name[name_len] = 0;
+	gd = get_disk_by_name(name);	/* increments disk's refcount */
+
+	if (gd == NULL) {
+		pr_info("blkdev LED: no such block device %.*s\n",
+			(int)name_len, disk_name);
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	if (blkdev_already_linked(led, gd)) {
+		ret = -EEXIST;
+		goto exit_put_dev;
+	}
+
+	ret = blkdev_disk_add_locked(led, gd);
+
+exit_put_dev:
+	if (ret != 0)
+		put_device(disk_to_dev(gd));
+exit_unlock:
+	mutex_unlock(&ledtrig_blkdev_mutex);
+exit_return:
+	return ret;
+}
-- 
2.31.1

