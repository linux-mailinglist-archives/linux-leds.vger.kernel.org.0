Return-Path: <linux-leds+bounces-6562-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E09D00EB8
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 04:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CF6B3003B20
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 03:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D943E28934F;
	Thu,  8 Jan 2026 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="f0OTr26U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CnOM96sg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFFB28642D;
	Thu,  8 Jan 2026 03:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843952; cv=none; b=DSaAP0Bs6/zrd3/8IX/5igxz0y/f35teTpt/WXi9K4jBQqa7dT0KBnwzFDSDeOQmtz0PwPVZksKNjFVhukTMQzFy2nn7VNzBp4oZSB0udMR9bzj21YrWft22QvVSGAx/0exCAff1IlFNYbgLcsMrAXBLVs7r5jfdr7xNeYpLxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843952; c=relaxed/simple;
	bh=R51pIOSxhagbTKh1Jt1ByaR5vAKzdpI0frd0dUUM/+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVPhvT9E/mxL/XTmAD86de6a8x//q008UVgxP+evbogsjVM9KR0W5ruzaVa+UN9DxIYbr30SMg7YCSIbbpiqM5rYYEcPqL2Eyn8P3lBssW8WOBtLExHL6KmegmD162kMx9ao+9P2w+l6Sz22yM+r3D9Ffl99kCTREdw00UTuM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=f0OTr26U; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CnOM96sg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843807; bh=AvIzM2nLqwPVqyqqe4S5ee1
	crGx+CsMVd1ai9BANdC4=; b=f0OTr26UiT7GIgVZKTmWAYSbSwE5vFBJEGUd16CEEKoF7cZalg
	PgXZt79hdNp6LHZSDolSIGKVNPTdptFbXI/Q9vLZgHjHHgQjD2FrbLnrK6H9FMqjtvApmj52XTt
	LMcXxawkektU4aim0LeUZOSQ9t02pJQlP1QSJcCCkKhfzUdyZPd5NpnqIkN7MW5hyzcr3JPgimT
	Bo2EacxXEU1pUpFxa3hrLIlKi/TTwurW15LZikLMD/ZvrpDST5UX7Z1bH6HTUR6g5m5rYEjE/Ir
	l3IgY2g9FvEd0/f6PEMYsZSP4El4KrdJrnwDIdxPV/YwDnuzNmAU8slM5wF/9RcMceQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843807; bh=AvIzM2nLqwPVqyqqe4S5ee1
	crGx+CsMVd1ai9BANdC4=; b=CnOM96sg1N3j7zzi0tMSO9BEz9yV5gPHyqQq127VOJEz6c/3+Z
	UvjghNLS0wWClBnaPzndbbxnBzgN1HcCItBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:23 +0100
Subject: [PATCH v2 5/7] arm64: dts: qcom: msm8953-xiaomi-vince: correct
 wled ovp value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-5-8687f23147d7@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=985;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=R51pIOSxhagbTKh1Jt1ByaR5vAKzdpI0frd0dUUM/+g=;
 b=oN2acr/W98lwM8fcqXwIMjp8lDu4Er4W65gMn+nJV4XhwUrEhpH1qBbOdnnX44h5MmluL9Vhs
 RwL6gSur57OCon433VPOrXCg/bJHh5LpUACYjG4IvHVMp+3x8PgMpR7
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


