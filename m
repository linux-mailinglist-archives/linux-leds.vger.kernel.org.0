Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936E42C5356
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 12:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387853AbgKZLxY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 06:53:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387600AbgKZLxX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:53:23 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B2FC0613D4;
        Thu, 26 Nov 2020 03:53:23 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 62so1536668pgg.12;
        Thu, 26 Nov 2020 03:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
        b=TxZnp9EEKj1GWsDhJ5bzUL1FFWUksdJ07SGVOVtK+eUCdtflTx0DH0HP7AKZo1xXge
         /TCVIn0JjeLSjRTE1QKN9PjjisDUtrnX2vJqr31endeGW/DnYhKCBbNk9X5uMt/51mQf
         Pgz5XuYSOJRvFbpNu3sqUj2sYiZlifdvH3iGlPGUKbKp3mFY6kEZliIkrE1sOBba53vd
         OV0fjKiZlW8HIsadc7Apus3je37TVR5KfDrJxsrTB7whvI9hS6QC8i8U503vGBxKsxHa
         hC0HNy6DiOo7g5RN2KL6qz7g32MNtbnEpB+whrpbXWcvhMKIAyEdxV+StiW2M7Nw+jEp
         1ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
        b=c/QQv+sVL0TTVUQzdwJ22xMeIPaHzZVebp63d/4VUPg3q3rTEH8hCye63CMEQDTj82
         Lw1Lro0HY6jhcK58+W5pkvqMhLdSdy0NNNNh27PLXrLPOY0fUZkq5B9Vg771Esad6+Mc
         pU/G2OObhxSNr9yaDPQE7DwpdzDZ/phbecEDFq3xF0GGfwJHxGReV/uegGX4lo1pp6Pi
         9CbTUp/XGCA0JehyOsS0hH9z50UaO8aEHqkLMt9bKVlstoWP834ZORIp7QftOv+aYtn3
         Xt+KOEntqIwIihPGZJ7Z9ODgpx//o6HUUTAEo18iueAo0xEA3JA+h3kwXGA/bwiDcYRv
         b7jQ==
X-Gm-Message-State: AOAM530w2YtCprgo/Ux4PLbAZ6doemKuFv3ctLu5a7iI5cqdoBcBg1q8
        k0dOjSDhqyHW9xTo+Qdy5HY=
X-Google-Smtp-Source: ABdhPJx+KiR9rXRtoRf1/iQ/w47KqjvKuGz+YtSpLuqMd2uSMB9voMZ/xGsHYbw/ayXrIZchFpysTQ==
X-Received: by 2002:a17:90b:1918:: with SMTP id mp24mr3135741pjb.45.1606391602773;
        Thu, 26 Nov 2020 03:53:22 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
        by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 03:53:22 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v9 4/6] dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
Date:   Thu, 26 Nov 2020 19:37:32 +0800
Message-Id: <1606390654-6075-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Increase LED_COLOR_ID maximum size for LED_COLOR_ID_RGB

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541b..0c9f912 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#definitions/uint32
     minimum: 0
-    maximum: 8
+    maximum: 9
 
   function-enumerator:
     description:
-- 
2.7.4

