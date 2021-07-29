Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EECD3D9B4E
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 03:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbhG2Byk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 21:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbhG2Byf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 21:54:35 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CD3C061757;
        Wed, 28 Jul 2021 18:54:32 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id y18so6368257oiv.3;
        Wed, 28 Jul 2021 18:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IXsGqm421WCEa+uNZfI8JQ6N8WTvSJdhDMDnpsXLO40=;
        b=sbO+GKQPOuYSoVEj0dWJThzQL+8BSjmWLzmMbnzB9QZaarb4p4F7qJUSyPP4lPWic+
         xUEJPigJ03l7hMB2zpGHSllrSoxJKyatDiLfPd+WUfgDygXFVffOV1TZKLl5jWXwZlse
         jrQKTbmyNEE7yqaH/LoYy6v17yks+Q/UcEAasqxVYch+QOrzxFyIj1bYLYtvlqG1TNbn
         JcEfcQC+uKWF7pGiAkAG1ClCUHojl5dkcF4BcZvWss9eAF8TIGVjz0iybilrdHNc4EhS
         sPmmqQOsjMs0IcuD6mJr1k2D0dG+cmNEJsOUHXc0Ud0Wdc4xVm/PO+H9zAWs7fCCHpQh
         LuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IXsGqm421WCEa+uNZfI8JQ6N8WTvSJdhDMDnpsXLO40=;
        b=nlRO+hUsJ9uEotn+ELaD/Hza1QLjLYJrBfYtk35521jymNxq7RGSQWgnhx5i4pPm6p
         GmxYDHyENbQPF6XEjpow7rqdamlQW9lD82SMcp7kZGWwIIWBBFttY7swWLjPfDJ4s1Rw
         gNMxGYifxFVMyeTCbEN9iaTtOopBnofwdIefVOwhRell0Gono81Te6omBMRJaXju8EPG
         iqVGoVzIGVzMrqKLlK2+Pj0puYMLs1M2uWpE4f4pxlqk32aZ0Rpq/zN0chAE4iakXCzJ
         18DXNkQ/+9vxKOqj+PpPe0sRaToXF+ff4lDp5vR+Otbvduswhr+PCil0++8NdPsjpLxC
         UMbg==
X-Gm-Message-State: AOAM533BHOqDbqHK57QJzCl5pCA7Z9ENEWdrcbfHKX8l+n9r+P7/4Ysp
        N681OCIb1YlaDO8Ac8Vr6WabaP0v++nSvz+q
X-Google-Smtp-Source: ABdhPJynUEtutX2shrkIN9s2qUx8+ygnzu8SLmc3+T0FSAsIUtMwMV62UOTZ7ZfUyPe4Qa3IHsW9Yw==
X-Received: by 2002:aca:fcc3:: with SMTP id a186mr7975388oii.105.1627523671883;
        Wed, 28 Jul 2021 18:54:31 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id c11sm311424otm.37.2021.07.28.18.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 18:54:31 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org, Ian Pilcher <arequipeno@gmail.com>
Subject: [RFC PATCH 5/8] block: Add block device LED trigger info to struct genhd
Date:   Wed, 28 Jul 2021 20:53:41 -0500
Message-Id: <20210729015344.3366750-6-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729015344.3366750-1-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Initialize trigger info when device is added.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/blk-ledtrig.h   | 7 +++++++
 block/genhd.c         | 1 +
 include/linux/genhd.h | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
index 894843249deb..5854b21a210c 100644
--- a/block/blk-ledtrig.h
+++ b/block/blk-ledtrig.h
@@ -13,9 +13,16 @@
 
 void blk_ledtrig_init(void);
 
+static inline void blk_ledtrig_disk_init(struct gendisk *const gd)
+{
+	gd->ledtrig = NULL;
+	mutex_init(&gd->ledtrig_mutex);
+}
+
 #else	// CONFIG_BLK_LED_TRIGGERS
 
 static inline void blk_ledtrig_init(void) {}
+static inline void blk_ledtrig_disk_init(const struct gendisk *gd) {}
 
 #endif	// CONFIG_BLK_LED_TRIGGERS
 
diff --git a/block/genhd.c b/block/genhd.c
index d0b1d8f743ae..420325447c5d 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -540,6 +540,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 
 	disk_add_events(disk);
 	blk_integrity_add(disk);
+	blk_ledtrig_disk_init(disk);
 }
 
 void device_add_disk(struct device *parent, struct gendisk *disk,
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 13b34177cc85..3409334c9b4c 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -169,6 +169,10 @@ struct gendisk {
 #if IS_ENABLED(CONFIG_CDROM)
 	struct cdrom_device_info *cdi;
 #endif
+#ifdef CONFIG_BLK_LED_TRIGGERS
+	struct blk_ledtrig *ledtrig;
+	struct mutex ledtrig_mutex;
+#endif	/* CONFIG_BLK_LED_TRIGGERS */
 	int node_id;
 	struct badblocks *bb;
 	struct lockdep_map lockdep_map;
-- 
2.31.1

