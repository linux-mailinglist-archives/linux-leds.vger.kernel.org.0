Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1CD3F1093
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbhHSCvm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235746AbhHSCvl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:41 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC5EC0613CF;
        Wed, 18 Aug 2021 19:51:05 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so6844263ott.8;
        Wed, 18 Aug 2021 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VB+baDa9o7QBYGGk/mOq5L0ZVoeaDiRYIRcxi/hAPFM=;
        b=WCUXl+XhEcacaKGATrA0KhVNljLVCbZOhtVf4LLxwbgmArictmIyRRaV3cK3TnyIKM
         Qwo+vhcXG9tDKAhK+UHDSTI6KaRjNFEsDSG6SxnrfM3Cdy5/BHSrB/Ys67uMO6a7mPaE
         LBNPtjEPEIs8k0xr+vynoknFYsdSCNSEFEB872mk72bjjOAuwCuEH1VbMS5Qzv0U43Lv
         HkOAo4UeJ/lpKS+vu3oS7ZU0Ek351ZtjkspNE32IXc7s6Yi0JbZmRa/yaYd+tv/ZFUqF
         qlh4qZ9Rc+7HOja0yjtE4gJpKQl22gkLQ7C036FjyuDMvGYv2/3f/2w02xWUxBJC/OkK
         2sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VB+baDa9o7QBYGGk/mOq5L0ZVoeaDiRYIRcxi/hAPFM=;
        b=q7W6KV5fpXfu0h7fuMPdADDKjCPPdBZcSzh7jMHJNLFfYH61hY8q/cCSLwnv8KCPIx
         L5s3OBDm4yIIwOItqB3vyOv/YbnTEh6zftBDmyueDfqWO4Q7MdJj5hdWysmbZVBt0/58
         39mNnAczLkU2MlRcM1T/FtYoz/j7XIMcg2f6+4dMvQtQvjGA+fek5uaDi709XiRbElcD
         2V0LHzxxiNWFPqyTmUYhlwBIiDgpN3wE7KbGXBsA62MzPECaSZWXPJsqPdeYkrCbM7vR
         lcZGe/IiE0nKY5X6RsMDdECiJ8o3tUk8cbHZ79PKPfx4nQd+Bg2VW6p2JflmN8NVKGwb
         XvPw==
X-Gm-Message-State: AOAM53009fpPz/r76is4SuU3Ir1pae+NoJIrLipEZCjMna78ZWZSbpel
        Mt8ei1J2O/3gJxM65eUGD3AHYd/8GxainqRJ
X-Google-Smtp-Source: ABdhPJwoaFZji6/oDadqjC5RCzefm/AYQBsuP/lp5448Yd0r5LflzybTLSICxFXmrqu4zpxMmxjxQw==
X-Received: by 2002:a05:6830:156:: with SMTP id j22mr1371657otp.75.1629341464884;
        Wed, 18 Aug 2021 19:51:04 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:04 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 02/18] block: Add get_disk_by_name() for use by blkdev LED trigger
Date:   Wed, 18 Aug 2021 21:50:37 -0500
Message-Id: <20210819025053.222710-3-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add API that gets a "handle" (pointer & incremented reference count) to a
block device (struct gendisk) by name.  Used by the block device LED
trigger when configuring which device(s) an LED should monitor.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/genhd.c         | 25 +++++++++++++++++++++++++
 include/linux/genhd.h | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index 298ee78c1bda..e6d7bb709d62 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1362,3 +1362,28 @@ int bdev_read_only(struct block_device *bdev)
 	return bdev->bd_read_only || get_disk_ro(bdev->bd_disk);
 }
 EXPORT_SYMBOL(bdev_read_only);
+
+static int match_disk_name(struct device *const dev, const void *const name)
+{
+	return dev->type == &disk_type
+			&& strcmp(name, dev_to_disk(dev)->disk_name) == 0;
+}
+
+/**
+ * get_disk_by_name - get a gendisk by name
+ * @name:	the name of the disk
+ *
+ * Returns a pointer to the gendisk named @name (if it exists), @NULL if not.
+ * Increments the disk's reference count, so caller must call put_device().
+ */
+struct gendisk *get_disk_by_name(const char *const name)
+{
+	struct device *dev;
+
+	dev = class_find_device(&block_class, NULL, name, match_disk_name);
+	if (dev == NULL)
+		return NULL;
+
+	return dev_to_disk(dev);
+}
+EXPORT_SYMBOL_GPL(get_disk_by_name);
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 13b34177cc85..b26bbf2d9048 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -342,4 +342,14 @@ static inline void printk_all_partitions(void)
 }
 #endif /* CONFIG_BLOCK */
 
+/* for blkdev LED trigger (drivers/leds/trigger/ledtrig-blkdev.c) */
+#ifdef CONFIG_BLOCK
+struct gendisk *get_disk_by_name(const char *name);
+#else
+static inline struct gendisk *get_disk_by_name(const char *name)
+{
+	return NULL;
+}
+#endif
+
 #endif /* _LINUX_GENHD_H */
-- 
2.31.1

