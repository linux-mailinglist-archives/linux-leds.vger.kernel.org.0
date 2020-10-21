Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6C52954E9
	for <lists+linux-leds@lfdr.de>; Thu, 22 Oct 2020 00:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506929AbgJUWvL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 18:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506924AbgJUWvK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 18:51:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05436C0613D2
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:09 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a9so5169822lfc.7
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XUajRf0deY0ybpth0h7755bmH20RWxud7qUm1cDBOWQ=;
        b=BLdNHBsk0bzhSHFYSUqNi1hqTF5D1yLj5g6uVYypoHoC2rBPrcMAMMVX3ZMntqDPGn
         vGRns97QNZBmNNeKykP88dy7j29AAjk6eTQ5jiUssnfd0uFJ8/bPSHCsS+uB9ZhmDX2b
         x2B5pZhhC86fONyjq0O2QKsA4dKici88ERecMmsiTQonHoH2YS161kkDw6LGexMprWJM
         ShOKMCLT3Clf5g9KCQqDNuQ0FgezMaKdnduSC1IRqy3AhVzRDVVQHANOulR7Hg4+UB30
         4Wwu8yv/yrILWa77z4QBtEGI0qUXh31NjW69Fpy4WRuoDtEkkz7UVaqTBQNGlKWlsGUM
         aFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUajRf0deY0ybpth0h7755bmH20RWxud7qUm1cDBOWQ=;
        b=NHi2jbt0XRsJrQTbkFo6e9i/aDVhFDgw20UrRgLFcbXbwXwAZ8LmFuc4OmtzaiUUUT
         ZWjFtCLLA1IsrS/e86oh1vT4N55rsoGXu1Gao9RaLKuY+E7oFXry07WQluBKtAaVcV9I
         ALsTCQy6PQuDNTQ8Obl0dc4/gCC0kN7100RWBViCu1fuTtbUMg2/xNK5HS96deiDF0e3
         LM+zQThdXc4ROUjeJQg3rdodXUCELCmZEl2e+49T8UnULbRTrhsyJtPsxmrFmrITHKvk
         V1DawZ804ywQL831EF/Zfp96D0HLI7gBjk69ZwUTT0tA++W7LDtgSKdXrFn7k3cRXfXV
         xatw==
X-Gm-Message-State: AOAM5312+ltrCrt8lKX/JO1D6r564sVxJ4f+lAhHenZVI8At9tPJffxC
        +i+30zAS+k7Vt+MwobIDjnd5KQ==
X-Google-Smtp-Source: ABdhPJxs1tCTj5XUaiigb6DjBHmi3vWNWrbq3CTTangd9VkMvzNz4GlTkZXByPWJ0vvNjotdjWf3ng==
X-Received: by 2002:a19:5e5c:: with SMTP id z28mr1931658lfi.528.1603320667465;
        Wed, 21 Oct 2020 15:51:07 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id h11sm652062ljc.21.2020.10.21.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 15:51:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: leds: leds-qcom-lpg: add pm8150[bl] compatible strings
Date:   Thu, 22 Oct 2020 01:50:56 +0300
Message-Id: <20201021225100.162795-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add two more compatible strings for Light Pulse Generator blocks as
found on PM8150B and PM8150A/L chips.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 5ccf0f3d8f1b..0474f1d998ff 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -17,6 +17,8 @@ description: >
 properties:
   compatible:
     enum:
+      - qcom,pm8150b-lpg
+      - qcom,pm8150l-lpg
       - qcom,pm8916-pwm
       - qcom,pm8941-lpg
       - qcom,pm8994-lpg
-- 
2.28.0

