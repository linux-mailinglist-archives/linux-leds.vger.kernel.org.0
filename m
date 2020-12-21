Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B082DFB36
	for <lists+linux-leds@lfdr.de>; Mon, 21 Dec 2020 11:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgLUKwm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Dec 2020 05:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgLUKwf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Dec 2020 05:52:35 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA43AC061285;
        Mon, 21 Dec 2020 02:51:54 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id n3so7661256pjm.1;
        Mon, 21 Dec 2020 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=lVENUt/1Vfzn4ItyxvSALGab79XYUxUjTr9B2AjlXUGHNLWLj+grkw4dLA+La/loh4
         asFegJTVxB2VvYd2bxdsUj/Aprw6VPKKKntdnacq0eg5n0+4mtnRmZH6BKAuwS9jHmAk
         buAD0h+R3tOQy1tnGZu5DA4K4HTdcpq/nv6crr1WnW1R/vZcPsVq8hMpHZssTQwQ4fFf
         XUXyefz5tz+vtL3S5TMDxOFpF/pY4lo2Ka/zWBHp4q6ShFH6zGP4c3he1uocNVcsaLUT
         /slHpqxNTYVHD9g9Vuwh3C8pgfnsCnAPRlBIgt11EHvScM/3Huut/MxIISyynqIH2WZO
         g+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=U/ESsTF7T6BxDNUXCUEcLNxEzSwtwumO3EdIWfOaELoP2bmJSL8eUkeaXa9Ygc74rf
         Bbs81rHvEQ8PIF5mwcC4dKX+wcSFUWllKR15428UxhocI9+UBzDIkJKouFrrfJonYyXx
         yiatjRtV1bCIUB3Nt97jsxy85/zhfbVnZUYoZqwiCMGRiLtfoa9s/aA2N0JYZTwmaETw
         lgBxYWQ1nNEHpSlXZyNDRXjzoPctwySmvz2Wmak7NRV0QykkTN6zV/PeYKZrOEsK8kz1
         EvBK3DmlEczS8Ctquo3dR2H+NmMKH1YLbFt5lhifQpsXFCq9nJvD8bPbqjivIx+xLIWV
         xLMA==
X-Gm-Message-State: AOAM531tOZc2r/NaJoeo/G8OBIKqYi9Ex49JVjQOPwWYpbvR9k6svAQ8
        cx2OSHI/APDEbm2q7st4oCo=
X-Google-Smtp-Source: ABdhPJzaFpyJoOWHv8sDnGwTv0VlmGyTiFFwESiKZwSC5LPBX08RmDtgHZCr6b5bwXvnqgPBF4CSHw==
X-Received: by 2002:a17:90a:6388:: with SMTP id f8mr16939805pjj.192.1608547914584;
        Mon, 21 Dec 2020 02:51:54 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
        by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 02:51:54 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Mon, 21 Dec 2020 18:45:52 +0800
Message-Id: <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
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

