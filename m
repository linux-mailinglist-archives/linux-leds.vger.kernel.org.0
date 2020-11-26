Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413452C5353
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 12:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbgKZLxT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 06:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387600AbgKZLxS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:53:18 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF644C0613D4;
        Thu, 26 Nov 2020 03:53:18 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id j19so1566960pgg.5;
        Thu, 26 Nov 2020 03:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
        b=W1/lRTuB5BWrIRy52cWEjawSqvx48zqA3+GMUD0SBq9nGtI0iXeB1BAMn1HRXfJsgq
         /DmLG7FpuOoiSfgDGmQsjd96V+bQKePgtbI4Du8LKs+x7Jrk1w1u+NFMXPiNcFRCfFg3
         zij48Jzd650JosQ8UO5ScJH6rjnsLATEe8Gj9Upzt+7dmjVMjn3G4lYJxRWj3HnaY4my
         O+fQSj9T6VB2SApRSuVS+d7aWHszem5cpGpfWjorkQYMrzuyIoUfmkZx8RJ3ppcF06Qz
         rg+plYaQxWaQA7Pz6qKg9HukG+TG/PIN7ratBpg8tN7uVPtIilL0UJZAIx+bEKba6mb5
         ZWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
        b=ONUg5vxGmuY1QMNSUPSogmAhbyeQjsSJKDPx5Tayp6ObY3s2xv5bnLC0dKHaj0wf1k
         d1IBlmH8FH4/u3gHt+TCXnnB94pyzoDu5fl/cQjWG1829bmpmjlu+nB/r1iJkzXRikxB
         SjTOXg0VaDPNAqRtdxd6thToMo04b1DxRJmoO/NWlpKLbecJPFkxVms940NIzuHdWsxR
         Lp74NEGi6K3xSrosdFgo3FDsrnjQw/WioAmpgC5IdnipOHwPaadQmPNisPorak0Ctru9
         qfkOIs/gmtgx319kkR2XT9JkghkYfsIhSjQGkUsCsCX4f+K8o6lboLkhqyIUk/FopFEq
         Iozw==
X-Gm-Message-State: AOAM5338PZVRQAoGQzfR6dJFSJzKxhzNyiKbxKwj3EZk1XTqnrewsRE2
        d5c890nuF9QtUXTMRot4po8=
X-Google-Smtp-Source: ABdhPJwSF7Rvvxiq0V1hS+grvS0qOUQWKW6wZio+TrhUEulohHu2BCW75CIQQ8Oi/yGV1wR3e2uWUg==
X-Received: by 2002:aa7:8812:0:b029:199:25e7:4ab7 with SMTP id c18-20020aa788120000b029019925e74ab7mr2528656pfo.30.1606391598344;
        Thu, 26 Nov 2020 03:53:18 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
        by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 03:53:17 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v9 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Thu, 26 Nov 2020 19:37:31 +0800
Message-Id: <1606390654-6075-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
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

