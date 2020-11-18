Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A9D2B7BC2
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgKRKsg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:48:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgKRKsf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:48:35 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156D3C0613D4;
        Wed, 18 Nov 2020 02:48:34 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id i8so1159392pfk.10;
        Wed, 18 Nov 2020 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zjOvnLAOQsy57cB5qoAB9X0bM5DNCU/FW9wn1RhcsQI=;
        b=cQA07SSqMsNkm9+jgdfKQRHxG1dJ00n/CPBZkWn58B2UztcDBbwJjyqHXGy3WyabKA
         QsAnvdm312LurfVNA6kQFUDwp6lbGW/XB3Ijm2CMoFpKFcAh8kwJhT2mJWgZXG+f6b5V
         /u0hJm50DrM6rtDhiNe6fkM6ZDi+ZlPYg1hTaCkuVEZ+F8D+24p0mRveCrxvJz5QFPB0
         d1VL3NJR2JmYH0Q0gw2vE38JnLqceR+IlWf/7t20lg9BFlJP42QMSyQomQL5JjKhMGcJ
         /qHgGO9SqX7PrgOR+vaq3mCjFmOs+ttNDSWq89Lr9ayPYx6In6L1UeqCrSTrWgbvTgm1
         tdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zjOvnLAOQsy57cB5qoAB9X0bM5DNCU/FW9wn1RhcsQI=;
        b=IQNwB80UuyT5w6aQ9D+0YPNQ+JgZ94iSLopkwvx9OrAJQ0tAM4bQNd1ffl5MQa1rge
         k/pcEMYBFKX5d78ajqMM9mqsx+egEQf9Zrjiy5tYk/gFzMihGvp4n0xDeDIzfIkaAmte
         QmZm0XmV6/+ptElBs4AEeTasVfnSBDrUEaDoec2bQkf86yzflPvvg2zPUjnNEVv2E8rt
         FiE2CmLLSXEKLDdN9fZ/S3RluC1YAylrzFvrOORPYBx/ukTW/r5aSrUel9B6IT31njZm
         wfS/bXYP8uAuc9yoQ5Jv7oUy9PpcdiyFYTyUUgimYRIuz2ebTKcxNqVTqh4d3Ykfr/aI
         AoUg==
X-Gm-Message-State: AOAM533cbGd5pU5PaYNdws2mb4aIq6naYv7fi6wWVbYhyHGD484qwM3u
        8zG8300FiDbPBCXPmQSeUgY=
X-Google-Smtp-Source: ABdhPJwUz/rq6SqpfdNRkMp1aE4THDFn5FSLHfJ5d3S4kzuk11j4GVcZWYerOaT8nTA+a3y17rlyaw==
X-Received: by 2002:a63:c944:: with SMTP id y4mr7482403pgg.435.1605696513712;
        Wed, 18 Nov 2020 02:48:33 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
        by smtp.gmail.com with ESMTPSA id a3sm25345154pfd.58.2020.11.18.02.48.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:48:33 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v7 3/5] dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
Date:   Wed, 18 Nov 2020 18:47:40 +0800
Message-Id: <1605696462-391-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Increase LED_COLOR_ID_* maximum size

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541b..f356b61 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#definitions/uint32
     minimum: 0
-    maximum: 8
+    maximum: 10
 
   function-enumerator:
     description:
-- 
2.7.4

