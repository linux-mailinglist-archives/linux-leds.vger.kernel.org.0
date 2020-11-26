Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3AE02C5350
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 12:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387685AbgKZLxO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 06:53:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387600AbgKZLxO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:53:14 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07988C0613D4;
        Thu, 26 Nov 2020 03:53:14 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id s2so1029828plr.9;
        Thu, 26 Nov 2020 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3BWNY6k7nFQ7p0nfAV1cKk+CDrVkR2e3P0EQTHCNigU=;
        b=XjRCEolab0HfL6dD3Q/7pNnNFP+rARej+4BkOsYtsaOMLjUlWlsv1K0mVDiZfTbK4V
         HPgpXr7+tEOwij/Q/05N0+7ww0fc4dxmNgDR3VTigqVJGHUZMW4pDhGnyMDaLjrc1mrG
         jKFT1471FWPHSB9An7rXhIHk64E3azxay1kjFlXlDYr4TEge8AqqHSLZimFneDMuTYGl
         hgaeWH8sr3Zj5NUdhLRcIgZt15NCME6fRfdKouWkMWH2Uzn2wVqQZSx7wludhliTjIjz
         cIlrFHjSiEkXdjI8Icnkw/x7OO3lMqcgI7YaJn3fAYzDyYQEfb7n+mmtPpdgbmAsipP/
         oKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3BWNY6k7nFQ7p0nfAV1cKk+CDrVkR2e3P0EQTHCNigU=;
        b=gDWGEiIKA5UsN7Os8lVzhpNPcEzoPX+It1QFZjTGfjn4z1PKZRehgxgxUKa3kkfzD3
         mnOSKK+a7qC1G1LoaMychPAquUNRh2vxkEZ3bLPb5c3iEbkxmmbPGUw3qEYrtaiRZhO9
         QdktWQd0Z3Mqg7f+EfQM6FkkVapP8irXKvG+0IIcUAebE+ZYmwN52NketN1q8xI6QWWK
         iUMJfs8gb4B9s6TusOJ/nuFuwOb+QjMb0Y3HBlUUhipcxrEj/n4f3Ru0snPZAuWZpFqe
         nl9RSvCAKxzMGMvg8WGzH7WgTxcRUeiswqH5zPDVLefmoiu8Zh9TQjairvvzZ8Q0/y1B
         qUVA==
X-Gm-Message-State: AOAM531YRBEpdMYIVbyUsdW6CEKpwruz8lJZS4Ld9pv6qZeat1baUFBH
        x1Zb98Eyk9pvrZYsVxSd1XcP1Cgf4Do=
X-Google-Smtp-Source: ABdhPJxqYpqCBkJukZyAfwknCBx+NtEQKNYEf9VzSUZ/BsjOAFIQPJpAsna+bLS0MMX6qz2v/ZGLFA==
X-Received: by 2002:a17:902:b58a:b029:d7:d45c:481c with SMTP id a10-20020a170902b58ab02900d7d45c481cmr2487745pls.55.1606391593618;
        Thu, 26 Nov 2020 03:53:13 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
        by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 03:53:13 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v9 2/6] leds: flash: Fix multicolor registration no-ops by return 0
Date:   Thu, 26 Nov 2020 19:37:30 +0800
Message-Id: <1606390654-6075-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Fix multicolor registration no-ops by return 0

Signed-off-by: Gene Chen <gene_chen@richtek.com>
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

