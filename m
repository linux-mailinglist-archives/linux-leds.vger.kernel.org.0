Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD1A323A3D
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 11:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbhBXKMC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 05:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbhBXKL4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 05:11:56 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD13AC061786;
        Wed, 24 Feb 2021 02:11:15 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id 7so1316714wrz.0;
        Wed, 24 Feb 2021 02:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YePlpvUL0aBMyJueFDdmnssF5V0Rr99NO6Z3UzDVvJQ=;
        b=BpPyliE2SCb85cQ9p1SZPXEp8MmVSLnusWu2HyycnEhWiaYL5dgU9x8BXSLJjsrKUz
         E5ek+uoLPDBTUeaUMMvqzHZXQRCgZ3y/LHnZta/lzi5iJ3GvuhYIgxQyx6uiYEYpHKgd
         R4FRmN6GFURgDwEzgnmr6GWtyViu5WKeIB3VMMYQFF1zluOOJMsFf93nRUKhz+LEfjA7
         1QDLFKqggkuxz9t2WasqUUp04FDZ/A4l4BemLggRaDDRjRPlKHNetewRbSstSr16PU/S
         mPXG9GKgCgFoQaxKjsE2URusGzjbEWEOl5pnCDEWwei7TguDrZxoUwgQC6re35vimFxr
         mCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YePlpvUL0aBMyJueFDdmnssF5V0Rr99NO6Z3UzDVvJQ=;
        b=JKjaam9LYIyYvO9JCfoF0dBBLhMYYvPujoC3kBH0mUkxrt22F7+oqptDq0VtUV36gK
         zPNVMEXf9DYmiwSt0AzK8Bl1zeVAFeGnkCskBgMOXAJ7mnDGjWZBIFiArXa4BlSVQ531
         T/7yk6HObhPLoBh5iqZ8ot8XwaVR/2/25561bfMvMnPh++nZhS3YDCJVS7xdHmSivlpS
         djMCCV6vi+Ts+BsE1DBwfBXK7w5/teI0HivXFpu5zvgy7zGHt4zlDspbviNvhqTMLCy+
         XEfDpGlwgS1pdDtBgW0lm5YI7KZ3Ktvn2mT3hcqdvg8TDwJM3qnzouiTsMYA/vojBzZi
         nkKQ==
X-Gm-Message-State: AOAM533BWPuBXb0sEDrSYK2u6nDkNYP+yd1v2h8zLPCF18DTWFRZXx05
        DYAMWLgrIrMWIk8EqWP1GoA=
X-Google-Smtp-Source: ABdhPJwF4OYHJRx1a4QL8P1yYTtLe4X6EH/71CNBVwU5+twVElih2GpPNYpbw9h0CapGPch/7HElnA==
X-Received: by 2002:adf:edcb:: with SMTP id v11mr9368941wro.358.1614161474326;
        Wed, 24 Feb 2021 02:11:14 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id a14sm2842573wrg.84.2021.02.24.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 02:11:14 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 1/2] leds: bcm6328: improve write and read functions
Date:   Wed, 24 Feb 2021 11:11:09 +0100
Message-Id: <20210224101110.20179-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224101110.20179-1-noltari@gmail.com>
References: <20210224101110.20179-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in bcm2835-rng
and bcmgenet drivers.
Both should also be inline functions.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: Fix comment style.

 drivers/leds/leds-bcm6328.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 226d17d253ed..595da15fc505 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -75,22 +75,24 @@ struct bcm6328_led {
 	bool active_low;
 };
 
-static void bcm6328_led_write(void __iomem *reg, unsigned long data)
+static inline void bcm6328_led_write(void __iomem *reg, unsigned long data)
 {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	iowrite32be(data, reg);
-#else
-	writel(data, reg);
-#endif
+	/*
+	 * MIPS chips strapped for BE will automagically configure the
+	 * peripheral registers for CPU-native byte order.
+	 */
+	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		__raw_writel(data, reg);
+	else
+		writel_relaxed(data, reg);
 }
 
-static unsigned long bcm6328_led_read(void __iomem *reg)
+static inline unsigned long bcm6328_led_read(void __iomem *reg)
 {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	return ioread32be(reg);
-#else
-	return readl(reg);
-#endif
+	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		return __raw_readl(reg);
+	else
+		return readl_relaxed(reg);
 }
 
 /**
-- 
2.20.1

