Return-Path: <linux-leds+bounces-6548-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E647BCFDFF9
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 14:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3067C30C3896
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 13:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B066332ED27;
	Wed,  7 Jan 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JRTKso5f";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="G/HQ3X/6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC5329E5D;
	Wed,  7 Jan 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792693; cv=none; b=bczLOaarJuJb9q272KoTiy8XFaIBVNxu9jrvPrDzMSs1eIbVS1kx5AbqlH2JwPoHM+xMoToBuienNhJOoTFz3IVzBa/1dwbb9BM6NHJ8uHHqQNrOp+/nq0y4trochjvXJBCAAum7ULT91aSUp6llcAjUHiJV06+DE0ud6kb7RLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792693; c=relaxed/simple;
	bh=ru5PPFVgK9SKpbwP4epYMO1PvHxYRXXIDwD6I01+7M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ag5xEo3BbSbva5cqUWD9TCdfoLJ1MPZ/9VZldeKeOOeMF10eLk9Mx7rivtSJroWp+QReN4yDYGTNjvOwxLTW/ZaYuCcvBMEhbeGZlYIj7l5QjxuE76U8jGd1YZ5ZfOit911epFFlS0c/b2mTT1+qnrlGTH9Dw7KTUW01H4cxsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JRTKso5f; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=G/HQ3X/6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792678; bh=3NZWoK7S/66Hxn8K/F6rDHS
	vz8ET7EHlWshH6nhF06A=; b=JRTKso5fE4+qWOr7ufZyGosB87rlL8q8l6OzkA9OSDl9GkZ8sB
	MacNm/sZbQ4ticwiI2GCn2u+cmKp3Rtgpas7WDzvwFfhagsYSQ2oXlEZ9tnM/4FcBuUQHNpIQeZ
	3icmQEDu8utd/24U+EN2VAmT3T0JT0YF66IIq4flSrDYDG9n3gZDAi2Xw2WN6HuqzE2hKJv0t+S
	u2vq9v/pcnxGDkFD4UOb3dkVbfgv0h81Nm0wKtbkFBpmYnFjHFfBZxNzyQ6+AA9Sa4wzqFY5ku9
	qb8T4KMdlI5e4oIlQw36Gla3zxjy3YYQhWaZMUZHTrbqHC07Ws4M4ua0MO027GlSy6Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792678; bh=3NZWoK7S/66Hxn8K/F6rDHS
	vz8ET7EHlWshH6nhF06A=; b=G/HQ3X/6ol+IPEhJiGrI4+65x+20VBeYW32xHq0hgIsjn+sXc0
	8iafuLoEqxPqA43OhcZAy74uPCCsFHhcnsDQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:09 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-5-5e52f5caa39c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=801;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ru5PPFVgK9SKpbwP4epYMO1PvHxYRXXIDwD6I01+7M4=;
 b=Shp3cRJqe3u+C7unSmCbEj8vWCSm+WnrIpHcvjXWFfsNvB30no+mSCenDvBtHWh+0iMNDCn2A
 E7Ww946EZvpBskW3F/I2gGElqa0M2VCeNMlzIG2b1zuRXDS9rDwF2kN
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Set qcom,num-strings to 3 instead of 2 for avoid stripes.

Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
index ddd7af616794..59f873a06e4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
@@ -157,7 +157,7 @@ &pm8953_resin {
 
 &pmi8950_wled {
 	qcom,current-limit-microamp = <20000>;
-	qcom,num-strings = <2>;
+	qcom,num-strings = <3>;
 
 	status = "okay";
 };

-- 
2.52.0


