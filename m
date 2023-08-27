Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7517D789E5C
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjH0N0U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjH0NZq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CA41A2
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50087d47d4dso3771523e87.1
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142738; x=1693747538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHnM0hu7z2BD25024RNiZ2OtoQYiaBNdLcRYXHmhZNU=;
        b=YrJIUkh2oV7xVnXXNa9VqTu+U+kMnEjTvfoj2y+WQ9KwbeqxuTVu73u4DH1jLzxcz9
         GBfG9MfdQrdLTUWsHe33LiJkz+13wyhrN8dU6OxEdypcZ/TxnijtEy/BB0oX2sT/+nxX
         rRX+zrd6vYyXC3iNwggz+Kg8TYGKHzw5UHi8hpjUaBTK3NgcXUjxbF4l+b8f+M1d6smt
         IgU2NWH4fMiMDQgvB7ur/GdH5+QdaRxEBPwFkQ0giAix519ZQcKJgqo+F4hHxpKRHak8
         4wFIS4j4HYFST+p2dxl8w+BbTzcfS5a3MbGb3t6AnQ8dhOZxPOK9Z9Q4ycfC9yRxi1ek
         ohDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142738; x=1693747538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHnM0hu7z2BD25024RNiZ2OtoQYiaBNdLcRYXHmhZNU=;
        b=jgblqMQ2oUzn+4D3SQuX6pj5x45GnitDug1DNzfctNhmILNFhAf8YUHgOCemRNLnhf
         wDKXCOyM4tm8YOe3ya0dItJ45HeHCHUmzHiyrZXoxOE9FKbkpjtqdZHVW6qxvCVJWbuw
         L2XNQ34CqLLuiGqbkDk6rOWbcOHOK+6yFigtKgL/LrgFpbStDipkguhnZ1v0Ad9/kLjn
         P2gb1MzTh4v6g8lu2kMCa++mbjvX2uTgvzWCqtsnZq7+Hxi/DBGr8WiCx3m9q40jobZv
         2On1zFt4A4jwcJp955HUyhOO7uJ75slyKqenpq4otTmcWUmUlREo7IdE4xHsyXW6TMK3
         GSUQ==
X-Gm-Message-State: AOJu0Yzxdz5y0+j8zpf3f7apoT3om1mAR+ehf7GMclMDlcQ6dZmb6+X7
        U/9HQmy3GSHbS79JlieyQEGiaQ==
X-Google-Smtp-Source: AGHT+IEdTFigONnpJDjn5i4EilE2SWmjEQ2gKwKb1eHh78Rt7qwSYTdtsx0B7OHC6dUAQGqx627aag==
X-Received: by 2002:a05:6512:3b9c:b0:500:a002:292a with SMTP id g28-20020a0565123b9c00b00500a002292amr9217956lfv.29.1693142738346;
        Sun, 27 Aug 2023 06:25:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v5 14/37] ARM: dts: qcom: mdm9615: move PMIC interrupts to the board files
Date:   Sun, 27 Aug 2023 16:25:02 +0300
Message-Id: <20230827132525.951475-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi | 4 ++++
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi        | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index dac3aa793f71..b782ff0d16cd 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -76,6 +76,10 @@ reset-out-pins {
 	};
 };
 
+&pm8018 {
+	interrupts-extended = <&intc GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &pm8018_gpio {
 	usb_vbus_5v_pins: usb-vbus-5v-state {
 		pins = "gpio4";
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index c4cfbdbcdf14..373d9425b8bd 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -265,7 +265,6 @@ qcom,ssbi@500000 {
 
 			pm8018: pmic {
 				compatible = "qcom,pm8018", "qcom,pm8921";
-				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2

