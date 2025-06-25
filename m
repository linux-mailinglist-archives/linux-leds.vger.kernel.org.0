Return-Path: <linux-leds+bounces-4877-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9BAE7CBB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 11:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2A1A7B666A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 09:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3BC2E62B8;
	Wed, 25 Jun 2025 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NUPWPYap"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14042D6625
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843134; cv=none; b=aGdpJ17U+py35NYbobPQi3PkxAz+kYOrsADbC0yiQ7eFkoOTEuaJDdfCb0NSa1h58bD5xbUu1nHpAg2GabJnAgtQShMmmyLgWN+70/Z6f40YiEgLgyptj1URAlT1JnHejKfzonciTw7YpJbqnD5bxuE0WFNJRLrRBkB3AM+VQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843134; c=relaxed/simple;
	bh=P97hYk/Hj/7qjo1n+kRFwU7+E2ZGne+kwKH4G41eZXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=un6GcybkLjFeLMYcBT4jGwHzgFsuM9F9eHz26XsCLM5kU/SuURIkNzSTmOg35BVO33aLbSLQmQZ7VTrCVkqfEp/nGryy3xisfBHl+fr0vH68N5AAjuXkywp05BRCnzifRG41f2qW5YR+XO8GRjsJjXChc6Q8R1sPnUH7l4TMx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NUPWPYap; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad891bb0957so234556066b.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843131; x=1751447931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TP0dDIATi4ERrUaMmJ+CWbb1W8kcq9VICfoUhwUDiY=;
        b=NUPWPYapldcPbk6SKz05L1rJ1Kx+L8QwhlKOuXfEf+RpD99OPI3glSQaDKVlXtJN5s
         gomXkHCnmDuaEuK/k10HbyUUrJbrOo3POsGhjA+zWi0y1gjiJHYa8E575SOfFrh8p1va
         adWSaTJB5/+lXjuTNc/YujVstlla42neF7Wn2xdRv6zjUKIcgJra/1Gu6y1J9usr/CV2
         y1TCSS69uMYJhwyE48wEL7ELAIG07TnH7C9Tih9xdVMOrS4L8qHJXlRWw8st77A+FdYA
         3oejs9phQSR9ZhZc6AZRT+UrPEOcL621ffHjzNRAs/I0kceuXDKAzbh9t6/qryYOdFXo
         m3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843131; x=1751447931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TP0dDIATi4ERrUaMmJ+CWbb1W8kcq9VICfoUhwUDiY=;
        b=P5v/dJfG76NE4KoOinvrbOf28/919jl1oGZ2nV7klhivx4n7OkydJoqfJ6yEr84wQ0
         WScFo0T1j8W1TQ4EufENuEwD+/sYg1UMur3kIrtN+maqyvCwtPGlgqcNl//NRYsIk5aU
         VR/7l0y1RHRIDDhRgzLu+YnDKwAb63zBQZ5rNZS11s5s4IdU2UUj+R6gTxQv/5Awdw2j
         EHR8K3JsA+TFsqbzlwaxIwqb6SjFkdmSShjuuYokfekgNDqpM1iV3FwZsKq5/kZxlnU/
         iy+NX85e6WSLnCbHak1pMFJanwiQZf0rC+lqdsxXlrogs2sNdrm1Og4SNbGLUGRXVUPQ
         Fk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5aoQmTEd3XwaDRKTJlgdQmcfI8/0d+dE1QOABn7Wt3GnOF2nM8Kw3MpT+n75lPmJd4APIKqlV7f4Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy6sYGX1ON6xT99XkJ2b8aSJjV4BR0QDNx1bhimvlIyuj35kYX
	LTYgYBgCTyEuvnSzTvNRAeYkClGLwTHwz3eHVQm4Sh1e57V1VSO9XACsct1Bq2NiICg=
X-Gm-Gg: ASbGncs0Drnh6sDXuOzdlNaCLZSvibbqdlv3F81bjQmR+2ybtd0l8Le7nQ8weo/A/U+
	EYuV1T5IMIE+UrFXrDEb3OlY0bcCPC1emLc+RFkDkJEJjqvYUDnHhiSoJIDcBkCxSBcSPIghwf5
	3OwfTVDGH/GlXvBfNVicmL8eyN6zzexsyuneshswKzgM6ASBxpZFcHiffoXkOWFBXXDOHYzSIOt
	rpSUcUrBWAyXt1v8/F4EMDuiW4Q/NtbloMpVbYa9UZtkbFqAQ0L4hnZGFCx0id124HMAIF+BWYW
	I7DueG9XeawobGh+qnRYgOQdjb3xTJZzL0/lBrJwJ9nJqnRQQm3264svd7sphsR/OKCsfmveTw8
	UIgSgq+mjIqsG4dxhHkUeOGYWwyjeHE1Og1F8l+Y35B8=
X-Google-Smtp-Source: AGHT+IEEGdscEMwvM+aessafAYILSx4LiZ9oh55JoG6lzWaD+B66L6MlI8IYziHgQ7LGeEr53zCpYA==
X-Received: by 2002:a17:907:940d:b0:ae0:b7c7:e181 with SMTP id a640c23a62f3a-ae0beea8657mr226509466b.41.1750843130955;
        Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:39 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=2003;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=P97hYk/Hj/7qjo1n+kRFwU7+E2ZGne+kwKH4G41eZXs=;
 b=5cKEHZVx1u5i2ve5fJgo3x1rCF2GP3PFrwvP2an7dIvDP5vrvjeu5ua9mRhBFWMTYswaRqpzW
 o4/U/Atpv/vBEvkmZ0W9XBJjxCziWpUp6mk/KFGJjWUSmvsQbZqtgPK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with SM7635 devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
@@ -0,0 +1,63 @@
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
+		pmxr2230_thermal: pmxr2230-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmxr2230_temp_alarm>;
+
+			trips {
+				pmxr2230_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pmxr2230_crit: pmxr2230-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmxr2230: pmic@1 {
+		compatible = "qcom,pmxr2230", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmxr2230_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmxr2230_gpios: gpio@8800 {
+			compatible = "qcom,pmxr2230-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmxr2230_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmxr2230_flash: led-controller@ee00 {
+			compatible = "qcom,pmxr2230-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.50.0


