Return-Path: <linux-leds+bounces-6545-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039ACFE100
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 14:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1D9D310FAE4
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 13:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D69332938D;
	Wed,  7 Jan 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SnVdakAh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dNUaG0U0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BFF328613;
	Wed,  7 Jan 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792678; cv=none; b=Bv1iY2TGEqRlTrIA4HLSdM4hb5zQQPy9u+h6bfDzR2/ssSOYuJgz/yET1UFZK7rxkGXCEdNHxyGJLL+SFBYS0twxA9FDg3YMLGLVW0tvKFqw38SbL3TjRIJoKwQNBs6ove3/vc3MYOG6Z2kLCvV7cfG262R71tnW92cgQIVVNL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792678; c=relaxed/simple;
	bh=rcB91V+MiBBf1Gpy7LPeyro72nzwXi0iP2zCyDfwjuo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCeC0/16NX3c+8MglQ9z3z9DXOsUQ1nWDuyM7LSMbsdJxRuQ4yfNFUn8ITE+nzZwDU6l0zmmeCRileL+9Lx0aBRlFlTjwPFUbwyrHtZ3mZ/4A2ct/cgUg3pcLXMb7bQwvsWgs/goEQUe0wJ75S2b8DuBO//GvLhWhBQuiL+mM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SnVdakAh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dNUaG0U0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767792672; bh=vMtYM0nxoHV7UFP+DHc4d1k
	uhCTawZBNaLpGym/DqZ4=; b=SnVdakAhoU6HzvgW4pZ1w0mCi40Sil3JNbHQ7+pGEsWzXvmAfz
	xAXo1u69dTJB52R+iuxaPvS77bsls5WqMl6sSmJuAMO5HevYmy4YIT0oeEq9Pv9uynxwGz4MM4S
	I1c21Z4FgCC4qSgwWow2jK61pr86ZREIh70Atw0rOrhffEiUvn9R+szvNVNCemYpGwqsc69sJ20
	R0cHkPwAOHlzAVIeTYMqLb+XpR/LJygrTIUGJHtDw9odG4DerqOE8Ki3wInxZM6FO2Akg/Owusx
	uKRqAVfXwChoH5kKI2dt88Le/YNe5A60J9IXyYl4xHleRuJQ6uLsx3qgrhtXaM88rEg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767792672; bh=vMtYM0nxoHV7UFP+DHc4d1k
	uhCTawZBNaLpGym/DqZ4=; b=dNUaG0U0yQauHAP7pjt3Xo4RkwNRErl12aVSeLQ0GAfYw6Mrrn
	GekjNwxjK0vTtuif5RVBkQ6JDhC6nPoz+/Ag==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/5] Fix PMI8950 WLED ovp values and more
Date: Wed, 07 Jan 2026 14:31:04 +0100
Message-Id: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABhgXmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNz3YLcTAtLUwPd8pzUFN0kA0MTU3OLNDPzRDMloJaCotS0zAqwcdG
 xtbUASKq5+V4AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792670; l=1163;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=rcB91V+MiBBf1Gpy7LPeyro72nzwXi0iP2zCyDfwjuo=;
 b=E8V7HXfevdmZ1qRo2dW+IMTQhXurrQZITpGXqcHNktfXQPqqV41b7b+5AtyG2xPU6tpEBfpQ1
 8mTY/CTvysACCBdSLUbvQIWNX56DSVU92oQqQOEj+XoG45V7Mc+dPbL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series fixes supported ovp values related to pmi8950 wled
and corrects wled related properties in xiaomi-daisy, xiaomi-land and
in xiaomi-vince.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (5):
      dt-bindings: backlight: qcom-wled: Document ovp values for PMI8950
      backlight: qcom-wled: Support ovp values for PMI8950
      arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
      arm64: dts: qcom: msm8937-xiaomi-land: correct wled ovp value
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight

 .../bindings/leds/backlight/qcom-wled.yaml         | 20 +++++++++--
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |  2 +-
 drivers/video/backlight/qcom-wled.c                | 41 ++++++++++++++++++++--
 5 files changed, 60 insertions(+), 7 deletions(-)
---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20260107-pmi8950-wled-b014578f67a6

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


