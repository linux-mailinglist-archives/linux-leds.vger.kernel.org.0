Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE9F2B7BBD
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgKRKs3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgKRKs2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:48:28 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A8BC0613D4;
        Wed, 18 Nov 2020 02:48:28 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id l11so789468plt.1;
        Wed, 18 Nov 2020 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ku4DFZSb8iFG29uouQzq61N1s3khgmRXmV0BrLGheJg=;
        b=cADCQDKC7QskBBuZxRAc2vN8S6wb7cXwjZYbpjAQyUOcDLGexcknfwLX0QGYqfcdQg
         gC85Y2FHjMKqPWhM2wE1MDEVdKfdPVWOF2QznJjnobjeIm4P1Le5j3A8cc9i+NElmj8/
         g0zqS8seje22I+sx+seZV2uVn9rUQGifnSBaMUzqYeoohgNNJvQilKMWOjb33cR/39Ot
         rI1aE2iRjBIxEtCl/ZDGBmRgDnPR0H3yPtsUd/TSXQ0K+Y+ZafC1b7mIKuGTpWgA64Xb
         BvJQFARQWvAWeEWQAMGchlBz3EG6YQGB7yiSP6xj03lhGY6XsIA3JZ5civtIa+23IQJu
         FmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ku4DFZSb8iFG29uouQzq61N1s3khgmRXmV0BrLGheJg=;
        b=aXVs3AgQRV4Ayi4upCaFx7RK1ItR9/u/PhJNPTf2ppxaNuHA1emnDsHYwzh73WV+dj
         XeKsbhxN7OUGH9yfC8A/6TST1Ae08iGDVfwLDUQLcYSP0nclpttFvGAPktp2VfWtF+kv
         KSkEwzqHoySa9QLiCIsEonBwhIQbhk0LAXEluDbRqNGhcqzKTtDr6HgWjNoVNQSiJunr
         rF5N2oPgONVMo6tXl1/zpYx4qTsQgJ3iZyWVJiPTh8LWOB2v27BPulgbZEjegnyg4VF3
         BWz5YWcMS1Id8b5fiGFyjTmlx3KLGO1it42PWbrAo6nb3o5gVI5DkU0FhHA7F91CZS2j
         sWzw==
X-Gm-Message-State: AOAM531C4AwlHTDcRKjP2X20+KfNOUwwSnChghzz2+wp828f7utuQWPJ
        8blzcFW+BSrXOyJzRm+hWJw=
X-Google-Smtp-Source: ABdhPJzXdq3kdzW4a83uwdkgeDkiLU/JLMv94gcpqdl6dzigYYr4CSB/SrH+nqIUZDL/XEBS6/UCaw==
X-Received: by 2002:a17:90b:fd1:: with SMTP id gd17mr3500973pjb.148.1605696508590;
        Wed, 18 Nov 2020 02:48:28 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
        by smtp.gmail.com with ESMTPSA id a3sm25345154pfd.58.2020.11.18.02.48.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:48:28 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
Date:   Wed, 18 Nov 2020 18:47:39 +0800
Message-Id: <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add LED_COLOR_ID_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/dt-bindings/leds/common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d..1409e9a 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -33,7 +33,8 @@
 #define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
 #define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary color,
 					   so this would include RGBW and similar */
-#define LED_COLOR_ID_MAX	10
+#define LED_COLOR_ID_MOONLIGHT	10
+#define LED_COLOR_ID_MAX	11
 
 /* Standard LED functions */
 /* Keyboard LEDs, usually it would be input4::capslock etc. */
-- 
2.7.4

