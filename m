Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E94E2CBAF7
	for <lists+linux-leds@lfdr.de>; Wed,  2 Dec 2020 11:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388674AbgLBKrw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Dec 2020 05:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgLBKru (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Dec 2020 05:47:50 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2C0C0617A7;
        Wed,  2 Dec 2020 02:47:10 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id n10so681746pgv.8;
        Wed, 02 Dec 2020 02:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=aciiHc72jqq8XQ+Q0YVw9dIM/ys8K2Pzi0MCbGxcy759pmCxb917oUBJlciBulnElj
         QcTJqHL1hjszzyI+RfvqAG8DPVJ69alEWwVHuMWMUwvlzzn4BtVavYj5IjhIdAzBI604
         4b2UtcgMMEKvcHIAWrfK6wHQFXqey9SXCzAeFDZrr9tjlcje0tZEAAPMywoEp/UY7gwm
         SORP3Q+ZLx/JhZ93fDSaDvRG8eaCYcxnzZ4uRMbLAWXt9Nmmd98lw4kdS8QExO5cGm9S
         s1udav6Ngb14Xf73odPLxlC0h9Igzu3a6wxa68myfqhvEgpdNWJ159Hz34xh09uggDMj
         eMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
        b=DuXIE5rf6ycEcNdXSK7zTdQbF79ALMwXxe/CW1FUL4ogEX3RCtBMCATPLoHDkSYkJ9
         J+oMZdYxPXp8+FIaLeJUP5eTz2zuHJErxJRsQi3lPXQd9do3NN+R6H65kwZJMG24VpKL
         PhSpnXkMbAAtGJJuWjXAv3ljmodQE+lmqDLcXdmye/lWZLkDdCoSxa4UQe6RguQIDifS
         AnV93zT1Pa8quGHSaMeCSj8O8dfxK6lRhVF9DP2zxgpmFOvDxi9flbbc/0L23odLgGAL
         Jjluou+hETnUKJpNCam+qO/FDWU9HWsPq3L5NR6rs6nTSEZUB7ZAVocdtPTEkokpq2fG
         BYhg==
X-Gm-Message-State: AOAM531aXpZ78MirX4VJEGHzATHUoPaz0AFODNZlT3VovoktZQbH9idN
        hDTJMLTqSuZYg+xBLonZi6C2jYKFGu8U0w==
X-Google-Smtp-Source: ABdhPJxHXKcGzMzqQaAgF8Vi7ulrYj4m6vrcieyqHrgNSrGzEuoK+vN8FEATbJfXGvam6Cfw61NCZA==
X-Received: by 2002:a63:1a02:: with SMTP id a2mr2041901pga.359.1606906030231;
        Wed, 02 Dec 2020 02:47:10 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
        by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.47.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:47:09 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
Date:   Wed,  2 Dec 2020 18:46:49 +0800
Message-Id: <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
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

