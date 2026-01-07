Return-Path: <linux-leds+bounces-6546-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBFCFE039
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 14:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE301314E8FA
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 13:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EB932A3DE;
	Wed,  7 Jan 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NNqrnorB";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="J6Xbyrte"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB07329E5D;
	Wed,  7 Jan 2026 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792682; cv=none; b=f+2zKajXuuA8IalDNN+h03n/Attjof+tc+cvNZzXj/UziB/1Wu0XGU9bsAfRwIAGzyhparA/enxwQ/vwt3rm73AufkwZ+KUGswo282lZnS5koyoKpZXy9am+LW2o/qzOcV3DjQTj2+O6dao11duo4GICnIdrrbKNcD34H0Ogb6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792682; c=relaxed/simple;
	bh=v8jKh7deIkBU5FebVf2aUVsP6DwuLjcMLNaTTYNAGn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZ4PHAmbn6tI18vKEb8YAxIG3mYgpNTC1jm9BzbhtTfJT2X+/9d3MVB6kxzLMz9XmDokvuXubInuiz6zXnz7NtW6qnGQnknbSsjEDObc0aFx9WEVlLkP/e8ruRTctj2y8YxDMwRYlHEqnl1zgPWxGlYLQ8FsllKjniMSAVS4cSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NNqrnorB; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=J6Xbyrte; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792675; bh=kGflik9VbPGwdJ/anHWMppL
	4CuNJ02DVZyvvduz9raU=; b=NNqrnorBFL0z6eL5xQaD2olhaoTbJWb5X5dW2ggaV+qrwZclNX
	GzzqoWqDWPTEDCmhOR1tnzN1F+P4xedKxddUur515R6cx0p0yB//Ei/5J+y5m2/E7gMG8z6eQi8
	RbHd3BlBFvuD//P4XKcmNcSdl89IoC/jIm6iIDcPylYeZ3kMGtn1yhZFXHKjORyctybpps5SQnF
	YVBBG6RXyN6QITSwMLcZ1SphBynlB2qbFpYkwzQvs1Q7WiWWsWQ/jAGOuTSK3HG20sGdEGIqdRY
	Q0hVjSczrNLShY8ZWE/RoBGRbLpie5dcmMR+0zM4XlVfScZW39eoe6VeKmW/25Kqbkg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792675; bh=kGflik9VbPGwdJ/anHWMppL
	4CuNJ02DVZyvvduz9raU=; b=J6Xbyrte5dq4Yboivczh9IX4sCCg2hOsPM72kDNfRO93ODM7M8
	ByUTKfi+/dusTKp9jPFgfHIMbXM5YBin7FBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:07 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: msm8953-xiaomi-vince: correct wled
 ovp value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-3-5e52f5caa39c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=837;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=v8jKh7deIkBU5FebVf2aUVsP6DwuLjcMLNaTTYNAGn4=;
 b=/gRLfpy6zIiw7KrLHNhj3HdiFJZsP46dgA/TKGecN5/54ztl/FcGCzJ1UNNgHkspw0KQ9AwS5
 +eW+Ow+vfHiClEvIQt1q8NlLMI5eJ3mHwZyRiQyT6283TC08zpBstLL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Correct wled ovp value from 29600 to 29500.

Fixes: aa17e707e04a ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Redmi 5 Plus")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
index d46325e79917..c2a290bf493c 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
@@ -169,7 +169,7 @@ &pm8953_resin {
 
 &pmi8950_wled {
 	qcom,current-limit-microamp = <20000>;
-	qcom,ovp-millivolt = <29600>;
+	qcom,ovp-millivolt = <29500>;
 	qcom,num-strings = <2>;
 	qcom,external-pfet;
 	qcom,cabc;

-- 
2.52.0


