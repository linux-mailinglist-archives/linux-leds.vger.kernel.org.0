Return-Path: <linux-leds+bounces-1889-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C00905D59
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 23:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 036AAB21E0D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 21:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4D01272A7;
	Wed, 12 Jun 2024 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6KJOXj4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312684FCC;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718226169; cv=none; b=ta+9Cbfm1pytyEfI2wrYhc0NJhqoHYDyCb4Qj/P0RYqTcOhiX8NEnE+5dnx9rv2jwD/fwyuetN6u9W5tmYpLghKgCsJx2gVr/aV/soK/KNI0muwS1kq1dqlEvZ/kzlYpheJUd2vKSXPVMX+ZhGQdu24ZyQNjEwh/LH5XvWshxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718226169; c=relaxed/simple;
	bh=2/D3y84MWExMUe/+ohdAcL5JtZ0TFzz2ZC4d4ub2oGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+f5QRnxkaMMnyUD6Wc4jyI4f4NEdGmfLvDWoaJ4sruU7bEsWBpkhZ+gdvGtz2ZnuTWhW5r/NuSMxX/KPnh9Kfg9qvXUP/6040TM2HZygdndmo5ORPY05QhoaC1s4BwaI9YsE6ia7DEepQUetISwUM/kAV6VZ1oIDl6+mu71XkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6KJOXj4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA3F4C4AF51;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718226168;
	bh=2/D3y84MWExMUe/+ohdAcL5JtZ0TFzz2ZC4d4ub2oGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b6KJOXj44xtQmKnjosF7WiA8Mx0I6uSl5rGZ96gvgVk3wW8IHBH5ywNNh20vRmu7k
	 pZ5c3FuyB9I/Fp/gxSYtB9qfI2RqwhXR5gnf6ZaxIzzZGjEws/VH2ijmYCxFLNA+F7
	 iR7ZcVsoDSRhCsPXEsBCvohhbIlScl/eYSxpxjQxrjUknRL+HhO/CVuBUAqRvlYO72
	 cnweTXjpJFq0mZPH6OGMOf5O+Iw+BfegwIwITzdyU+NIPLW4Fsiavxy5LPrd64Evh3
	 bVg+pqbJ9VqHZl6ZNuhZrrdDm3BkBV1FZhnNLY/abq9FAVsfqATaSblAK6GLX+Djc3
	 g2EYppCk+FylQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4FCC27C53;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 12 Jun 2024 23:01:34 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240612-sy7802-v3-3-1e9cc1c79b79@apitzsch.eu>
References: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
In-Reply-To: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718226168; l=1408;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=5PZFGehTShxKe3OFkYq1lO6OPdXhGy4wNq5owjXoJG0=;
 b=U4zL09R/h6bvbX1wqNtjXFrsRAogqI/mEldeu7GYtmhwqNQ0lSLQI9IJwXLRIg/1sidABnw3A
 S7qNrUqcDqQAyHwDaPa2lZ4ksDuzggAlN+sL4Ot0Dts7pLb/UZRs02z
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The phone has a Silergy SY7802 flash LED controller.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index e3404c4455cf..528737929274 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -159,6 +159,25 @@ led@2 {
 			};
 		};
 	};
+
+	flash-led-controller@53 {
+		compatible = "silergy,sy7802";
+		reg = <0x53>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&camera_rear_flash_default>;
+		pinctrl-names = "default";
+
+		led@0 {
+			reg = <0>;
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			led-sources = <0>, <1>;
+		};
+	};
 };
 
 &blsp_i2c3 {
@@ -318,6 +337,13 @@ camera_front_flash_default: camera-front-flash-default-state {
 		bias-disable;
 	};
 
+	camera_rear_flash_default: camera-rear-flash-default-state {
+		pins = "gpio9", "gpio16", "gpio51";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
 		pins = "gpio20";
 		function = "gpio";

-- 
2.45.2



