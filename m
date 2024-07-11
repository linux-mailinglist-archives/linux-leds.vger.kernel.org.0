Return-Path: <linux-leds+bounces-2263-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DB92E887
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5C6284726
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F1F15DBC6;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7osMi8v"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC715B98E;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720702204; cv=none; b=fMVPSmadeUIXhz1BaQ7RrtzuKbAwlEAkYc3vi4SDLUYBvlpGMeZf8t6WlOU0DTLVqCGAvLiiGYnJA6dAmUWgQG83Zc4HbK1dvc1Tl+wTS++kjZhz0sqscHY0BjE7OHNq9EEEHS/1v/QE0OLkaFcZ0p+PWyR1qUybXDFcMiKmxxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720702204; c=relaxed/simple;
	bh=PGVBgX12JpkKOC5s1Bqle8ztSKAHOxZdYZgmUN143qQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/gEq+HDYBSics3Jnvn7XYmGzwYrK2wqjtUvojtA6uU/p7sHFneDNZTUWaF8UFtoYg0AP0Y4TBaXRx9cFlOPvP45vN9IT4tTZdMC81oPUXROOrRsWK7MsTNn02Hau6Mb+Lx7+eGNacB5D+rxWTmS/TeuIN344l1jUYHIiVhEKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7osMi8v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26A89C116B1;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720702204;
	bh=PGVBgX12JpkKOC5s1Bqle8ztSKAHOxZdYZgmUN143qQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=L7osMi8vtVVsKfXBZwBaBUQWHv/Sw8/7bAFn2HiW/uHDtx9LKSr7IJTjjCRxRuB+6
	 gQAx+zlk2xwPD5UwDhXZ9JGR5hG/a7s8ZBKnBroWUaCL+VvostbXkpV1Fyo09Qb99j
	 lQAqKDhQSgueipOgcQmYCY5KJIF78ywDj05DwzS4yDsKqAjMjNb7BL5T/WXm7XKdJ4
	 l97h+BLw/FzIlROyET4CmeGzAfzkYSXTZrexO76zBcxM/mGviiJJD6AKaHg/yT3py9
	 h5AYh5n+5C5MIKXbni2N8Y6gDQ+yEh77MYTgFvnjSiE2UaBzDrHwGIiIT24Mqhj1xX
	 qaoV4bjlGfF8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC27C3DA49;
	Thu, 11 Jul 2024 12:50:04 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] leds: leds-pca995x: Add support for NXP PCA9956B
Date: Thu, 11 Jul 2024 14:49:49 +0200
Message-Id: <20240711-pca995x-v4-0-702a67148065@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3Uj2YC/3XMSwrCMBSF4a2UjI3cvBrjyH2IgyRN2oB90Eiol
 O7dtIgWweG53O+fUXRjcBGdixmNLoUY+i4PfiiQbXRXOxyqvBEFykGCwoPVSokJV9IKr6QvnbE
 ofw+j82HaStdb3k2Ij358buFE1uu7QeDTSAQDFlwAESUwALjUrQ73o+1btDYS/eNodievvSkdN
 7ISv47tHfk6lp0mxhPPLPNC792yLC+Ft1xzDgEAAA==
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702203; l=1479;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=PGVBgX12JpkKOC5s1Bqle8ztSKAHOxZdYZgmUN143qQ=;
 b=M3aIdgUWYTDf089Cx4ujaOq2Ip9hglN2nxHFzrJDLbxwePXbbDpKjolYz+CCfp8MzvIkuWpEL
 wwAiD9fKSlWD61ulo6cZr/ErA5yrVWdzchxpnAiMiGcw3114bsAgp7o
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
Changes in v4:
- replace btype with chipdef in-place
- Link to v3: https://lore.kernel.org/r/20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com

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



