Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F253636F1C1
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 23:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbhD2VQW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 17:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237285AbhD2VQM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Apr 2021 17:16:12 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACB2C061342
        for <linux-leds@vger.kernel.org>; Thu, 29 Apr 2021 14:15:21 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso29685723otp.7
        for <linux-leds@vger.kernel.org>; Thu, 29 Apr 2021 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bQ/eHw0O807xhfjRTzUKKKGXt5q/41pRNJanGN8nKE4=;
        b=BUHqOa+YjbWp/5UEKNV8vZbD8Vmm1t92rKIAKXwvqtqihqDmp/qhp1/HQGcyEwfHSI
         O0q9xuIg+FhG97LuHqIuIM3kjU6AtCD4yJ7kPkwHzEZJ3nfvBpdtUlbjn/LNa4buIhJU
         0aLxzYby4MjO49PVCoeGytry8sgHkExnAuWVy2Oy7yNTOTlOTRkvD/pAM7YvQmIdrkHD
         TN79J8LpZdpOhH7V3lPXQPre7Rd0Q7HRY4f+0A8AnGX85WF+++GI2I5z7/eTCpQGECBA
         T3ZojWeotJBuqAb6lXI5w3YY38twPQIJ6afQ8KxEmSA/1cU//WjGP9jKTxj4Bv3aR3gM
         w+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQ/eHw0O807xhfjRTzUKKKGXt5q/41pRNJanGN8nKE4=;
        b=pUjr/KvDeZ21MJ6pCPw+q9Y0TUzq6X/tm8Ls3GyuN2Rj/1KPUx1BDvIYwtqXVHdcja
         jIHjZkoMyWik+r+y0sXKLDCxPCEJp/7dPJnW65yjtx9Pw9hhheyzrxagiUlbihIsnNeA
         o4uJ/xohQWJm/fn9Y3c6HAn9GsDX9fNELrEb1N4YEtTaexs2Tt0Y1ex+99jxBYVAiHQh
         Q7RoXIzOP5LbHdcprDjqS6SnVp48+00pTWWr5GZKmw2XVctaAAe7JUkJqvjnju19i3Bz
         yewtfmzHGJLmCxnqHLnao1MMMjppLqjf0UrFwINdc5sGFdED4mMfiDeBL4Ne71+OgXH7
         ItXg==
X-Gm-Message-State: AOAM5304G2Llfa+qUKHRMRFk2hIrcqLCI/wcct78Np2BmY3VTZEMXxmP
        qlTYVqM5sDu5imBp4PbyOnCj4g==
X-Google-Smtp-Source: ABdhPJzQ0rkej+f8URw3y1yG78KyfEoTvAzZrNr/LrYQFPGoSI2BqvMrNZA68gO4XbbRkaXE9KBLug==
X-Received: by 2002:a05:6830:23b7:: with SMTP id m23mr1086915ots.326.1619730920677;
        Thu, 29 Apr 2021 14:15:20 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y67sm242707otb.1.2021.04.29.14.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 14:15:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH v7 5/6] arm64: dts: qcom: pmi8994: Define MPP block
Date:   Thu, 29 Apr 2021 14:15:16 -0700
Message-Id: <20210429211517.312792-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210429211517.312792-1-bjorn.andersson@linaro.org>
References: <20210429211517.312792-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pmi8994 has 4 multi-purpose-pins, add these to the definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- Split from the previous patch that adds LPG/PWM nodes

 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index b118e87ef59e..b60934ec4a9a 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -19,6 +19,18 @@ pmi8994_gpios: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8994_mpps: mpps@a000 {
+			compatible = "qcom,pmi8994-mpp";
+			reg = <0xa000>;
+			gpio-controller;
+			gpio-ranges = <&pmi8994_mpps 0 0 4>;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
+				     <0 0xa1 0 IRQ_TYPE_NONE>,
+				     <0 0xa2 0 IRQ_TYPE_NONE>,
+				     <0 0xa3 0 IRQ_TYPE_NONE>;
+		};
 	};
 
 	pmic@3 {
-- 
2.29.2

