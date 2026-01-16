Return-Path: <linux-leds+bounces-6661-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0647D2CFB1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 08:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FD4306AE57
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 07:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39A534F24E;
	Fri, 16 Jan 2026 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WFKFORhR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OK6MxOYq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B2B1EA7CB;
	Fri, 16 Jan 2026 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547427; cv=none; b=IH/hI1yFmNvkiss6onDQCUOQT0Tm80vq/EPE19vQ/H9Rndf5WNtO4hvbc1jh7aQzJOSCVC18zwqPQliMYjpMOSUCFkHUoaHiFurqIXv4BYrSyKDP3D2gTkPgWT9sMkiwBfDrKFMBwCiAZphgYr40PlgjrQAOEFpJG9njjoHIlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547427; c=relaxed/simple;
	bh=yju4oSxB0NaiCLqBM93QBdmsxVeT/doxDNhzm2PCA6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bFyeLWm/ci8PQVaNpuNUiDACYiFOeOocXHDWfSmtd821Ok1Nkk2yg32G2yzRPakoujZgPRNHatlpAlqVJsYaQoJBRqG+P4yC4gRg0XqH+1ZVISHJds9TCcj1iBLhaE1eA+GXTkmoU5QMWno/SkbAKuNJRrnsjPeBEK1jJ1iYxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WFKFORhR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OK6MxOYq; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1768547277; bh=lVpvJ+XJ8TLq81lwSOeh8p2
	a84h6Y3P65PxX77VIr4Q=; b=WFKFORhRa8Hpm8fzcFgr0hOmI5fqXSTEpJ4mTWyVlVL5mr2nTw
	OsEo/t0XDcGhR/6ANkxEWZFL1YkJXnnqgcPnyWv1nCZlVeOO5WomYkR60yhbJQFmP+LsyimHRaP
	55Gr+1Y/Ny+UjR3JTsgzLEGrpEe+Etw1J4L/804S8s0n5R9cLvHpmMTGOtK/GXch6Se9BqTPHE2
	z/2AJ/1c60IpxFiau22IjHINCUMkMy9sY1uTcukNj/adgkHDA1BzmTzzSA9krVyHupbb+Q/IiRe
	pqbNBgzZyAxO4mQWciT0F6Y+hc+jtGf+zlkBfMMNLhTjk7zS5NL9dmq/sSsYFUxBseg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1768547277; bh=lVpvJ+XJ8TLq81lwSOeh8p2
	a84h6Y3P65PxX77VIr4Q=; b=OK6MxOYqlHUzv3C/pgwaJVF5U4PFnYHXI03knJ04NRewbEGo4d
	9AbHXszMUV27+4jZm8pGIy6/5FKBdstQvZAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/7] Fix PMI8994 WLED ovp values and more
Date: Fri, 16 Jan 2026 08:07:32 +0100
Message-Id: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSw6CMBSF4a2Qjq1pC33gyH0YBxVu4SZQSGuqh
 rB3CyOjcfif5HwLiRAQIjkVCwmQMOLkc5SHgjS99R1QbHMTwYRinGk6j2hqyehjgJbeGK+kNk5
 pq0i+zAEcPnfucs3dY7xP4bXriW/rHyhxyqgEKZxsrC3r5jxa9AN69N1xCh3ZtCQ+BfMliCwYZ
 bQTJa90q3+EdV3fyfWaoe8AAAA=
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=1756;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=yju4oSxB0NaiCLqBM93QBdmsxVeT/doxDNhzm2PCA6Y=;
 b=kUGeeK4mRdlF/SOPDhacwvBN4DZafVp4JKjiCbogQYCAFlEAnp0nWJtKJ2QANj3dS3arq5P93
 BZ1d6wdO3SEA0CC5ZQAWVDFvYKu4XCouvmNmZvqQR97iRZOZVoM2Vlf
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series fixes supported ovp values related to pmi8994 wled
and set same configuration for pmi8950 wled.
It also corrects wled related properties in xiaomi-daisy, xiaomi-land and
in xiaomi-vince.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v3:
- pmi8950: reword the commit to make it more clearer
- Link to v2: https://lore.kernel.org/r/20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org

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
      backlight: qcom-wled: Change PM8950 WLED configurations
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


