Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A83C3E3E54
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhHIDdO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbhHIDdL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:11 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6890FC061757;
        Sun,  8 Aug 2021 20:32:51 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w6so21734420oiv.11;
        Sun, 08 Aug 2021 20:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OX+fGhBFKu5FC8W1LaNx83ZClAd+GqNacmx+NCQZpPI=;
        b=WCC40AOnAGPJCaly+0XFVIQEEX64WmZgZhhQF5zRUV4r4HOd8anG3DBtybTrc7soJe
         tGoCQUJTuST/3+LB8ERWMX41+GufyjY5NIgQAhP/BZqvyzELNQ098BPqituW4QSQq/FH
         ba+s+ygjJ/OfjWLGzE86crAdG56hD6CDqqFMRYOLLnVKmQWSTJbRJx9OWaZFv0QYNTQd
         qTssijziug4kor5ryPvtorh5aLHZnjZCON27lHp7zHcHhxsyDYsOPjsXoMD8eDQGoWmU
         GhmFz3/wN1XECvJTvjkp+D7xG0614KsXnhfui935r7yY3ksjGn2+I98ZG+Pf11Dg9qLu
         n1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OX+fGhBFKu5FC8W1LaNx83ZClAd+GqNacmx+NCQZpPI=;
        b=LrW+cH5Eeopi0Cx75GDz7JRyWltCGl2F263kA/CmmF0CdQg3Z/rYXXycXSiooiRcJl
         2SgAJTH2C8mT6HZhr/jeQ/+kCQ6FerFFqq4/MhPCSVymf2OcY48TnidNzMTZaKF/uqob
         5NfxlE12BMTIK3kE75ukqgs6f8EOE2FpOq+VSYfUWIQPfAqvu2zFjxboYkZGKILeKqSc
         G3Zg6NtMsXY38mqizOvEp4CbLEe7hCEvDMT5+prtsV5cglomcY7QdHswrXAKTCiqP89f
         QiRQek+Y61kYGJG2jvP5n4tcENJAhrNWwCCvtIzVS9DRYC1H39MgHhjTQyi5zM8HZbXo
         RyGQ==
X-Gm-Message-State: AOAM530fW/AlCX3nKVy2S6NjL1gLulgRRN6PirlT1Wu6eacX+Xw79lIR
        NcbYrEc08yp9Qc+jLube5lCPyiosDjL6SPew
X-Google-Smtp-Source: ABdhPJxsUg7gwG7M3FvrqmDHa42XuVGQE62q8ZQUKn9I3VhNuZ7da2cDoNa5fykXMIwI1js9pyQSsQ==
X-Received: by 2002:aca:b757:: with SMTP id h84mr4870760oif.77.1628479970869;
        Sun, 08 Aug 2021 20:32:50 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:50 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 04/10] block: Add functions to set & clear block device LEDs
Date:   Sun,  8 Aug 2021 22:32:11 -0500
Message-Id: <20210809033217.1113444-5-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Create a symlink from /sys/class/leds/<LED>/block_devices to each block
device that is associated with that LED

Ensure device LED is cleared when device is removed

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 93 +++++++++++++++++++++++++++++++++++++++++++++
 block/blk-ledtrig.h |  3 ++
 block/genhd.c       |  1 +
 3 files changed, 97 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index c5ad57ed9c3b..280fa9edc2dd 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -6,9 +6,13 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/genhd.h>
 #include <linux/leds.h>
 #include <linux/mutex.h>
 
+#include "blk-ledtrig.h"
+
+
 /*
  *
  *	Trigger mutex and LED list
@@ -46,3 +50,92 @@ static struct blk_ledtrig_led *blk_ledtrig_find(const char *const led_name,
 
 	return NULL;
 }
+
+
+/*
+ *
+ *	Clear a block device's LED
+ *
+ */
+
+// Also called from blk_ledtrig_dev_set()
+static void blk_ledtrig_dev_cleanup(struct gendisk *const disk,
+				    struct blk_ledtrig_led *const old_led)
+{
+	sysfs_remove_link(old_led->dir, disk->disk_name);
+	list_del(&disk->led_dev_list_node);
+}
+
+// Also called from blk_ledtrig_deactivate()
+static void blk_ledtrig_dev_clear_locked(struct gendisk *const disk,
+					 struct blk_ledtrig_led *const old_led)
+{
+	RCU_INIT_POINTER(disk->led, NULL);
+	if (old_led != NULL)
+		blk_ledtrig_dev_cleanup(disk, old_led);
+}
+
+// Also called from genhd.c:del_gendisk()
+void blk_ledtrig_dev_clear(struct gendisk *const disk)
+{
+	struct blk_ledtrig_led *old_led;
+
+	mutex_lock(&blk_ledtrig_mutex);
+	old_led = rcu_dereference_protected(disk->led,
+					lockdep_is_held(&blk_ledtrig_mutex));
+	blk_ledtrig_dev_clear_locked(disk, old_led);
+	mutex_unlock(&blk_ledtrig_mutex);
+}
+
+
+/*
+ *
+ *	Set a block device's LED
+ *
+ */
+
+static int blk_ledtrig_dev_set(struct gendisk *const disk,
+			       const char *const led_name,
+			       const size_t name_len)
+{
+	struct blk_ledtrig_led *new_led, *old_led;
+	int ret;
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_mutex);
+	if (ret != 0)
+		goto led_set_exit_return;
+
+	new_led = blk_ledtrig_find(led_name, name_len);
+	if (new_led == NULL) {
+		pr_info("no LED named %.*s associated with blkdev trigger\n",
+			(int)name_len, led_name);
+		ret = -ENODEV;
+		goto led_set_exit_unlock;
+	}
+
+	old_led = rcu_dereference_protected(disk->led,
+					lockdep_is_held(&blk_ledtrig_mutex));
+
+	if (old_led == new_led) {
+		ret = 0;
+		goto led_set_exit_unlock;
+	}
+
+	ret = sysfs_create_link(new_led->dir, &disk_to_dev(disk)->kobj,
+				disk->disk_name);
+	if (ret != 0)
+		goto led_set_exit_unlock;
+
+	if (old_led != NULL)
+		blk_ledtrig_dev_cleanup(disk, old_led);
+
+	rcu_assign_pointer(disk->led, new_led);
+	list_add(&disk->led_dev_list_node, &new_led->dev_list);
+
+	ret = 0;
+
+led_set_exit_unlock:
+	mutex_unlock(&blk_ledtrig_mutex);
+led_set_exit_return:
+	return ret;
+}
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 95a79d2fe447..66a1302a4174 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -16,9 +16,12 @@ static inline void blk_ledtrig_disk_init(struct gendisk *const disk)
 	RCU_INIT_POINTER(disk->led, NULL);
 }
 
+void blk_ledtrig_dev_clear(struct gendisk *const disk);
+
 #else	// CONFIG_BLK_LED_TRIGGERS
 
 static inline void blk_ledtrig_disk_init(const struct gendisk *disk) {}
+static inline void blk_ledtrig_dev_clear(const struct gendisk *disk) {}
 
 #endif	// CONFIG_BLK_LED_TRIGGERS
 
diff --git a/block/genhd.c b/block/genhd.c
index b168172e664b..9fa734aeab0f 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -583,6 +583,7 @@ void del_gendisk(struct gendisk *disk)
 	if (WARN_ON_ONCE(!disk->queue))
 		return;
 
+	blk_ledtrig_dev_clear(disk);
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
-- 
2.31.1

