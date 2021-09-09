Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B3F405F68
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346098AbhIIW0l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345073AbhIIW0f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:35 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB8CC061756;
        Thu,  9 Sep 2021 15:25:25 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so1071222oon.2;
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5IvB2ie/eR/p0ZXjKpNOoLs51YY8X2DxXyaLyjEGU5s=;
        b=O7Lrxvdjp9rmXnWXN6cN3wCovZwHVrpRw+J8dHaOE1IHnLxOyOprFhm6t6nkjJ0XLn
         c3PxliT2pHGWQqNcuht6a3BVZKYFVd3FkYRTXpa4k4UqCCG+ZkPyyTHdbmMsQSc+1Oyl
         3vRABWfn2lUyrAfshml7FY0iuvmcgzlZ2NJNZqPVnUNwhU8kqPxIatF9AJOGIkt7vP//
         S08grsbyjPbrBTkcv37taFMoV53FpoinEskk3u7DjiHeKbQZ3KIPzANwudBLwyua7cIe
         2iKFiSAacrC1RSJ7lujclmKJvzKylL7lRvs7XJdBClyMCYmLIo28iNYEXS9C5QxXxOBN
         FcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5IvB2ie/eR/p0ZXjKpNOoLs51YY8X2DxXyaLyjEGU5s=;
        b=aL0eRcdY2n8/bySCvhJdp8ldr621fSmX+gwMJR4O/npa4PkSoQxx1UDswaIhZlWXuj
         J2aTbU0+Nl/W7628cnn36qD4702cMm8+IiNiV5IpgttgkCcgJlkReJsFtvdjmIn6ynYb
         4Mza/Ra8Bms6PtutChzFr/X77hiaP0RMZU5k9W2MYu7FO09IEOcyxt6rOmHysu5zCRsZ
         hmSemHH5ycMX6qLTcAha5Xa5VlrM5WZq81x1ISG+uwOg8Ba7alogg0/FHnG6kBdQtYZO
         WA/zrslq7MF28X60SkgUJATXZdTJ92HtPHFCHlrX0NkC2YKt9vt4vmnqdTEifPgCQmgr
         0iow==
X-Gm-Message-State: AOAM530AduKtcgUWKuLRgF1x2btp8VKEP66x4vojI9iQwHNphwAf1uJq
        lzSzBL8J3t/K06qiGrFaO70=
X-Google-Smtp-Source: ABdhPJz1DcaFu/ilKPUNbaGKdUBmyHS98IMiktlfW3megURnCIqFZQwdWUaccOOWGIvFcF2QYa5ZSg==
X-Received: by 2002:a4a:e942:: with SMTP id v2mr1798582ood.96.1631226324934;
        Thu, 09 Sep 2021 15:25:24 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:24 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 04/15] block: Add block device LED trigger integrations
Date:   Thu,  9 Sep 2021 17:25:02 -0500
Message-Id: <20210909222513.2184795-5-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add LED trigger disk info pointer to gendisk structure

Call ledtrig_blkdev_disk_init() from device_add_disk() to ensure that
ledtrig is initialized to NULL, in case a driver allocates the structure
itself and doesn't use kzalloc()

Call ledtrig_blkdev_disk_cleanup() from del_gendisk() to ensure that the
LED trigger stops trying to check the disk for activity

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/genhd.c         | 4 ++++
 include/linux/genhd.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index 567549a011d1..6f340a717099 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -24,6 +24,7 @@
 #include <linux/log2.h>
 #include <linux/pm_runtime.h>
 #include <linux/badblocks.h>
+#include <linux/leds.h>
 
 #include "blk.h"
 
@@ -390,6 +391,8 @@ int device_add_disk(struct device *parent, struct gendisk *disk,
 	struct device *ddev = disk_to_dev(disk);
 	int ret;
 
+	ledtrig_blkdev_disk_init(disk);
+
 	/*
 	 * The disk queue should now be all set with enough information about
 	 * the device for the elevator code to pick an adequate default
@@ -559,6 +562,7 @@ void del_gendisk(struct gendisk *disk)
 	if (WARN_ON_ONCE(!disk_live(disk) && !(disk->flags & GENHD_FL_HIDDEN)))
 		return;
 
+	ledtrig_blkdev_disk_cleanup(disk);
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c68d83c87f83..29039367ccad 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -166,6 +166,9 @@ struct gendisk {
 #endif	/* CONFIG_BLK_DEV_INTEGRITY */
 #if IS_ENABLED(CONFIG_CDROM)
 	struct cdrom_device_info *cdi;
+#endif
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV)
+	struct ledtrig_blkdev_disk *ledtrig;
 #endif
 	int node_id;
 	struct badblocks *bb;
-- 
2.31.1

