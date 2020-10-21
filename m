Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B4E2954F2
	for <lists+linux-leds@lfdr.de>; Thu, 22 Oct 2020 00:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506937AbgJUWvQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 18:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506928AbgJUWvP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 18:51:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF04C0613CE
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id l2so5246147lfk.0
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y68c1c7Z13VLVISWQSjGtMfYfdgX0kCBgReV2FtuTdM=;
        b=mMYojLC4y7LhWFZ4HHoDPGU7gF894ny2E2sByf3XJyfbQ8dXJ5y50Py2imnmaBNCEl
         2eHj/pu/bMM8PHskEfAJL/y6Q5T3LUqAyJh5FGnNsmT1gohNN+uLPByBNe7QLNcDWQgv
         KHFBNupcplqe6jduKdvG408ANXfIaU8aVe9hpvWpBRdXgCw123z1YP/b4d+fsY/SJHoF
         gCO3n/RonRvdNuUE7SLivYTwdtZfBPJagk8cH4PB6mZDVNW1RTSpxxxGOab0UvseG/ve
         t3PnoLVJHYoURRMrrRqfIzyDtSnV3crQtJckg9OpMU/wVvisE49a3wabkUgGohOrCzoq
         fXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y68c1c7Z13VLVISWQSjGtMfYfdgX0kCBgReV2FtuTdM=;
        b=EbXwxgvi2g/jPh4ddtK1lxQlt3bOG18FYuNfwu2F3xyvaxDKkFEDNOrPXR7Q+RIyy5
         JudnPwGXYt/AmrtxTdTj7VoLJhPE+QqMTmnRNkTgsIqmdS+YApCIqTOjaNO0nhhS9cml
         rOeBY02qOeMclnn83+XQl6fLKXCbksTpFp+yyThesOh077HGGU+N1P8LXFM83WgZ08Ts
         1haXjNyq/vC7eAz6pmvtflfT+YwIe7DmSvw2T5Sg2In6xQVxQQ+L/HbLHTyU9CHPZLab
         hw9iIp9bfiq776WjzAhXTwNNdlR7DMkKUjdZGY+YyFgBl4Bme0xyyakwPbZsfzbq/YY+
         oZsw==
X-Gm-Message-State: AOAM533h2oT4Y1uaC5TQcx3yWI/OxJkjLSKMcXth7eAwNe20fN7UQaHQ
        8l2PoEmKKbjtdy78T/Krd2v5OA==
X-Google-Smtp-Source: ABdhPJzSrFyWrEgkely2ncAXUZGPErChj9HT+aDia8Z+Kob9YWM/XyQlsxnRFfcuK16COCt/B/93BQ==
X-Received: by 2002:a19:c3cf:: with SMTP id t198mr1831682lff.461.1603320672111;
        Wed, 21 Oct 2020 15:51:12 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id h11sm652062ljc.21.2020.10.21.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 15:51:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: pm8150l: add Light Pulse Generator device node
Date:   Thu, 22 Oct 2020 01:50:59 +0300
Message-Id: <20201021225100.162795-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add device node defining LPG/PWM block on PM8150L PMIC chip.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 9f214ceec2b7..e8926d6c32cb 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -114,5 +114,15 @@ pmic@5 {
 		reg = <0x5 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8150l_lpg: lpg {
+			compatible = "qcom,pm8150l-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 	};
 };
-- 
2.28.0

