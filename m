Return-Path: <linux-leds+bounces-2211-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F19299B1
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jul 2024 22:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F88281177
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jul 2024 20:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4DF60275;
	Sun,  7 Jul 2024 20:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN0KiTs6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13211DA5E;
	Sun,  7 Jul 2024 20:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720384326; cv=none; b=WqrNhLVdu7eM+JZK0knwy9/uFUfjlCcNQlgU3bWkbeNh3bI56zsw4uA1/vlE+6IojtbeTf9mRPfRxHnbi3mMiO+6jId8j84970874hm2ebN5zJt8tF4A/1ALl/MPUqd/lRSOl6+lKCuTv3Sn5Nfe2BLlonXv7/ZmKQfCZd2fLFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720384326; c=relaxed/simple;
	bh=F8ef2LDwx73H3bb2EMmW031XbE67mopRtD6WTxjZLwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KhecPS9/dSR93yY85xeZWV1srk+nQbOCZ3g8ffEsR4JbpR9+NrsookR8ws683O6GwgxZK6+MxiLhBmh4KLJ63wRvBjgn//dl3XvpEQ+Q4lPiGSo5msFRVVli6vR/kFjVWCD1bk2Up8B2YhcwmjzUd2XdkutE0Vx1XdEZfbkFEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN0KiTs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FFE3C3277B;
	Sun,  7 Jul 2024 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720384325;
	bh=F8ef2LDwx73H3bb2EMmW031XbE67mopRtD6WTxjZLwQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=aN0KiTs6hXFdiNwQnhyJmYVyyW7MnHzEASL4dCWsZ0pRmZmG9Wxs55XMgcN+s0qXr
	 h+eyG/zGS48A5pOwj7VnFyaCs6sc9nZBybK44gZ7/psVENrwk7AJobj65sE1DzHU9N
	 N+A+32/vHmm/StvhWyj9QNAqyAPMR7Yx88sGQ+ezmk50vPqtNQDvB1EXKe2XdPyuS6
	 W5Sck9Dza2fOdugTBs42KNVp0rBAPPkhZTQy2xheFVkRCmdhAFfBC4a40X0NYAbzxy
	 y1q1V2gQMWw0iEZZU9z8zDOJxtIMjrRsuJDa0j344kBZp1oTLwmAFnGABoD9swbjuA
	 MsT22CHXrXg1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F69C3DA41;
	Sun,  7 Jul 2024 20:32:05 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 07 Jul 2024 22:31:59 +0200
Subject: [PATCH v6] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240707-sy7802-v6-1-ab03f17706d8@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAD77imYC/2XMy27CMBCF4VdBXteVZzy+seI9UBe2YzfeAIoh4
 qK8ex0kAlWWZzTf/2A1DSVVtt082JDGUsvx0Ib+2rDY+8Nv4qVrm6FAEhIVrzdjBfJMIkedlVa
 oWHs+DSmX6zO0/2m7L/V8HG7P7gjz9ZUwr8QIXPAuGPJBYvY+7/ypnO819t/pwubIiG9IAhaID
 QJIC054Q2TXUL6hBlygnGFyMUI0Lhi3hvQJ9QKpQWOdcwRWJKHWUH1ApAWqGfoQXed0yF7/h9M
 0/QGc3YZEggEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720384339; l=3739;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=PCHxsETnqMCOtnrhqJf1EyDZwF469Myb53EG0JzMbr8=;
 b=OaGp88AZFpSA85IPzlVCL7cbjAQlkMynDDxeobpKmJ0lx+cfRR36y3siZkt1KFN/ZFdZ+Jcas
 tT+f9DBoLAlBy24twlkMj0jWQf3GWqOKtcyoC1K1M2DhMML30NTa2Xg
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



