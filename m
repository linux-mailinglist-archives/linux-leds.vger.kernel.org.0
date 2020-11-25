Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEFB2C3E7E
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgKYKvk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgKYKvj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:51:39 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F61C0613D6;
        Wed, 25 Nov 2020 02:51:39 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 131so1927936pfb.9;
        Wed, 25 Nov 2020 02:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
        b=bTkEAlNdfgadrGnjzxHjZzVwFW0EJEYJkB0ibL8YpOkC8fl5JKii37NIHGO59oqBd2
         WJMsrPmfeYLprG0UIHzFyXEvaYa9bdMEgzzeOAvdcoKlr8E71bB8FQkp9yM0wJCXJmnD
         xp4wxIxO5YDXvBk+4LrApKYcz2DEZaBOj3Keuc5+ETqovP68RfgX0K3XQIoUMVVqFZ3+
         fxrjfvyiQx5uR/XvQVLsHDuE2D8k0yC8bRNnNtiC8NgyThuWQ8IP/IhCKt3ETYLETB/Z
         RsA2jd6TOMYCem4VuMWAmE6EGxFmzOee2+1M8skLwOCtvFDAsnrLES/pfgRFTfXslWkD
         nDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
        b=FX7dfcAJTKDvr4BcHkOimRHYMbf2P7eqYz4gdNUred2+oH54QT2//Ph9k88/ti16hM
         OAIywANuh5ftGZNDmgWOdJVryC+8IlrOd0QZ1o9UBXZYYuMVO6f6j9ZPiEiXHcPaYKt8
         lNfmDB5NNTlY8ZQeOpyq/cKkLKdc6hn2kH5rg71yIzkghExwM0hzXr4cEU74MAD47FP4
         s76dNMUwcIooormRMdTH7HTiSJfj+xC/ALlGJD2RVac7nVr0cTRxwf5bYBZPNjbHAJbf
         D7t5mjQuKxMG8Fm7dlCBtZV1/tTS5136GAwBrjbNBGltKGUOKMsK1aob/T6a1Mw1zS77
         egug==
X-Gm-Message-State: AOAM5315uHD50NNlt++0vhip81ErN9D7ynSL5aiI6UETHy/6x/jbxH5r
        W5aN98OWF3tC+nE6CNh9rMk=
X-Google-Smtp-Source: ABdhPJxkCo2NB3VMtqBYMczVycJrUhJPChTbNkRn1v8GR5fyek9rkb0/e+ltHQy6gV+XGKSIz9tfKQ==
X-Received: by 2002:a63:443:: with SMTP id 64mr2572625pge.127.1606301499549;
        Wed, 25 Nov 2020 02:51:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
        by smtp.gmail.com with ESMTPSA id j10sm2049520pgc.85.2020.11.25.02.51.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:39 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v8 4/6] dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
Date:   Wed, 25 Nov 2020 18:51:13 +0800
Message-Id: <1606301475-7030-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
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

