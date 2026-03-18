Return-Path: <linux-leds+bounces-7381-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEXSKE7wumkBdQIAu9opvQ
	(envelope-from <linux-leds+bounces-7381-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:34:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A42C15D1
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3FFD30333EA
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 18:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC1B3E2774;
	Wed, 18 Mar 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8NGOrV2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F83E123D;
	Wed, 18 Mar 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858881; cv=none; b=CqoTsQEw+4SkRt0gKg0T/YmwB2TaUueAprHJczZx+fT8MlsijufOaE6rLXXGagNk1Q/IbPK/yUNMqpXfl27rMP/UbaxHl4UNJsjhrocQ4eWeglDuGssd30zpQaVPv8TVfZupCmtWgNTM8xEgJKnYnhgTP1yWA//cGTmM9xbJxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858881; c=relaxed/simple;
	bh=zFPpzhrUFYFmNF065283+r2lfoF7K9r9raXNq+AD6Kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6IOAjWKaoSCAnQi4TDOiiyXk99TPfNmWITG8WrMf5DlNtTSWpxI0SL7kF3c0wYJjxK+zinQwajODUCBrKqOJGHWUu2Bb+6K6/KvT2QQb/A694Pu2Cv/uneOiYh0cmBJKkM9cIFDBbB72ynnqywIVAX8R4vi6xRXZlOSn79GE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8NGOrV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D360FC2BCB5;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773858880;
	bh=zFPpzhrUFYFmNF065283+r2lfoF7K9r9raXNq+AD6Kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h8NGOrV2xGhyhP6YQwxfniQqgibl19W6Luyp8ewrMUWGIAExPEDG6a3BfMNPjGROz
	 vZIrcAWxw3n5oHX+67NdQeTA3R6q57tQgYrxwk4/iGlQEtcB1fvs+ClfrhYEetigEc
	 T1e2FAb5KSsZwiDeCeDj0wuqXkTTEvVgyQSrzTRX2iays61Qfn+yN5wZW2a4Lz19YM
	 1CSNLSf7i/FSZMHgnEDKfQJPOtjVMU+uWxG902FlvoZR0MMHhrRPoVXX0fK8/BRoQh
	 v63hIQvqNE4wryASJR5BYXKCAtzDkGnpKIoqT4E5loc1UbFne5WiKM1f/KaXqLLo5n
	 3r4yB6iOhxqXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4371077608;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 18 Mar 2026 11:34:41 -0700
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-expressatt_camera_flash-v2-3-5c2b9a623dcb@gmail.com>
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
In-Reply-To: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773858880; l=2751;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=azmf77v4SGAT8Qy3s0ldETd0CQ8M86C+x8906RvCaTA=;
 b=6W4N4Z/M2J271yx81scr++OgMBIh65qYQhPNRv+4WahF9Ol2dd2zT2Rh+tVyY8NVYrH9eEwKu
 eTB7LrYhv7tCxn7EGgbN2ffH8pUsHbcuncooOOUdPgfqgkwce8AyZ+Y
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7381-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ixit.cz];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D1A42C15D1
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

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index c4b98af6955d..ad5169a60937 100644
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
 
+	flash_gpio_reg: regulator-flash {
+		compatible = "regulator-fixed";
+		regulator-name = "flash_led_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&flash_led_unlock>;
+		pinctrl-names = "default";
+	};
+
+	camera_flash: led-controller {
+		compatible = "richtek,rt8515";
+		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&flash_gpio_reg>;
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
@@ -247,6 +274,13 @@ touchkey_irq_pin: touchkey-irq-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	cam_flash_en: cam-flash-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
 };
 
 &pm8921 {
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
2.53.0



