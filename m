Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5529E3226FC
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 09:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhBWISU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 03:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhBWISS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 03:18:18 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8B4C061786;
        Tue, 23 Feb 2021 00:17:38 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id c7so4866901wru.8;
        Tue, 23 Feb 2021 00:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNEw5+KN/m9CFj7d9waUxYOFKIXM7YhrKD+xb21xU64=;
        b=psiBN/V+prGRoutioxbXUUfUKvFc27265OGNjYreAdo/hf0ULLM8HWcAABYSKGQ09J
         LkHN1Bha86AZT2mA8vu4iUaHWqGldOVmQpQ7nYN5Xxg1rhCXuTbijw5/iUMp8VyjHEV2
         fK/pC9OaYn8fWVRWtBi1S89y5i+HHO/66Cxtf0JvnTB+ndmNfoW0Ro6OvW+CE8F0gAyJ
         dC91zs9voWHUTcusUafYEPRW2Zw+TB/2uQkQ2ZTgiNm4C9uvOlF8GHj+PYfT+PuIQA8k
         7O5KY3nWWBB+G1tx/auQvOMNKeLQpJhEzkCkJ/SuRjykuW8pnyqX+/wTZxQZpIMtwpDC
         h3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNEw5+KN/m9CFj7d9waUxYOFKIXM7YhrKD+xb21xU64=;
        b=mNngCPDJO3GnPtUYaPHUDPApFegPV8ffNEpm4q2RO26CMBE+u9nmK4CY+iTHbdUZKh
         YdMu8c0ovlgvI0RUD3+zWypEGVk1CH9mDgwEy4vhbaWgA+xWGyADNOEV+eH7T+AW6wL7
         CYAglQdbPNtotVe8CpRzDa2cczefoFCIkkH/fqUeSRRYulTdw4OQ+dJqt2+jsmbpaXvV
         UjVpqF3g8SkdNuusQlkJ7klqBRDwyMNiy3o/+kG9oQgS/Cm6E0Ceg+BeoDgroejiLGFf
         F5lEWFqYIz0DtcD67JxPGXRkJSRHwmf211kxoPLfPwxeSQh3TCe7e3bgm3w07xhPbrWD
         46dw==
X-Gm-Message-State: AOAM532DeokHKvNZ23IkDwoLpLL5acdA6yfOpYInE8cYobemuMnM8N6u
        la3BIhN1fyHFU+I9U4w/7vk=
X-Google-Smtp-Source: ABdhPJzWZ8u66kwr7i68LI1VtR0JJAsn2a+sBN7IE2FzPmW88cHjal0NdZ2CBWHtqkqG3OjKPK83WA==
X-Received: by 2002:adf:b611:: with SMTP id f17mr24561268wre.8.1614068257013;
        Tue, 23 Feb 2021 00:17:37 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b83sm1903753wmd.4.2021.02.23.00.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:17:36 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/2] leds: bcm6358: improve write and read functions
Date:   Tue, 23 Feb 2021 09:17:32 +0100
Message-Id: <20210223081732.9362-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223081732.9362-1-noltari@gmail.com>
References: <20210223081732.9362-1-noltari@gmail.com>
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
 drivers/leds/leds-bcm6358.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 9d2e487fa08a..775b8c8b562a 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -43,22 +43,23 @@ struct bcm6358_led {
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
+	/* MIPS chips strapped for BE will automagically configure the
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

