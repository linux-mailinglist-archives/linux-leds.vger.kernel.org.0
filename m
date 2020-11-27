Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898582C5F00
	for <lists+linux-leds@lfdr.de>; Fri, 27 Nov 2020 04:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404258AbgK0D3Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 22:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgK0D3Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 22:29:25 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05DAC0613D1;
        Thu, 26 Nov 2020 19:29:24 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id t37so3203220pga.7;
        Thu, 26 Nov 2020 19:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
        b=smbUOLENdjxCXbV0m17KXUVQhGYwCjoW20xk+63OI+k9fDoSFz05dZoYU4cC+AmiH+
         yCi7p/PevJvHYi+RsbR7xSNZmWxFX5YjAc7oJf9GiQMlGpC5i9cs9D947L+ui1r7i5N5
         weHg69bTym00c8JFgw9+ciDFHapieXs3H4U5DCuIJkdezszMJlpjmRNA2yMPRszwpNkE
         JPYKUxmD9FQ5JQHNiNRe3MFIqyQtcUZVc0h7kKyRrKBPILIFuNBVib8rypaJZZcghXtR
         HuFDl5tIlgGSCW0m6IQQyYYrRUtUA3EUGYYj9efX3mGsogScEo5AMd8wrk4YJ29nxWXy
         wP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
        b=TbIJckPDT9xE2UJ5NcSF+TbMDo4+3t1rrj2a5sCZaB+16dmqphy1HaO5GsXk7jbpeZ
         M4vxqibBYro8OJBpw+vyZ2ImasmLxr/NG84gTkYR/3u9R59IUSf5S6wewT9EsN4M70+g
         IRtu2uQYVZ2O5hXPUszFzD/hhbo++e0RqpplO3+OGFVQBV2w5AD9BEg7BAv4Ad12enXP
         vgCeWfnxYvwa4NDWxk0dWNiD/qqlc7CgjbTCnSlvpFM8YxQCfjuu8L/iisPGzEfc1P7b
         s2PbfghtgoMNtUQjrVahNVk1S9KgF2yQXbZglWwTCfseVDXWM8eLZAx6ozJcKsjeBO+P
         cauw==
X-Gm-Message-State: AOAM533APYatwcVhJKS189/ryR4j953x/jGg83+lNst013zvqK0LIPgl
        zd2OC/MoT9z9p3In09MUAKI=
X-Google-Smtp-Source: ABdhPJyOCcwfhFklQ2azHbtb9rQzNHUGo//zFgzf94EtkPv7coAzdKgY+XglsBB5MYpGcOUDhvp7SQ==
X-Received: by 2002:a17:90b:1009:: with SMTP id gm9mr7342196pjb.84.1606447764644;
        Thu, 26 Nov 2020 19:29:24 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
        by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 19:29:24 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v10 4/6] dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
Date:   Fri, 27 Nov 2020 11:28:54 +0800
Message-Id: <1606447736-7944-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
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

