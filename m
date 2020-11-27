Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B7A2C5EF2
	for <lists+linux-leds@lfdr.de>; Fri, 27 Nov 2020 04:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392314AbgK0D3P (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 22:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgK0D3O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 22:29:14 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8276C0613D1;
        Thu, 26 Nov 2020 19:29:14 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id q10so3295033pfn.0;
        Thu, 26 Nov 2020 19:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=enRX+fjbiOGGszFGSnN0VRhBHLDbLaaj7qo38qYIjAI=;
        b=EGT7XCmS5lTUdHmeqfrZIO4IWmxjObU5czb2nM/R7RBir8E4r9Za6wL5CcugTpAXLi
         LjF7zfgU+FK8lz2FDQVuc4KBaH0NjRHglL5/5iXifoj6DGMpG7YPuFmRXfBpBMNVBHez
         XUn7v9fD1Jo+WgTmuB2XHLPfgAYAyeyJ8XhTCEMBvQdfBniuel2rR/NuoKzwjSTdZB88
         FKndA49/ITSdIKBgyckfe6NEz4Ypq2/9AUPvKbFSPWTg1nreyj7v3irpTXCkNOJuIupZ
         wQvsaIgdJcH7r29+R3chdJ5iRUhANEkHkLHSSyd+ELQ1vUBF5mo+ypTYwD+TelMrLG/D
         LMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=enRX+fjbiOGGszFGSnN0VRhBHLDbLaaj7qo38qYIjAI=;
        b=iLBZx3qCocpOraLW2wfoslHxgBKYDBkgM58crwyUoNh3XCNcHDkWBhW1EjMY/+lLlB
         Z/y0buAj9gWZ0XZsRKPaWPZk57JR0hFgj7Y5XK/0mrxsMzXYmYFK0iu3NyobI8r1Dskr
         HQh9L8TN5G0uiDZeCgAn0fSjj+DI1CQk/FXQ4UsDffj//r3ws0YMlyui2n9y3oBNq+l3
         9RIpEv0kQhJax2vNkEv5ScUn7SyMDb9vxx1Hl2XN1szcJiVBTlqtqZu0j6OiN0ajT7cF
         qY4+M+i2kELnZsdQ28RCSnFpNkd8VMMbyLEI5cq69ntFiBxsXCQThzCUpjq7m6c7GRv0
         y4SQ==
X-Gm-Message-State: AOAM533M6vghcj2eJSImQVzLfBPWJ+K17+fGipMBMOnbz2rUtPLAcrWR
        ybkaqohKu08CemV8hx1Cklw=
X-Google-Smtp-Source: ABdhPJw35Au4zu5W5qUVCPqy6Zw1EA84mDfVySoW4hNMOu+dCTgJjNxqibYGG06/mf3drvVZttLFag==
X-Received: by 2002:a17:90a:3d48:: with SMTP id o8mr7298488pjf.103.1606447754456;
        Thu, 26 Nov 2020 19:29:14 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
        by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 19:29:14 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v10 2/6] leds: flash: Fix multicolor no-ops registration by return 0
Date:   Fri, 27 Nov 2020 11:28:52 +0800
Message-Id: <1606447736-7944-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Fix multicolor no-ops registration by return 0,
and reuse same registration functions no matter multicolor class exist or not.

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

