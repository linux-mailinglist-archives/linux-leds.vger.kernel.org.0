Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8FC2E237C
	for <lists+linux-leds@lfdr.de>; Thu, 24 Dec 2020 02:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgLXBsU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Dec 2020 20:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgLXBsT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Dec 2020 20:48:19 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBF7C0617A6;
        Wed, 23 Dec 2020 17:47:39 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id q22so432695pfk.12;
        Wed, 23 Dec 2020 17:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
        b=eBgxRBB0KRgn8u7GYCIB0UCfgreqvLGU/UL4FLCxZeCRQ/LtTC/4AdEO7TmR7b02U8
         K3FJK80AKQ9N87H5pNyBHwojP1KPuKxSdlnfBa1bKTfY2bf7ZKw9+AY7A5sLt8+wLUmY
         oImuWUKb4EDYCwIvA8++SaG+291y1UhN8h6uNnvecsJF2gCr8Hd4YSsHzEViMz45/42D
         QMXYJQGE3/V6LCi/Q3RxXHtxkfZP7guFiNerw0xEwfwoBCiUA/QqrXc5vKBcmy83GqeL
         baIYMZREt1xRqJeTpi8VrmaPAhmhkE3KgwBs4gUtMVlwKCAaxoATh31CNlA/A2scaO6m
         +wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
        b=OZ0kcOY+eedXAtKRMSYFBKqpuQMQNeQjaYDDd9iStGb/OXXYhGVMQK9VTxYBSGHegv
         rwCiWB0KYYZvvcrfIWWdn7gXVp16H+R6AMI9h594Ft9qfJsG5HEzoDFpMIStVqpbAGim
         Hgc++l6uvFVUzEjF09TfLUoBu0szdgR0abt/ss6SQOC3yvalF9+Ip25StTN2L9dKoSQ6
         eBrClI+2pzKcK2VquqgOm4gq/vs+Wqz2gDA94RgHXCHBLsLiLHT1FzgUen1dn3v2Ocem
         GiGHduo0kVMKzgccYu/oJauULf3q12Rb+XNqCf6YolhNHR4VHvgYPEGiC7N9e3HK/UcU
         Vz0w==
X-Gm-Message-State: AOAM530tke8j7cZ8dIyk/kqlyOsyXeJHfp43j6703/YYu/Xyz5ZAopPS
        B2ZRVFl5VSBubsxhElhu4cw=
X-Google-Smtp-Source: ABdhPJx62bVe82WYr6hgjMs1G6eeoXDGGKeKDFiRTGKlweti7hgXQmHETwa5vmTDCxJX9NiciZKc3g==
X-Received: by 2002:a63:4c52:: with SMTP id m18mr19470746pgl.280.1608774459106;
        Wed, 23 Dec 2020 17:47:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
        by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 17:47:38 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH resend v13 2/5] leds: flash: Fix multicolor no-ops registration by return 0
Date:   Thu, 24 Dec 2020 09:47:17 +0800
Message-Id: <1608774440-21655-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
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

