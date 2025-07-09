Return-Path: <linux-leds+bounces-5023-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D3AFE829
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 13:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 646B84E4BA8
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 11:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498942D8796;
	Wed,  9 Jul 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u+xMDE7L"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B502DA747
	for <linux-leds@vger.kernel.org>; Wed,  9 Jul 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061614; cv=none; b=nAVaH9Mo5MPyRU0dJ2gA8GXnlnqdwD9pAPTtUzNCKomxGxusszMCgAgN1KxKYDyg78FYvc8mc1Y/KymJ36wDRR2cSLfSsVrCyi/i7AF5h0GaoU+fxleg41oCx/WOcOaP8m9Zw9gYdZKiT7SPNyRaQVyJ5govmTgRUTTLtr1E7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061614; c=relaxed/simple;
	bh=hC4XiUyCXvfKUfUdujggOXgHdLNV4lf1H8qLCscQ3Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1o8JcPnU8sGnVFCp8HWVau4iGnsYeg1UjlPHoIefpd00d/a1VG6K9Z4+yJQaUIdHD188v6w/0wudyJ3RrGmaUIlgQuBirgslkfgZccDyU+hR59JxzdqNvs/FqeZN22hUAqIjxCvVFxUKDCOwmfANp0mWgVdP8LP0YhA84pBUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u+xMDE7L; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so10231303a12.2
        for <linux-leds@vger.kernel.org>; Wed, 09 Jul 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061609; x=1752666409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bpa1qe4qe1U2tW+ccEjSHAObelYY5h6LZZSGvF+pGw=;
        b=u+xMDE7L0X3yoC4TxKZQvTud3oIy5LyXnoSeMEHz+v+9PjCqZnmkMHCSi4NTmBXxbU
         6Z3GE2APvlyDmqvoIzH8ohA/qOxz1FBCAJz7yN637L4WAnSUImeL87RqZ0GnuX2mdT6v
         AhPov5DkFGPPHXsQCRWiRajKyz0W+x7ZuXSCZUMSBIMvUaGUScJ6CG9xToal7gE8+k9p
         5h+oAm72VIWgQnwS31O+AS1ezIYUudUNO03QVY2vROv4tyaPpHIKxUcLl3Q3FML6BFdY
         LVlh0Q5za5gdLYYTXY5uyc5ZqFpmF65ma+J70yQi8yW2qlOx4gHC24JySM+UTeQGNcSr
         8ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061609; x=1752666409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bpa1qe4qe1U2tW+ccEjSHAObelYY5h6LZZSGvF+pGw=;
        b=XmoeXv5XZ6kJ2zzBb5/7fCitoNSoM7bKU1XMgof6DZb0GZBGwEOA6ExughE+AtCpYz
         yKD/jKEp5iKlY/pEsbkCUyJkc+YW1ZRqW2M6P0zNdYJkXbK5JVuCI/k13/SIzU3R7Vdc
         f5vZLpmgk2UsPYpQrb4UGOFfUiB2Bo2KwD2dmxC0k5Heh1BxUyo2aBc+Dcv91MZqOVAD
         3clMM8dW5HSLF9ty852iWKjJOFCvDmU8dsF/jNKJ9c9sHTn/dDGgozc5WEeb79iFDsba
         DVIZsLpyeFZ72+gYpoja4a63ypxdHtKtRVlgjb1Npu0sV1LCOPiS9ZXBwjR3IEOHIiLc
         PCxA==
X-Forwarded-Encrypted: i=1; AJvYcCVflyr+eSjKSLO/klfYcTmL0AtnVXI70d0//4sq1C+t+7Ar8C56kKZEH/Xy/9CkxEAVox47zyXhwI4E@vger.kernel.org
X-Gm-Message-State: AOJu0YzPII6xARuDgkAyiUOfSk5yoWxN7eHZycUXroC9IjCUgMxiiR+S
	TyN/KDFp/qlMjCHnCFS36ivdsQ9R9OIcKaq/sd2KhqJRYf1KAqUF9lcCY0q6wNf++C3tFcz3R1i
	DpoBC
X-Gm-Gg: ASbGncs0YyodA7Dnxxn1iLxS6VXp1euUSTDAevGUxAWNkOWFsnkTb5kF7uRpp3+l3GD
	zOAbkYw607sMYi/iRNY9MIVSBOrODzXkq+kIDoRl6g4s4Mr2Hoh/aOu0jWo1jUXmLvwLUAkBlRm
	4F/6lZXAA8LjyyNmAIhDfCPpiQgs9EWtqsryUQ66fGHi3kIzZILlCnNQ+wdpA94xl2zCC1S8qtW
	Z9TPipdhecaqCrUa69Jv0xe/GRJmLzAn2s1D/vLJWJrLDV47BExcWb1riY+TgzjT5RDp6gkMvrC
	a8DdJbWgxiAV1dM1ywq3CH4e0Jb0p/CF9FVPgciWUnHjhP4kvcO3rvxLe0jMLbp44KPmoh9xtBU
	eUZ1d7jweZpQoEwDOyGF5J/PpvZGmE7er
X-Google-Smtp-Source: AGHT+IEa3VxKGGtmpJqSqUpaGE5jivuUSxb7qkbnXKu41EclZPptdV4vVLyJP7ntg8X8h5wcm0ceXQ==
X-Received: by 2002:a17:907:c283:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae6cf5c0132mr248175366b.16.1752061609399;
        Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:36 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add PM7550 PMIC
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=2089;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hC4XiUyCXvfKUfUdujggOXgHdLNV4lf1H8qLCscQ3Zg=;
 b=h+IOj2hBQ3I6W+a+vQJaatA2VbxLX/L6dXEb4kRe5+aHbi3nsUWGLE9ZKVDSnGLxp5qWzVFcG
 c3PpiaHPXufAZcvursiA5Rs+k8oJGNcZ1iri5Kab6VB9Dbrbl1zMCRE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with Milos SoC-based devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7550.dtsi | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550.dtsi b/arch/arm64/boot/dts/qcom/pm7550.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b886c2397fe735edc92f2c3f307eb4d206961f11
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
2.50.0


