Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFF42C5EF8
	for <lists+linux-leds@lfdr.de>; Fri, 27 Nov 2020 04:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404175AbgK0D3U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 22:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgK0D3U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 22:29:20 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40484C0613D1;
        Thu, 26 Nov 2020 19:29:20 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id l17so3229843pgk.1;
        Thu, 26 Nov 2020 19:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
        b=fXm4xFIHdwcdMtvxr89NGvdeVIhpQRN3GeHL22pvKRJAntZtwKKkNJpesqZCZOjx3m
         np65TuSEcp0/Jz/lr1DFy8eGsdR1VnfOWbHv9JeH8NnBqWPxelpQi3H8oeU3Xl6YMSHG
         iaCaJkr8TeOG850w+RaYNbZrkYd9EVd5IUadWNtgwwy/1ecGI42mMe1Glgn+tX+51epG
         kEP2osm1qxzOSxN1IoybQUyD3UJHQSRmAzE/zS8vekscBhRciqb5slU6/EXWbYuI4yNI
         M/nG4LgGKTwmwgq8WvGXU22Kbk+lu6f8t+vxpPOZEinU56uZXFkYy+P7GtSHaLWE6a5P
         wrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
        b=tsrjz+QcY6Be+13SOTQ4WIz/1Gh1TNhagZvX8wdRNYvq2/NUeb9C3nFeouzy1z5WdD
         tpBSw2K/WOfFg93GyslwCyYl2WV27Qxsf0RY8zHRqVX7mNoAA8CC+LUIKVxLq/GiMoHY
         0Oas5B8SIc+Xvv12n1UT8CMzYOZ0oRkZnipC3DBP7xjrzQyLIhaC3Dfg5YTv1u4BaNIi
         f5c6oXnmZklR8O3iHkHqgQI+kvJ0ifsYXu6jpJBcUMk8RG3Mkkt1lDbfStbjiKEAXP+1
         N8Vj+6vOopSoFTHhw4DarzMlRDHR778zk72dmxFWHrWnHhmo+yt1be8xWCj8GIpRG7V+
         wtHg==
X-Gm-Message-State: AOAM532E6nXJ2oCTuBPQsP+yMZL42UYM0Cuk76cPcexFEacp4SbQ+77z
        RdCnLUizZbXAt4G2LcwY90k=
X-Google-Smtp-Source: ABdhPJw21pCcsmVQlLorPRAbz0QycKLe+GyiIW6goHtRMOD339aLc4XGL7UVDGC6T4wqJBKzOFDuoQ==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr4950162pgk.100.1606447759860;
        Thu, 26 Nov 2020 19:29:19 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
        by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 19:29:19 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v10 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Fri, 27 Nov 2020 11:28:53 +0800
Message-Id: <1606447736-7944-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add LED_FUNCTION_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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

