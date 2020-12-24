Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEC32E2381
	for <lists+linux-leds@lfdr.de>; Thu, 24 Dec 2020 02:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgLXBsY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Dec 2020 20:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgLXBsY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Dec 2020 20:48:24 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6501BC0617A7;
        Wed, 23 Dec 2020 17:47:44 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id be12so584719plb.4;
        Wed, 23 Dec 2020 17:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=b6VtEooOcj6G+Yzpi4yuJN2Tk/SCa/SppLvqNgEo58oVrEjCAz1l+tZ7p2qxpJdQo6
         w6tXHlyTmRCrgh6d0LmrA591KKa/9pf+/B3wSV2LYhzMi6s11w90sJMKum9lzVj7f765
         8T1YcRYffdY/7PJBIEceM7+/YqnyoNk19x4gcUMGZcNfJXlmP/HH3D3HUDq9xMjvQh4p
         kunYYB7no+7ptTFO9yko5kfUjD6qcGJZRNmftBjQ5fk2BV3vBb4YU7uRRxYzOz4Jx9AF
         71BV9zna5T2aG1XekV32MPfwHLhjFIXoEulg37C20FOwWjIsYTk+HyFpMWf9UqegGFYK
         iTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=MquOiJOi1CH1jxbrEPFj0yKdFrr75zJn0pJFlQj7oSrTZaXS53XNF3FuDE+89smY1Q
         h4WnA9/G8c6w3whLFJ7GTDDCR1Q9/2Pk2AQFW4+44oiHh8Y7/HXos/XLnGRWWgRt5/Ns
         BM0CWWE8/4S9VMEEBevZzkNBFCSe0FYjeoNG6H1w2zkqBj+C1vF51qVVF3A9Or2uvD5A
         JwRJd8fNC2S0lDs0KI0CTuV8TkFeUEBNDCHV57Uc5og2875yBX34YYmstKH/rXDfeokK
         DF7GMgD6veVVjOUyU2KGdxw9AtInUdRiJdr4uGAlB1DDSEuomxR0vmysgNvXrUqpJGJW
         sbXA==
X-Gm-Message-State: AOAM533VM82L8L7Gh3y7wFYevWpZuBJcMB3U1KHWH1BCSkJfcBUAZRKI
        TE1E+1rLNRXWXxi6F+l1ztieYJl1WlOQUQ==
X-Google-Smtp-Source: ABdhPJxqjoQSL0T7GEFa+YhUWjU5wOryKoVWZIE5tSsZZdXdO6a/pSWx+KIYHbCiwtadTy/Zv0l7IQ==
X-Received: by 2002:a17:90a:2e84:: with SMTP id r4mr2153362pjd.147.1608774464055;
        Wed, 23 Dec 2020 17:47:44 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
        by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 17:47:43 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH resend v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Thu, 24 Dec 2020 09:47:18 +0800
Message-Id: <1608774440-21655-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add LED_FUNCTION_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d..843e65d 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -78,6 +78,7 @@
 #define LED_FUNCTION_INDICATOR "indicator"
 #define LED_FUNCTION_LAN "lan"
 #define LED_FUNCTION_MAIL "mail"
+#define LED_FUNCTION_MOONLIGHT "moonlight"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
 #define LED_FUNCTION_PROGRAMMING "programming"
-- 
2.7.4

