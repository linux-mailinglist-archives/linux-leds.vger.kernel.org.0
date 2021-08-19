Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10133F10AE
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbhHSCwB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbhHSCvs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:48 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502AEC0617A8;
        Wed, 18 Aug 2021 19:51:12 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id y14-20020a0568302a0e00b0051acbdb2869so72454otu.2;
        Wed, 18 Aug 2021 19:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5mjMakUsAY/Uh/ybHnL/303309Iy2FWIDQogSSAPJE=;
        b=CKzXUP9e9H7OnWKRpvxpj9DZggpzSBm9fUyxcGKPKhuDDkyVLNst7w8zLS49jQfets
         u4tb6EORuqkPnRVK5gu50hISvyG/WzA8m+XDzGM71NHZyZApr07bCxToJ4B2v7H61CaW
         JVbse/inPDtaC7KHv2QX7IXFMKiLgrSokBBTyOh7Kf2MSuKOs70SpJbnKVjS8dpceYG7
         gRct/vplsSHmwvF4Wb5ie0JrxoFxonxNt7GenSssHntTS9HFQycxXNnk8whkyninX4Y7
         9u9BffctCML+de4ezoF37vX1MD6txzMwX7yFIukgxw/UKksw0AW/xkXRp7nizsWyuHTk
         w8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5mjMakUsAY/Uh/ybHnL/303309Iy2FWIDQogSSAPJE=;
        b=MoB79Up6ehYIZytUJ5mEon/K7e1ZsowNT3LdrZrU3+yDTH9h3rv4VnrqnmlAop//UB
         ucVYq43Qo/Mxud1OgmUJUQ/KuvQVPj3+zJ93vhSW7bdcClh9nSsFdH9wIe1mpKis18ha
         l9GGRtxdaAOvfm3ePmS7HR23NktpRXI0pvHv/B1xueI1Yq3Tmf9PCw584fE2fEMOS4cD
         4ki43em/xEQZMcSWtWJhKLORjIcaq9vabo60hnQsY/8PbSel5JewUdrCLr/zKTO7rnTQ
         cLnLt63U+juCgiAaBPK2XuI5mDoYNjiqofoPMtM3UHIQnVPNuCtLEgCJvFrp2JXw2AEn
         UOtw==
X-Gm-Message-State: AOAM5331+5d+5dIYM2B2VIkfSBX0lUvNksC/ZWwkC8y6BOwEScxjkIkx
        YSbfXBPAGPaabx+23LmnBxOXP9Os/DZs14aa
X-Google-Smtp-Source: ABdhPJxA7g3i9lB/V607DC+8KFBgYk7tDMorATPY2xOn/FsLNCoYfwiuo6WPuwjqOx1oEdnbYIYVTA==
X-Received: by 2002:a05:6830:2b0d:: with SMTP id l13mr9768430otv.39.1629341471526;
        Wed, 18 Aug 2021 19:51:11 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:11 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 10/18] block: Call LED trigger init/cleanup functions
Date:   Wed, 18 Aug 2021 21:50:45 -0500
Message-Id: <20210819025053.222710-11-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Call ledtrig_blkdev_disk_init() from __device_add_disk() to ensure that
gendisk's ledtrig field is initialized

Call ledtrig_blkdev_disk_cleanup() from del_gendisk() to clean up any
references to the device from the block device LED trigger

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/genhd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index e6d7bb709d62..091b954ddab3 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -24,6 +24,7 @@
 #include <linux/log2.h>
 #include <linux/pm_runtime.h>
 #include <linux/badblocks.h>
+#include <linux/leds.h>
 
 #include "blk.h"
 
@@ -539,6 +540,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 
 	disk_add_events(disk);
 	blk_integrity_add(disk);
+	ledtrig_blkdev_disk_init(disk);
 }
 
 void device_add_disk(struct device *parent, struct gendisk *disk,
@@ -581,6 +583,7 @@ void del_gendisk(struct gendisk *disk)
 	if (WARN_ON_ONCE(!disk->queue))
 		return;
 
+	ledtrig_blkdev_disk_cleanup(disk);
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
-- 
2.31.1

