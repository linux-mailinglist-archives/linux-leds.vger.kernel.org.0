Return-Path: <linux-leds+bounces-3972-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D42A34EBF
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 20:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC203AB8CA
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 19:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011A524A07B;
	Thu, 13 Feb 2025 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eweUpE/T"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7724A05C;
	Thu, 13 Feb 2025 19:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476498; cv=none; b=Xrziom/MFjJLGIrNfTUNVnt4CsRBp1ArJjZyi3Rn7zxV5nWiK6+9I//AP5GKPdnAKi2oyADAQULHnV0iAbOYYzPowyOJGJ9KDWWTevBuAM4jAoU0FmsOkNo1uiOaLfYUiNxuOrHps2VxuD+rdtMK7VT454INU+evm4XoLx99tUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476498; c=relaxed/simple;
	bh=NN7XCFu6Ip6xp3gWF1KuCvhA9zDDObyxUfpBJfPpms8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H+yM1qI/vFlNh6mFIzXsaWmUvr4bHj9rR5AIao3kDZ+PSqhyjXF5lTtkAgcjIMKSe9VD3veyizPilH838Zw9Apso8OpSFDJKjmYxH86ql9ZFGi58oG26nJeYiDmcu156bWy5npjx6PyTyK40jCR0OgxibbmfBkJBoGNCePACXZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eweUpE/T; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C08C9.nat.pool.telekom.hu [37.76.8.201])
	by mail.mainlining.org (Postfix) with ESMTPSA id D754ABB835;
	Thu, 13 Feb 2025 19:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739476488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3WYm8SkJvIaTE5nz4Ei7FIjZM4/qSMSt4a701gCXsRw=;
	b=eweUpE/Tegz1eHnWrhil1/dqy/lZAleEQz2a+smE0oBYpmpINtZsoBpfCrPCjRJrtkFNAT
	ZzQTly0ISvZBVeCKzr8QQclYG0yPQHgCbiuwEt3MkcxrJRZPEkzNCkVOuIhuTzouGMEyWr
	fZEZcw71E9GptE1lhDF5Cmq96xqHZ0EN6rzzJWqvL2gy99SBFo8i56J0rmrqCDsmHTtxDB
	GyzHq4fRK2jFm5HN/EIpT0L+8Ijxk6IFxDsZhQ7l6POyiFK9l9UcejvfcwOZlFKyB3hJAr
	BxwzhY9w4ciTukBFcha/Ar5BklmMiFXHtGmzxb4DluiidxHDdevOYEfpiUXC0w==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/3] Add PM8937 PWM and display backlight for Redmi 5A
Date: Thu, 13 Feb 2025 20:54:46 +0100
Message-Id: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAZOrmcC/23MQQ7CIBCF4as0sxYz0Bqsq97DdEELpZNYIGBQ0
 3B3sWuX/0vet0MykUyCW7NDNJkSeVdDnBqYV+WsYaRrg0BxQcEFC9u1byULr43h0k7KdLMWKKE
 eQjQLvQ/sPtZeKT19/Bx25r/1L5M5Q6Z6RCVlP3VKD5si9yBHzp59tDCWUr6N1GXtqQAAAA==
X-Change-ID: 20250212-pm8937-pwm-0f3bae4cd207
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739476487; l=1001;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=NN7XCFu6Ip6xp3gWF1KuCvhA9zDDObyxUfpBJfPpms8=;
 b=CBB4MHNmuqS7oekdNMlEGD1CM8PUYzZA4YvQs0/FGCQ4OTbVZ00e+SmFMj8swcCppYHSbWOP0
 3nLphYQDboDCA4fKv2Sijxzwl8f/Rn+tmEb68KWjQJuw1EHaVqvycOB
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add pwm node for pm8937 and enables
pwm backlight for Redmi 5A.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Add qcom,pm8937-pwm fallback compatible for qcom,pm8916-pwm.
- Link to v1: https://lore.kernel.org/r/20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org

---
Barnabás Czémán (2):
      dt-bindings: leds: qcom-lpg: Document PM8937 PWM compatible
      arm64: dts: qcom: msm8917-xiaomi-riva: Add display backlight

Daniil Titov (1):
      arm64: dts: qcom: pm8937: Add LPG PWM driver

 .../devicetree/bindings/leds/leds-qcom-lpg.yaml    |  4 ++++
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 25 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8937.dtsi               |  8 +++++++
 3 files changed, 37 insertions(+)
---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20250212-pm8937-pwm-0f3bae4cd207

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


