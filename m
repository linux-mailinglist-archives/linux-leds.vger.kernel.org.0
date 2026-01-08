Return-Path: <linux-leds+bounces-6561-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1245D00EE8
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 04:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657CA3011EC8
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 03:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136CD28642B;
	Thu,  8 Jan 2026 03:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NbNziHB0";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ASwF4KVW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A92853FD;
	Thu,  8 Jan 2026 03:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843950; cv=none; b=uS/4JVvPumKpu1gScoZ90JK62ax6o4itukcYNSn306fFPhLpPGvk51BjIKCGjJ/yTZR69DzNyyXMaD4COd51s6A1UN7/cBNOiiLKI5gVLjCDSdTmBw9FNWuzk/Wb058t1KxvENvMqMVWZt5DRUZNZZiMNMiAMGcXSRaQAdFMm0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843950; c=relaxed/simple;
	bh=lAFlcJa6yZSCswitINnF7QzcexO3g0TUjXUSDta3MZY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JRPPx5rf3DsIEdzaxWIm0jpy7A7sD0IElHiZzzhoZ3Zuqwo91UgnqptK1zjlhCdQVO2yh/uNWQrswin5e8Ep9NPiAlK/ygCqbRVFjIPLQVp+jK/aBPxUoUca6jPDeJsJGlVxvD6E/Vq9EJFeC9OsxYhOYGXXj+QephVMAnZRo7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NbNziHB0; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ASwF4KVW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767843801; bh=4mkalf5iikrptp+BJvqOi2W
	WeQZdLoJ+PfiutcDUaPg=; b=NbNziHB0cXSOf4dv2feHCLFz3hPMhwK/NtHD2V4HGbdjjLbCZd
	kEIVv1xZMjbdP0bli8YNynvrqZwONK31zCxeAREOuJlsKGvPDWM6iT5DQlvWQR9LobEShTXhPVw
	yoM049cSOxuOdl6ZVKxaWvYx/SZBTjUG/kZhEZL6hd4IaP42J+m/rnuA8Y9qQ6d5+4NiWxO1ax/
	tBsV9z4GvIGql3AlZNl88siHh1wzzcSf1U0hbDYVhF11RBYcX2Ax4kGm7lpEiLtylgVUHeMcrp1
	goLBexNeE+9L9pLHR5ORXHGB+4gAtRQcVjUK6TriqSs+n4WdTFBdJ+TboV6GcrxFD9g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767843801; bh=4mkalf5iikrptp+BJvqOi2W
	WeQZdLoJ+PfiutcDUaPg=; b=ASwF4KVWOFgoTLy3moPeVAotLpUfCmUGeh5cNa9AgnMoLtUIZ/
	Not/PuYRguWMvhIefxBvqmZObayiv7ZdqcAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/7] Fix PMI8950 WLED ovp values and more
Date: Thu, 08 Jan 2026 04:43:18 +0100
Message-Id: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANYnX2kC/3XMyw6CMBCF4Vchs3ZMW225rHwPw6LCUCaBlrQGN
 YR3t7J3+Z/kfBskikwJmmKDSCsnDj6HOhXQjdY7Qu5zgxLKCClKXGauai3wNVGPDyGvuqwGU1o
 D+bJEGvh9cPc298jpGeLn0Ff5W/9Aq0SBmrQadGftpe5us2U/sWfvziE6aPd9/wIL1/idrQAAA
 A==
X-Change-ID: 20260107-pmi8950-wled-b014578f67a6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=1531;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=lAFlcJa6yZSCswitINnF7QzcexO3g0TUjXUSDta3MZY=;
 b=6vMUOetyPD6aS5STCPI6lo5UHm7LzddPCosCQRFi4xPeERui3/WfdvtzHnm36nkDChtxI8BKI
 5603jaDfHfoC+cc+u6Is2aeTYSXFqe71EblQWm++4uUJmd6i+gyL8gK
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series fixes supported ovp values related to pmi8950 wled
and corrects wled related properties in xiaomi-daisy, xiaomi-land and
in xiaomi-vince.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Rework ovp change to support pmi8994 also.
- Reword commits.
- dt-bindings: Set min max for qcom,ovp-millivolt.
- Link to v1: https://lore.kernel.org/r/20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org

---
Barnabás Czémán (7):
      dt-bindings: backlight: qcom-wled: Document ovp values for PMI8994
      backlight: qcom-wled: Support ovp values for PMI8994
      dt-bindings: backlight: qcom-wled: Document ovp values for PMI8950
      backlight: qcom-wled: Fix ovp values for PMI8950
      arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
      arm64: dts: qcom: msm8937-xiaomi-land: correct wled ovp value
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight

 .../bindings/leds/backlight/qcom-wled.yaml         | 24 +++++++++++--
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |  2 +-
 drivers/video/backlight/qcom-wled.c                | 42 ++++++++++++++++++++--
 5 files changed, 65 insertions(+), 7 deletions(-)
---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20260107-pmi8950-wled-b014578f67a6

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


