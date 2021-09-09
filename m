Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545B1405F6A
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 00:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346078AbhIIW0k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 18:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345132AbhIIW0f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 18:26:35 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3850C061757;
        Thu,  9 Sep 2021 15:25:25 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id p2so110469oif.1;
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B9eeaudGo2vbFyWuC9u2+X8O9/8e4JqvbQd9kXidz48=;
        b=VJiBClSMfBlHzr8KKo1MdKbKQu8spCbPJM20BXrrcl2TsNjuyAa5R6kgVNwImtYJKz
         kDpDTgvQUfpaeV5CyeYTFUCa2ij43x0y8kwMMw/8DHCLG/dFnk9n1P7aUFmZWV4S3kiz
         NJBkObuvo3r02k822cu0tLcNMAuInst03Kgt3ieQw91SbeSNHJVGxXOxy2U7ynPcnmbq
         clJ3PrUKVHk6/Qt/b7aKs0A+37XYh3eacH/fMRaHsROl7pMpD5lmwc9vKsqrBQlLDriZ
         2mZmuN2JuuQ6JWIcRMgvmM8KxN8xZJoyRGE+TPQqYAv5tbbg+YDNpsD5sZRLFmcwAD/B
         URQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B9eeaudGo2vbFyWuC9u2+X8O9/8e4JqvbQd9kXidz48=;
        b=iJF6n+wBrV8oPuRU5Bx8nrUCILP2xisvtaF93AHFOICER8ZhWfSbVcBPMQKzYr8m7d
         MiDa6glXxpbJWo3MIwhOFl5ZVGNGkfOq///SaV1/a2KeITb5k4Uu76HNPSuI1+8BTGbp
         ReoTZDn+3KFFhG64NXqRu/d+dsf7r+r/3ghMFcRzmt5aDxWqJUM7kom92ZPzsdkW/PrM
         WfebToxllCMH8XP7Pqg74pEZOVS4BIIaAw5Bo2QdWdAnHW1FI83ArK40Ux65xTEfp74L
         JRxfCJ7066kYFNGcCuY+XZxGv+0TUq/RY+R3SPggqQpLsnDIqM6bX37NleaFUXsD06Tw
         kj7w==
X-Gm-Message-State: AOAM531LL51b6yPqRqc59cOo1KIV7TZjVuVxv9jsubVg8RC3d0eCyPSB
        ccBw1ULCzFhWbsi6laSaz+A=
X-Google-Smtp-Source: ABdhPJzEf7GjMQ0hi0um2SRAf+sNVmkJPJL1ZvuVeDvcDUr5bf3pTq20DcH9zTd0/ZShLPpxyctwAw==
X-Received: by 2002:a05:6808:483:: with SMTP id z3mr1750372oid.5.1631226325435;
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 4sm747293oil.38.2021.09.09.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 15:25:25 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: [PATCH v2 05/15] leds: trigger: blkdev: Complete functions called by block subsys
Date:   Thu,  9 Sep 2021 17:25:03 -0500
Message-Id: <20210909222513.2184795-6-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Now that the ledtrig member has been added to struct gendisk,
add the function bodies to ledtrig_blkdev_disk_init() and
ledtrig_blkdev_disk_cleanup()

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev-core.c | 15 +++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.c      |  1 +
 drivers/leds/trigger/ledtrig-blkdev.h      |  3 +++
 include/linux/leds.h                       |  1 +
 4 files changed, 20 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
index b0a455180b05..d7b02e760b06 100644
--- a/drivers/leds/trigger/ledtrig-blkdev-core.c
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -10,6 +10,13 @@
 
 #include "ledtrig-blkdev.h"
 
+DEFINE_MUTEX(ledtrig_blkdev_mutex);
+EXPORT_SYMBOL_NS_GPL(ledtrig_blkdev_mutex, LEDTRIG_BLKDEV);
+
+/* Set when module is loaded (or trigger is initialized) */
+void (*__ledtrig_blkdev_disk_cleanup)(struct gendisk *gd) = NULL;
+EXPORT_SYMBOL_NS_GPL(__ledtrig_blkdev_disk_cleanup, LEDTRIG_BLKDEV);
+
 /**
  * ledtrig_blkdev_disk_cleanup - remove a block device from the blkdev LED
  * trigger
@@ -17,4 +24,12 @@
  */
 void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
 {
+	mutex_lock(&ledtrig_blkdev_mutex);
+
+	if (gd->ledtrig != NULL) {
+		if (!WARN_ON(__ledtrig_blkdev_disk_cleanup == NULL))
+			__ledtrig_blkdev_disk_cleanup(gd);
+	}
+
+	mutex_unlock(&ledtrig_blkdev_mutex);
 }
diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
index b615a8bf38e2..7f85e6080ea1 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.c
+++ b/drivers/leds/trigger/ledtrig-blkdev.c
@@ -6,6 +6,7 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/leds.h>
 #include <linux/module.h>
 
 #include "ledtrig-blkdev.h"
diff --git a/drivers/leds/trigger/ledtrig-blkdev.h b/drivers/leds/trigger/ledtrig-blkdev.h
index 6264d8a9201b..b1294da17ba3 100644
--- a/drivers/leds/trigger/ledtrig-blkdev.h
+++ b/drivers/leds/trigger/ledtrig-blkdev.h
@@ -9,4 +9,7 @@
 #ifndef __LEDTRIG_BLKDEV_H
 #define __LEDTRIG_BLKDEV_H
 
+extern struct mutex ledtrig_blkdev_mutex;
+extern void (*__ledtrig_blkdev_disk_cleanup)(struct gendisk *gd);
+
 #endif	/* __LEDTRIG_BLKDEV_H */
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 38fb8b6e68fe..3925499c0b3d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -613,6 +613,7 @@ static inline void ledtrig_audio_set(enum led_audio type,
  */
 static inline void ledtrig_blkdev_disk_init(struct gendisk *const gd)
 {
+	gd->ledtrig = NULL;
 }
 void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd);
 #else	/* IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV) */
-- 
2.31.1

