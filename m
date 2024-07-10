Return-Path: <linux-leds+bounces-2229-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2E92CAD4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 08:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3411C22EBF
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 06:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3EC5EE8D;
	Wed, 10 Jul 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPewflyz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452DB5B1F8;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592198; cv=none; b=c/ZJI4Mcvovc7PCGJupxmR9ZfzyNv4NTrxRL78zlL6d0pWqKaujFG1xHhD9ly8+0MyML3OXHZWiy8EjHDrM9lOcd5NqCDbi9JomV1Fg4bhZ+2N25f6F7DrVe4A5yIdgHLhKJsgMIkhWKhd8CS3yA9WrFsYv90u7KMrjBs4XEmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592198; c=relaxed/simple;
	bh=pviwYWTgWw3NGArxYhhEFp+fozfsJBF9UBiIPePQypQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=arVudMt5sSFnsDX6j6+C3zdbAUwFec1hm8Avl2FdjnKxkisCj33EN/hJ3HSeRKzUqSSwq5dTy7xfROL/wlSkqH2J4T1Z7Z74/GqO+M+wlIeeEKT3ih0WqnQZUydKnLxPVQ9hFC5VytHcCv0TsMUFsCWzpvI1N2d6duJ2LEdPve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPewflyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF1A1C32781;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720592197;
	bh=pviwYWTgWw3NGArxYhhEFp+fozfsJBF9UBiIPePQypQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uPewflyzyoJUSO4xqexro0tqcnODuYneaQF7yo00UPxuEiy+UUSaQnBvN7DfSjybL
	 KoKFsVOPyNVv1HTEXv2oXwhzCQvmZLDpZAztwetB/e+1nCVKLRKY8QRuB8zE0ZHXkO
	 O6v/XsUmfVjT+Ey8WK1f9eXRgZsV8E2D3bCUxiaimufexOWVGLgGGxtTL01Aw+VQXe
	 8HTHJgDuoCTIPNOX2ESRvT4PhaoajQQzSqh5QoVJeDXyy40kOgjwm8MFfgUi3d3iOg
	 BY/1zOEPX6ckwCNc7bAqHRgnuV8Obdebz4Hnw3k2er29ay5ivM+NuVrijg8gQjWC77
	 AkQRcyIU7eFYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3484C3DA42;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Subject: [PATCH 0/2] leds: leds-pca995x: Add support for NXP PCA9956B
Date: Wed, 10 Jul 2024 08:15:43 +0200
Message-Id: <20240710-pca995x-v1-0-545015603000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8njmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNL3YLkREtL0wrdFPNk0zRL8zSz1KRkJaDqgqLUtMwKsEnRsbW1AIU
 h1oJZAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720592196; l=851;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=pviwYWTgWw3NGArxYhhEFp+fozfsJBF9UBiIPePQypQ=;
 b=gN6PPOVhY6hcmCR6ePaNQo7jHDwWqhmkx7tGNyHg06AKjZ4k+cJdsEUy8EaLP+3JMZ6lf+ANk
 yNjDM/+TE/SCvLoefDlQCMrr8s0wXQMpaMLnRum5O8vuyBH5p3EkUP+
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
Pieterjan Camerlynck (2):
      dt-bindings: leds: pca995x: Add new nxp,pca9956b compatible
      leds: leds-pca995x: Add support for NXP PCA9956B

 .../devicetree/bindings/leds/nxp,pca995x.yaml      |  6 +-
 drivers/leds/leds-pca995x.c                        | 88 +++++++++++++---------
 2 files changed, 56 insertions(+), 38 deletions(-)
---
base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
change-id: 20240709-pca995x-d7c5f97f6ebc

Best regards,
-- 
Pieterjan Camerlynck <pieterjanca@gmail.com>



