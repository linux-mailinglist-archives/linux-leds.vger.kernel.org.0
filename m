Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80F6400701
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351044AbhICUrO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351022AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5080C0617AE;
        Fri,  3 Sep 2021 13:46:06 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso586676otu.0;
        Fri, 03 Sep 2021 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4JcwdMYWeD2CXgYcF0/13R+BnPwvx/9AVWBS8bvHNaQ=;
        b=PpgxQSF94zkf0qRn6Mje6Huh9Yn9925qauW8zOcEJstvxh54PCCy7AmCCE5szZsg1p
         VvIb3cm8veewaZyp0Nq4rvT0aZsR3nqfMIG2Y06UhtO/XVf1uVNhjP0wXF1apbrp+n70
         2cg8P4bCdgh99UYlEy4qXUAcnFGzqNaoVaEDVx3T2QCfQi9++fI6a4RNpJ5ua/rzC1f7
         UH23J9B99uo7/0UQkN37IwhUY3SNC2oewJzWR5HDaYsyaI2HP/eJ86/7a/tcGP0OfUMy
         PoBFV+i1zUtkhV/58xpub8yluKeEAThpjfNvc4MjFypZGaS+NhZGgtmdKUXgJQppQX6j
         Y1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4JcwdMYWeD2CXgYcF0/13R+BnPwvx/9AVWBS8bvHNaQ=;
        b=sMWn6DIpUghZ2iyDAVUurD57EYqr969fOAgGq2bZXd5ABScQHYZb2oDjtR+G0ABkNf
         evMXT0V6slA21sNYm9gtoKtkGTHMSDo1Dpo/Aio4srxgTX6/XpmV/KF7hnPh5/ObrqFi
         fckr8KfGnpJonymGmpJzP8lP8zuxbTQfCeTxBL/qTXbnX212Fi0oiLFFWMWEeNncWhIH
         B45YlIXfhbTzfYHG6YFuK7kG/+K0gJIVS1SnjJ8DIEtVMwz/ZVTRvXFmqMnR9HASN68V
         rMaFHqLvJ9Q/dvq7tV1NMLveDLbl3H2AlRiCnLjRyUPWDKwtVZ5YZLwin1pD3emgo4+Q
         oWVA==
X-Gm-Message-State: AOAM533qxbDjyKgL7aKfqo71SYYbugfYcSgeR9TtYtt7GkcDOC96AiB3
        BIZeyOXzF1x6BBV6fW8s/j3dJXEhpjhUAA==
X-Google-Smtp-Source: ABdhPJwh6nMceHqJGvwdRnRQLbBsaWAgwmCDT9u6C6ZgExvmV0SGx7O8uwXtP00DUt8DkgcRRKAtNA==
X-Received: by 2002:a05:6830:1f0a:: with SMTP id u10mr822351otg.53.1630701966339;
        Fri, 03 Sep 2021 13:46:06 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:05 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 11/18] ledtrig-blkdev: Add function to associate a device with an LED
Date:   Fri,  3 Sep 2021 15:45:41 -0500
Message-Id: <20210903204548.2745354-12-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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
 drivers/leds/trigger/ledtrig-blkdev.c | 157 ++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index bbf71ff18057..e3169d1f0e38 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -252,3 +252,160 @@ static int blkdev_activate(struct led_classdev *const led_dev)
 exit_return:
 	return ret;
 }
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
+	dir = kobject_create_and_add("blkdev_leds", &disk_to_dev(gd)->kobj);
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
+	struct gendisk *gd;
+	int ret;
+
+	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
+	if (ret != 0)
+		goto exit_return;
+
+	gd = ledtrig_blkdev_get_disk(disk_name, name_len);
+	if (gd == NULL) {
+		pr_info("blkdev LED: no such block device %.*s\n",
+			(int)name_len, disk_name);
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	if (blkdev_already_linked(led, gd)) {
+		ret = -EEXIST;
+		goto exit_put_disk;
+	}
+
+	ret = blkdev_disk_add_locked(led, gd);
+
+exit_put_disk:
+	if (ret != 0)
+		put_disk(gd);
+exit_unlock:
+	mutex_unlock(&ledtrig_blkdev_mutex);
+exit_return:
+	return ret;
+}
-- 
2.31.1

