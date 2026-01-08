Return-Path: <linux-leds+bounces-6558-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 603EAD00E97
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 04:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5F823057473
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 03:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E40286419;
	Thu,  8 Jan 2026 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kOVvML5l";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5hoHm3Yn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157028504D;
	Thu,  8 Jan 2026 03:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843813; cv=none; b=GZbkZIFTvvZqJ29uF0TOcrKe06PgvFbIYVtBkGGms9VzIUkA9HjEewbCCvoi0lN48QvtRCHWIAHjNSVIRLXxiKr9VwoBRgydETqudYhykHE67TtvzJuuSXHNL9sSpxKlrpMNWKIIia8LzoHiyPp1CoTRTuL7mbPWlIFHfnBDOwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843813; c=relaxed/simple;
	bh=sL1xJ/7VJyqA0vrIzRCtoN0OcaOJvQekAknEhb2LvJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9UKrBRdCPacNlVzpnhITHI8TX1ec+tCvUMUXKSxqJFo3NaDlv0nSWb3teqFRzaFS7V1M9+GjKUoHolSJwsIDrsLnSfWYyCmHTuIwyXJU9rdmGqq1ml3kZc5EWFti99UP3402fMjuC1iEeuqF2Z9BAQrrPqFxT4Iji1+dY8/4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kOVvML5l; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5hoHm3Yn; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843808; bh=ZTd4KzpYo+iJMB9JniHWo34
	Z5P9kW3MY6d22A976Kv0=; b=kOVvML5lFohsUI8D6FwPX2Dy/4EmoVyvktLHoiZQ1ymPsk8yti
	1xi4PX87/ucegUy3DqhaQRQlbfwejso2wx37FUj7Hs3ZIFdSxF6W4nfx3hBcjIBiyHjAcO8qVha
	jyQ7lYbZUM+66RNdYiKR6m7BsSRh4OErzfjZkqIBt5ycOVZYD4AUQIdZXSuLuEWMyQoTLQzj8uC
	rRrbGxszuxAWrzci7zQbB2zZHD+vHiD4bGANKRIorxSJ8S4t9Uzj805oKFtw7tLaei72+1uuZ6h
	gCoSEdfx1LpInnQnTq3KJQi5dFCopdzc6csqRWytj/uGEotuXyuHxzlDlwejn8hCnQQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843808; bh=ZTd4KzpYo+iJMB9JniHWo34
	Z5P9kW3MY6d22A976Kv0=; b=5hoHm3YnX+K4EzJu/75c/xk/SFyZvF75Ckip4jNc2Xur13Ji7k
	CNQY+9Nv467Fkqrld2Pk7UZMLeyaigRxmKCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:24 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: msm8937-xiaomi-land: correct wled
 ovp value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-6-8687f23147d7@mainlining.org>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
In-Reply-To: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=883;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=sL1xJ/7VJyqA0vrIzRCtoN0OcaOJvQekAknEhb2LvJA=;
 b=OCZfcW3st9m2Z+QSVfDFmb7XpMqLumaNG7TxNMHoMYX2wMMPJreY/7uhRPTsi8N20ufJz15XB
 hA9A7/eLpWIAbzP6gBpZaIbc+AkJHzfnI6c8AXs10MS6z91SXSIKngQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

PMI8950 doesn't actually support setting an OVP threshold value of
29.6 V. The closest allowed value is 29.5 V. Set that instead.

Fixes: 2144f6d57d8e ("arm64: dts: qcom: Add Xiaomi Redmi 3S")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
index 91837ff940f1..4f301e7c6517 100644
--- a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
+++ b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
@@ -178,7 +178,7 @@ &pmi8950_wled {
 	qcom,num-strings = <2>;
 	qcom,external-pfet;
 	qcom,current-limit-microamp = <20000>;
-	qcom,ovp-millivolt = <29600>;
+	qcom,ovp-millivolt = <29500>;
 
 	status = "okay";
 };

-- 
2.52.0


