Return-Path: <linux-leds+bounces-2249-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FAD92E14F
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDFE281395
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 07:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CFB1509A4;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eF20VhMV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485BC148847;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684382; cv=none; b=aLbxSLeB/wrW686SR7xekk0IIFqEqIU4NZCMwWqsWYmyzkIr4XyG0+Wyv4opyudK1lD7PStUpEaPk3coHdXgbzWTtdleG2RoRoCndyW8pc/5k4UHT1C0nH4MjiztGhDqBayAh9O0usGaXazolEd1538w3t7QOivChB97ayFFt4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684382; c=relaxed/simple;
	bh=xTXN2dtxTf7A/9UJXOYSRARxg5U3uy73slffwuN6WTQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=itwUDvJXHson2XUJfgPAtkth5JJu8S76sq1Q3YltYjVad/XLICix/+NzX7hzNFVWHSlkgQv9z4QbD8Z0vf37AR0zxBC/+lqYmjrhWdPiswNvcu44u3NDsIkb7I1kV6kAXcVCwHgOvBuzsugsIO5pEq2YkVlKVhDksQth+OfXY5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eF20VhMV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D26FCC116B1;
	Thu, 11 Jul 2024 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720684381;
	bh=xTXN2dtxTf7A/9UJXOYSRARxg5U3uy73slffwuN6WTQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eF20VhMVvKNcxFrE+mBYyo0q3GzqwmyfBTl1lmMXopOI4I6O176xb9ZdjddQOcKHo
	 u4Wo5RwLXlvkLkdPBJhzWjDmXv6qwMUJ73UrNZvRVNcU0IfPtpKDCtAEMV7sSqlkIu
	 uZW6CmqWqaWO4Tz3zO30ZJkNCpKOMCF0ONqShY8SYbGaBj9LQmPOmu5BXsHI3Jvyce
	 qGH8S5gu26bFZrv5OngfTGe7zY2kj4mkjILT/krw+5NoUAsd6kZ5ucCAUK+J/yKOnT
	 bYvUVTvdFkwCRSimgsKTWQ3nR0iieVJKrP0fWjuz4G2zfdFkGOKw3cNhWTsPGQSCfe
	 GE7wNq4n5wExQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD01C3DA47;
	Thu, 11 Jul 2024 07:53:01 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] leds: leds-pca995x: Add support for NXP PCA9956B
Date: Thu, 11 Jul 2024 09:52:21 +0200
Message-Id: <20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWPj2YC/3WMwQ6CMBAFf4Xs2ZptodR68j+Mh1Ja2ESEtKbBE
 P7dQozx4nFe3swC0QVyEc7FAsElijQ+MpSHAmxvHp1j1GYGgaJChZpN1mgtZ9YqK71WvnaNhfy
 egvM076XrLXNP8TmG1x5OfFs/DY7fRuIMmawkclljiYiXbjB0P9pxgK2RxB9PZO/kjW9qVzWql
 b/euq5vxZgtetYAAAA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720684380; l=1336;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=xTXN2dtxTf7A/9UJXOYSRARxg5U3uy73slffwuN6WTQ=;
 b=YWKHaXwn+jK7EvJ9LJLdgV6AIIjMe82U/vCV0MCyl4ermO4p1CpJwnfrCPXwgxAqkNI+74KmA
 oTzKwRHZbGnAo7aEmpIfKX0RkZDR1RS0qP63wuhs084eipEn9mLhbvg
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
Changes in v3:
- restore PCA995X_MAX_OUTPUTS and increase to 24
- restore secondary for loop in pca995x_probe()
- remove parenthesis around (chipdef->pwm_base)
- Link to v2: https://lore.kernel.org/r/20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com

Thank you for the review Marek Vasut.

Changes in v2:
- define seperate const struct pca995x_chipdef for each chip
- remove chip enum
- Link to v1: https://lore.kernel.org/r/20240710-pca995x-v1-0-545015603000@gmail.com

---
Pieterjan Camerlynck (2):
      dt-bindings: leds: pca995x: Add new nxp,pca9956b compatible
      leds: leds-pca995x: Add support for NXP PCA9956B

 .../devicetree/bindings/leds/nxp,pca995x.yaml      |  6 ++-
 drivers/leds/leds-pca995x.c                        | 59 ++++++++++++++--------
 2 files changed, 43 insertions(+), 22 deletions(-)
---
base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
change-id: 20240709-pca995x-d7c5f97f6ebc

Best regards,
-- 
Pieterjan Camerlynck <pieterjanca@gmail.com>



