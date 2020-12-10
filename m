Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A00C2D538B
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732923AbgLJGCl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732915AbgLJGCf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:02:35 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BC5C061794;
        Wed,  9 Dec 2020 22:01:55 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id o4so3236260pgj.0;
        Wed, 09 Dec 2020 22:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=Q01omhVfCcgT943adihwfzBwNcLe91YDo+rjvwqe8AlHjWiJq6HusMxwi9ESFgcEf9
         wlgq+VKuQHAOOoOLs22xKRaD2KaO18rjf7RcFYettl6+9J9x9RZ6S+g6Z0/Rf5wcorl1
         lrUR4iFdwnF8YVOUXPXE6ksu8NFJqOriehPNEVv8RAqLdrfVAHcAWFIjampng5g/SFlF
         RPMmIj0ygAWYqPskqitNV3a1S+MLQcaEHezAGJk+agwNUQLmxURpAZfGxeO9CfCVoLGT
         L94H+coTT7ubiMoJzurRZzMHNvxklVTc0QoNtJt5l5MqqNbDKODabqxg6gR+AG4OYUa3
         PM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=tPiJT0+273n4O7Eib6ZYl4UoHknGVD/p4pHnl2HJUdszTUUsw9iNSlYw9Vpk/5jps3
         UaRizAX5CB9MOpGK66dZg42JwnigsU1dprozWhHRNnDx8EKE0MjMXLgvDjlLwZgvG7oy
         x0M4OBrv0EcqTjXsDXzGJlf2Vcx3JFsEOXEh+MsRknoW0k8NNN4ppCCDqjQnz/6bi//8
         8fUdPC4dNL+LIxPaIuU5S0TDuOBmWt+QHwzGxDNLt2ZuHlwT8Fo/TdqU2ppyrMAwI2yJ
         OAxcCp/1dxOncorOfi7QViNnmJFJD01qLo6PljICQbPe0eUh/jqMYf5rdqlQvY362LZe
         rRnw==
X-Gm-Message-State: AOAM531B4DhkzBBAbPGthvQ1THwx+rEJ4Kp4+tnT8y3iMEmOKursd96F
        Qnx/34ORWDxejqcfTnunb/I=
X-Google-Smtp-Source: ABdhPJxoCJN9uM6PsuumhKAHW78UCmRkPIb1f8FKymCwFKozMV/iwNWNadkexsXerE7z/dg6tntvJQ==
X-Received: by 2002:a17:90a:1a10:: with SMTP id 16mr5688955pjk.42.1607580114750;
        Wed, 09 Dec 2020 22:01:54 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
        by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 22:01:54 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v12 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Thu, 10 Dec 2020 14:00:55 +0800
Message-Id: <1607580057-4408-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
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

