Return-Path: <linux-leds+bounces-6656-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1347D2CEF2
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 08:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 348A7301736F
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 07:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3448B3502AB;
	Fri, 16 Jan 2026 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sIB4aTNN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="H453Xz73"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3134F27D;
	Fri, 16 Jan 2026 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547290; cv=none; b=FijdJpUIrUoXjRW+ks6z/mOIwn4C/kjb4A2yI20rSI9Vg4TCGxI9+ZuED17JdoYPHsXsqsyKUT/l3NQ6pIZpcDQqsWxY8gPOwomzcIB9swy3wrz2gghLUcCCbuvwGKzNown/EMwKqRFBRXCuCeHVNFMgt/G+/roanpIGgup9fU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547290; c=relaxed/simple;
	bh=R51pIOSxhagbTKh1Jt1ByaR5vAKzdpI0frd0dUUM/+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QtTVKUvx7hkrryxT7PmW5puYtszaGJ5Fh2JfbmqrRXp4uU3wbsuv1k0SDqeEK89YzHpv3VI6vmccsu0+wydM3sQFJhU+kHNaub/lStA+UnabKvxdrIHJtFauR/TXGSIsmNbsQhsTHH3gVaXALMbJPKqmpACh3+EcM1ekOZuSCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sIB4aTNN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=H453Xz73; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547281; bh=AvIzM2nLqwPVqyqqe4S5ee1
	crGx+CsMVd1ai9BANdC4=; b=sIB4aTNNhUWitXSp/KvVMnd4Ff9pI8BNWfqzlQTbgfUVJoeSES
	yUltBbCQQnuc+m8OtiTw9d8jJtFBXrT+3imMOd3cD9+0tZb5HdffUsXh4saGoc1CNLspSYKM2/V
	gso4kxBN7ejKsg0wjDojP3UhRK8OdA+XdRgtIfEIeOcXDxjqrXLipu6kzALbSFiUzRuaGeQNC1Y
	AB5sn3XRyIupRPgMWhvAdvnIC4YsJT+OStay5LuxSJ+FycjMYKHOHxO/nCsqBgU8DUt2kAc5kX0
	2Wc/Ifr6+gYgQG6lAT25BRIEy5yLTdVYbtRag42Ckp1SGR5OIB28cpRDsjErYA/CJHg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547281; bh=AvIzM2nLqwPVqyqqe4S5ee1
	crGx+CsMVd1ai9BANdC4=; b=H453Xz73k7cugjgil7k1FMgZ/nq1ybMTSQnubxePz6oGaQPwxe
	Y8fyZ51qEYi+4cyr9PbRbWoKwpAl1/H77MCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:37 +0100
Subject: [PATCH v3 5/7] arm64: dts: qcom: msm8953-xiaomi-vince: correct
 wled ovp value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-5-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=985;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=R51pIOSxhagbTKh1Jt1ByaR5vAKzdpI0frd0dUUM/+g=;
 b=+nOudNBfn6dCatVLyaY7JDGGnY9FFAaPs/wsaYm9YWfHzAIZBo0FmHb4NymZEy210NauvIiZr
 bSQqa9OouP8BHE3xxmqauZSMbJl8agbGXbaGpZEhY7w6y4ZyHclvWmZ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

PMI8950 doesn't actually support setting an OVP threshold value of
29.6 V. The closest allowed value is 29.5 V. Set that instead.

Fixes: aa17e707e04a ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Redmi 5 Plus")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


