Return-Path: <linux-leds+bounces-2112-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCE9158D7
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 23:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EDB1C22CB9
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 21:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0481A0AE2;
	Mon, 24 Jun 2024 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwXHosJw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3919FA81;
	Mon, 24 Jun 2024 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719264307; cv=none; b=LAI/Bu10AAWWnvZn1N9C0gsT8GhC3Y58xG+ZONPWBBlVLfGM1tvt2tL0zCnqzChCuB2tJN19Q7ZKUz8e7yvxp4RaxodGxC1eu7DhkyQbx2fTXvMAWz0A9DRBfTGAdEUbdERNTeRFnHMkLJDDMZb+M0hQkzInYgHF9tW9L1lJn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719264307; c=relaxed/simple;
	bh=2/D3y84MWExMUe/+ohdAcL5JtZ0TFzz2ZC4d4ub2oGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2TteI9ewFA/pI0Yh1kHmLmBVan9Jp1f4GfIBS2TEckMC09KHKeyJ8/eOmjqaobHadJG2Mlzk1iW+BOhS93YSlico+PfKOQ1RVOXPXrmcGhTNsabhpzVEFL51aCYXDeBA/OwdEJMCVeRsRDez7vbNLOV+IzE7OCE6mPQ4Av0Vw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwXHosJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4BF4C4AF17;
	Mon, 24 Jun 2024 21:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719264307;
	bh=2/D3y84MWExMUe/+ohdAcL5JtZ0TFzz2ZC4d4ub2oGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cwXHosJwT/Na/x6XNpTVsjhLSuoIzS5QUDHdjk4TO4qEyTKrh7GhqCCXF7TlT74j3
	 98QLXr5+/kfwaE3paHwNAkacx3FIcV6zWgseBB+cYWywP3c9Q8Cm8mNkTfcx9D867R
	 Sesf5/4PQiiopGuM8vN94aTgKQEk59k1g4jQkzHyGQXwDHXeEKXSDM2bc3a9XBfvzJ
	 ZR98vrHj0mY9y/7yr8ex+eyr3NEtYLj7KdHbriR5NSIGPgkJvPUP9cASoizKJB/z9V
	 928kMcbd0eqablgPpV7SgAj+lWM8HlP4qJxIh1XYJ5lokigx72NLDGjOpa8QKKwWsP
	 q6AkfM58ejksg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D657EC2BD09;
	Mon, 24 Jun 2024 21:25:06 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 24 Jun 2024 23:25:14 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240624-sy7802-v5-3-7abc9d96bfa6@apitzsch.eu>
References: <20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu>
In-Reply-To: <20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719264314; l=1408;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=5PZFGehTShxKe3OFkYq1lO6OPdXhGy4wNq5owjXoJG0=;
 b=oDPZXMmOvhZAvs35W+AMotHZ0o845LK2xy/6wJrfMoJEC9S9QIh9P4AKXB5Yphutt0FvIy5DU
 l14UvbAQRItC7IXucDZiEx2vfROezgknXjhz19eMZnc6MNHfCo3ZQE6
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



