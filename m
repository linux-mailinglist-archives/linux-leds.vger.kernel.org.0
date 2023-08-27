Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275F3789E1C
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjH0N0O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjH0NZk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A31B1B8
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5008d16cc36so3596013e87.2
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142732; x=1693747532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=cCVsb3K3wTfdGYKkLNh1/LCiVvILBc2XhlLJIjiafrrG3xEUf+oUfFd0FAqb9TPZqI
         MC5gFOtdGOkhHDCIrrawqoN6KSb8RbmKgo/Od0rhkufLjTeENV0j8pKtKSphj+jAMjus
         FJnysUy5d0dG4K18vfUa42rYIQUvFiunnslZ8S5lv5g26Q2P9SXhWmbnTBZC0XA6vabC
         zksrLDya3z9Eoe2ea353xcMQZBnuM+t6NmWGGTeqER2egO6dlO3Gnj0r0epa22vPKorn
         k9z/BJ6ZijRtYsb9U7qE4juFZ/eFQ2L0JbG1Y9/iV0G/zespBnMUtZVthSeWZPeL2CdT
         VYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142733; x=1693747533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=bT0dIbkHCiFGEcHGkooT6Y8PtQ6+eB4+Rm1Tz2K/L6r6nr6H+l9tSZ7X+6bdsH0oQt
         9qxtJxoGBojXE0C3dYuAtddZPBDqLi0rsfACYxUIs8TrxU502jMg7IoCjPnE3zWPIr96
         yxuY/nDpH2ZY/o8knAEJsv26XaBVMvWVzqyKJWBkRC0Ut15jaANVrm7LdhUK3PSZJqso
         LP93fFEY/ubHwWyZHIzgoD7DwaTm/6+FjClo4nG2e1xiv9USbGpQtIutTv6b2pv5H4La
         +NDqHJAHGByawoIvtIiTdc6I9ZZOgjdoK0mv5dS8ZYu8A9dt4ZU+z3DmGK3eBk+Wu7Sn
         Nw6g==
X-Gm-Message-State: AOJu0Yw8QwNUkX90E2l+LKO8UbX0B2l9ZlXniQ5XjcbHhZJrtaBWDuZx
        mxg55fCrpPvvtdjVS5JPWzamrw==
X-Google-Smtp-Source: AGHT+IFZK+tUrJtz99p54EBnoNcVP69Kr8EdF+9LS0F7pvu+9j+DO77rmoZZV5syR2tVbCjoleJlDQ==
X-Received: by 2002:a05:6512:3da7:b0:4fb:7cea:882a with SMTP id k39-20020a0565123da700b004fb7cea882amr20200319lfv.3.1693142732738;
        Sun, 27 Aug 2023 06:25:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:32 -0700 (PDT)
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
Subject: [PATCH v5 07/37] ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
Date:   Sun, 27 Aug 2023 16:24:55 +0300
Message-Id: <20230827132525.951475-8-dmitry.baryshkov@linaro.org>
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

Group file inclusion to follow contemporary practice.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
index b269fdca1460..e3b4b93c3d38 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
@@ -6,11 +6,11 @@
  * Author : Neil Armstrong <narmstrong@baylibre.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 #include "qcom-mdm9615-wp8548.dtsi"
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MangOH Green with WP8548 Module";
-- 
2.39.2

