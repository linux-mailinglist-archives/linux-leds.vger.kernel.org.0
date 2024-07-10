Return-Path: <linux-leds+bounces-2240-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A457C92D449
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 16:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AFFBB23677
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 14:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD431940B7;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvH2CAax"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76218EFDC;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622069; cv=none; b=bhgCaCRaqc792Egjuolti4Xbtu4xNvhingiJzb6JU7rCNJL1u05PGeWjXCqxSn71pO0VfMpS7iClWBXf8pnBz0zCObj6wp5SARufwIp7siz87oqxNmrL1QDtcLr2xNbfXunaIjEZwiFganemUI1B8A6QkU20IBROtii+2dnWF/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622069; c=relaxed/simple;
	bh=HQPU+5jS7G7Dj8KsEuC+g6jBNrSexrUpV+05g1CQqTo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UgRaipDomAmRf2O7rmPEccqfGcueDS+UbbBk/3x7m7P+tFhIrilp0N24cOAxziKmXyVmOz0gZjHxZFkDHDhnsbNPeoBSCfEhK6+OUM4h/Wck6V8/ypd8aVy4Ff2c+m8pUPHX3CYL4MSHdB8NdW6Y7APz/xpS5yUsR6jr2azu26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvH2CAax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E0DAC4AF1D;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720622069;
	bh=HQPU+5jS7G7Dj8KsEuC+g6jBNrSexrUpV+05g1CQqTo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LvH2CAaxNb0Tk2Ofx6u/UKjZqs8AVpfmqr84FlrxHX1SlQ6/0yR4FNFSY3lMw1Phz
	 ir5UIllEh99b+/K7Vd+qYUVbZz7hZco1KFhrploohEj+JSje1fGVisLqIH6VqFcRed
	 W1wb4zeOrRnFucgJAyQxTcOYKabE62aOmXiNJl7QWxLFOLH/WiOn8g2JU1jXteHCdt
	 KJ0HzEVCzHk6q56K8wjOAokWr+aXT+KhVm9DAycjQEfuCxQkD9mmM+qu+PMTDSQean
	 6blR2f/1qhK9mmNJQirA+S5mVzjL0onZ9cdSzTKdtxwtixk+FPUkD2JmhyEwFJelv0
	 Ud5BAXVw+C74Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489C1C3DA42;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] leds: leds-pca995x: Add support for NXP PCA9956B
Date: Wed, 10 Jul 2024 16:32:40 +0200
Message-Id: <20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIibjmYC/z3MQQrDIBCF4auEWdcy2hixq96jZGGNJgNNDFokJ
 Xj32lC6/B+Pb4fkIrkE12aH6DIlCksNcWrATmYZHaOhNggULSrUbLVGa7mxQVnptfKde1io7zU
 6T9sh3fvaE6VXiO8Dzvy7/gyOfyNzhky2Erns8IKIt3E29DzbMENfSvkAr1tInZ4AAAA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720622068; l=1042;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=HQPU+5jS7G7Dj8KsEuC+g6jBNrSexrUpV+05g1CQqTo=;
 b=+7OE7Srtgo57fzZtzKrAvZxDoLui0UX7KXjIQnCXh1pkUl52uBwoU2xRri3g4xXm0Ee7J7pir
 7GH18tfGxjDDSA2OE+snIK9QgVcFUFm7nmNCBnR9/gIIPmy8cr4PzsO
X-Developer-Key: i=pieterjanca@gmail.com; a=ed25519;
 pk=gSAHfvqQjVhNa1MhUClqbt7d3S+fviKz6FdQVaWFRyM=
X-Endpoint-Received: by B4 Relay for pieterjanca@gmail.com/20240709 with
 auth_id=182
X-Original-From: Pieterjan Camerlynck <pieterjanca@gmail.com>
Reply-To: pieterjanca@gmail.com

This series adds support for NXP PCA9956B to the pca995x driver. This
chip is similar to the others but has 24 instead of 16 outputs and a
slightly different register layout. Datasheet available at [1].

[1]: https://www.nxp.com/docs/en/data-sheet/PCA9956B.pdf

Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
---
Changes in v2:
- define seperate const struct pca995x_chipdef for each chip
- remove chip enum
- Link to v1: https://lore.kernel.org/r/20240710-pca995x-v1-0-545015603000@gmail.com

---
Pieterjan Camerlynck (2):
      dt-bindings: leds: pca995x: Add new nxp,pca9956b compatible
      leds: leds-pca995x: Add support for NXP PCA9956B

 .../devicetree/bindings/leds/nxp,pca995x.yaml      |  6 +-
 drivers/leds/leds-pca995x.c                        | 82 ++++++++++++----------
 2 files changed, 50 insertions(+), 38 deletions(-)
---
base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
change-id: 20240709-pca995x-d7c5f97f6ebc

Best regards,
-- 
Pieterjan Camerlynck <pieterjanca@gmail.com>



