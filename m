Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00203D9B54
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbhG2Byq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233440AbhG2Byh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:37 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F99BC0613C1;
        Wed, 28 Jul 2021 18:54:35 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id a19so6351530oiw.6;
        Wed, 28 Jul 2021 18:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=As8Tkf4mRo7Mi47sb2gawTIsMDIBW35dWzDfuJXzf24=;
        b=KAXxg7WDVZEiBctmG67MeAut2sjCZTRyAlgzgozM0u4dV10MjAmjS86P3FlU+oRh+d
         ghx90pJrqPDbf7Bp8D/UAD3HFl51KaHhxydnKfpWLyaL/lMrpvgZ3tOl4MwjPhzpuU+m
         HPQNjmomvkHC98rUTLOnoCCxeLQfa+I167ai5XSSD2UE721s6UCl8ozJgaYAwteTKkc/
         10Ba3iV2uv7CC4zjuuYBIFTWALir0n3mP/oci/LS9L7K0k2CHxZKeMPFwp89VepBYeqQ
         +aK0bJS6GnSwYJZbCRS02GZriHFHuWNQZ5GesGwVxHEC+cDkoT3Dy8sqWFM86au913Bh
         oeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=As8Tkf4mRo7Mi47sb2gawTIsMDIBW35dWzDfuJXzf24=;
        b=KO4NOOonAyouTT5YH1+vMsSQHPCB93ltYX3Nb0cD/IL56VbrzTmhNxMayjFrjFSLMW
         8p07DfPQCrBqCSETQCAVDgnxCd3I6zILk6axhdS1OHp/IhrXFbtS8k7Qh/m48en7MiOW
         1HCt8gGOIeFpAYmnqfW/wewPSxT3KZmVPJv3ar3mbTBGWLjyDSCi1zBRzb8Xq9JU+5MT
         nMmKRvdV8tC2C8VvdB/B3Pla2pomVyhLSf6KiWQvgZdLUxB12LeW7ApvKV7XcGxB31Jm
         XWi52H9joQVkHdhSu22h5SmE03Y9MtB6ILUgpDCr5oJRi4g83RU7k6xz1FRtSChMGS+u
         4x3Q==
X-Gm-Message-State: AOAM532cudXDXSAyVdc9ZZj55YT7cyia7De7T6/nLLIL5qvFJSjrX1uw
        id92Rp5hF6H9Ve1e6/DURtZLqAUbxHFieS/S
X-Google-Smtp-Source: ABdhPJxzLQsJ5CMubDia3i29fHRTGMkjAZX1g4DtO40aQk4OXdjunp+l7c/f+gIhfdtLP3dwYUm99g==
X-Received: by 2002:aca:d11:: with SMTP id 17mr8341809oin.19.1627523674550;
        Wed, 28 Jul 2021 18:54:34 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:33 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 8/8] block: Blink device LED when request is sent to low-level driver
Date:   Wed, 28 Jul 2021 20:53:44 -0500
Message-Id: <20210729015344.3366750-9-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Don't wait to lock the device's LED trigger mutex; just don't
  blink the LED this time if it can't be locked right away, i.e.
  if mutex_trylock() fails.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c | 24 ++++++++++++++++++++++++
 block/blk-ledtrig.h |  9 +++++++++
 block/blk-mq.c      |  2 ++
 3 files changed, 35 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 2d324df45149..1b475530ce6c 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -544,3 +544,27 @@ ssize_t blk_ledtrig_devattr_show(struct device *const dev,
 
 	return (ssize_t)(name_len + 1);
 }
+
+
+/*
+ *
+ *	Try to blink an LED
+ *
+ */
+
+void __blk_ledtrig_try_blink(struct gendisk *const gd)
+{
+	if (mutex_trylock(&gd->ledtrig_mutex)) {
+
+		if (gd->ledtrig != NULL) {
+
+			unsigned long delay_on = 75;
+			unsigned long delay_off = 25;
+
+			led_trigger_blink_oneshot(&gd->ledtrig->trigger,
+						  &delay_on, &delay_off, 0);
+		}
+
+		mutex_unlock(&gd->ledtrig_mutex);
+	}
+}
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 5d228905edbf..146deda92a8e 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -27,10 +27,19 @@ ssize_t blk_ledtrig_devattr_show(struct device *const dev,
 				 struct device_attribute *const attr,
 				 char *const buf);
 
+void __blk_ledtrig_try_blink(struct gendisk *gd);
+
+static inline void blk_ledtrig_try_blink(struct gendisk *const gd)
+{
+	if (gd != NULL)
+		__blk_ledtrig_try_blink(gd);
+}
+
 #else	// CONFIG_BLK_LED_TRIGGERS
 
 static inline void blk_ledtrig_init(void) {}
 static inline void blk_ledtrig_disk_init(const struct gendisk *gd) {}
+static inline void blk_ledtrig_try_blink(const struct gendisk *gd) {}
 
 // Real function (declared in include/linux/blk-ledtrig.h) returns a bool.
 // This is only here for del_gendisk() (in genhd.c), which doesn't check
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 2c4ac51e54eb..5593ece7b676 100644
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
+			blk_ledtrig_try_blink(rq->rq_disk);
 			break;
 		case BLK_STS_RESOURCE:
 		case BLK_STS_DEV_RESOURCE:
-- 
2.31.1

