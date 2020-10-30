Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A9D29FA46
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 02:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgJ3BHZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 21:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3BHZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 21:07:25 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E51C0613D2
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y16so5191328ljk.1
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BwMmGlmMLcmqzYJ99gKjkUq1Wudan5TSJn8Ws/0M4Fo=;
        b=aZyFNJB8da1k2pfCYzco1TTbsjCFiv8Gvrhvf+dokA9bi9ZwJSTXcZLrCzC1jZIE77
         nN+51GLd/uTe+fqkk67784XDB+QxBJH6D7+wocH6K2C7aqgXB0EVmuR7g7wX9vOCVtVX
         rOlGABMtk3f7WWHw0+5MTgF9j1k5MXe4hoqvFBoMCLDYdoRi7xfY0fr0gUmZh39UdyKb
         AZ/nbj8M5DXsJpTtbtOXEw1Kgz8P9fHwra3oG+i7hHXK61MsBloD2mJ/ouQdIt/6b0Mv
         DFQjYjSteSUnUt1hYlKcul4jKEajEG0jTY/kdH/HogdcW66w5KPkcWtvtoxmHAdFqKUQ
         RHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BwMmGlmMLcmqzYJ99gKjkUq1Wudan5TSJn8Ws/0M4Fo=;
        b=h6MrPmocdiQFd8xhvp8qFQW35BhqHWRqOYLR14wlv/++1050JPWGg4+NKxqJDpOeyJ
         0/YHNxSJvTQR32ODAjwIslYxCskcZ4b92vPI44+aK4DyytLGwg9rpenJf5Eb3sE+3YBv
         Xfd0Adp9nQRHTYCPm5PnBiNO4ujaLcTsRpcp74lafMHaYZxBHxVs/f4rVf1vQ/2Mbo8G
         xxiVLwSgI7S3/iBCMH5dhs84QF/eKlRwHlA3H5Uqy5TIKXpbIHaVpzKocvnzek/DVgD1
         sz7dG829cJFtenntSUqvkFK2Hd8WIbwpi1Y9SbttJbWhovE3VfH8kFhWquqfi15+gT6h
         o/2w==
X-Gm-Message-State: AOAM531w/vukUZtxcTlvibk7UG3WwOs0g9NaNXKrWxBVQCP77y5W3byn
        R/4DJ6h8VYq5HZ20hGn59Ly3cw==
X-Google-Smtp-Source: ABdhPJx4//2VJE2i01TQOxJzPGp6fxZJabT1/zncubmKp651pgiNQxMNSiEThV/1hG2iyvDpPWRCwA==
X-Received: by 2002:a2e:8702:: with SMTP id m2mr2624598lji.21.1604020043137;
        Thu, 29 Oct 2020 18:07:23 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id c6sm447130lfm.226.2020.10.29.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:07:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: pm8150b: add Light Pulse Generator device node
Date:   Fri, 30 Oct 2020 04:07:11 +0300
Message-Id: <20201030010713.247009-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
References: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add device node defining LPG/PWM block on PM8150B PMIC chip.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index d6e075f92b1e..30e7a5f19e5f 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -133,5 +133,14 @@ pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8150b_lpg: lpg {
+			compatible = "qcom,pm8150b-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.28.0

