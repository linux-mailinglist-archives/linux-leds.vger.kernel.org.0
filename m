Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07352DFB34
	for <lists+linux-leds@lfdr.de>; Mon, 21 Dec 2020 11:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgLUKwb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Dec 2020 05:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLUKwa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Dec 2020 05:52:30 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0B4C061793;
        Mon, 21 Dec 2020 02:51:49 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id s15so992621plr.9;
        Mon, 21 Dec 2020 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
        b=Rvi8S3q04e64MbnS9vKgfT49gzFSnZRQ0NCdKTd1OV75XAzbAfkL6GVdVPw7QR2wc5
         pNUZqhZ6t0lNO6dKcNsNKKvwPg1NEBcQQRpXdRSBNIcIkNUg0Qn0lUenwiBLP4rAXocN
         kiETbaFQdtMRSt/h0Vw/J2xPbjQWW9cWcpZLWcdDKoRJloblvLFfP1EV8jk1l8Mg6p0x
         mcQ4a7+1v4C7WdelIJ0tnt4m/AbTlTW6gG0/5YidOQ/U8U4ppiu9qhF6BhUVObl4upNk
         5YMmJ5vnoMrJ1TUWlhxsXtq63l5hkAaTG1Q7k0pzLB+LqreJCGQnieFJMVbBugS9YHSG
         ywtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
        b=XfubzXUYizUYPUcJLD4zHiC8ASYLL6YhLp3bHOE3dNftNCtFQ46qI+PawKYAj6HEZA
         bbnM2i+CtsSI99/43JGTn4O7grFPhUrfCkb1iCi1DgPyrJzye2ZpPiwFbfG2FZdY5cPU
         o2MSEVWmmWSIx5dTLmY+9a/CEttnff35ENsWh8R2M2AyzI/wUF2cCNWA4wkmbGxfyHP0
         5S8cT76KjpGF0qajLCRiOPXHNQdlugDNK9GWNCKXpxjjKT4dtp+BU8JcoTgDNycD4BNM
         cYx0X87A2shjQDI4M7YIYdrBeaX+Mqe5oO3K2CKKFQMTUK7iHP6WFF/7FDVrNnQ0dF1f
         WHdw==
X-Gm-Message-State: AOAM533pEWT6kw5vbHKwZQAre+mGTiP4jwV90RxB9OzLuiWVYD7XFEMp
        2GfgYo0bRMTP578cQoUIl0g=
X-Google-Smtp-Source: ABdhPJyb2042q1smVmDkkxxMdqhSISG9Ezvv+4QX8nFX5aKAXyioE/se9Hnf26RimffTrgyJxg2kvQ==
X-Received: by 2002:a17:902:7596:b029:da:b7a3:cdd0 with SMTP id j22-20020a1709027596b02900dab7a3cdd0mr15610064pll.14.1608547909466;
        Mon, 21 Dec 2020 02:51:49 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
        by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 02:51:49 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v13 2/5] leds: flash: Fix multicolor no-ops registration by return 0
Date:   Mon, 21 Dec 2020 18:45:51 +0800
Message-Id: <1608547554-6602-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Fix multicolor no-ops registration by return 0,
and move the same registration functions outside of #ifdef block.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 include/linux/led-class-multicolor.h | 42 +++++++++++++-----------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
index 5116f9a..210d57b 100644
--- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -44,12 +44,6 @@ int led_classdev_multicolor_register_ext(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev,
 					    struct led_init_data *init_data);
 
-static inline int led_classdev_multicolor_register(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{
-	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
-}
-
 /**
  * led_classdev_multicolor_unregister - unregisters an object of led_classdev
  *					class with support for multicolor LEDs
@@ -68,13 +62,6 @@ int devm_led_classdev_multicolor_register_ext(struct device *parent,
 					  struct led_classdev_mc *mcled_cdev,
 					  struct led_init_data *init_data);
 
-static inline int devm_led_classdev_multicolor_register(struct device *parent,
-				     struct led_classdev_mc *mcled_cdev)
-{
-	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
-							 NULL);
-}
-
 void devm_led_classdev_multicolor_unregister(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev);
 #else
@@ -83,27 +70,33 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev,
 					    struct led_init_data *init_data)
 {
-	return -EINVAL;
-}
-
-static inline int led_classdev_multicolor_register(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{
-	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
+	return 0;
 }
 
 static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
 static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 					       enum led_brightness brightness)
 {
-	return -EINVAL;
+	return 0;
 }
 
 static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
 					  struct led_classdev_mc *mcled_cdev,
 					  struct led_init_data *init_data)
 {
-	return -EINVAL;
+	return 0;
+}
+
+static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
+
+static inline int led_classdev_multicolor_register(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{
+	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
 }
 
 static inline int devm_led_classdev_multicolor_register(struct device *parent,
@@ -113,9 +106,4 @@ static inline int devm_led_classdev_multicolor_register(struct device *parent,
 							 NULL);
 }
 
-static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{};
-
-#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
 #endif	/* _LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.7.4

