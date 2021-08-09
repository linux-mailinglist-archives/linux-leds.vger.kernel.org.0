Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDDC3E3E64
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 05:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhHIDde (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Aug 2021 23:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbhHIDdV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Aug 2021 23:33:21 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA35C06179E;
        Sun,  8 Aug 2021 20:32:57 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so5605239otl.1;
        Sun, 08 Aug 2021 20:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jYD0I1JcL0BH0vCCzrjiH0y23RAOPCoB1MhwiKSdk1I=;
        b=ASwNRcZC+WslkMmnYkzKeAg3z3EdGFgbbNCh31jouaKVo60A66evSpkvvLRWbhw+5g
         nIxp6BJ+01A7BQZ+UxzSo2yFWVCtQn7mVg/tr93Q4V35bGHssqSPJf4XS8cVQ/jLxId+
         C2xa9ZsEMKYB1hbS6WzLr2lJXzEe58ij8m148DOuQ9uqhuELQLOTxwSOtwwPv7h/9Yqd
         Uf/lGePC7NMPiDt3EShFA8vO9bPmxpemnTIZO4WfCQ5iV2tfygJwCiCr2l3C6wvTU7VZ
         NlFjMC2rbG6YyoXWz9LvgaRTZHAoQK3u+OqovsGJcXU8FZT2SBtRc6ZCHd5v5CPNhGTF
         NlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYD0I1JcL0BH0vCCzrjiH0y23RAOPCoB1MhwiKSdk1I=;
        b=b+4+YwlOEm67fpWc0ezLeh02lKOvuKq1d2tqMq5OqPc3ZiRTJrdKwZmvdsKiKFLpAV
         RPvZa76djgP9tdElRWaZA2Ae8ah4MlsYjsRwC72oDUHGWWSjZ4MY7KgQ2mUCYGyjuWjq
         jQ2WNbV23huEP3GrpfKsN80XOf78MgS7pLJyn5lpKX4XjFpAQQYHUKdG0/NZzPx8xs+/
         27ust1ZnZXipbmIVSMPGRO82XcKnWwhSp0qoA5OI31/+lB4HJewz3nlvPSGF26VsMzeS
         pDiXA8Bbf5CzZYzmyWQcDu08IrNSf9d3LFtQVk6szve5sCXi/owdfqr3ejk30yh8gxNm
         9Huw==
X-Gm-Message-State: AOAM533nJVqJn7UnUc9F4NxaoVFuG83RDAEy4V3IeAZamoHQHCO57/2A
        YX6powhQogULnjEbknCVcl5F9wlwIm0dv8tF
X-Google-Smtp-Source: ABdhPJznv0VzS5EFBDhxNOvRXEEZpBoNS4yw7oHByexjC6HrCWiHLgymSQWFvxuqHAhXUc10JmKamQ==
X-Received: by 2002:a9d:5e0b:: with SMTP id d11mr15767902oti.371.1628479976891;
        Sun, 08 Aug 2021 20:32:56 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r7sm1463646oij.14.2021.08.08.20.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 20:32:56 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v2 10/10] block: Add config option to enable block device LED triggers
Date:   Sun,  8 Aug 2021 22:32:17 -0500
Message-Id: <20210809033217.1113444-11-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809033217.1113444-1-arequipeno@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/Kconfig  | 8 ++++++++
 block/Makefile | 1 +
 2 files changed, 9 insertions(+)

diff --git a/block/Kconfig b/block/Kconfig
index fd732aede922..ef05b36b5251 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -220,6 +220,14 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_LED_TRIGGERS
+	bool "Enable the blkdev LED trigger"
+	depends on LEDS_TRIGGERS
+	help
+	  The blkdev LED trigger allows LEDs to be controlled by
+	  block device activity (reads and writes).  See
+	  Documentation/block/blk-ledtrig.rst.
+
 menu "Partition Types"
 
 source "block/partitions/Kconfig"
diff --git a/block/Makefile b/block/Makefile
index bfbe4e13ca1e..bcd97ee26462 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
+obj-$(CONFIG_BLK_LED_TRIGGERS)	+= blk-ledtrig.o
-- 
2.31.1

