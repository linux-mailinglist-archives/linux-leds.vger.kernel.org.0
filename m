Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936DF3D9B4D
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbhG2Byl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233370AbhG2Byg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:36 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481B5C0613CF;
        Wed, 28 Jul 2021 18:54:33 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id f20-20020a9d6c140000b02904bb9756274cso4184266otq.6;
        Wed, 28 Jul 2021 18:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/h9CNhDEWaVYT21D38h0CBGh+E5bTlq6KWJZsooWmc=;
        b=oKQ5XMdqLNJK1CchH8QRSYF5bWz65GClpM9gYk/AR/X++pukl4wVzJAfMBpvRiDHyi
         i8T5mUidgHraCdyPjy/1z/ZzPLJSxzOxtCOm274vMx04xqtPbAq1GpY0EHq1qdOxVIWL
         wtJ0XPPismyXN+10tjE3DkOFVXFGVtCP8PMmk4ijGa8iL4MWW5twGkzaZgjAUGkH5Ltg
         h8iqqzadL3r4rXBvqT8UbfsuRlH6RuRwjASnrxxXz4v4Z7OUnWhddhxTikh1smbJR6Fb
         iIL12gPQnpW/WQZdC+CFZeRtnPv5XoVXtX+L5ZzvW4h6tj+EV4OXfyMV/iCvx99puKl8
         aqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/h9CNhDEWaVYT21D38h0CBGh+E5bTlq6KWJZsooWmc=;
        b=H2/hTJZbdAlTqzKfYJtVv6pc/XHkPP5T4gaNkkUWl8pV6yG6Ln5kAZF1PeneMV/dBQ
         5lPI09s/q1DpU2R7M4o2KvrgGK3DAyPOStd8cHj+eHoeDDPmwx4FldYcSw0o+2iBlYVF
         QR5rpG2+s7W9evbzCGlgO+gARacyqIzOowDha9er1o770V6mYaaOs7L1W6UoySVzCGfO
         mI29yg4ivrUb4W+2D1utUGJtyooQaHuZaDohfm/w4NUPKSWVUmkKRyA5fRu7ve1BEz3A
         m2rq6UNMWIEmOZu7l/blP4yCbMY6RkztMm/TM7hhsEmNlXg8t76mEn9VrjaLiMB9Q8Ue
         AvHQ==
X-Gm-Message-State: AOAM533HfZBMVd0YHsH09L7zA82/Gy0DE3jLKTrApxv1vyzmPDY0E4kY
        2v5tznBVxyi5lhqphUTFhFLBKS9WKcz/6KQa
X-Google-Smtp-Source: ABdhPJwV1SZfY/OcfRoQmrShjgEfsL5nfsPervIgTuOpn3XNxlelwr4Ao/A2hCxFCd+nAFNtBlR6nA==
X-Received: by 2002:a05:6830:b:: with SMTP id c11mr1918695otp.149.1627523672666;
        Wed, 28 Jul 2021 18:54:32 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:32 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 6/8] block: Add kernel APIs to set & clear per-block device LED triggers
Date:   Wed, 28 Jul 2021 20:53:42 -0500
Message-Id: <20210729015344.3366750-7-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Clear LED trigger (decrement trigger reference count) when device
  is deleted, e.g. when a USB disk is unplugged.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.c         | 131 ++++++++++++++++++++++++++++++++++++
 block/blk-ledtrig.h         |   5 ++
 block/genhd.c               |   2 +
 include/linux/blk-ledtrig.h |   5 ++
 4 files changed, 143 insertions(+)

diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
index 6392ab4169f9..7c8fdff88683 100644
--- a/block/blk-ledtrig.c
+++ b/block/blk-ledtrig.c
@@ -348,3 +348,134 @@ void __init blk_ledtrig_init(void)
 init_error_new:
 	pr_err("failed to initialize blkdev LED triggers (%d)\n", ret);
 }
