Return-Path: <linux-leds+bounces-2354-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0EC940049
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 23:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FBE5B2248F
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 21:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB3B18D4A4;
	Mon, 29 Jul 2024 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmAt9mx5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796182869;
	Mon, 29 Jul 2024 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288156; cv=none; b=i4F7h3oTtX0ojoEU4J4M32gsgTuos9aIBHVtu+aNqeK/B+HopU4syuvMEk8BO3bS0mVDC+T+wDE/ITZ0YgjbdGeLPDjiMJABqNAA7IPQpKtEgxj4B18ldFLnOy3D58xL8pXDovYoBTCjD5fBd/zj1vSUIpV7rjRbh2FmGNO4hWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288156; c=relaxed/simple;
	bh=F8ef2LDwx73H3bb2EMmW031XbE67mopRtD6WTxjZLwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zr5Gwe/j6WQqshJB87bfp6F6XYFaRf9WH4Qv4IvzaEJXjTDzCZm7A6XE6GDLkjVQXkWxuJIgMPjeH1g5sO4KX//x+3sJE2Jj3dqvTjR1p886+gY1jftQOQcO+yDImNRSgDCJe+jorRJEqjXH4NUswnW5W//IErkrqLzStUw3HTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmAt9mx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EAF3C32786;
	Mon, 29 Jul 2024 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722288156;
	bh=F8ef2LDwx73H3bb2EMmW031XbE67mopRtD6WTxjZLwQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PmAt9mx5DLPTLR9pzzN+MNia/8Zg+5f7ddSrppVHUoxoNwaP+W9qeymFNDeGCLdCB
	 KtTXISWn/Sxno7pF339Q1L++CAdfqrhUNRAVqQbtBcAcOQpQLMbjKJdgn7tkY40WvM
	 YLu00LqZ+MU7xCiUXgAsKSOnful/TLzadr4JSbpxlS1yed7osSooSvFp+dT9k8B5Fh
	 v4H5JmpGzW5oh0KPonvw1/+Vp3Cvl1Fsqcee4wojz+qtBDKe5psAKWfdG655ZGmupS
	 zRWAJjnM9uHDVgVk4/+P/tm/Ejfv+AyOUTDRHa3RrZrZBp2DkSHv7mFv08M+9Qz1hk
	 l0Qjs4wgaYJ4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1687C3DA61;
	Mon, 29 Jul 2024 21:22:35 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 29 Jul 2024 23:23:04 +0200
Subject: [PATCH RESEND v6] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 rear flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240729-sy7802-v6-1-86bb9083e40b@apitzsch.eu>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722288184; l=3739;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=PCHxsETnqMCOtnrhqJf1EyDZwF469Myb53EG0JzMbr8=;
 b=R41Cn5ZKcw2KtJh8ebGpfkx53Ew/zWyK2YNsULcY/fu5FAXW8J1xss0PQq6fsocyHz6f22SRm
 C1GF2/xvJwuBWbUHV2FMavpMU+x7Fxny+yIK5EXtoABuKtQfm69wCJ8
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The phone has a Silergy SY7802 flash LED controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
This series introduces a driver for the Silergy SY7802 charge pump used
in the BQ Aquaris M5 and X5 smartphones.

The implementation is based on information extracted from downstream as
the datasheet provided by a distributor of the hardware didn't include
any information about the i2c register description.
---
Changes in v6:
- Drop applied patches 1/3 and 2/3
- Move #address-/size-cells to the end
- Add R-b tag
- Link to v5: https://lore.kernel.org/r/20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu

Changes in v5:
- Fix language in driver description comment
- Unwrap function arguments
- Remove unnecessary empty lines
- Add Acked-by tag to second patch
- Link to v4: https://lore.kernel.org/r/20240616-sy7802-v4-0-789994180e05@apitzsch.eu

Changes in v4:
- Use for_each_available_child_of_node_scoped() to simplify code
- Use dev_err_probe() to be consistent with the other code in
  sy7802_probe()
- Split devm_add_action() into 2 devm_add_action_or_reset() to simplify
  code and balance regulator_enable()
- Link to v3: https://lore.kernel.org/r/20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu

Changes in v3:
- Add R-b tag to first patch
- Extend driver commit message
- Improve readability of defines by using BIT()
- Rename some variables/parameters
  * led_no -> led_id
  * level -> brightness
  * curr -> fled_{strobe,torch}_used_tmp
  * mask -> {flash,torch}_mask
  * i -> child_num
- Restructure structs ("Place th big stuff at the top")
- Declare 'child' on a separate line
- Move multi-line assignments out of declaration block
- Update warning/error messages and comments
- Use gotos to handle error path
- Use devm API to cleanup module's resources
- Init mutex before LED class device is registered to avoid race
  condition
- Link to v2: https://lore.kernel.org/r/20240401-sy7802-v2-0-1138190a7448@apitzsch.eu

Changes in v2:
- bindings: remove unneeded allOf
- bindings: example: move flash-led-controller under i2c node to fix
  check error
- Cc to phone-devel
- Link to v1: https://lore.kernel.org/r/20240327-sy7802-v1-0-db74ab32faaf@apitzsch.eu
---
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index e3404c4455cf..b845da4fa23e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -159,6 +159,26 @@ led@2 {
 			};
 		};
 	};
+
+	flash-led-controller@53 {
+		compatible = "silergy,sy7802";
+		reg = <0x53>;
+
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&camera_rear_flash_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
@@ -318,6 +338,13 @@ camera_front_flash_default: camera-front-flash-default-state {
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

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240325-sy7802-f40fc6f56525

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



