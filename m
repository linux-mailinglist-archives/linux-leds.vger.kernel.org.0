Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529913E3E53
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbhHIDdN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhHIDdM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:12 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6DEC061757;
        Sun,  8 Aug 2021 20:32:52 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id be20so2853251oib.8;
        Sun, 08 Aug 2021 20:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kRrIoSKg1v4/TjhUcT0NK/1ehkQeeVfSwbumR9nUTwI=;
        b=rn0342fWakTOfnwZyR38Tk1r4457maQ+jFYOSAyl4x0tRYTdpBUqCMwdK9KqnUNHTY
         bnmYFStkH9MYPBH2rlut2KfG2yS8bN05EbM94cb0Y9oZdUoDQ0T5NqZC/MqagyLxKxDW
         mwXEcXWvCWkYEAPTfoJtFUwKauyIV2JiQMaH8ymqSgx2AYByFBE8JgTJNqeRwIflo2G0
         sYgjHdY8ffdpCXbLYVSrnTYslQxiQ1mLrxHHtmmFIbIPanWYZxRQNF2GpAxVeBfTkn0G
         x0H5AQSDdhQ4ZO0QO7PZrElvYdKx1WyjZQqzAeoL2haikbCg4fZWvnFRRFnckA767QAS
         ZVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRrIoSKg1v4/TjhUcT0NK/1ehkQeeVfSwbumR9nUTwI=;
        b=lAk9k1Z051zbVu5nvLbSUduQDif9RWXyl0exsiOKdbBvTKA+fu6gUl5Sv4r2x6x0g6
         T6fITdA11DduntmmIx2L176bBoRb9juRfH38knzGxxUkUpfvkNCmXSDNFAAIyM1M6CHb
         QtJGEp6zcG1pSV7p8sfTOLNgPGPiCNM2nrNvexTE6aEJ9B5vZVBlMdp+C8QKaYWe9ChW
         tQNqA+je9e5jtS5LjZRLJ691uXkP0myfnTe8nqm/8+vEtfZqTzoeoOT1IH3Z2akZSc8k
         LszbvPCWEyrw3dPtNMBE1Mefy+OSepX2Ijx7WNjNMM2u02aBXbAFxtus8JHjGBW3UZhV
         7sqw==
X-Gm-Message-State: AOAM531pUwPyOWVksmelUS88nIT43iMTZqQ7FZh2YAg1odXEbuV1kYwv
        TGBMJT4/9COoxO1cOxakorKz5sloqQnJqCze
X-Google-Smtp-Source: ABdhPJwZ2nCdKz7ZHdKJ2lNlsJ+uCw9Aw35CFGNScZU6OYTKlyWRPBg+/wMC34wH3kMIblU9RFzmtQ==
X-Received: by 2002:aca:de54:: with SMTP id v81mr2142698oig.40.1628479972174;
        Sun, 08 Aug 2021 20:32:52 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:51 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 06/10] block: Add activate and deactivate functions for block device LED trigger
Date:   Sun,  8 Aug 2021 22:32:13 -0500
Message-Id: <20210809033217.1113444-7-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Set up activated LED:

  * Allocate per-LED data structure
  * Add LED to list of LEDs associated with blkdev trigger
  * Create block_devices subdirectory for links to associated devices

Clean up deactivated LED:

  * Clear LED of any associated devices
  * Remove from LED from blkdev trigger list
  * Remove block_devices subdirectory
  * Wait for any blinks using LED to complete (synchronize_rcu())
  * Free per-LED structure

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 1af94dc7ea51..f8cb6de203f8 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -13,6 +13,11 @@
 
 #include "blk-ledtrig.h"
 
+// Default blink_on & blink_off values
+#define BLK_LEDTRIG_BLINK_ON	75
+#define BLK_LEDTRIG_BLINK_OFF	25
+#define BLK_LEDTRIG_BLINK_MAX	10000		// 10 seconds
+
 
 /*
  *
@@ -248,3 +253,93 @@ ssize_t blk_ledtrig_dev_led_show(struct device *const dev,
 led_show_exit_return:
 	return ret;
 }
+
+
+/*
+ *
+ *	Associate an LED with the blkdev trigger
+ *
+ */
+
+// Helper function to create <LED>/blkdevs subdirectory - doesn't
+// swallow error code like kobject_create_and_add()
+static int blk_ledtrig_subdir_create(struct blk_ledtrig_led *const bd_led,
+				     struct led_classdev *const led)
+{
+	int ret;
+
+	bd_led->dir = kobject_create();
+	if (bd_led->dir == NULL)
+		return -ENOMEM;
+
+	ret = kobject_add(bd_led->dir, &led->dev->kobj, "block_devices");
+	if (ret != 0)
+		kobject_put(bd_led->dir);
+
+	return ret;
+}
+
+static int blk_ledtrig_activate(struct led_classdev *const led)
+{
+	struct blk_ledtrig_led *bd_led;
+	int ret;
+
+	bd_led = kmalloc(sizeof(*bd_led), GFP_KERNEL);
+	if (bd_led == NULL) {
+		ret = -ENOMEM;
+		goto activate_exit_return;
+	}
+
+	bd_led->led = led;
+	bd_led->blink_on = BLK_LEDTRIG_BLINK_ON;
+	bd_led->blink_off = BLK_LEDTRIG_BLINK_OFF;
+	INIT_LIST_HEAD(&bd_led->dev_list);
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_mutex);
+	if (ret != 0)
+		goto activate_exit_free;
+
+	ret = blk_ledtrig_subdir_create(bd_led, led);
+	if (ret != 0)
+		goto activate_exit_unlock;
+
+	list_add(&bd_led->leds_list_node, &blk_ledtrig_leds);
+	led_set_trigger_data(led, bd_led);
+	ret = 0;
+
+activate_exit_unlock:
+	mutex_unlock(&blk_ledtrig_mutex);
+activate_exit_free:
+	if (ret != 0)
+		kfree(bd_led);
+activate_exit_return:
+	return ret;
+}
+
+
+/*
+ *
+ *	Disassociate an LED from the blkdev trigger
+ *
+ */
+
+static void blk_ledtrig_deactivate(struct led_classdev *const led)
+{
+	struct blk_ledtrig_led *const bd_led = led_get_trigger_data(led);
+	struct gendisk *disk, *next;
+
+	mutex_lock(&blk_ledtrig_mutex);
+
+	list_for_each_entry_safe(disk, next,
+				 &bd_led->dev_list, led_dev_list_node) {
+
+		blk_ledtrig_dev_clear_locked(disk, bd_led);
+	}
+
+	list_del(&bd_led->leds_list_node);
+	kobject_put(bd_led->dir);
+
+	mutex_unlock(&blk_ledtrig_mutex);
+	synchronize_rcu();
+	kfree(bd_led);
+}
-- 
2.31.1

