Return-Path: <linux-leds+bounces-6559-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07FD00E70
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 04:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1571B30223C6
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 03:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661BB28689A;
	Thu,  8 Jan 2026 03:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gkM4pLlW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AyHSfQbj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F050227B94;
	Thu,  8 Jan 2026 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843816; cv=none; b=oNUqX9vgb1VosJkuZNX+9X3lE1rFEcSnfUtc7Tr3c5S4XAQd5R3i4FHjLr6OAYnvDmcs0t9nNlUkBiLWo3gFW81hveS5eIa4EAfDLvqrRxz+3h2duIJUSWVtGOu8YhzCf4lfL484y11jE9AknaJ8IF5yAPDkyjwRpuT+QkPdnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843816; c=relaxed/simple;
	bh=zbsGn2Qvn3aara0EHz4uPK0rPp25zn+kle3Iajn6Cwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdFvstR5atj6j6xqJIkFJkzd3UTH/ox1GE7UH58mTqDX0mv71hULL58Ul24yjqllHSNcQv5GN87obo6rwxuHZzHxvNcv/OUxE452RYfTN1QWFLClLujBgDUh9NY5vwiZfP79I6yq+2vH2ujXDTfm7q9z9XUMvc8ptpZUyhnl7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gkM4pLlW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AyHSfQbj; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843809; bh=Qq6InsqVKyZMyL8BBK8OAsI
	lvW+EJdyNiC2eOxhaapI=; b=gkM4pLlWmlWVpHt/4MGEfpOLqUB7JkVLgMVc06lobHNIhbm0Q4
	6xz7QYtJEVrn5tsl+D1zMJCIm2N/chGZ4xwmFIuyqrwdvpao8aCbU+vVXBIimISilD96trHgBR4
	TbPtiELNOn9J1yBN8NFdM4jSizcpxvUbwcg/awSHpTJia3MphYd/wB8vJqq0OKRDIvIHh1Z8Q2M
	IuPuJVUZkczDQi1KiyHVHp9AgfbAyJohqZLvguXgx43wLFa1gDDf+rOp5+SQGoojtdqBbivRneQ
	PmAPbAeiC8iMzFO0VMm5LH/ATXR2lAwZLpXp7lfVVrEVeGq3NGqJfQ4GL+pWR26XsFQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843809; bh=Qq6InsqVKyZMyL8BBK8OAsI
	lvW+EJdyNiC2eOxhaapI=; b=AyHSfQbj7Y3aa8eg93TAFTfzvVE/KAQqg/0oT50nwCTuSWqJ3z
	H4/nXbDSFZDpESNfbCQaVPDOBhRKUzGi+kBg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:25 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-daisy: fix
 backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-7-8687f23147d7@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=1000;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=zbsGn2Qvn3aara0EHz4uPK0rPp25zn+kle3Iajn6Cwc=;
 b=ejAlox52kJS1BSLPruIeS6ipIU4sjxQtcDRCwdLtTEhMvlyOi5AWZJcBvCT03GDUnUT6lhsTP
 Ses+zax/KG3BprxVSDzEhBAHJSrhlphMhnEynzP7BLaPCJGka2IfC9L
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


