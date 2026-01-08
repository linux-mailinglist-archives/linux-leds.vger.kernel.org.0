Return-Path: <linux-leds+bounces-6563-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE1D00EF4
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 04:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC0CF305FFEE
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 03:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D546E28851F;
	Thu,  8 Jan 2026 03:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CIxVZ5mQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UZnuEd1+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117672857FA;
	Thu,  8 Jan 2026 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843955; cv=none; b=tD1YLrHd8RFk5gK2i7BevpQfnReK+hy+EEuIIiJgS8aIx4euncCfTQPqpj286dWmRT4Q3imjBPb8EMldO3ZVl85GARC+E/MDv8JCH+CIUp6iXHz0XNlNZdn17cnFsvYt9uEK4TSSlB8Z7Aic/AgGCeRO/7g5CYr4ta5khhRjXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843955; c=relaxed/simple;
	bh=R/fwkb7Qmt4LT480i1UqLq0vWO/bV6zTcVUBwn+/sZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSfEq8JrCvGbSQnJtdrQzs1PYPVYKJgtfGCt+oR+wcZSDqEcrGbK1jPf5r0/gbjn5ilhMojk5NJcLY33GMq7K7JJ0wtng4maHoNz51bgbQkEZs+u9ap0aSyI2FH4qeoc9Y8fF1lLUnldpaKNkj1fDmPFQfonqJlTzNwl3qop4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CIxVZ5mQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UZnuEd1+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843806; bh=8LHmY6HcOY73PGWHr/gojog
	Mzi8vGGFWJuGz3nuS12U=; b=CIxVZ5mQMxK+of3gsS4VVwjo55p9SoFPjksV/gx2F1+1cI4dHw
	Xnt7gPWho9Cjx2btAM35/7qsy6AloDAJMQvcQTgtFenldD27zpZ+TPOkEeq5wCiKZqVj3uIxlQo
	g4yvH+jfIjsQT5eNvT9yOJ2xzRIrSBZTQpCvMREmqDt5tFlujggM2JnWxTCLAuRlvrSOXzU3bkE
	OFj+csusVajoBXsKC0JAo2gcVGGxRYVaT6f1KPGUh5vaunUg/pt8Gc+tATCjebhGbuMpSxhFzSw
	if96qPHSQmjvxfxQg+yvnnFwes13C1NXu7GVf9pkQof0rdAltJrW8b3MyFWVamCYPcQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767843806; bh=8LHmY6HcOY73PGWHr/gojog
	Mzi8vGGFWJuGz3nuS12U=; b=UZnuEd1+UioT3aY0qEq4xxFjgmXS+CcHzBXA7PjCG6uTmIZUgx
	nlUOMAQysU+6trRvIRYfo55J2ToxcblQTuCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:22 +0100
Subject: [PATCH v2 4/7] backlight: qcom-wled: Fix ovp values for PMI8950
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=923;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=R/fwkb7Qmt4LT480i1UqLq0vWO/bV6zTcVUBwn+/sZ4=;
 b=4pg/PVS5l36GvKHTmd3NY+FHowK2SomMGRGIae+jnepX7IGH1jBjp4Mp1bP8AiLFtH3T5mmvY
 mPVxfVkt9FjAziHSBGwO+xnOPOv6nPMDFQa7hVhk1IGP46y/B2gFlR/
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

PMI8950 WLED support same ovp values like PMI8994 WLED.

Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/video/backlight/qcom-wled.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 5decbd39b789..8054e4787725 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1455,7 +1455,8 @@ static int wled_configure(struct wled *wled)
 		break;
 
 	case 4:
-		if (of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
+		if (of_device_is_compatible(dev->of_node, "qcom,pmi8950-wled") ||
+		    of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
 			u32_opts = pmi8994_wled_opts;
 			size = ARRAY_SIZE(pmi8994_wled_opts);
 		} else {

-- 
2.52.0


