Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC9A789EBB
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjH0N0j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjH0N0G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:26:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B5DCC3
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:59 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-500913779f5so3709783e87.2
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142758; x=1693747558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgscUjE5yDYSGHC1956h5azSC53EgKvpe5p9UzSNGuk=;
        b=mXXXNgzGSReQ6jQUF/A8MlOxA9vGYi6rwjbMQRXQ/ehm+7xXMPk+BTFQiYeB18tw/4
         a33hehxZRRXNdl97bnvRJul+UVAAH5hLPLhzyLudZzjbFetLxpBQn0CyowvsWTmVxpSa
         gIoEWmc6IifWoy0AIj6rerCRscMN5A/aHTFBC5mk5NKcFH2XR1opS0AWIM0l/CcrMnx+
         Ink6A/PRZRPocNkBVwHfCmIZGea1dKpmUTfWxTkjkZRP2x5Y16kIIf4mWmTDiVcOWpsL
         k5VbXCg8JNcvJBiuSWbaGHbFTgPFYniy7n7kvZR+lVaICzjDSaqymOkzJo4sEa/JoxNg
         WuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142758; x=1693747558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgscUjE5yDYSGHC1956h5azSC53EgKvpe5p9UzSNGuk=;
        b=BO6hPguWXJbDonEygRt+jR50qIhhYUZtTMB3gZm3BOUrUcsgjnwOdwBIZfRtSTRJei
         y2o4Q9kf+fk7UHm283YR2nvhpjxJsGbihAjzV9DCDYFXUTESyQj2OxwyJFSaWalrLMjT
         3WPHvevi9iwpUV+hGJlgVqqSExwWPXfhIJARTSktZu0JR319dqu5tWgs72Ui5zVDX0DQ
         LctBYdp96qv4DR7HNEkudMORdZOg0+Pv6Kw0ESnT6pF+d07h5ob6FVylAidFPh0+3SZs
         oPMrEoVriBBdWxm/F1CJ6wQnf9IWVSLbSf/IvOwHrCJxD2atHNlzvlU2+7cWj8smWIPv
         0vGg==
X-Gm-Message-State: AOJu0YywuxdG9iliLGwRxkoY6vTaidYiq1n00t3epP0GemWhkNapCpFi
        pU16KISdPHvnFASdXSuBGMqzlw==
X-Google-Smtp-Source: AGHT+IGy2k7YsLBurwPoagaVteEGqHoEFuFN2j79QP6Ia/1b3mFH5soRZ/nt7IeVX9r68//2ahCa7g==
X-Received: by 2002:ac2:43c7:0:b0:500:8f64:52d4 with SMTP id u7-20020ac243c7000000b005008f6452d4mr10008489lfl.53.1693142757945;
        Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
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
Subject: [PATCH v5 37/37] ARM: dts: qcom: mdm9615: drop qcom, prefix from SSBI node name
Date:   Sun, 27 Aug 2023 16:25:25 +0300
Message-Id: <20230827132525.951475-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index 07e712e890f6..b02336bd8370 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -258,7 +258,7 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		ssbi: qcom,ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.39.2

