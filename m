Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6272CBAFB
	for <lists+linux-leds@lfdr.de>; Wed,  2 Dec 2020 11:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388736AbgLBKry (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Dec 2020 05:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388717AbgLBKrw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Dec 2020 05:47:52 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE09EC0617A6;
        Wed,  2 Dec 2020 02:47:06 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id i38so790986pgb.5;
        Wed, 02 Dec 2020 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
        b=LuL/ISrlnUyz61vEuqciCm8pEDG2XCpxAW5g/Y2wyQXl8B6Cjgl5MiXtSPZE8K1GVN
         x4jQF8ewGW6ACZ9H9B5rLcTTh4q2s7ar+6RUWxhqWQ1wFsYZY1LQjEMSn9JDR4UgiGNh
         sExYEcHbclUNDkAERBB4DrYD97dmTO6h21PLP4tCSsg5CqRmHCPzTIBQFv5xespkkGsA
         8XSXgpTyY409JILJvmzutm+jKP/G2ymOhwaikjF8QsiIAHu1C50D/ma8UXWRkXt7xpI5
         wJ/Y6QsWZQ5jrhFsoDIHE+JN1mP6pfvZYGHznLWK6hPEBftjon6hgyVOqYXZlI+8Yz3O
         tGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
        b=Yfj2J8UYb60vgHRLjikXZLHLllXUs4onSJH0m/NbA37fewN3Wuy5dQizQPjdnaDhbj
         8BlWpO3izT7sLJ9QUCA1E8VBmhISn4k9WJ8UkAN4V9/QP9vH5wwsY+QD1tzK98RVQ1Y8
         phCPUndmkMLPuLCF/jD++9BZ7CVwsRVNqBkoQVzR7cyyKCnm9wEL67qMNzxzKXBYF4Vh
         doVIhVC0Ri4GJ4wpgVyrwvU/r5udYYsSucsnWSeY3k4rVLkGWaumf7qYRQvWJiX9jSoE
         CGhEgIZmAUwhzdkCj//i/XL4AcTFrsRectLim1MuKG0B0zAdYhDr2wfHeC15Srixumgm
         daUA==
X-Gm-Message-State: AOAM533+lVw25zlRHSENQf6dIzRKNFJBwMEOjvHI18I9k8nzkj/fhRGZ
        npno0jyO3lYVJ0HbXSbtuJiov4zbvVstVQ==
X-Google-Smtp-Source: ABdhPJyeY2WV1nLUcEzBdz84Q6ciSbRyG3hkgQz3aYDs6YblKSXhLv1wGLdo94QUyXRbe4tzOmj+TA==
X-Received: by 2002:a62:e212:0:b029:19d:8cff:f179 with SMTP id a18-20020a62e2120000b029019d8cfff179mr1635734pfi.44.1606906026411;
        Wed, 02 Dec 2020 02:47:06 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
        by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.47.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:47:06 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v11 2/5] leds: flash: Fix multicolor no-ops registration by return 0
Date:   Wed,  2 Dec 2020 18:46:48 +0800
Message-Id: <1606906011-25633-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
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

