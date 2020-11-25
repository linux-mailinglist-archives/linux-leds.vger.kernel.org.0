Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD93A2C3E81
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgKYKvo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgKYKvn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:51:43 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438B7C0613D4;
        Wed, 25 Nov 2020 02:51:28 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id t18so940186plo.0;
        Wed, 25 Nov 2020 02:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HdfyyrxnElJwDt41ZW/Dyzf78ymH1BXPai7vmDeW4Ts=;
        b=m4UOb7/VuH/ZpMia0pBkb2WT64Ij3iHzjUmoXIe0t8RPFuQEDl0r7AyTk0NcMWm6Dt
         h/P9kYiwx9872GvQe7T8PQlVevCi6IhnYBVrhDly1rWST+s7gxzRU6QL/6Gf1Dr+Hd93
         DT7DAMZrp+RYNU244figNQnEYOdHMa9aokj81lSMrs1q4fnuYEDs/Bl9kp3plKUz1X4U
         CbvvaO6KReoAl2Lrtz0Mj9mnuoBMRI7XrLPib3mIkYtKPjrE6uk86TGiISEuvqMlstsS
         ixRXUnEMf5vfUKl9DbNzEVnxEYMpH42F27vO/TF2rEmJ2DZD9euD+jRhxAqPEoD3Cjs4
         4Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HdfyyrxnElJwDt41ZW/Dyzf78ymH1BXPai7vmDeW4Ts=;
        b=cRo0u5+OiFSZVyLzsXaQ/l0aj0m98/Gy+0tQMvNkZhXQHOZNb6UW7QmLTkk/bgR4EC
         OD9SIVuhZWBZm8+smpaPc4rQlf1wuyOLqoks+DiJYdmkn1BN4ylV9/ZssOJqf/9qLR5A
         okCi4p6+XJ6iFt+igOxIvUpum4o83a+BZnMzEQa/2hblDLFkAzt4r5Vao/GFOZMg5cQJ
         69XykshefyOgHz0/51hC3QPzt2so0eAyQJcpODuBK9PXPzCCKjRiMPvtLg0GiAWZLuJx
         XkOB8AvRDXwY8cM+knV0X6Y+a2YCO+Oibt1POaQzaAvDH8cLZhuEFQPps/Lw+zNk75Gj
         5hUw==
X-Gm-Message-State: AOAM530QgTUwy09m/SVEYn7uSq+uSpTKvDKvyfVMeGMQ7MvnPpkgNdI2
        vfQNoawalMqBOQFoMmHrKjs=
X-Google-Smtp-Source: ABdhPJwynFK/qp9LVcEP18rNXNCg2T/QIUC6iHWSoWqS09knnetHnfVquPSLM9sLRlkCqggDKFoUvQ==
X-Received: by 2002:a17:902:b283:b029:d6:b2a7:3913 with SMTP id u3-20020a170902b283b02900d6b2a73913mr2706376plr.54.1606301487900;
        Wed, 25 Nov 2020 02:51:27 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
        by smtp.gmail.com with ESMTPSA id j10sm2049520pgc.85.2020.11.25.02.51.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:27 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v8 1/6] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Wed, 25 Nov 2020 18:51:10 +0800
Message-Id: <1606301475-7030-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21a3358..5f36eae 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register(struct device *parent,
 void devm_led_classdev_flash_unregister(struct device *parent,
 					struct led_classdev_flash *fled_cdev);
 
+#else
+
+static inline int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline int led_classdev_flash_register(struct device *parent,
+					   struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
+static inline int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline int devm_led_classdev_flash_register(struct device *parent,
+				     struct led_classdev_flash *fled_cdev)
+{
+	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+static inline void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
+
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.7.4

