Return-Path: <linux-leds+bounces-6550-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD839CFE0B5
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 14:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A916D316CB11
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 13:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEA133A714;
	Wed,  7 Jan 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cESJymPw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="M3xRcU+/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C93327C08;
	Wed,  7 Jan 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792831; cv=none; b=d/f0P22UcVIMZSLwLgiMYYbGeuplR4yF+vm6Yz4FAN/jys8QvFY5Y31LITwPGy3PW+HJLjiIYnVNA2Rd9zm0zLbuXq1aHSpOIhJrb2opKpAMAn5EPSXK6Tw6Ji1UrmBK03x8hmZzGDGL5BPwn3+WwfuKcv/0OUdjivpV/8gA7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792831; c=relaxed/simple;
	bh=VW78Ujo+EwXFe0PRiUbzn+cyI2HRhNJC2s0rKR3xSr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXGXpnjVzqZadUlkKQja5k/Ev9LkFbo73f+ebVdv+eayZxDh5Ehqk4FVZNpoZZqDU9AFP0Hjs8052Se989KOsHXf14TPLi0vWlM9KBn3UzXBRtOS+DV+RATihGcJKToKARQbZ8/9ms2T3iWQ7Gp4QLlj3n4hKZJDOHCMGS6ZePg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cESJymPw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=M3xRcU+/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792676; bh=NaV9lkfW0P2ymvt3pfufEgA
	rA63fyFY5MEhTkcp5K4c=; b=cESJymPwOR+2Mv8GRlSeadGUcX2U4ONV4rpPNagQGav5PqBbA/
	fCHPZf7MHFlNHa32YV9ZFu9w5ms+OiKVFBUgngBJO+MsLlka2ZojOO/qRwddgKb0QzYj4Ylv89u
	3vlWFMDOB9my0gJHsLazJTv3MjC1aJST8F0o3a7cIt6vz8OsxNJO+05vbAxAScZTKEgj9prX+4n
	MpIHsuGJufucurvb9TJogXvXtHNki3HtIilPTmN4qZcYQeqmAlXS/JP1dh/3RMaUiY14oMRJ8Dk
	N/2SMoaJtya2gp9GwXhVYoUjgGgGhe/jvgL+C4pZXJqxiuCzqXhPOGUo+yPFqJn2kQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792676; bh=NaV9lkfW0P2ymvt3pfufEgA
	rA63fyFY5MEhTkcp5K4c=; b=M3xRcU+/JuoAkiLaMgtDEclpQDbfkj1uUnm43LZDaJDOFXTpQq
	K4NqulYw2Es/0zArd58hh7e+I1f69hjo41Bg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:08 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: msm8937-xiaomi-land: correct wled
 ovp value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-4-5e52f5caa39c@mainlining.org>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
In-Reply-To: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=796;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=VW78Ujo+EwXFe0PRiUbzn+cyI2HRhNJC2s0rKR3xSr8=;
 b=1H0UZG2Y3jbizp1sxueNLBEqJXnjaCUpBpDkRM9hjtfaY+tThnhRLUozfPE2fzyJ2fe43cDag
 NswQXXNV87bDi5bE50GI6/zcQ47DQUE1k8CTocRl9dmnUzTuKt4XFR9
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Correct wled ovp value from 29600 to 29500.

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


