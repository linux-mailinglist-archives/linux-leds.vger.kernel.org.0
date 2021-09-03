Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFFC4006ED
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350991AbhICUrB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235953AbhICUrB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:01 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13400C0613C1;
        Fri,  3 Sep 2021 13:46:01 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id r26so694867oij.2;
        Fri, 03 Sep 2021 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5IvB2ie/eR/p0ZXjKpNOoLs51YY8X2DxXyaLyjEGU5s=;
        b=YCZigrz5HRASifSFQmQ+iyFnfxeRbHvnj0TYLkOUsnLAgDERauNK3mRpQShZPB1WRv
         u9aAgchJLl8OR2iKIKE7OH723cVvMZDcmpkyISJOq/+zQ6Qf91Bl3PZYI34ddeJsc0y2
         guZanR9DWcpSUb7UIeavVf/KTZL3Hvejxi3GNkG9ePUUM7kjEvraaK6e4AWXVEBaijD/
         Gr1/xdDCJulIGhuUXCqOI2rwrFjNr0uQQqowhO8CaI3orm6Nh5IjG2GPm2n6HgUvJTgX
         c2VxrtOtW34F1P0TpLdwaH4diZNTASpcKudNh5je80YIFwLl2EiskxJahNFxVooUkAyR
         Ve5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5IvB2ie/eR/p0ZXjKpNOoLs51YY8X2DxXyaLyjEGU5s=;
        b=c4lFiXNH1ag0Mth+HBtiLTikYwH01HUjR33/cgBKdG0JjcCjT98C/Hm2PRu8r06OSL
         SkwqPmwumpPx6sV6UejkouYSIdOgObCLSxbvmQsLH64VkDgVoifJbctkcLpQyO6gjtgo
         bwSqTnSOFyMOkwNbU8reiagt6ZJXyZIHoOynchQ2NbHbFj8PNVAKr6k6LMzNmBEdnqn4
         gO5uLXsSPoAyl7dkoDVKqJhlZJjB2VXJZa3iuRQTAAOhAGE1NHVUkh9Fx9ei9JGFH7Rh
         bGha+NV9LScsEDyTbFGjF/dBshYMhNV7C8i5B+DJy7SFccbeBmbyYwzMkfaRkpobn7MY
         xhog==
X-Gm-Message-State: AOAM533fEOF7Jy2DJsVNFHLMuEPGt7CM/dTv71njE7dLexHyy1rWJhRm
        hLZ0QvF37eoKC4GRdVvf/jw=
X-Google-Smtp-Source: ABdhPJyJAaZc/kL+e5qS7AY/S/FKJ4jwSG2ea+uz4iv66JyQAH/tmA+Tr1Nu31C9f2usbgrQhFtmFw==
X-Received: by 2002:aca:f143:: with SMTP id p64mr485284oih.161.1630701960452;
        Fri, 03 Sep 2021 13:46:00 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:00 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 04/18] block: Add block device LED trigger integrations
Date:   Fri,  3 Sep 2021 15:45:34 -0500
Message-Id: <20210903204548.2745354-5-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
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