+
+
+/*
+ *
+ *	Set a device trigger
+ *
+ */
+
+static int __blk_ledtrig_set(struct gendisk *const gd, const char *const name,
+			     const size_t name_len)
+{
+	struct blk_ledtrig *t;
+	bool already_set;
+	int ret;
+
+	ret = mutex_lock_interruptible(&blk_ledtrig_list_mutex);
+	if (unlikely(ret != 0))
+		goto set_exit_return;
+
+	t = blk_ledtrig_find(name, name_len);
+	if (t == NULL) {
+		pr_warn("blockdev LED trigger named %.*s doesn't exist\n",
+			(int)name_len, name);
+		ret = -ENODEV;
+		goto set_exit_unlock_list;
+	}
+
+	ret = mutex_lock_interruptible(&t->refcount_mutex);
+	if (unlikely(ret != 0))
+		goto set_exit_unlock_list;
+
+	// Holding the refcount mutex blocks __blk_ledtrig_delete, so we don't
+	// actually need to hold the list mutex anymore, but it makes the flow
+	// much simpler to do so
+
+	if (WARN_ON_ONCE(t->refcount == INT_MAX)) {
+		ret = -ERANGE;
+		goto set_exit_unlock_refcount;
+	}
+
+	ret = mutex_lock_interruptible(&gd->ledtrig_mutex);
+	if (unlikely(ret != 0))
+		goto set_exit_unlock_refcount;
+
+	if (gd->ledtrig == NULL) {
+		already_set = false;
+		gd->ledtrig = t;
+	} else {
+		already_set = true;
+	}
+
+	mutex_unlock(&gd->ledtrig_mutex);
+
+	if (already_set) {
+		pr_warn("blockdev trigger for %s already set\n",
+			gd->disk_name);
+		ret = -EBUSY;
+		goto set_exit_unlock_refcount;
+	}
+
+	++(t->refcount);
+	ret = 0;
+
+set_exit_unlock_refcount:
+	mutex_unlock(&t->refcount_mutex);
+set_exit_unlock_list:
+	mutex_unlock(&blk_ledtrig_list_mutex);
+set_exit_return:
+	return ret;
+}
+
+/**
+ * blk_ledtrig_set() - set the LED trigger for a block device
+ * @gd: the block device
+ * @name: the name of the LED trigger
+ *
+ * Context: Process context (can sleep).  Takes and releases
+ *	    @blk_ledtrig_list_mutex, trigger's @refcount_mutex,
+ *	    and @gd->ledtrig_mutex.
+ *
+ * Return: 0 on success; -@errno on error
+ */
+int blk_ledtrig_set(struct gendisk *const gd, const char *const name)
+{
+	return __blk_ledtrig_set(gd, name, strlen(name));
+}
+EXPORT_SYMBOL_GPL(blk_ledtrig_set);
+
+
+/*
+ *
+ *	Clear a device trigger
+ *
+ */
+
+/**
+ * blk_ledtrig_clear() - clear the LED trigger of a block device
+ * @gd: the block device
+ *
+ * Context: Process context (can sleep).  Takes and releases
+ *	    @gd->ledtrig_mutex and @gd->ledtrig->refcount_mutex.
+ *
+ * Return: @true if the trigger was actually cleared; @false if it wasn't set
+ */
+bool blk_ledtrig_clear(struct gendisk *const gd)
+{
+	struct blk_ledtrig *t;
+	bool changed;
+	int new_refcount;
+
+	mutex_lock(&gd->ledtrig_mutex);
+
+	t = gd->ledtrig;
+	if (t == NULL) {
+		changed = false;
+		goto clear_exit_unlock_ledtrig;
+	}
+
+	mutex_lock(&t->refcount_mutex);
+	new_refcount = --(t->refcount);
+	mutex_unlock(&t->refcount_mutex);
+
+	gd->ledtrig = NULL;
+	changed = true;
+
+clear_exit_unlock_ledtrig:
+	mutex_unlock(&gd->ledtrig_mutex);
+	WARN_ON(changed && (new_refcount < 0));
+	return changed;
+}
+EXPORT_SYMBOL_GPL(blk_ledtrig_clear);
diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 5854b21a210c..9b718d45783f 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -24,6 +24,11 @@ static inline void blk_ledtrig_disk_init(struct gendisk *const gd)
 static inline void blk_ledtrig_init(void) {}
 static inline void blk_ledtrig_disk_init(const struct gendisk *gd) {}
 
+// Real function (declared in include/linux/blk-ledtrig.h) returns a bool.
+// This is only here for del_gendisk() (in genhd.c), which doesn't check
+// the return value.
+static inline void blk_ledtrig_clear(const struct gendisk *gd) {}
+
 #endif	// CONFIG_BLK_LED_TRIGGERS
 
 #endif	// _BLOCK_BLK_LEDTRIG_H
diff --git a/block/genhd.c b/block/genhd.c
index 420325447c5d..fb1617f21d79 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -24,6 +24,7 @@
 #include <linux/log2.h>
 #include <linux/pm_runtime.h>
 #include <linux/badblocks.h>
+#include <linux/blk-ledtrig.h>
 
 #include "blk.h"
 #include "blk-ledtrig.h"
@@ -583,6 +584,7 @@ void del_gendisk(struct gendisk *disk)
 	if (WARN_ON_ONCE(!disk->queue))
 		return;
 
+	blk_ledtrig_clear(disk);
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
diff --git a/include/linux/blk-ledtrig.h b/include/linux/blk-ledtrig.h
index 6f73635f65ec..4ab4658df280 100644
--- a/include/linux/blk-ledtrig.h
+++ b/include/linux/blk-ledtrig.h
@@ -11,8 +11,13 @@
 
 #ifdef CONFIG_BLK_LED_TRIGGERS
 
+#include <linux/genhd.h>
+#include <linux/types.h>
+
 int blk_ledtrig_create(const char *name);
 int blk_ledtrig_delete(const char *name);
+int blk_ledtrig_set(struct gendisk *const gd, const char *const name);
+bool blk_ledtrig_clear(struct gendisk *const gd);
 
 #endif	// CONFIG_BLK_LED_TRIGGERS
 
-- 
2.31.1

