Return-Path: <linux-leds+bounces-6662-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A87D2CFDA
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 08:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F38A3026BD5
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 07:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C67334F46F;
	Fri, 16 Jan 2026 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VaBEPpYY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CoGRshCl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A334D90C;
	Fri, 16 Jan 2026 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547437; cv=none; b=YZ64DxgD7M1RdBzfoFvAI+vN7bMkFBNuNq8ipnHt/DQb/M8XqMBiAg40Arcx288qD/mYBOIgCr2zU9Sgn1wRNobCX75mL5f4mhUXCLggSHiP9W2AmKvfPCE9yT6KcdZF4OpmFaM7k3jEeLB0IcYDq2gTKkjzy+SV4eGyEAP/uVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547437; c=relaxed/simple;
	bh=zbsGn2Qvn3aara0EHz4uPK0rPp25zn+kle3Iajn6Cwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzPSAf+20qs/u0lNx/qNOLDMtFAz9VR7CapwgmxTjC3HeKFnPxQ5fmdv/riy19qKru3DfrOqV3QAMRb6jpvxQxm6ENfagP43Ut4Fy/B76jNq7rvh7wuZHDqy9oVoUFSCtWwWvyn4BFgARKSr8HQgRXdi1RCyBLu5YTkL+djtduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VaBEPpYY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CoGRshCl; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547283; bh=Qq6InsqVKyZMyL8BBK8OAsI
	lvW+EJdyNiC2eOxhaapI=; b=VaBEPpYYGV0aitRRLPWrwe7ifNmDNF7jo9f7xRPRh/F8wIzRrD
	BFR7NwMc6497hME5ZvUzF7Zby3HEB4hUCtGbFmlN6E6t/E5AkTiLZA3rVk/2BNlxXIa0LXg1H21
	FjWI4Qls3Ad8nGqAFAwIJ/VUh4dYxMZJukaoLDdzEKbtyXqEsz7mwQU5gUfJRFhIdNrxt6kffOV
	XG3GD7iXiSY6adVNz50uD3Xz08b2z+ucPql+wfW49JVvdD1S3LmKqdKL8ckLuAoRPLew3IVRjlB
	qasejZ9h8at2wFPoKuws5/DSDt14P6TkzeiU5iW4qKBAn9wQ2pz4luRLAV8br/bhwvQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547283; bh=Qq6InsqVKyZMyL8BBK8OAsI
	lvW+EJdyNiC2eOxhaapI=; b=CoGRshClAhUsSwLdMkAUbhVsUGtifY6wsj/5581V9ZqidaiTab
	80QumbT1nBtOdt5Wes+Kb4DEC4TjJzadEyCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:39 +0100
Subject: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-daisy: fix
 backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-7-e6c93de84079@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=1000;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=zbsGn2Qvn3aara0EHz4uPK0rPp25zn+kle3Iajn6Cwc=;
 b=jXbi9hS+qCYPyUIO2MjLpEkGwVCUg8dMlehD6gtjnFtgUbq6vXrFPPH7hLzQkhTcdONIl1uRu
 lA95BhCL5LXBZMCPRSwew6pW4uyOlHbhFPmk8n77fx1VbxFJFxAK0Yz
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

The backlight on this device is connected via 3 strings. Currently,
the DT claims only two are present, which results in visible stripes
on the display (since every third backlight string remains unconfigured).

Fix the number of strings to avoid that.

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


