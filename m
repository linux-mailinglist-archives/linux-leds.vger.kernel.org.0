Return-Path: <linux-leds+bounces-3974-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E78A34EC5
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 20:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF49A188D5B7
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 19:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5F224BC16;
	Thu, 13 Feb 2025 19:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KG1xWxBk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0124A057;
	Thu, 13 Feb 2025 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476500; cv=none; b=dX/yH723vYmVltC+/oQYjpDj3QvVwbUF6AIaBfqFr0PZm36iKxjKnMFKGft5vdWb0pVy7fqWRFIjyvqd4gFE6rMI7p7r6DjO5bVzfDio4dF0rwj4DqX2EV+pZfR3r0uoZRwu0y4xJsxFCcIlWLiwUfKyOkksM/QrUqQdifdbEnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476500; c=relaxed/simple;
	bh=kIBzo1hTSnHBpHp0h6a/1GVcVgYd17roCbJ9ycu54MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVZdBmQFeYN1mz1NRTGLyEGuronM0ofyHUEl0XqrQeXZlSV6whuvP3Po0FhKEBeioocYfOfTpErPgthldffGkxWgDodc66xJ0mu6N+hByzYUK6QDKymXeJePWeMUVpxVGllEt9CLLffIOY7fOxCn2unC9/6/XG7zo6BsgVbLh0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KG1xWxBk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C08C9.nat.pool.telekom.hu [37.76.8.201])
	by mail.mainlining.org (Postfix) with ESMTPSA id 015B9BB83A;
	Thu, 13 Feb 2025 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739476490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pyw1u1T/BhqeaBOTjBWKSBiCdVPWSj6O3GNyYzcu6Bw=;
	b=KG1xWxBkuZlEwOl8B/pEdKc9eoZlT0p8DklwzaQeftd7+nP6iULsfoaHqZWEhdCRD4VvxE
	2lxf46ectbmEq+EgXaqeFPuougjjCJtn0UC3FZpJxbTxSpL2uQW8QmCLaIVTJyU3MgDMey
	EIwht3rmrNxKTnNtOWDFnlvoi1/rIG7jGYiu0eLkgf8hlTTFeWvMM2qJyANUrt/lIMYnyX
	bp5njWW+PCaqnokxsw81oPwUhIizevybzkW5tG65Vpc3ALGknwSa0hqSr9SD6xgoq+N5EE
	rpKAQMKV4BtZLnQRTeYFTWM3LRYsBscbC9ZJfbz2vjdOPiVmyO2fv6+y3BSSOA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 13 Feb 2025 20:54:48 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: pm8937: Add LPG PWM driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250213-pm8937-pwm-v2-2-49ea59801a33@mainlining.org>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
In-Reply-To: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739476487; l=910;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=69SYFpWMkYJ+N8d8d0RynUMQEawybp8xYKfH2SGkMEE=;
 b=gMHRaEAax1pz7MFagRnve2mD3gqITTh6Rho1R+aKyNJx89dpuAu0iNjgjOKXLQ8Nlyu07oTty
 4MXXavmQbj+BZLHnpIkdVPPeGVstj9xXT0Pfv8fk3VCHZMhlJJxG5X8
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Add PWM/LPG node to the PM8937 dtsi so devices
which use this block can enable them.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/pm8937.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8937.dtsi b/arch/arm64/boot/dts/qcom/pm8937.dtsi
index 42b3575b36ff4d37df11ccb5ed68e965e3716300..77809c3534a744f1aa4d8941736e590b9cdb28c5 100644
--- a/arch/arm64/boot/dts/qcom/pm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8937.dtsi
@@ -143,6 +143,14 @@ pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8937_pwm: pwm {
+			compatible = "qcom,pm8937-pwm", "qcom,pm8916-pwm";
+
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 		pm8937_spmi_regulators: regulators {
 			compatible = "qcom,pm8937-regulators";
 		};

-- 
2.48.1


