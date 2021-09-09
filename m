Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E37405F74
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346944AbhIIW0r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345809AbhIIW0j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:39 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2773CC061757;
        Thu,  9 Sep 2021 15:25:29 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id v2so83599oie.6;
        Thu, 09 Sep 2021 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OWBpnRYKTA9XJIeXV+fWpllaXIMTnG6vSbQ+mGIkUI=;
        b=HGByUuo1qHqOQrb1NgszLt4+QVNaVphP6cdYk/h801IRiTHoN9orv/Otax7ZVQgk8W
         lO4s35uKHKuJxcZArPR3GClB2NCp04O7ePunK611kL/5/xnTHNp/jb3pLmcvYyqy77OG
         fYOUmQGBInHqzQPGslSiMSNaT6GAgQxpVwMHr/rsr4a4aadhZQgiITAx+Vno8T5zCN3W
         SYsm9HKjsx8PiRjNB0p1VNmrFPxY3TiJTI0TWQE69U/DWZ+2+JoR8jzvVcneyDAnSbLp
         litFAffz37hBy0fVsdEI9rDyeZNuQXa/KJ8veibD0AuWIdhB9zPCvh+Tn84gk3g3a2Ns
         CKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OWBpnRYKTA9XJIeXV+fWpllaXIMTnG6vSbQ+mGIkUI=;
        b=7e4dKwM9GZ4qOfIXwsJe15Z/x1j/LHIX6l/z1CRX3rIXvaXT15H2HyM8opHDV3SuCK
         +nxiyYTKd0r1sYu2Ncd3Sdj9QPZqrqxWb6qGxZ7f15Qozz2EwIcWgAplNAZOem7XgPis
         xGzZP4lQZLoKxzsIjwrWkiV9w6vjQrySuU6vB7fe24FXc3W0MR9EAy6SLqgCvHTeTnRK
         XX/awHuj+dih8zkXl0KH4ZSoPtnakaJej87pfueBiaNb/PoNEvCVOwBWriZtzgmytPjP
         G+fHjmsZN6gA/GrnLxH1ijFcOUIITPcGmIfijmVyEyqJgNmiwT9RuC3y+YValZY+9Z1K
         R5Kg==
X-Gm-Message-State: AOAM533VaDvUP/1F4n8wwQ/DvLlrB1ERHNprRm1yndo2GMdvgN4+US6p
        pVIsfD2rMGQcPHs0wq2c6Bw=
X-Google-Smtp-Source: ABdhPJwmRXBiE1FNJvFgfv37fGM8QXPVVz1aiEBc0oYxsuY0sU1D6TITrzUV4htMIvtiQo9hZGtX+w==
X-Received: by 2002:a05:6808:657:: with SMTP id z23mr1835231oih.113.1631226328602;
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:28 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 12/15] leds: trigger: blkdev: Enable unlinking block devices from LEDs
Date:   Thu,  9 Sep 2021 17:25:10 -0500
Message-Id: <20210909222513.2184795-13-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add /sys/class/leds/<led>/unlink_device sysfs attribute

Remove symlinks in /sys/class/leds/<led>/block_devices and
/sys/block/<disk>/blkdev_leds

Decrement reference count on /sys/block/<disk>/blkdev_leds
directory (removes directory when empty)

Cancel delayed work if no devices are associated with *any* LEDs

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 26509837f037..fff67ebd28f2 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -379,6 +379,62 @@ static ssize_t link_device_store(struct device *const dev,
 static DEVICE_ATTR_WO(link_device);
 
 
+/*
+ *
+ *	unlink_device sysfs attribute - disassociate a device from this LED
+ *
+ */
+
+static void blkdev_disk_unlink_locked(struct ledtrig_blkdev_led *const led,
+				      struct ledtrig_blkdev_link *const link,
+				      struct ledtrig_blkdev_disk *const disk)
+{
+	--ledtrig_blkdev_count;
+
+	if (ledtrig_blkdev_count == 0)
+		WARN_ON(!cancel_delayed_work_sync(&ledtrig_blkdev_work));
+
+	sysfs_remove_link(led->dir, disk->gd->disk_name);
+	sysfs_remove_link(disk->dir, led->led_dev->name);
+	kobject_put(disk->dir);
+
+	hlist_del(&link->led_disks_node);
+	hlist_del(&link->disk_leds_node);
+	kfree(link);
+
+	if (hlist_empty(&disk->leds)) {
+		disk->gd->ledtrig = NULL;
+		kfree(disk);
+	}
+
+	put_disk(disk->gd);
+}
+
+static ssize_t unlink_device_store(struct device *const dev,
+				   struct device_attribute *const attr,
+				   const char *const buf, const size_t count)
+{
+	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
+	struct ledtrig_blkdev_link *link;
+
+	mutex_lock(&ledtrig_blkdev_mutex);
+
+	hlist_for_each_entry(link, &led->disks, led_disks_node) {
+
+		if (sysfs_streq(link->disk->gd->disk_name, buf)) {
+			blkdev_disk_unlink_locked(led, link, link->disk);
+			break;
+		}
+	}
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
+
+	return count;
+}
+
+static DEVICE_ATTR_WO(unlink_device);
+
+
 /*
  *
  *	Initialization - register the trigger
@@ -387,6 +443,7 @@ static DEVICE_ATTR_WO(link_device);
 
 static struct attribute *ledtrig_blkdev_attrs[] = {
 	&dev_attr_link_device.attr,
+	&dev_attr_unlink_device.attr,
 	NULL
 };
 
-- 
2.31.1

