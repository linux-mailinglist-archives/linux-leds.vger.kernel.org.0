Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB2B29535B
	for <lists+linux-leds@lfdr.de>; Wed, 21 Oct 2020 22:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505145AbgJUULx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 16:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505137AbgJUULw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 16:11:52 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79CACC0613CF
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 13:11:52 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id u127so3442042oib.6
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CTQjXkyBU+AXR4n3+CD+/Udf1tnLCv+grrFndIKi/I8=;
        b=rpbvkLyJKFEWhkI0bl3iRJ+6Poue7ZjikFm+j1wMw19BQi6vVa2w+6A7TGM4i5AvyJ
         FLoZ+56T1NEJM6CnMG5xvbV4BZ3aTwgZlOpE4elptBwWTWUTiwXEYciyvTWCF9mgW5kO
         nHLnEdd7zEnzst/FkZ1nUrX+w01wrlpCzhQpiMj5TjFp9YR/p8z01F8O/OdyiuvL5dAN
         8+cxJbZJW5I6nERd6vGo3ztfMoIi7HTdSi18LDcBVYaMiMpJxUbXhbjCskQin9kGq5M8
         wKylvPzXTkMyZGExbYQZaHjA/jcY96t7sXYPv4LDgvAF8IyCntAftflBr8R6so9a1/j6
         LJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CTQjXkyBU+AXR4n3+CD+/Udf1tnLCv+grrFndIKi/I8=;
        b=D6k88fsENtT9KBwrnPpR3R4KOMZz2fPDPMCIer8zq4s7lCE6LFLy5oGUz290FEFAWF
         WIbPV+KkNrgawMiIxJzX8jIRQ0TbCWQjNnL5k8KlcSNQjEq7C1IsMrUP1GGtu6p5fmKb
         3bNGfWgJp0MHWhAIuLHnlM18JsX80mgDT6PlI4uAWEI5/yJJhjyDvyjyX/tG3JjRFijW
         /m8mexbC5VQtY3nAN5YZe7o9MO1vqqjAdwmCEK29XSMwvFGC5NLOzI7kK4Cugyw8bScZ
         89Skm55igsMf5q+rJPvHZdC4U6D6F3z01MT63qeQWv/wnQ5Ow24LIxs+zalWb+QoAkH8
         YgUQ==
X-Gm-Message-State: AOAM532Bh+vznPYrnfInq9lKIxkZenGVK4ZHuBeJK8sjTzObD7Ivb7cx
        RLNiAvlzSpIaEDM5QQCxz25xTQ==
X-Google-Smtp-Source: ABdhPJxVvM2KS6NoTYQZqhWxtTSGGTGaDlEmqecZLtPRRYaUhla2A0ek/tTe7tHT+zFDTkG92bLCOA==
X-Received: by 2002:aca:4c0d:: with SMTP id z13mr3207502oia.78.1603311111876;
        Wed, 21 Oct 2020 13:11:51 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t5sm838166otl.22.2020.10.21.13.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 13:11:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH v6 3/4] arm64: dts: qcom: pm(i)8994: Add mpp and lpg blocks
Date:   Wed, 21 Oct 2020 13:12:23 -0700
Message-Id: <20201021201224.3430546-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
References: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pm8994 contains a 6 LPG channels and the pmi8994 contains 4 MPP
channels and a 4 channel LPG, with TRILED and LUT blocks.

Add nodes for these blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- None

 arch/arm64/boot/dts/qcom/pm8994.dtsi  |  9 +++++++++
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 7e4f777746cb..b5bef687aa3c 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -86,6 +86,15 @@ pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8994_lpg: lpg {
+			compatible = "qcom,pm8994-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pm8994_spmi_regulators: regulators {
 			compatible = "qcom,pm8994-regulators";
 		};
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index e5ed28ab9b2d..23f41328d191 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -19,6 +19,17 @@ pmi8994_gpios: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8994_mpps: mpps@a000 {
+			compatible = "qcom,pm8994-mpp";
+			reg = <0xa000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
+				     <0 0xa1 0 IRQ_TYPE_NONE>,
+				     <0 0xa2 0 IRQ_TYPE_NONE>,
+				     <0 0xa3 0 IRQ_TYPE_NONE>;
+		};
 	};
 
 	pmic@3 {
@@ -27,6 +38,15 @@ pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi8994_lpg: lpg@b100 {
+			compatible = "qcom,pmi8994-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pmi8994_spmi_regulators: regulators {
 			compatible = "qcom,pmi8994-regulators";
 			#address-cells = <1>;
-- 
2.28.0

