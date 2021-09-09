Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7B7405F82
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348828AbhIIW07 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346823AbhIIW0p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:45 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C0CC061764;
        Thu,  9 Sep 2021 15:25:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id s20so101082oiw.3;
        Thu, 09 Sep 2021 15:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=57sH7rbHDCtndpXrjoz5ALAT6TMzRAfWHgGMDK00Q1w=;
        b=aTD33AfBhDhGMQGAKEWJQxoV7Q0RxdGwq0rs8Wb4nnoNuzoRNFJvHo9LaAVotzMr+s
         CfRVHTtFj0KhONHMLOc2+hTQXBvYqENmxJjNpMD5sEL6n8tc1C7DLmBwmXqAH5axuGa8
         UftJlAleHCa2DldkBhLNGN+o1L35bZXV/MG4i6BGoVhmZ2aTecnqxeI9tvxAWhSJcYVA
         WY4E/nnti/KsRAL0WnWlXxVYEbp6IzPx+f3YRWOB52BEqy8pY9UJ1f98wI0ONyb29f2y
         6r+rp28BtmUKIbsdQleaUh6FDn4bgFkVFxlk7F3Bmfc532VyeGQzd1/HilEkr4rgGgMU
         j6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=57sH7rbHDCtndpXrjoz5ALAT6TMzRAfWHgGMDK00Q1w=;
        b=SPiQaz+K0Evfdn6Ymxf84W38eSq1ixk67r6KfkPOU5OaKvAegZgnSmW5sMniPiFLiJ
         FXK+XBFsGavJYQ4mnX+PwY0swL+g4BwryS/WXwM7KDJs0R6/LU9HIz1KEQaJRjkSoAhj
         d4HCJA3znfboJBodu+i5k5OmOjnVPu6Sq01ueWeCoLux/FEjn/rDphk5lNwL81h+3Mmg
         N5qLndG5qiForc5AO5HpiJpBNLF5Ku5X5ogtfoBzCP9zojgeFaBURsCRi2KYajWlFut8
         4bQGwmhM4KsiRC5Z/n1eQ0LKYgUcjuzeYYs4A+v3tnwYJDPJhfZ0nujKHSbQZCNgzmub
         WMww==
X-Gm-Message-State: AOAM532DojwqRRI7YIKQIhDAIYi8hm5rMYR/eCft+jHTZ8gpMD4qJeE1
        lLH2rBagV/hniBua9kUJ+1IOAR+O2V0=
X-Google-Smtp-Source: ABdhPJzwsGy9wITJK6/Ou5BOUSLzjFkl9yxn495BEF84qNPHzcNg5IKrMTtgWf5WIIFu7EOFJ1EyUA==
X-Received: by 2002:a05:6808:10ce:: with SMTP id s14mr1824088ois.157.1631226332821;
        Thu, 09 Sep 2021 15:25:32 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:32 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 15/15] leds: trigger: blkdev: Add disk cleanup and init/exit functions
Date:   Thu,  9 Sep 2021 17:25:13 -0500
Message-Id: <20210909222513.2184795-16-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Disk cleanup function - blkdev_disk_cleanup():

  * Called when block device is being removed
  * Called via __ledtrig_blkdev_disk_cleanup function pointer from
    ledtrig_blkdev_disk_cleanup() in ledtrig-blkdev-core.c

Init function - blkdev_init():

  * Initialize interval (convert default value to jiffies)
  * Initialize __ledtrig_blkdev_disk_cleanup function pointer
  * Register the block device LED trigger

Exit function - blkdev_exit():

  * Unregister the LED trigger
  * Set __ledtrig_blkdev_disk_cleanup back to NULL

Make LED trigger struct (ledtrig_blkdev_trigger) static (as it's now
referenced in blkdev_init()).

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev.c | 65 ++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index 4b88f877ee81..96ea694ce29f 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -435,6 +435,23 @@ static ssize_t unlink_device_store(struct device *const dev,
 static DEVICE_ATTR_WO(unlink_device);
 
 
+/*
+ *
+ *	Disassociate all LEDs from a block device (because it's going away)
+ *
+ */
+
+static void blkdev_disk_cleanup(struct gendisk *const gd)
+{
+	struct ledtrig_blkdev_link *link;
+	struct hlist_node *next;
+
+	hlist_for_each_entry_safe(link, next,
+					&gd->ledtrig->leds, disk_leds_node)
+		blkdev_disk_unlink_locked(link->led, link, gd->ledtrig);
+}
+
+
 /*
  *
  *	Disassociate an LED from the trigger
@@ -615,9 +632,55 @@ static const struct attribute_group *ledtrig_blkdev_attr_groups[] = {
 	NULL
 };
 
-struct led_trigger ledtrig_blkdev_trigger = {
+static struct led_trigger ledtrig_blkdev_trigger = {
 	.name		= "blkdev",
 	.activate	= blkdev_activate,
 	.deactivate	= blkdev_deactivate,
 	.groups		= ledtrig_blkdev_attr_groups,
 };
+
+static int __init blkdev_init(void)
+{
+	int ret;
+
+	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
+	if (ret != 0)
+		return ret;
+
+	ledtrig_blkdev_interval = msecs_to_jiffies(LEDTRIG_BLKDEV_INTERVAL);
+	__ledtrig_blkdev_disk_cleanup = blkdev_disk_cleanup;
+
+	/*
+	 * Can't call led_trigger_register() with ledtrig_blkdev_mutex locked.
+	 * If an LED has blkdev as its default_trigger, blkdev_activate() will
+	 * be called for that LED, and it will try to lock the mutex, which will
+	 * hang.
+	 */
+	mutex_unlock(&ledtrig_blkdev_mutex);
+
+	ret = led_trigger_register(&ledtrig_blkdev_trigger);
+	if (ret != 0) {
+		mutex_lock(&ledtrig_blkdev_mutex);
+		__ledtrig_blkdev_disk_cleanup = NULL;
+		mutex_unlock(&ledtrig_blkdev_mutex);
+	}
+
+	return ret;
+}
+module_init(blkdev_init);
+
+static void __exit blkdev_exit(void)
+{
+	mutex_lock(&ledtrig_blkdev_mutex);
+
+	/*
+	 * It's OK to call led_trigger_unregister() with the mutex locked,
+	 * because the module can only be unloaded when no LEDs are using
+	 * the blkdev trigger, so blkdev_deactivate() won't be called.
+	 */
+	led_trigger_unregister(&ledtrig_blkdev_trigger);
+	__ledtrig_blkdev_disk_cleanup = NULL;
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
+}
+module_exit(blkdev_exit);
-- 
2.31.1

