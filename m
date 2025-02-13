Return-Path: <linux-leds+bounces-3975-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB44A34EC9
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 20:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0D0C189071A
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 19:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEDB2661A2;
	Thu, 13 Feb 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ToSrb7cW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ACF24BC00;
	Thu, 13 Feb 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476501; cv=none; b=tI8uV5dwYxKMD3bTLM1crLUgOc3TubljZakLRDCXfIABq8DHAgfjPUDZbfrEoFno0THz7Ff+IUhwDfHiuacq2O4/4h3vvGRUQf6YmiWenNsAWVIqgRuxVB6n8oKVIUxG7NHusJfM0/Ru+CsgsmqupRCs4hWg5K9Q3R5SOqxkDT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476501; c=relaxed/simple;
	bh=RirCIYtA6MaJ7gcEWQuqa331X8Y+fvPvZb9sjazFIgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOPg1yrSzhBRjsfPQDAzWAfXXfysOzjSVeLyDOfgdR78z4dgXlF7gCVj/jAPZMq4sMJR1fGCa+RvWCjHy3EZSbkVKPoxmX9zMMR+4Lqc4fawYGM76mMpXAB8HwrQ+AjOf3ZS1cY56WP9JDLNQWporfmDATJXAyx4i+jFUwgMLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ToSrb7cW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C08C9.nat.pool.telekom.hu [37.76.8.201])
	by mail.mainlining.org (Postfix) with ESMTPSA id 187B5BB83B;
	Thu, 13 Feb 2025 19:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739476491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScU4C5kD2FXBNDVEfbcMvkNhcY06xzpF/lYTFbynkHs=;
	b=ToSrb7cWxsGup6WNke565smwGv4iGjqGyd4npgIm1nb6eyAPFAwbDYquNjXXKGtnC1bb+1
	XAjITBoisGOGuDOKa8C10UFM7o2ZqusBifeCPobGpDNLOXCziEp1G1wHN4X8bbG0UVgpmy
	JFmaboKetHSP868LBQZBjLxxm6iHskdsYZGhDZB7LPCHLB1g7KlC7z5vuNhEpiO5I5Tz6S
	OCDtnt82tdEglwkeKi1bmiEhOxuIiBcA5KRF/EjybwXs2EEeyPqrAq7dMY8Hp68VjDuY/u
	oREve8mrTyQApB8hNxaFKGvhENQuWXRqiOOC+iYIkuDxGqTi2aPDfnhYMIoZpQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 13 Feb 2025 20:54:49 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add display
 backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250213-pm8937-pwm-v2-3-49ea59801a33@mainlining.org>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
In-Reply-To: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739476487; l=1432;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=RirCIYtA6MaJ7gcEWQuqa331X8Y+fvPvZb9sjazFIgA=;
 b=MXdN/OeYJ+HXHqyCS7XR6hDExLVdcfdJEh8V81GhWZRu/97AI2iRcUFBsgB2o20BfDCEXFT3M
 ollHQ4fiY6LDYki5rfbrXks+dDfQx7Mozso667n02iBjunbLbfGOVyJ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi 5A display uses pwm backlight, add support for it.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index f1d22535fedd94467ba3f0a88b2110ce5360e7e1..8808306c989f54116052667887f9bf36b63c4c64 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -20,6 +20,14 @@ / {
 	qcom,msm-id = <QCOM_ID_MSM8917 0>;
 	qcom,board-id = <0x1000b 2>, <0x2000b 2>;
 
+	pwm_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8937_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -131,6 +139,23 @@ bq25601@6b{
 	};
 };
 
+&pm8937_gpios {
+	pwm_enable_default: pwm-enable-default-state {
+		pins = "gpio8";
+		function = "dtest2";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pm8937_pwm {
+	pinctrl-0 = <&pwm_enable_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pm8937_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 

-- 
2.48.1


