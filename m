Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 653DEC1B84
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2019 08:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfI3GkQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Sep 2019 02:40:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41822 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbfI3GkQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Sep 2019 02:40:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1FE1B611BE; Mon, 30 Sep 2019 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569825615;
        bh=OMqRx5N2rWXTmv93+Wi9xzjrf7Um3LYjyZ6ahSUawb0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BLxxa52GtpY6nvByOFCQCUpZFyuZ1DYeAeRbq8ObXB3z1FhXhCf9qMaJuNuHGeyVO
         cKpJP+Wp7MwA4BveOKECBi4RHqwfqeW3CCdV9W3xCZ9AO80OjqM6x5f1lRKjdvLStK
         RMjm2YyzIwDMCsPftRS1zcXnG2KuFikWDu9hDQa0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 01D5560128;
        Mon, 30 Sep 2019 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569825613;
        bh=OMqRx5N2rWXTmv93+Wi9xzjrf7Um3LYjyZ6ahSUawb0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cJVsXzcFVqliWkEFvHj7th7mM6/KLtxjSndaN758PIUWK4RsVTWLMeJxrl/r7U03g
         TcEJiZcU8fUCwTjqi/ME7upsZ38+Sa9rdUA0VlAOFEmObgopPsOe4p+bhTsW5wtCCe
         bmxaKSFJwp4Cy4JNIDXgCNaFhSf5+lJdZc5XxslI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01D5560128
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Andy Gross <agross@kernel.org>,
        linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V6 1/8] backlight: qcom-wled: Rename pm8941-wled.c to qcom-wled.c
Date:   Mon, 30 Sep 2019 12:09:06 +0530
Message-Id: <1569825553-26039-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

pm8941-wled.c driver is supporting the WLED peripheral
on pm8941. Rename it to qcom-wled.c so that it can support
WLED on multiple PMICs.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 .../bindings/leds/backlight/{pm8941-wled.txt => qcom-wled.txt}    | 2 +-
 drivers/video/backlight/Kconfig                                   | 8 ++++----
 drivers/video/backlight/Makefile                                  | 2 +-
 drivers/video/backlight/{pm8941-wled.c => qcom-wled.c}            | 0
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/leds/backlight/{pm8941-wled.txt => qcom-wled.txt} (95%)
 rename drivers/video/backlight/{pm8941-wled.c => qcom-wled.c} (100%)

diff --git a/Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
similarity index 95%
rename from Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
rename to Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
index e5b294d..fb39e32 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
@@ -1,4 +1,4 @@
-Binding for Qualcomm PM8941 WLED driver
+Binding for Qualcomm Technologies, Inc. WLED driver
 
 Required properties:
 - compatible: should be "qcom,pm8941-wled"
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 8b081d6..6ff3176 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -284,12 +284,12 @@ config BACKLIGHT_TOSA
 	  If you have an Sharp SL-6000 Zaurus say Y to enable a driver
 	  for its backlight
 
-config BACKLIGHT_PM8941_WLED
-	tristate "Qualcomm PM8941 WLED Driver"
+config BACKLIGHT_QCOM_WLED
+	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
 	help
-	  If you have the Qualcomm PM8941, say Y to enable a driver for the
-	  WLED block.
+	  If you have the Qualcomm PMIC, say Y to enable a driver for the
+	  WLED block. Currently it supports PM8941 and PMI8998.
 
 config BACKLIGHT_SAHARA
 	tristate "Tabletkiosk Sahara Touch-iT Backlight Driver"
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 63c507c..6f87770 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -48,8 +48,8 @@ obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_OT200)		+= ot200_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
-obj-$(CONFIG_BACKLIGHT_PM8941_WLED)	+= pm8941-wled.o
 obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
+obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
 obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
 obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
 obj-$(CONFIG_BACKLIGHT_TOSA)		+= tosa_bl.o
diff --git a/drivers/video/backlight/pm8941-wled.c b/drivers/video/backlight/qcom-wled.c
similarity index 100%
rename from drivers/video/backlight/pm8941-wled.c
rename to drivers/video/backlight/qcom-wled.c
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

