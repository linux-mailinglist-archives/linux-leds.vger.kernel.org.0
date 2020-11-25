Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9192C3E7D
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgKYKvg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgKYKvf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:51:35 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB27C0613D6;
        Wed, 25 Nov 2020 02:51:35 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id l11so935118plt.1;
        Wed, 25 Nov 2020 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WG4D2tiQF6AFMb6tNX1EXpM5C5fu7Z8QRdWNSLMkGcA=;
        b=dbkXugIXmomhr1J8RXRX8+D9hoHp9wUSbj+pxnAqlExuIoG2BsPNnAcsjQkXlJyJp+
         yZow225tjQE9U3UsKwYyB0sK7nEo3zEm7DMVRl4g309UfVbqfL8b0U+aNP8/Rc9vOz8G
         sDXXC/6nEh1UkN7VEE01X3JVONzs9afP/NX0Cvx2UEjhjkR9ku4Teu1iAfvC0icJXas/
         L/jHCACJN1CskOR3PK0pFmNJ9ajCjiodGQmopgaqH9ho2nXI47CrOl596u/RIlNhbZVa
         3w12Fmy08eieY93UBtaZbkrTPlLJurnJZ34g6sWuaTBwsJZmjNLWYUoOYRkIgWjOK2cf
         uC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WG4D2tiQF6AFMb6tNX1EXpM5C5fu7Z8QRdWNSLMkGcA=;
        b=sjnx00dq9iL59fCMldpA+gATp/vh2/GxBJTnezHWMKTE/HpZGqGZaYsJHx5eekG/zm
         01HrM8w8FcGGkDadM5igbIxLTiPIkr30fLKuDViVVlqvVIS9tf1W0CLZXZLFFpV5ExPy
         mjZN+KeaYQvP6TjwpzjUW/jXN4LmiqtRx88/uVVrkRDitu6v7UYlkz76IgS/vUx7JbNM
         Wpt1NdUKhAgr1mBYBefKir81bvkZIHf/yvvs/yGQxZxb+ClY2zuansGNt5Bx7tL7ShMV
         HUpgYj8YvmHswjjVKzUwPuors1l0PBhYVzvW9F+bbnZefGihNjVHAagJX3gM2fTEqLkB
         BX5g==
X-Gm-Message-State: AOAM531BwWKHpOEX+ecG+bn+veLt1rkzT/nmun3RL9wE40NnGY0wHcO1
        88f5uBSJLHB3JCDAGJ0hOJc=
X-Google-Smtp-Source: ABdhPJxjSR93uqTSDIsCHJvTFjau0SzlxTnQGMLpk80DIofepTZ6WucuQIx2lHesNI9sEhoK+V2whw==
X-Received: by 2002:a17:902:a581:b029:da:d78:7f79 with SMTP id az1-20020a170902a581b02900da0d787f79mr2719139plb.32.1606301495464;
        Wed, 25 Nov 2020 02:51:35 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
        by smtp.gmail.com with ESMTPSA id j10sm2049520pgc.85.2020.11.25.02.51.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:35 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v8 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Wed, 25 Nov 2020 18:51:12 +0800
Message-Id: <1606301475-7030-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add LED_FUNCTION_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
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

