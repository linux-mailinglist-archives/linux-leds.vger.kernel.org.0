Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B907323A3E
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 11:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbhBXKMD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 05:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234851AbhBXKL4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 05:11:56 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F0DC06174A;
        Wed, 24 Feb 2021 02:11:16 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id w11so1283419wrr.10;
        Wed, 24 Feb 2021 02:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xio+fpATjQPBtlCF5IdCsyWm8QAS5cdYxc9ta78hmOY=;
        b=jSV6iSSFXACjKaQ6XT4veg+fhoZLvyUwkcv+egAGAxXSZgTpD8vGu/ksgm2MQ0h04z
         KHaVPwhnGjwnj3MBXi9PsuihHDKjH7xxaobIPFMU1vcG968mn7/aymmd+kRdJSIyoU+8
         B+zeoTXFSz0hzTZR52z+90uzZZCJtCrOoVyzGBeiJSzLfRCnlPy9NIQ2uGy4Xvj5RriQ
         fLAJzolN3HlUL84Qj7XCOTIQZzCm4q/Q5mJIYfhgn/uuReEmWTZxl1EI5FgJje6z2bZ3
         4mUwcP4JTNDgWyfZZUCzx/1N/gQyo0AO/5zbOpSw5pt1SGLdJhmRjv9xDD8VMj8R1h4i
         hn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xio+fpATjQPBtlCF5IdCsyWm8QAS5cdYxc9ta78hmOY=;
        b=GWL4WLW4eiajJiiMNLlNAoDSLFSACjEUbna+C/4AG3Nk7BSTVY1ThdaplCBy2UFTVT
         WHhVtnpAOEP7m+75dGRSFsYGCTTKC9/oFEZujuQIvjr7i3vUhAyAV9xZ0WqvaNkz3LUt
         zFYuOBsImNPJDoeSTbskiLjrd8SinFsBar3UwjzKUBNeysTC2pCDD3/AhUx21z0to3OO
         Mtuo1KAnVMFIT5rMzZqhqOfPNIqfvH5HI4UbFbNwQTOAwEH+XdAHTzHH716oKixCryih
         Sx+fCTn1HRs+9u7ObIdi9OVqxUNVQcaAE7V8j48ukX68bsb2ZZmS5qUVWyHkSyvngk9m
         XgJw==
X-Gm-Message-State: AOAM532oQB148z2UHKo7zGXMGeRyE/jJLiSJyRq31DDJuFwa8YZmORjI
        KrwH8eLRSJG2Gfi+8Q6Fwy8=
X-Google-Smtp-Source: ABdhPJyevah7TqE1RxFVZP342lOb4KWaEPUF444YdhMGECQgMsv0J4n2Ocs7PFAAdly8tE67Zyt6nw==
X-Received: by 2002:adf:8445:: with SMTP id 63mr31322644wrf.222.1614161474911;
        Wed, 24 Feb 2021 02:11:14 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id a14sm2842573wrg.84.2021.02.24.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 02:11:14 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 2/2] leds: bcm6358: improve write and read functions
Date:   Wed, 24 Feb 2021 11:11:10 +0100
Message-Id: <20210224101110.20179-3-noltari@gmail.com>
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

 drivers/leds/leds-bcm6358.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 9d2e487fa08a..37d27b7c58a8 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -43,22 +43,24 @@ struct bcm6358_led {
 	bool active_low;
 };
 
-static void bcm6358_led_write(void __iomem *reg, unsigned long data)
+static inline void bcm6358_led_write(void __iomem *reg, unsigned long data)
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
 
-static unsigned long bcm6358_led_read(void __iomem *reg)
+static inline unsigned long bcm6358_led_read(void __iomem *reg)
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
 
 static unsigned long bcm6358_led_busy(void __iomem *mem)
-- 
2.20.1

