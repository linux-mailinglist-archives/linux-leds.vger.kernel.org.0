Return-Path: <linux-leds+bounces-3391-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A89C4CBE
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 03:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F011F232BF
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 02:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88151204F84;
	Tue, 12 Nov 2024 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lhj4T7RH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3030204953;
	Tue, 12 Nov 2024 02:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379282; cv=none; b=fQiBfADpjgTVrgCpYCNRc5XExrnJtSjg8XCvia2Ml/v3TD6ZoYyoJ47NlqneYgmeHOkSOne3AU3I6dfWRRCjmveLBbogsKWWtDjKne53CNRPE/WvKztz+0ECBMomr/jdtrLyOusYiyeB7VpGpi0YG9CfiDaq3ZY0LLHTi6dwdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379282; c=relaxed/simple;
	bh=IpZydYlHdxh/qFTl2PNa2xzz/UVdkEWmO3oPwcHl8g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sa1RnKSwiEemA6hAePY4cZYp0ejBn4T/X586sCICJW8Sw3CJBLyD0LoqhWiNKfY53dyvw14F30yKDESQg9YfJHHvtZI0bCG8ExttFhdCCis6drD220HWDMjm36PsM8ofnSZxgjdOMc/WCxYoAieo+rjkZbSvdlvr8SFalLYXETE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lhj4T7RH; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b14df8f821so478537585a.2;
        Mon, 11 Nov 2024 18:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731379280; x=1731984080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ug7n6yxxaOQrSjkaUQ4R0ZKOErDPDxqYqa7dlrKjLQ=;
        b=Lhj4T7RHNpgD29xFmQaDlVLIo2UBoI9EarVAcfnHl2qP3PJs7fovxKgSDBias2/eJX
         sUfgOldzAGJkMcfKvFCzoAINPLGiisWM+Q3uju7Dzu+yQ5R1NuVhDbw5EPPhYpIiqR54
         SyrTElhoQ5364tW5qkZFxI65OyYne+CKaWlNuE/S9fUueQMZrbV6b3ezp6OzEMRM+FlZ
         4BouKOPmb1oLNvd7Y8MPfr3GavjByy+JULQy3pM+KvjcwTNemM8T/LsoopCMilg7RhFO
         iudWst4WQBJaXkqzdYe5mf+BzZ9AKbfXPIZS7IEFX9bin7y8ghwy9qjIEoKyudUXN/N8
         GNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379280; x=1731984080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ug7n6yxxaOQrSjkaUQ4R0ZKOErDPDxqYqa7dlrKjLQ=;
        b=f9h/3NPsCLiHvr/L+9gwo/mgWHA0uxgfWBQdmkzNb5KzN3xpEKt2iaiHgpI8nF3vci
         rd9b7shvQbp1lR04F7N+QSNg+6yhrE0wTBBfN/MAx6DZaMGeXx68Krc03F+14KkwHqcI
         Vt4ABQundoxsDX1LBOhdZCxaUifLSKt7XcTxr05wB6tjlr3TSLzuPDWgOVnuUfuIZNg7
         fS6Mlwq9W67SNNQAZ3ddEvacpRgaEqFzGWZFkqwgpVFacB6by9tKz91stkvMdTa7IbcC
         TTLRQsm/q7NVcVloKPNQ3VhdlcYv1pzfnxi4ZiBklp1nlI3J+DNNRX4g9JsTVQngk7MY
         JWYA==
X-Forwarded-Encrypted: i=1; AJvYcCVdu7+GyVK2D6GzLNRyOA4HjxywcsOnj02qDrFOKsDq1x5UWvjQMvKOutD6zb5f+BmvZuWKdMGJ6LFJ0Q==@vger.kernel.org, AJvYcCVt874CeyhGd13uxwbZS8a6Umnk/voOnGtFfGPZ+DuZPmgUgkQpS0CBsj32T6FZ2UKcKMe4tAllob9GGHh9lw==@vger.kernel.org, AJvYcCW2Qpam0caHCAvHTN4v7q70G65aaw3u9orpXnRDSh7QA5zxigHWherNDzTkhYGotYZrOFKfIatmkbYR@vger.kernel.org
X-Gm-Message-State: AOJu0YxMpLNzU8Q13hyazfCzCvYXFYkkd5XSGPb9TzmV0vzjQmB/6468
	JcUbHUeZhPaxwM0n90oso0w18CfxpAR5Bb/uB0IrAvLoSWOlIP397cgvP9C3
X-Google-Smtp-Source: AGHT+IEZLQmBLPlCMkGicHqpc5EwF+VqAhoWrKJafZogRF3mvoiv4B1zv1uWeW9gfuIKLxieb4hzYw==
X-Received: by 2002:a05:620a:4495:b0:7b1:5143:8da1 with SMTP id af79cd13be357-7b331f20600mr2031990585a.43.1731379279849;
        Mon, 11 Nov 2024 18:41:19 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::ea7f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dc1esm550438385a.18.2024.11.11.18.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:41:18 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670-google-sargo: add flash leds
Date: Mon, 11 Nov 2024 21:40:54 -0500
Message-ID: <20241112024050.669578-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112024050.669578-6-mailingradian@gmail.com>
References: <20241112024050.669578-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a has two identical flash LEDs. Add them together.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 176b0119fe6d..800773a676c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include "sdm670.dtsi"
@@ -482,6 +483,19 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&pm660l_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pm660l_gpios {
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
-- 
2.47.0


