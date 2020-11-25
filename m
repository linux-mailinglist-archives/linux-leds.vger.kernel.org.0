Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED302C3E78
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbgKYKvc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgKYKvc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:51:32 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399BBC0613D6;
        Wed, 25 Nov 2020 02:51:32 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id v21so912640plo.12;
        Wed, 25 Nov 2020 02:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vKuoXfSjmlab1b9KLwliC6EIUs6pDBR6RvujvSzTHXI=;
        b=s5pJC6u76IHIcIW+3vghtp7beSwJPEAu3vWsiPuzmNtndNaEnWLLAu8HgTqFZi4t0/
         incmpH7aLGfxucVeunw4FT/sWoaXr4F9yOdNV7iipC7K8WnqhFGSljbqXNei9XzFyISo
         aEPUlJHwGftgl1skytPCLvFdd2lYM1lbsq6cjvLTwhfB4SzcRqZayrHSZB7K9Qix7vCg
         OufoAlpgi5qPNQIZwNs3SZoVDOWUagAPqpQtiaT41PuNieal5xAB9MtNQM1lc4Mp/V5t
         RX8F/Oo0EWFYSuQIdZL+UpEbgXvdTaJ05ENEzNR6WtbXCvW2XD2m45RSyRwMWYFbsal8
         fcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vKuoXfSjmlab1b9KLwliC6EIUs6pDBR6RvujvSzTHXI=;
        b=FZgBnQFirEUxL724M9I+igmUD+OovMgQX/hJYzJLvDBDQkKYpsil5dppEz7+C7jbJp
         wQPTWLMhd6cuRcTxXDcBf8yo6xlqZjQA/IkTWYKnhWhP7GZXNjOCwDasPcvqjupSvpXq
         5agRziCtWysK0zioC+fW5QfFetfpyypF06WSu2i0sZR5DwNPAxqyc38jWDBgNbL4ZvsX
         kbbv8zznDDRcZ0UdNrFp2xGrWah1LTCs2AeassubG9BHfrvig3M/EyCMBB/fs9eW/den
         0bnnWDBXo/w5UTnwYNhhgvO6IiXXEdBpRwnAmmE8ulw73xjCnrMaHMWHUxy4N2PehoHU
         Kgsw==
X-Gm-Message-State: AOAM5318Uky7R/6i6pD5UXGSktzTYrtA3hnIxJRrDLYJkF0/ClL/q4iF
        CAmPy3m4yxExYUeKy8OFX8M=
X-Google-Smtp-Source: ABdhPJzgWtL4JcZhK3GJoCWvYsE/dDwzlsM4pjaOlCRdRsHUYX3FbFsKQsJJmKajI3FCO54GGsriKQ==
X-Received: by 2002:a17:902:469:b029:da:17d0:e755 with SMTP id 96-20020a1709020469b02900da17d0e755mr2535168ple.53.1606301491875;
        Wed, 25 Nov 2020 02:51:31 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
        by smtp.gmail.com with ESMTPSA id j10sm2049520pgc.85.2020.11.25.02.51.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:31 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v8 2/6] leds: flash: Fix multicolor registration no-ops by return 0
Date:   Wed, 25 Nov 2020 18:51:11 +0800
Message-Id: <1606301475-7030-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Fix multicolor registration no-ops by return 0

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/linux/led-class-multicolor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
index 5116f9a..dbf3832 100644
--- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -83,7 +83,7 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev,
 					    struct led_init_data *init_data)
 {
-	return -EINVAL;
+	return 0;
 }
 
 static inline int led_classdev_multicolor_register(struct device *parent,
@@ -96,14 +96,14 @@ static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mc
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
 }
 
 static inline int devm_led_classdev_multicolor_register(struct device *parent,
-- 
2.7.4

