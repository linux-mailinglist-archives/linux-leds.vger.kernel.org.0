Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 427293F10A0
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbhHSCvr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235838AbhHSCvp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:45 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB78C061764;
        Wed, 18 Aug 2021 19:51:09 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so6844440ott.8;
        Wed, 18 Aug 2021 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BkKk5IdQRzWklzG7HN3qRXs0xk7AxusQvu7aSpQWfNY=;
        b=d35XzzvrkYne8EgQl4IWEEGQcIsB5mM2CgVGd4U2m0dJP0+ttUMD1knAkSdg4UBuig
         c91p2X25gK6cmvA6wExYn298f2n/lpFmWU4XLxy2G7vMthM/vePscjReNCcQHc+5BEs/
         r7lUWYwxjqPcBSDInCVSICp4MJk0nWD8JDP0y1WIUa7i8dR88zJss7VurRa2tTn2e/hy
         ry+tYU56dhhpaEYwgLI1txRcM0dFCdFcdvoQPpAB6Hb+yb1seBIbnWKtVI5hfGzriOBl
         HTTr49BFbX5sPEn6fkiGKUA+LZwRLoz34moSGyQXI77wtm0QhvtoTzV9uX+w+ePhTDLT
         cUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BkKk5IdQRzWklzG7HN3qRXs0xk7AxusQvu7aSpQWfNY=;
        b=N0Y0GH+a4/9wE8bRqmsK5Vse2plZACcXsOdKdCBoOJQJaOr7yX9kd04moBC5lwzsyU
         uwc5Wj7RmNmWyEicVsb9PQRG/+hZdwJN+zF3gmk1zYncKLD5ZIygOiJKDhHSQKiZz1Bk
         LmSHvRZef+rtjnmVTx3+vhtxdGvbMP2tqjxujR1yBk71Wn5gYH1qWeAqi4bQDx+/UHPg
         R4afdwAG5hOTFAWlSqgHAhYUZ7/oRj2/w8X4TVbfGTCPPMvHC4ZuSELxefsVplFNmzdH
         09F7hF0rlXEx45oMlopHyhzvAkeaseP8CEHZB3nR6mvpS2vqOHZBvpzh8Ww9ZJkBMl7u
         xzVA==
X-Gm-Message-State: AOAM5323MovSDNzv2I08wAjbNr23l3wb5Wj18BmjnF4yEW8KjOsCU3m/
        uk/7U3tCbGvYoHVsvMsErkEvxZz/zF+UKVia
X-Google-Smtp-Source: ABdhPJwz+g7O6kNiz8COeZqlifuu0qwV+1TFbFCZnSdwZedt6whhHGs0tQ8q2RTrW8aCsiM67DlT3A==
X-Received: by 2002:a9d:6e0a:: with SMTP id e10mr6439459otr.259.1629341469018;
        Wed, 18 Aug 2021 19:51:09 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:08 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 07/18] ledtrig-blkdev: Add function to initialize gendisk ledtrig member
Date:   Wed, 18 Aug 2021 21:50:42 -0500
Message-Id: <20210819025053.222710-8-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ensures that gendisk ledtrig member is initialized to NULL, in case the
structure was not allocated with kzalloc() or equivalent

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 include/linux/leds.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 329fd914cf24..6b67650d8797 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/leds/common.h>
 #include <linux/device.h>
+#include <linux/genhd.h>
 #include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -599,4 +600,19 @@ static inline void ledtrig_audio_set(enum led_audio type,
 }
 #endif
 
+#ifdef CONFIG_LEDS_TRIGGER_BLKDEV
+/**
+ * ledtrig_blkdev_disk_init - initialize the ledtrig field of a new gendisk
+ * @gd:	the gendisk to be initialized
+ */
+static inline void ledtrig_blkdev_disk_init(struct gendisk *const gd)
+{
+	gd->ledtrig = NULL;
+}
+#else	/* CONFIG_LEDS_TRIGGER_BLKDEV */
+static inline void ledtrig_blkdev_disk_init(const struct gendisk *gd)
+{
+}
+#endif	/* CONFIG_LEDS_TRIGGER_BLKDEV */
+
 #endif		/* __LINUX_LEDS_H_INCLUDED */
-- 
2.31.1

