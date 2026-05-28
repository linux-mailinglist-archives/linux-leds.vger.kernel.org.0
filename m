Return-Path: <linux-leds+bounces-8333-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE91CdeqF2qhMQgAu9opvQ
	(envelope-from <linux-leds+bounces-8333-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 04:39:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 699AD5EBE70
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 04:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8ABB2307806F
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 02:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47012F8EA0;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6dhiBcT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8160D253B73;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935672; cv=none; b=SeKnGO0xA5kvz/60V5+A43OMK/N/Fu9qNY+y0/J45PmE0yuQ3ReuFXYb9LN09rJfYOztlDSYOBT0+D/tESdvcieAn0lL9MZe68It6CEd2R9z9GLohfaa3OCU19khlnvT5o7sYPOt54x2tTaT5K/LqI0rfJ7ZB0sdvJdrq0OH7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935672; c=relaxed/simple;
	bh=hyWGe4LoKdOz2ufuUZwugNnXg7/lcAA7rw4Pu1D+Mk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXFxG0B1pekVoYnZFoWgB8e5CLs1RsKVctxYqlSVEuAUHsBP2BU5ywIBnApKzG5YxULIttRNQ/TEOY3EPis+ZK+nBYiubNkhXus6pJO/+rk+0Sl/s4rz4/V6TXiIh4iCWCNJj3YZ3Zb2PuyWZiVTb+Q4c5CWIpMJymo6MpqFraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6dhiBcT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4017FC2BCF5;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779935672;
	bh=hyWGe4LoKdOz2ufuUZwugNnXg7/lcAA7rw4Pu1D+Mk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i6dhiBcTzc33gMR9Z329RR/Sg6r3GAhHoPQyxu2PhbLdOZ6nt98w9ZAW+KhDEG1/2
	 QhsapmtyIR+dBq5eqyMG6IHipvbjiHpxrd/4aoXrN9VAjfhnaJQw2nKlKNXOBsCLhi
	 ZMPYD9les4OQgCm1/5+ndkx+WVs+EZ1oDb/05RKE5BKBtBAVE33DPlgVHIJ2a2/sBb
	 gd59atKlin+FIlm5CfRhwq4iHTkQe/NmabbMD46oNuUkRvq1UU97PjTa0ejoBwYN2K
	 72PAxqobHZX6kKRPddo+73uYCS0lu8vDWRFVMuFgA/Ax/b1UvmNz2FaoIx1uzXbQXY
	 Hnr6kMRtmAh+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3322ACD6E48;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 27 May 2026 19:34:32 -0700
Subject: [PATCH v6 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-expressatt_camera_flash-v6-3-de0f150024e4@gmail.com>
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
In-Reply-To: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935671; l=2830;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=c3pguP4p4sJML5y1bS/4w0Oy/+Pm7okFRZWMElZDoA0=;
 b=pKnBUSBZ/y8XHkVPgoy6GGUDn7DbsvbBzUygzI/ILQdXmPBmLzBg2DfKnfqSF+PLm+T7kSNhv
 tMUfSjsMOgaD/QodEFB7stFNWblAhbLmPKbPkLfsypfK8MVvkS0ac4+
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8333-lists,linux-leds=lfdr.de,guptarud.gmail.com];
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
	NEURAL_HAM(-0.00)[-0.941];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ixit.cz,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,4a:email,2e:email,ixit.cz:email]
X-Rspamd-Queue-Id: 699AD5EBE70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 5a3d88e31cf5..8fcd5e8574fa 100644
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
@@ -171,6 +198,13 @@ touchscreen@4a {
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
@@ -571,3 +605,12 @@ magnetometer@2e {
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



