Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A254006FF
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351041AbhICUrO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351043AbhICUrN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:13 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB559C0617AF;
        Fri,  3 Sep 2021 13:46:07 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id y16-20020a4ad6500000b0290258a7ff4058so55230oos.10;
        Fri, 03 Sep 2021 13:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YznRyopAqCuw4dasqam73G99JKILnKKYOqYTDQveRLc=;
        b=ApHkhu7d9UY4CRXhqDNsI5BKnDvxO49SCBiD98MAuaQJ68Wx3Dhg0ufBg93iLQWkcM
         bBGDlngKX8HptIZpLV+iRWHyeHSJz5wyJ2k8IHu83h7P5v8QZ5xQAZ6Ax9YfRy2F796y
         Ubgqi13+gnXVa8cOpVtTIRZy7Vm+q2EaH9Kv5Tdj/MXYYBmYkAXO1ke6XRPpGr9Qfsbh
         g2t/nc6RJ6SbdnF2FXwhVTnBq1EvZ+041ZrM6i5SfOPpLkeMhVBsODqlizubSSAm2d+b
         c0aNf5/lDYhj4tQrT+S0lhe0WLy5cC8ELJin43bxEM2lnhoCNZdjnn23hOVakLcJER3Z
         Z98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YznRyopAqCuw4dasqam73G99JKILnKKYOqYTDQveRLc=;
        b=h6XXDVx2XhA/wsnF5ngN2ZMYiqZ+FwAddZSTJyr9aSjokyrByOdKjgk/faJyODM0h+
         yhd9qAX7zq2yklw7sJ9kBGLvjD13vsscZm16Iek3S2/POnGsiL0ank3gCanLNDVDWraM
         7T8Nmp4ZyrBCTDjARyffxaH+Rd/T16v10O9qICVRag4uU5YCqXX2jx5sxoX5FOe4nMKV
         2+V7tKPB3BJqpoW5kzVAu7DPWm0MqZqVt63fjh4ZjIo8EjZGtSY1tBNOrAHsHBG0SdLd
         0ehNi+ICo9T3PdjI4AwvXHLjw/ayFGJrQoVrXCpks2p4pmXpqc275q0Tk3sIdZSW3yLp
         I3pg==
X-Gm-Message-State: AOAM530seks3ESBxO0m3vyGzUELkHuujcwW4l9fR0iq4NISXD+pdDXwP
        45U4wVMU4PqMDmC1qWjFJS4=
X-Google-Smtp-Source: ABdhPJyjs48bGxrVmYa8aihJ83miReXzopPurZYGQcVdQv2a4B/Y6McdisFYko2MTXXe2b6fwR9tfg==
X-Received: by 2002:a4a:a2c5:: with SMTP id r5mr4591113ool.66.1630701967050;
        Fri, 03 Sep 2021 13:46:07 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:06 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 12/18] ledtrig-blkdev: Add function to remove LED/device association
Date:   Fri,  3 Sep 2021 15:45:42 -0500
Message-Id: <20210903204548.2745354-13-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove symlinks in /sys/class/leds/<led>/block_devices and
/sys/block/<disk>/blkdev_leds

Decrement reference count on /sys/block/<disk>/blkdev_leds
directory (removes directory when empty)

Cancel delayed work if no device is associated with any LED

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 56 +++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index e3169d1f0e38..7edbc48050a5 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -409,3 +409,59 @@ static int blkdev_disk_add(struct ledtrig_blkdev_led *const led,
 exit_return:
 	return ret;
 }
+
+
+/*
+ *
+ *	Disassociate a block device from an LED
+ *
+ */
+
+static void blkdev_disk_del_locked(struct ledtrig_blkdev_led *const led,
+				   struct ledtrig_blkdev_link *const link,
+				   struct ledtrig_blkdev_disk *const disk)
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
+static void blkdev_disk_delete(struct ledtrig_blkdev_led *const led,
+			       const char *const disk_name,
+			       const size_t name_len)
+{
+	struct ledtrig_blkdev_link *link;
+
+	mutex_lock(&ledtrig_blkdev_mutex);
+
+	hlist_for_each_entry(link, &led->disks, led_disks_node) {
+
+		if (ledtrig_blkdev_streq(link->disk->gd->disk_name,
+						disk_name, name_len)) {
+			blkdev_disk_del_locked(led, link, link->disk);
+			goto exit_unlock;
+		}
+	}
+
+	pr_info("blkdev LED: %.*s not associated with LED %s\n",
+		(int)name_len, disk_name, led->led_dev->name);
+
+exit_unlock:
+	mutex_unlock(&ledtrig_blkdev_mutex);
+}
-- 
2.31.1

