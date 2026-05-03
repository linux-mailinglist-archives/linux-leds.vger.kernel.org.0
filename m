Return-Path: <linux-leds+bounces-7962-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNZIEHjB92mXlwIAu9opvQ
	(envelope-from <linux-leds+bounces-7962-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7C4B78AA
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B723300903F
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 21:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD123A9619;
	Sun,  3 May 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgHqYeub"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29A3A7F4E;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844596; cv=none; b=EXHwE4BsMVgKNBvAVJhRNhaZoYYKh0WrEZC15hUuRZ2UBEKwBXuP7hjMEKsKaU+UFiSlizRS1NNtnIFI10B1T2yAzgBZm5gHuWrr+AtPX+Dgal/rwj1fcioYZ3ijjDSSQ/xa33zlrqvELGT52GPlVuO9XIx31Cx05NkoHfvD0tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844596; c=relaxed/simple;
	bh=USYQkKC8Cv0A2pYqgRyY+WhGkg5fTpj7dbhEJlN6nQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdeTIAMGQshklkRYSVukSdqx4WpxNtVi3Halj2/OCYhmsKOYEgfLWlehXbajoGU0fKk2wD9AUEtx0g1UmcRAb8+lo1jW/tlNEzRfvnMWAmztmqbMrNRN0G0vJs+w+Kq4Zbx+eHYATZU3Wqf2NARS2TjotCujVlHSxMtHrMY3wtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgHqYeub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89C8EC2BCC4;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777844596;
	bh=USYQkKC8Cv0A2pYqgRyY+WhGkg5fTpj7dbhEJlN6nQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mgHqYeubITJQkyCdHP96549Y6tCv9LpRtPfNKUXcLcTtFqaZs0jI4d9iiNjks5Jpl
	 QihYUycUU6ahSDahaKMh159ma6atW+1rgM+P0NTbKecIyjciNzQ6LEFUf0wWbUWefT
	 C2zdoLMM0gFaUHPUsnT8NOP4xijfZP5CWXSiEePUeaQYLG8qv+fQpfM9NcREBL0mBN
	 j/Ay4MlMeFQsyRKm9ZaNzz/sXuSDo+q5A36KyjFNswbUnLTlOZGY2eH6FSTWgbItb4
	 StqNZDxNic4x3K8FD71czJQDKhsR7Jn/EriWLABLzmPDJczfqjGIM4++TxWxY9ZvSd
	 ijx1gqJyLPT2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825B9CD3427;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 03 May 2026 14:43:17 -0700
Subject: [PATCH v5 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-expressatt_camera_flash-v5-3-95524506a799@gmail.com>
References: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
In-Reply-To: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777844595; l=2830;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=4TPb3tv60VTi1jGXTAHafiOXo9LAWJdtsHID/kn3FOw=;
 b=dH83lHvmBOCbnxL6ArmC15m16VNwHrcRUDHAo7SQ7PDfnyvg2Ok6Jwv3Aef853LTfYGeL6Oer
 d+3uC5MokMqDjGuXtqFPLa7gwxK32J3dlqUxCyDAFA9E1q9LBjF09c8
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: A4C7C4B78AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7962-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ixit.cz,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,4a:email]

From: Rudraksha Gupta <guptarud@gmail.com>

Add camera flash support for the Samsung Galaxy Express (expressatt).

The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
modeled as a regulator-fixed node and supplied to the flash IC via
vin-supply.

Downstream references:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Assisted-by: Claude:claude-opus-4.6
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index c4b98af6955d..35514fd53e3d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 
 #include "qcom-msm8960.dtsi"
@@ -61,6 +62,32 @@ touchkey_enable: touchkey-enable {
 		regulator-boot-on;
 	};
 
+	vreg_flash: regulator-flash {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_FLASH_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&flash_led_unlock>;
+		pinctrl-names = "default";
+	};
+
+	led-controller {
+		compatible = "richtek,rt8515";
+		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vreg_flash>;
+		richtek,rfs-ohms = <16000>;
+		pinctrl-0 = <&cam_flash_en>;
+		pinctrl-names = "default";
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+		};
+	};
+
 	i2c-gpio-touchkey {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
@@ -172,6 +199,13 @@ touchscreen@4a {
 };
 
 &tlmm {
+	cam_flash_en: cam-flash-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
 	spi1_default: spi1-default-state {
 		mosi-pins {
 			pins = "gpio6";
@@ -572,3 +606,12 @@ magnetometer@2e {
 		/* TODO: Figure out Mount Matrix */
 	};
 };
+
+&pm8921_mpps {
+	flash_led_unlock: flash-led-unlock-state {
+		pins = "mpp4";
+		function = "digital";
+		output-low;
+		power-source = <PM8921_GPIO_S4>;
+	};
+};

-- 
2.54.0



