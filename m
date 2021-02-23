Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7673226FA
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 09:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhBWISS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 03:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhBWISR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 03:18:17 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4CDC06174A;
        Tue, 23 Feb 2021 00:17:37 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o82so1524669wme.1;
        Tue, 23 Feb 2021 00:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IrbHtC63Y40ZjumDhwEmL/0NBUxd16jsImdAf305wn4=;
        b=TeM1legDO9vD3cvML3F+sSsOZVkEZmmmyH8BCWt7hRTnalcL8bKvbFaHQb5S90ziI+
         S1mYwMUmM7rzDYkQghk4GO0cRC1FZVXJbCKD6rWBhhiQeFpbBudaEwIndiHSIAa9xUKF
         wvKKO+xk9vaR+DfbSZxbgtBd3iBKMsdKu56bSP4+OPhRWvmlhww8YP/LIAL7EgFUZUKE
         VcOHklPtv4gPANjYW9oPRgqUgn5S2ob7n3XYX6vsfSF64rqGbBYH612UtHN+h/Kd5x7l
         vN1G7u/HCZaZOZZ9C/R/+2sBiX7dE4x+6KqwG7MSE7f6oW/T0CfsL6z+7u9KSMuThY91
         LVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrbHtC63Y40ZjumDhwEmL/0NBUxd16jsImdAf305wn4=;
        b=jwSzMs6l4Q6kCugjbC7G4VLeA0QIuSj1SU18k+BAiwiwlOf3x7JV0EixnvXwxJ05jL
         EU1QZxpU4IzjtbCWDUzvVGkXYVvbmVzwYTehFLHEypP6Q2WLPeeJ0kK1sCCT1PgFZcFp
         koR3jH6OPvNjhD3vNdzbyvtZ4oq8u3WOi7sxZ83QakX4IJQwfZMB7zGp+PZfsh7yv4q6
         AKSgDDSgu4f31bqH4OSvvzGnsSXnStOLMuXQhOiZGa6i79tAyN6WAdK37X0npXjyuXam
         KClL4rIQkpbnpOMm1H1UA6D8qo+9NnL70YZn6CfG+vkqUe4yWzsw6x5QeyoIBunnOU5B
         U88A==
X-Gm-Message-State: AOAM531tlhSPU7PNJnM2aBXA4oV0oAKYoU9nzWY13huj0mhKpj/a71Qb
        8z402XF2CalhDYwjAe2vLPw9vt3q8IhjIA==
X-Google-Smtp-Source: ABdhPJzFEHzmwkLtbqIgzH7vgw0ADtEkVvVToBbImTJBaw60Plqv7nGkchJ+ZNnQFwC5omDKfBScSg==
X-Received: by 2002:a1c:e905:: with SMTP id q5mr24015250wmc.84.1614068256053;
        Tue, 23 Feb 2021 00:17:36 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b83sm1903753wmd.4.2021.02.23.00.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:17:35 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/2] leds: bcm6328: improve write and read functions
Date:   Tue, 23 Feb 2021 09:17:31 +0100
Message-Id: <20210223081732.9362-2-noltari@gmail.com>
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
 drivers/leds/leds-bcm6328.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 226d17d253ed..112c9c858432 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -75,22 +75,23 @@ struct bcm6328_led {
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
+	/* MIPS chips strapped for BE will automagically configure the
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

