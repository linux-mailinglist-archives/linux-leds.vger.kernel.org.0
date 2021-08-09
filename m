Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51283E3E61
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbhHIDdc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbhHIDdU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:20 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D16DC06179C;
        Sun,  8 Aug 2021 20:32:57 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id s13so12448674oie.10;
        Sun, 08 Aug 2021 20:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qODwXXqin3j/qsovJZX1OPoeqYbdkrnP0jJoGjELmHg=;
        b=Eyk5GgBH6I3rb4Ai0P5hqtxOAtZoHai29umGdiMXpXSFkCoWLuuQXMHHxMnF31hWxy
         TwECvAwVMLCdlf3EY/me4rZjrK8xkJ4d+vGUeMSsz2chtXLaBqm3HzcUOH3C+nMiw9ov
         ddoIhKjjaFg8Ja1PgqSmcPqeS2MKOjGVdyeS3FQqQJkjbpF7RgZ74gO5Xzv0/Fwj8smV
         Zs+3HlfwdjOD4hCbKhA8VVT4fNr/Lv3YTtNPFw/ldWakbc7WVtDRiwIj+o8k8nA6tYt+
         S1TR/vtuD14EjK0mbXCPrdPyTrAJNC0b1YRWE2bb7VB/Czq/G1dKcR4dQ7VLUz+mihzK
         Y2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qODwXXqin3j/qsovJZX1OPoeqYbdkrnP0jJoGjELmHg=;
        b=GPVs3eGmTlzoy3fEIqzQlAzLYj04rEHILjmRa0JkGD/4Z3H6lW51LktordleeFegJu
         dgkK347hXwLIziqfBFAXFnU51g/mqR0hxfelgsMCzAmrwW8Mm0vHHmbiOD6mhAXwcFep
         /92d084tisEGTVgLta0TINsIgXqrgtnI1R7McSZgkxg4fp+DiVsj27u1dJf6XvnefmD9
         agtzfj6IoS14w/Qg9ASR4WeKFSOrTWT0UL9cxCLixuWSGfLiuKH40HCevqAOWnS7jNpl
         YJSZQd+64T8akRLIUQDMTG6hQ4ihUmj11FeE9fEzZcFGreeZGAYOWiKhacZYdLKxdZ8R
         sYWg==
X-Gm-Message-State: AOAM533P0l+4jICX/c1rRZJjPUQhIL3chn4D9Krp/VLYmYNN5e7FuTDy
        SCKahVUVEtWDmlbZQ1htV5wPGjcBEZghiQWc
X-Google-Smtp-Source: ABdhPJw7mnevUVdAxjv9lcCViU4OrDqE+qpTu4fIVB6YzvapPOcSvTc1UcLCL+4FqRr0v8fi4yqzAw==
X-Received: by 2002:aca:130d:: with SMTP id e13mr26895oii.3.1628479976217;
        Sun, 08 Aug 2021 20:32:56 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:55 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 09/10] block: Blink device LED (if any) when request is sent to its driver
Date:   Sun,  8 Aug 2021 22:32:16 -0500
Message-Id: <20210809033217.1113444-10-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Call led_blink_set_oneshot() in RCU critical section to ensure that LED
doesn't disappear.  (See synchronize_rcu() call in blk_ledtrig_deactivate()).

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 26 ++++++++++++++++++++++++++
 block/blk-ledtrig.h |  9 +++++++++
 block/blk-mq.c      |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 14b1d33a2953..10588f3dea15 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -6,6 +6,7 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/blkdev.h>
 #include <linux/ctype.h>
 #include <linux/genhd.h>
 #include <linux/leds.h>
@@ -441,3 +442,28 @@ static int __init blk_ledtrig_init(void)
 	return led_trigger_register(&blk_ledtrig_trigger);
 }
 device_initcall(blk_ledtrig_init);
+
+
+/*
+ *
+ *	Blink the LED associated with a (non-NULL) disk (if set)
+ *
+ */
+
+void __blk_ledtrig_try_blink(struct request *const rq)
+{
+	struct blk_ledtrig_led *bd_led;
+	unsigned long delay_on, delay_off;
+
+	rcu_read_lock();
+
+	bd_led = rcu_dereference(rq->rq_disk->led);
+
+	if (bd_led != NULL) {
+		delay_on = READ_ONCE(bd_led->blink_on);
+		delay_off = READ_ONCE(bd_led->blink_off);
+		led_blink_set_oneshot(bd_led->led, &delay_on, &delay_off, 0);
+	}
+
+	rcu_read_unlock();
+}
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 771000d43647..7eb1d88e2b3c 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -26,10 +26,19 @@ ssize_t blk_ledtrig_dev_led_show(struct device *const dev,
 				 struct device_attribute *const attr,
 				 char *const buf);
 
+void __blk_ledtrig_try_blink(struct request *const rq);
+
+static inline void blk_ledtrig_try_blink(struct request *const rq)
+{
+	if (rq->rq_disk != NULL)
+		__blk_ledtrig_try_blink(rq);
+}
+
 #else	// CONFIG_BLK_LED_TRIGGERS
 
 static inline void blk_ledtrig_disk_init(const struct gendisk *disk) {}
 static inline void blk_ledtrig_dev_clear(const struct gendisk *disk) {}
+static inline void blk_ledtrig_try_blink(const struct request *rq) {}
 
 #endif	// CONFIG_BLK_LED_TRIGGERS
 
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 2c4ac51e54eb..7732e31f3ca8 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -40,6 +40,7 @@
 #include "blk-stat.h"
 #include "blk-mq-sched.h"
 #include "blk-rq-qos.h"
+#include "blk-ledtrig.h"
 
 static DEFINE_PER_CPU(struct llist_head, blk_cpu_done);
 
@@ -1381,6 +1382,7 @@ bool blk_mq_dispatch_rq_list(struct blk_mq_hw_ctx *hctx, struct list_head *list,
 		switch (ret) {
 		case BLK_STS_OK:
 			queued++;
+			blk_ledtrig_try_blink(rq);
 			break;
 		case BLK_STS_RESOURCE:
 		case BLK_STS_DEV_RESOURCE:
-- 
2.31.1

