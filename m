Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053AEEBDD7
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2019 07:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbfKAG1z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 1 Nov 2019 02:27:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45772 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729894AbfKAG1y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Nov 2019 02:27:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6241960D5A; Fri,  1 Nov 2019 06:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572589673;
        bh=KXb10Tnw3cR6uvRJfbte1LltJk1d/EvokCCPooPECdQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=li6G4O0fUyFDaHGBqkDIXnkX4lbIZJ/dKajNWJyyUQDLWfzfS6A94QFBQ0DP+Ym5M
         f+Xv2nfBwwTjCqAOHNiQKdHLUCG6AsOtkyn4bfd4T7/GBWszAKgIVWmch+T5l+eE1O
         7Yi5NlhFDyPaJoH2hzeFQpzMi+YHzDHvBWn0Yoo0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5571660D97;
        Fri,  1 Nov 2019 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572589670;
        bh=KXb10Tnw3cR6uvRJfbte1LltJk1d/EvokCCPooPECdQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BXtZnj2cx46Wp5yaI6ohZ93LkDQzmvYvvYZeHPGxbI75IfK2lPlPDMtsC0K2OykKY
         /rstR9N8Rnz6A2KXYwiAR+IElfX96H5C7knNi+3UCbCfyKTArJD08ijCIj6aEU4MCp
         K7CWWPd6U5BBKZvCwdcbJiflEiWmoN4w1ZtDfurc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5571660D97
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V10 3/8] backlight: qcom-wled: Add new properties for PMI8998.
Date:   Fri,  1 Nov 2019 11:56:59 +0530
Message-Id: <1572589624-6095-4-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the bindings with the new properties used for
PMI8998.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 .../bindings/leds/backlight/qcom-wled.txt          | 74 ++++++++++++++++++----
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
index 14f28f2..c06863b 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
@@ -20,7 +20,7 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
 - default-brightness
 	Usage:        optional
 	Value type:   <u32>
-	Definition:   brightness value on boot, value from: 0-4095
+	Definition:   brightness value on boot, value from: 0-4095.
 		      Default: 2048
 
 - label
@@ -48,20 +48,24 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
 - qcom,current-limit
 	Usage:        optional
 	Value type:   <u32>
-	Definition:   mA; per-string current limit
-		      value: For pm8941: from 0 to 25 with 5 mA step
-			     Default 20 mA.
-			     For pmi8998: from 0 to 30 with 5 mA step
-			     Default 25 mA.
+	Definition:   mA; per-string current limit; value from 0 to 25 with
+		      1 mA step. Default 20 mA.
+		      This property is supported only for pm8941.
+
+- qcom,current-limit-microamp
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   uA; per-string current limit; value from 0 to 30000 with
+		      2500 uA step. Default 25 mA.
 
 - qcom,current-boost-limit
 	Usage:        optional
 	Value type:   <u32>
 	Definition:   mA; boost current limit.
 		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
-		      1680. Default: 805 mA
+		      1680. Default: 805 mA.
 		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
-		      1500. Default: 970 mA
+		      1500. Default: 970 mA.
 
 - qcom,switching-freq
 	Usage:        optional
@@ -76,15 +80,62 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
 	Usage:        optional
 	Value type:   <u32>
 	Definition:   V; Over-voltage protection limit; one of:
-		      27, 29, 32, 35. default: 29V
+		      27, 29, 32, 35. Default: 29V
 		      This property is supported only for PM8941.
 
+- qcom,ovp-millivolt
+	Usage:        optional
+	Value type:   <u32>
+	Definition:   mV; Over-voltage protection limit;
+		      For pmi8998: one of 18100, 19600, 29600, 31100.
+		      Default 29600 mV.
+		      If this property is not specified for PM8941, it
+		      falls back to "qcom,ovp" property.
+
 - qcom,num-strings
 	Usage:        optional
 	Value type:   <u32>
 	Definition:   #; number of led strings attached;
-		      value from 1 to 3. default: 2
-		      This property is supported only for PM8941.
+		      value: For PM8941 from 1 to 3. Default: 2
+			     For PMI8998 from 1 to 4.
+
+- interrupts
+	Usage:        optional
+	Value type:   <prop encoded array>
+	Definition:   Interrupts associated with WLED. This should be
+		      "short" and "ovp" interrupts. Interrupts can be
+		      specified as per the encoding listed under
+		      Documentation/devicetree/bindings/spmi/
+		      qcom,spmi-pmic-arb.txt.
+
+- interrupt-names
+	Usage:        optional
+	Value type:   <string>
+	Definition:   Interrupt names associated with the interrupts.
+		      Must be "short" and "ovp". The short circuit detection
+		      is not supported for PM8941.
+
+- qcom,enabled-strings
+	Usage:        optional
+	Value tyoe:   <u32 array>
+	Definition:   Array of the WLED strings numbered from 0 to 3. Each
+		      string of leds are operated individually. Specify the
+		      list of strings used by the device. Any combination of
+		      led strings can be used.
+
+- qcom,external-pfet
+	Usage:        optional
+	Value type:   <bool>
+	Definition:   Specify if external PFET control for short circuit
+		      protection is used. This property is supported only
+		      for PMI8998.
+
+- qcom,auto-string-detection
+	Usage:        optional
+	Value type:   <bool>
+	Definition:   Enables auto-detection of the WLED string configuration.
+		      This feature is not supported for PM8941.
+
 
 Example:
 
@@ -99,4 +150,5 @@ pm8941-wled@d800 {
 	qcom,switching-freq = <1600>;
 	qcom,ovp = <29>;
 	qcom,num-strings = <2>;
+	qcom,enabled-strings = <0 1>;
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

