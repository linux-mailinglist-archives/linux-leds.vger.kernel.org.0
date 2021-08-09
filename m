Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DF53E3E4E
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhHIDdL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhHIDdK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:10 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD508C061760;
        Sun,  8 Aug 2021 20:32:50 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id bj40so2130335oib.6;
        Sun, 08 Aug 2021 20:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IcIaKivSr+2Yd3P4FVIhtXkcUXa5XZoFFn0fjLKQOWo=;
        b=mqYz/bI9Gx7XG281BcCFUWqFGyaKKaifMLfJnojAfArFfBGdZK/LWa0ej0sC+5XsCt
         QRd0bMUIdHh82fLgLyrJGvq1qammxusly2Hj3AuwRab5LHZD8BP5bLRMj2ER59Yk65bv
         YAhU3L9Gu2gkyAIIe1zGfNflWm5yYDdC6k3ugjap/rpnhOtGpOsGEMl4jO7Jf5+Ykr4T
         gUM1jzBI5FJGDv22aap5yHZgPRaTdh5Mp7phwaf7IpJUrwVGt6ocAWJGfEshYXqjmnhX
         stG5Yqni3t30HklKMzuoibv8FLdtYO+r8K8sgJF3Vw+2Qc3CYeKz55MwZBr1YdDR2mWW
         DBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IcIaKivSr+2Yd3P4FVIhtXkcUXa5XZoFFn0fjLKQOWo=;
        b=LqZ+BbIhm/UdYlYD66dsh4SNmDAvmJgQ1+aRahi3kC60nrzJFL+zGEGije2MWrt5E2
         KAI+WvysQihpwGWQwScxykvusQlvAsJNRsMzfwqpN4M6xoVxg3/H4xkkCiIKyDwbQpJ3
         +AQgIjbOdKaZ99Zq4CKeA2uKcywB4qRSZZcA8UXpjEYuK8Jd2wDVuOwb2xBrcb/PpKFd
         AFBa0Uv0wBUUFhO/Uc/XysXx1mUcgDKbVrg0e1izRtxttvt1wpN4t6txrvJABBWLm8rb
         6Bkc2IwsXiXoSUndf/ry10xVhwMUnStlZgmw0rczRTuuzEnVxyxibPGfsq5jPqEuORmb
         k7ow==
X-Gm-Message-State: AOAM530HYr/sXKmX/p7izKdu/tCHWW9cFCuAvSk1WzUlWQtIZfNgk0gk
        3STnBYPuFksROumqab85l+bXZm/HS9OpG/FF
X-Google-Smtp-Source: ABdhPJxaHA7mhECQguJGrUQ5hRrn555INgeZXFbjZGf6xE9vczxSGfhtcmcRacSOqsG7nNmVs6vQrQ==
X-Received: by 2002:aca:f306:: with SMTP id r6mr13953554oih.165.1628479970169;
        Sun, 08 Aug 2021 20:32:50 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:49 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 03/10] block: Add block device LED trigger fields to gendisk structure
Date:   Sun,  8 Aug 2021 22:32:10 -0500
Message-Id: <20210809033217.1113444-4-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add header (blk-ledtrig.h) for LED trigger-related declarations

Add (inline) function to ensure trigger pointer is initialized
(to NULL) and call it from __device_add_disk()

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.h   | 25 +++++++++++++++++++++++++
 block/genhd.c         |  2 ++
 include/linux/genhd.h |  4 ++++
 3 files changed, 31 insertions(+)
 create mode 100644 block/blk-ledtrig.h

diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
new file mode 100644
index 000000000000..95a79d2fe447
--- /dev/null
+++ b/block/blk-ledtrig.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ *	Block device LED triggers
+ *
+ *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
+ */
+
+#ifndef _BLOCK_BLK_LEDTRIG_H
+#define _BLOCK_BLK_LEDTRIG_H
+
+#ifdef CONFIG_BLK_LED_TRIGGERS
+
+static inline void blk_ledtrig_disk_init(struct gendisk *const disk)
+{
+	RCU_INIT_POINTER(disk->led, NULL);
+}
+
+#else	// CONFIG_BLK_LED_TRIGGERS
+
+static inline void blk_ledtrig_disk_init(const struct gendisk *disk) {}
+
+#endif	// CONFIG_BLK_LED_TRIGGERS
+
+#endif	// _BLOCK_BLK_LEDTRIG_H
diff --git a/block/genhd.c b/block/genhd.c
index 298ee78c1bda..b168172e664b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -26,6 +26,7 @@
 #include <linux/badblocks.h>
 
 #include "blk.h"
+#include "blk-ledtrig.h"
 
 static struct kobject *block_depr;
 
@@ -539,6 +540,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 
 	disk_add_events(disk);
 	blk_integrity_add(disk);
+	blk_ledtrig_disk_init(disk);
 }
 
 void device_add_disk(struct device *parent, struct gendisk *disk,
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 13b34177cc85..efcb1ca62f17 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -168,6 +168,10 @@ struct gendisk {
 #endif	/* CONFIG_BLK_DEV_INTEGRITY */
 #if IS_ENABLED(CONFIG_CDROM)
 	struct cdrom_device_info *cdi;
+#endif
+#ifdef CONFIG_BLK_LED_TRIGGERS
+	struct blk_ledtrig_led __rcu *led;
+	struct list_head led_dev_list_node;
 #endif
 	int node_id;
 	struct badblocks *bb;
-- 
2.31.1

