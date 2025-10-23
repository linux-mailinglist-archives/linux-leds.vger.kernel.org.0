Return-Path: <linux-leds+bounces-5863-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8743C00CA2
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 13:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5D23B1984
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 11:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C9B30EF9D;
	Thu, 23 Oct 2025 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VKvLSr2E"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C144F30E0E7
	for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219171; cv=none; b=qrOJbhDiY2cpwyaSV4lHULBCTzey91O8EaIxhpE94vW1xaiIAnwJwJQhI0m44+9iqog4oO3FHZcAxEga0qyPXYGy29mEZ2biG+2MblWhUITHYdEXVpb/AV7lK9/VK1l+TZbsy5huLouxcTuPhGns7iQ+1VtMJJVeaeF2ktC1PjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219171; c=relaxed/simple;
	bh=VrNwvQvfKelfjsNL39NDV/Pr5hRkFpgryYK23xxuGu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHAm8EeuTTNo6tMV1rAqACpKBbNiQVuz2mH7OtdRUpHwftKgHCLUwIJvINXwL4m4WVhY2Xui/VuOZixZymBgzTuVy/kQplT3ymMKQ8oxjIB8/q/yA3IwZfkomsbQmhB4dXGW2bR/PNjgDu69qthM8FzBB04O7tc9jZ7WXzL5XCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VKvLSr2E; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b5e19810703so116124966b.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219167; x=1761823967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FvWczutByRQszn2cLDwkyaS9cC21yJeCI2ighUyDzM=;
        b=VKvLSr2ENU05eh3nOi4c7i1f5BhnT0JUwH0rJZGXChuflAHPGG7f1RZ4jcNUCvfyWn
         xd+Yid58NRkG3RttV5RjHKlIq9nw472mjw9GskxzqPaCTVFmJ+xFAVIVTDRNENVV2Wi5
         4itWNOIaU5uEkNE70WBKJ9fALdz9MTXlHGznWMIYNEVaY4PbrsPY2Mb8T3FrXd2hqwWJ
         Sq7ovF34yEPndI6HLK6b18eK8tCvB+B8xHpYYWICw10SV0/2VHtwidXhfkJaRTUrhvqv
         4yyeOQF/1RoH4iJMY54na5RwjjAvPgy/jscw8WRlU/2nMRjbj2++Ir0YAITUHlJpC93S
         vE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219167; x=1761823967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FvWczutByRQszn2cLDwkyaS9cC21yJeCI2ighUyDzM=;
        b=i3O4mirBriu1mEEkwXECCzJ/Qbt6MR1x1GHLufpEwJ4+2exnwTh1STa5HMCmaGi9aU
         ALhuVigTKSCblrm3x1bAyjJumCdCM3vMn83Ebdu730NPzFZtnlv7mK7UFuOJTv/D43a8
         2CMnuATEfRWCaDpNqeulsq2yjVltjBDxNpPbEG0x3NtmRVqVY+NfpZd5il8gPqNjGGqh
         HYoX/IMFMpA1bpP/ixJtzWXyF4znI4zhy25olqf//T3h58clU5Yu0HKVxCoLQAfpDDeM
         ZgYog/PuDD7oRxnNuZx5kYT4VswSUHBLjKJdzd9TsseBV50EB3JveJ/RIR1laIvUWhK3
         7CVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUohPlmrUN4Lm2TN3dC9lUGxRmf4PQJJA9vR0pe4wcs3vaMGWSiRmL+PcsL0xVFywcTsTU+sBpbZq8n@vger.kernel.org
X-Gm-Message-State: AOJu0YzQYV9ZMIaxR4VbXiNreVhA4ws1ee4yKSkxZT7M2/LuqEz4EdEb
	6IonrpzmySZQqA3RzF9iJt9qK0w9bgWoXTXXUocEQTljAt9Jo1gQt0niNKWTDqV5INo=
X-Gm-Gg: ASbGncuk4xFuR2vgdXRMVHFDC4NP+5CbsCJ6dQu5C5y2VDmNGWC5aBJezpgODaQwZUo
	AL8gtPiQCaRiJXynRD5L5cSCtYm3Qiqp06pifUCJAnn4yZAcFbvMblQFX7cBcSCZ/Fbn76LIhGi
	xQkgeu0jaAtMnf3H5FzXmEMapO592omthyUjXZjqStRYJDRCPvBY9mYAAb7e6gnK+Vpesleqtr5
	9mAjCctiBYtNnl0RvbYBCHbBBycVhSVYJ5WBIpXUDrRouA1ka2bTzVIHK2LRgHDDAAijycjPGYm
	9OskqpP9fKgGRvSYbrgRH9fVIt265Llo6TJytwMUKwdeZhD1YT0EuHsOfd+Kt99MhWVX2u7kI20
	AyOqCfpMtfDJTHNYm7B9R8bVP8IUtjMYCKX7noxtqL1P0worlT9KzoL+FOT/z9qEHFgG4wyGm5G
	agFnIeGGWZ2UEdY4FXoC3hQxjROq+K4Yfv0swH3avCaQvRNg==
X-Google-Smtp-Source: AGHT+IH9Dd5psNqWeEfzs5C5WDQnf+kwc7VZusjUHqTftWu4ybm3zPVgqZTXAL85Q+86yhvlI2NMXA==
X-Received: by 2002:a17:907:3e21:b0:b45:66f6:6a0a with SMTP id a640c23a62f3a-b6474940f13mr2873736566b.44.1761219167068;
        Thu, 23 Oct 2025 04:32:47 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:27 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add PM7550 PMIC
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-sm7635-pmxr2230-v3-3-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=2094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VrNwvQvfKelfjsNL39NDV/Pr5hRkFpgryYK23xxuGu0=;
 b=LITtwk2B2ra/A63gTBSxvj5T+8xvMhjvBIUq6RekYdT03g4nS4NJvFGWBL4db9lxly5R4rCM1
 IXGzn4EqsZpASHqeKavP7cdKOUaQUtybwgd1YFp4m4Awa7sL86odCK6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with Milos SoC-based devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7550.dtsi | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550.dtsi b/arch/arm64/boot/dts/qcom/pm7550.dtsi
new file mode 100644
index 000000000000..b886c2397fe7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550_thermal: pm7550-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					/*
+					 * Current Linux driver currently only supports up to
+					 * 125°C, should be updated to 145°C once available.
+					 */
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pm7550: pmic@1 {
+		compatible = "qcom,pm7550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550_gpios: gpio@8800 {
+			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550_flash: led-controller@ee00 {
+			compatible = "qcom,pm7550-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.51.1


