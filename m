Return-Path: <linux-leds+bounces-7142-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF83ACJ4q2nDdQEAu9opvQ
	(envelope-from <linux-leds+bounces-7142-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F094C2292BF
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFD383006227
	for <lists+linux-leds@lfdr.de>; Sat,  7 Mar 2026 00:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEA02D94A3;
	Sat,  7 Mar 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnaPiWkb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA3293B5F;
	Sat,  7 Mar 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845084; cv=none; b=choi1jGHRpitdX3Qufabn/CU5m4V6YHjijGvfoHUCGt6zV4iuscQrbwdMARu1F+kB/exbbfGxpsEvqs13KFD855AF24Yxz2EyTMG/Di7I7ezOTtDEQFUemVGzgzEEFyGScAFmqp07JZfbs/iUEw+5qk2LKQcDewcheeknrw9Bdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845084; c=relaxed/simple;
	bh=ND57kbsJYsDJH/Ykaz8RaKMHxJbv09SilGF1X9TaUM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfCKoH5MVwtM6bO31oAgiaUw1zpXqGeDvhrmjZ0n3Wd94AlFdUBB02NLQWwSst/tdsnq+M++ij76bxrndmua/oHBWih4oVmfGOESH0am2DiGWZfn2JTWrKkqtJ4qVGZXJKECXQySV4U5loQ5+jP485S1e77WYQak7t2BIjMie/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnaPiWkb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0FD3C2BCB5;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772845083;
	bh=ND57kbsJYsDJH/Ykaz8RaKMHxJbv09SilGF1X9TaUM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hnaPiWkbaWUD48wCZ5LaIFZENdxVWmFtPxM1sQZZCk+zVkqF6O7cI0J/VggTotznm
	 LnN5UD3htS+lt6RO0VN+yZ1wuvwUxZehZMm6pfZFgA8IOEV/CCPONOEeCyweiRsK44
	 EL7b8/XHKoN9rHKmb8SYJV8BFhoNYnskzUv+Q3pQ9xTOImP9VjKdok0ioR6p87hW57
	 uXVy34NU3Ab8O2+U6r1n3i+yoRZmPgwAlpTprnnKBdwriPIrfZpb+jsXW6jZ75ZnQj
	 2K4oNfZhwUgQznPUkeWKAzND4F6EGZnrQQOUnnnAvpkPY9TvUKI77HMeh78b0MSmAj
	 OqCdTttQyI1NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B260DFC9EC9;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 06 Mar 2026 16:58:04 -0800
Subject: [PATCH 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-expressatt_camera_flash-v1-3-b1996f7cdfdd@gmail.com>
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772845083; l=2268;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=m8KzHTR6SVXyCK/3SUO/rHRnAapxb/9fTcFjEI6HQ28=;
 b=Bqqb8k0+8JBKt2d4AiB+WtjmC335yhw4VSqawv2OtkoBfOe49d0X3+SbLdDy6RT+WEDI764qj
 /yXwDX//3jTC4cjAao5RbQcnoR2PNxkYTjkIHJQF/ErNwysEaJgUWxf
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: F094C2292BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7142-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2e:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Rudraksha Gupta <guptarud@gmail.com>

Add camera flash support for the Samsung Galaxy Express (expressatt).

The flash IC uses a one-wire pulse-count protocol on GPIO 3, gated by
PMIC MPP 4 which must be driven high to unlock the flash circuit.

Downstream references:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index c4b98af6955d..96460775a4ec 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 
 #include "qcom-msm8960.dtsi"
@@ -61,6 +62,20 @@ touchkey_enable: touchkey-enable {
 		regulator-boot-on;
 	};
 
+	camera_flash: led-controller {
+		compatible = "richtek,rt8515";
+		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		unlock-gpios = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_flash_en>;
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
@@ -247,6 +262,13 @@ touchkey_irq_pin: touchkey-irq-state {
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
@@ -572,3 +594,12 @@ magnetometer@2e {
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



