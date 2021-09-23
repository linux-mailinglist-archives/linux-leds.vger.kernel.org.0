Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6E4415881
	for <lists+linux-leds@lfdr.de>; Thu, 23 Sep 2021 08:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239470AbhIWG5O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Sep 2021 02:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239459AbhIWG5M (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Sep 2021 02:57:12 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5257DC061756
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:41 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id w19so4819841pfn.12
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vusVt5eH6z53FEnYJC51hYVGMazKlgJXSbb2j/UFtkU=;
        b=FcYoAZO6Y/DrfPEgmsrPxBrUEp3lvN+OFH7xFE8E7cs9Jkx7XLUqSJ/eJCRv5E/Q4q
         hhiNbzZoI3yTeKKoTKXi5+8CI9zlnnBmCGn99jZzNA6eVwK0GfOPqabguPMiPo1Sr//6
         erUwU9WZA5FZAReuxSpdd7FIbarTMBxGygwMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vusVt5eH6z53FEnYJC51hYVGMazKlgJXSbb2j/UFtkU=;
        b=EAvOFMCUi6kYcDodGDBJcIm64V0I5JZQ08YCzs7shgA5b8lNWiAQdqesU3hpIzOFdS
         chsnclBNMPMdN9dc5T5TJX7QEOD6gv+CjPLP0FY9O7FlTyjkuHad3zG7FFvMy1ahIj8f
         gbIMUHNzbYoKH2fAs8BcRSehomly691Te7TW6y5oY4zOxvogzLFrcjL9grP/FwCq6EMA
         nL2an1hu4ih4U+0n+03DmuBuEpmDjE1NlX6O/21mFHi3JYQtaITr4d39poMl3VLU6Y0K
         ul9eBMghNuLKV+d/qraGuo64KsxSjtRXQ09M4XKzTQ3duK/ALGKpkG0Jfewy0x4A0Fu1
         nncA==
X-Gm-Message-State: AOAM531bUKIx9vY/uuToNY8lrpFpx2nKgLTqvidnkAyfV1dc8esU9W8O
        Z6fD1bpjO/AT2Aj5/GStEpixAg==
X-Google-Smtp-Source: ABdhPJzV+U2u92yiyjXbz259a8HfYeoGopZ9o51Jyfvl4A/opKbnvyGVQoQXhGr0L2LhrK01GFGBeA==
X-Received: by 2002:a63:7d01:: with SMTP id y1mr2805422pgc.343.1632380140902;
        Wed, 22 Sep 2021 23:55:40 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:55:40 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/11] dt-bindings: gpio: msc313: Add compatible for ssd20xd
Date:   Thu, 23 Sep 2021 15:54:50 +0900
Message-Id: <20210923065500.2284347-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a compatible string for "ssd20xd" for the SigmaStar SSD201
and SSD202D chips. These chips are the same die with different
memory bonded so they don't need their own strings.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
index fe1e1c63ffe3..18fe90387b87 100644
--- a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
@@ -14,7 +14,9 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: mstar,msc313-gpio
+    enum:
+      - mstar,msc313-gpio
+      - sstar,ssd20xd-gpio
 
   reg:
     maxItems: 1
-- 
2.33.0

