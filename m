Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8BC4006EB
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 22:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350987AbhICUrB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 16:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350971AbhICUrA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 16:47:00 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51706C061757;
        Fri,  3 Sep 2021 13:46:00 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id m14-20020a4ad50e000000b002912a944a47so53421oos.12;
        Fri, 03 Sep 2021 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NNm8UV+NJ/s6uGLWClpSwEu83DssbVn3I+chz3NRB0=;
        b=nYR8Pw5XZyQayzbXEwey3+oMRPG0fTFlrZRaPJYu4DJfpIFbSajDBvltlKpxu0ifge
         qCHpfzCsZPtWfJRXTAC5v80TEK6cMiYxH1a0gE3C/IIGb10E8wdelo0XCHO085OqoetT
         5xNiwe22fqdSM8TJl7zip79oy1jgbzYUDDpXzoZ3sARgRZPUAId7UY03j81lIFXXSNrx
         vEtr+RpJsphBGmeBkpdsWL4oHaTUHzQX5q1UuBkr5zmL3pb+neTre+I/WYCNpU+8z4Lg
         qlsqPbBo5UOITfjNJ81xcShFRrmS8+dNmaxLKh48w+zpyEmXR3/Z3xzg+J7+ItqWfS+z
         cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NNm8UV+NJ/s6uGLWClpSwEu83DssbVn3I+chz3NRB0=;
        b=WmOLCNTDljEaliRQ0DXyiq8SwrgPdPhD5fuNYI1lAjJRsOUuYP9Xc+SXY+VW0au3GS
         pF4R8dMhUc6o8LuMVs4JyxdKa3BwqU2VpCSF+9jg3wRn1zNUB+MGaDZWra0BY+LgPlfQ
         wBQDD5yYuecV6f8+wT0MiSwe66rwzV4Z4l5g859sXeMEn1VHETUfu7S2BsbEioE4AgAw
         yYILFxBmb8Hqnjj9fSRhNraS5C7MqgM4Ga5EPcnVw63O/xNGmnYxAudOP7XqZwqMcl54
         JjESmV4m9TnVRtAP+mD+UCVKwEnsHUnnOpOBnJhw99qbaY9uyNeUypgHiYR4/ExvNBDl
         G+mQ==
X-Gm-Message-State: AOAM533Y77Z3t1LHhX8ujNxUwzr+2FPkbax6r7xWBuhkMgXkcXadvBJt
        izPWgUeYQiJVca5LkQm87v8=
X-Google-Smtp-Source: ABdhPJyabuCrCZz4NiJWv65TjdVZndPyUien4ErM5hTT3ZFxyA64avQnRkULN5TWfcv1zePVbhpjCg==
X-Received: by 2002:a05:6820:16a8:: with SMTP id bc40mr4556576oob.63.1630701959730;
        Fri, 03 Sep 2021 13:45:59 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be5sm90023oib.10.2021.09.03.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:45:59 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux@vger.kernel.org, gregkh@linuxfoundation.org, kabel@kernel.org
Subject: [PATCH 03/18] ledtrig-blkdev: Add function placeholders needed by block changes
Date:   Fri,  3 Sep 2021 15:45:33 -0500
Message-Id: <20210903204548.2745354-4-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903204548.2745354-1-arequipeno@gmail.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add ledtrig_blkdev_disk_init() and ledtrig_blkdev_disk_cleanup()
placeholders.  (Implementations depend on block subsystem changes in
next commit.)

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 drivers/leds/trigger/ledtrig-blkdev-core.c | 11 +++++++++++
 include/linux/leds.h                       | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
index a126c7fc0f9f..f5b92d37f0df 100644
--- a/drivers/leds/trigger/ledtrig-blkdev-core.c
+++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
@@ -6,4 +6,15 @@
  *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
  */
 
+#include <linux/leds.h>
+
 #include "ledtrig-blkdev.h"
+
+/**
+ * ledtrig_blkdev_disk_cleanup - remove a block device from the blkdev LED
+ * trigger
+ * @gd:	the disk to be removed
+ */
+void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
+{
+}
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a0b730be40ad..5d53921e4229 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/leds/common.h>
 #include <linux/device.h>
+#include <linux/genhd.h>
 #include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -605,4 +606,22 @@ static inline void ledtrig_audio_set(enum led_audio type,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV)
+/**
+ * ledtrig_blkdev_disk_init - initialize the ledtrig field of a new gendisk
+ * @gd:	the gendisk to be initialized
+ */
+static inline void ledtrig_blkdev_disk_init(struct gendisk *const gd)
+{
+}
+void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd);
+#else	/* CONFIG_LEDS_TRIGGER_BLKDEV */
+static inline void ledtrig_blkdev_disk_init(const struct gendisk *gd)
+{
+}
+static inline void ledtrig_blkdev_disk_cleanup(const struct gendisk *gd)
+{
+}
+#endif	/* CONFIG_LEDS_TRIGGER_BLKDEV */
+
 #endif		/* __LINUX_LEDS_H_INCLUDED */
-- 
2.31.1

