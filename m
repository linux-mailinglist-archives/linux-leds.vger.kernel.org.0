Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45684006F0
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351001AbhICUrC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235953AbhICUrC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:02 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C913CC061575;
        Fri,  3 Sep 2021 13:46:01 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so62767oon.2;
        Fri, 03 Sep 2021 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKK/fBeFfvOE99paMTsbD4VeXz4kFfi2EgolsnRk9cc=;
        b=SRfq/VfauuFs1+8uy6apGPMmX4P6c5dHEUy0CO79E97tvQJ+c/FXx4bWS77i/sno4O
         SorVF8Cusbu53IGjE68sEWQCaAhWsQrHrk51ryqGHH++1bf+e1U2hZ/oDMIzoIC2Zc7t
         NuMNzMl1iOQ1+3dRyF8mpvnat7di5tNs4m1We7W3i/mcBCEAXryKlIsrLV5URJDiuu/h
         IL3RuQ3smGR6ahZLtRzrL2WWgI9/9U1t21iE9lW69DFYMpsPG2zVRCPB5xxySCUkJ4a9
         Usrg/T4E0dCEIMPkXzi9Siw23jo+Q2DDX4snqONxYwLPs/gIKHyxzFUVHsvdrJOgBihH
         l5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKK/fBeFfvOE99paMTsbD4VeXz4kFfi2EgolsnRk9cc=;
        b=iatATyk7NP52mB8Gnf9Exv3OoV4iJMx5/0TMDpWnsR0f470U23U4ChCrOrBErnsL+D
         ot0n3jEYxKmBOgRnrSTNPhk4ybAHnszJIor1zwHVFtHi6qgDCugNkKlUwITZNXaIG+VV
         eO96CkhMn/b9m+hytVTN/pB+kqXCHNu8wQ4tygCcpI5mEEs+Vm/ywU0uaL4FAjrBGBgv
         G7JO38HrhSc2r0um0msmDyGU8lKZXUhEiWVscxPFn3h7oZZfmZztu61f7I6pa9n28JP0
         7NndxEAkrYqdRDGhLsEs6198TKHxMFdQ5xuqRly9MRYsw/DcJmvkQsNZn1fZMKnbT22I
         5/sg==
X-Gm-Message-State: AOAM530aSg5KRImN422n/RD8lTyT8ik3sxcRxrRpnP2qMm4VwOSGsGqo
        C9Y/86RcbB8gphkuqSHUf+aqbud9Tq5oJg==
X-Google-Smtp-Source: ABdhPJw8AOqc9MkslD5KWC8CipHSj0DZHMN/PbFmWGM/wXP0RDW3cmua7kobquUbuEakp4dDPcHKrg==
X-Received: by 2002:a4a:966d:: with SMTP id r42mr4545451ooi.11.1630701961204;
        Fri, 03 Sep 2021 13:46:01 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:46:00 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 05/18] ledtrig-blkdev: Implement functions called from block subsystem
Date:   Fri,  3 Sep 2021 15:45:35 -0500
Message-Id: <20210903204548.2745354-6-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Now that the ledtrig member has been added to struct gendisk, add the
function bodies to ledtrig_blkdev_disk_init() and
ledtrig_blkdev_disk_cleanup()

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev-core.c | 15 +++++++++++++++
 drivers/leds/trigger/ledtrig-blkdev.h      |  3 +++
 include/linux/leds.h                       |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
index f5b92d37f0df..102cdbe26d66 100644
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
diff --git a/drivers/leds/trigger/ledtrig-blkdev.h b/drivers/leds/trigger/ledtrig-blkdev.h
index 50b44461d4ab..914fb1523a2f 100644
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
index 5d53921e4229..6cf3c5de5c93 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -613,6 +613,7 @@ static inline void ledtrig_audio_set(enum led_audio type,
  */
 static inline void ledtrig_blkdev_disk_init(struct gendisk *const gd)
 {
+	gd->ledtrig = NULL;
 }
 void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd);
 #else	/* CONFIG_LEDS_TRIGGER_BLKDEV */
-- 
2.31.1

