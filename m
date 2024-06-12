Return-Path: <linux-leds+bounces-1886-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5553905D4F
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 23:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82E91C22106
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 21:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C0484FB7;
	Wed, 12 Jun 2024 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwGXea6B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111F433A4;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718226169; cv=none; b=Oytq5ZxvRztnL0mXIVGNTLcyqkDorRWcWswKWAklym7tVmdEsIRupcO2hry4PO2JiEQqecNls20m9jniY1gWLMAgnzgA2vIng+Hi/wwwK6Cuj+RMb9QqoHk2qvzRwyF9nXVebxTag1WZLKftWhvFX24XLsVoFY1k0dPMG3vv7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718226169; c=relaxed/simple;
	bh=2lfTlYRZCf4xaUB6sPr/DlI2iYZHVJqO+OgfzvR4kGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YmxOT2fA2ivx/opLUWgtmZ+rNnJ9GGCf6b6mpRVcfKgNRtW/0o3rFNlc4GevKmvdT++8Eim65XGPqsZeV3Nrv83kPf03B1yp7hXLh4l2qWuNbFDhV6PMKtwINrDphNQanfhnDRAoI2dQ3oN8qHpAao4VNyRREaEdn1sVm9RjWiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwGXea6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FDE3C116B1;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718226168;
	bh=2lfTlYRZCf4xaUB6sPr/DlI2iYZHVJqO+OgfzvR4kGw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fwGXea6BJRhGx+laVmx6YpeiZLZ8shU8KXnFtipCOY6R8AB0AncVq3DD6oF9X9mAF
	 2shovLjZfxp+iCsTMEHltvz8eZ4cCooiM92CcK0VZY1dnqchQfE8ep5YmtxolR4/oo
	 9J0ps9CjVXm+RjhxquK1TEFJIQpHKDmzdf4NlXzzjtqUYfX7vaTnp2owviVtxhVo06
	 5sXZcXoxR41+zGKg+hhcz3BBnFZAtILmVreEkKD/U/F6ycs9Y9ZrV0tUWenpjKJ+LO
	 DjaRdph8uE6/0yZXKl1vvgiTIlI8v+quRCw++L56s3wS7bqxlEB5ljAY4Bdt9UvKiM
	 Pzvg6id4IiPPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52192C27C53;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v3 0/3] Add sy7802 flash led driver
Date: Wed, 12 Jun 2024 23:01:31 +0200
Message-Id: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKsMamYC/1WMwQ6CMBAFf8Xs2Zp221L05H8YDwVa2QuQFhuR8
 O8WEjQe5+XNzBBdIBfhcpghuESR+i6DPB6gbm33cIyazIAcFZeoWZxMyZF5xX1deF1o1JDPQ3C
 eXlvods/cUhz7MG3dJNZ1T5g9kQTjrKmMspVEb62/2oHGd6zbk3vCGkn4ExUXXxGzKIQsxZlbo
 1T5Ly7L8gGP6kno1wAAAA==
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718226168; l=2112;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=2lfTlYRZCf4xaUB6sPr/DlI2iYZHVJqO+OgfzvR4kGw=;
 b=Pych9e2dTWPhOchjqcDytmZ/K/iZ6oz2KN+nidvINrUBfeDPVXXIhVJ3r3TsY9GaSqk5+WjjM
 SENcXoQ7nFlCC6vEaOEjuRohZAprrZVcWnbwwLCELrO0dyBYZfpIEfJ
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This series introduces a driver for the Silergy SY7802 charge pump used
in the BQ Aquaris M5 and X5 smartphones.

The implementation is based on information extracted from downstream as
the datasheet provided by a distributor of the hardware didn't include
any information about the i2c register description.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v3:
- Add R-b tag to first patch
- Extend driver commit message
- Improve readability of defines by using BIT()
- Rename some variables/parameters
  * led_no -> led_id
  * level -> brightness
  * curr -> fled_{strobe,torch}_used_tmp
  * mask -> {flash,torch}_mask
  * i -> child_num
- Restructure structs ("Place th big stuff at the top")
- Declare 'child' on a separate line
- Move multi-line assignments out of declaration block
- Update warning/error messages and comments
- Use gotos to handle error path
- Use devm API to cleanup module's resources
- Init mutex before LED class device is registered to avoid race
  condition
- Link to v2: https://lore.kernel.org/r/20240401-sy7802-v2-0-1138190a7448@apitzsch.eu

Changes in v2:
- bindings: remove unneeded allOf
- bindings: example: move flash-led-controller under i2c node to fix
  check error
- Cc to phone-devel
- Link to v1: https://lore.kernel.org/r/20240327-sy7802-v1-0-db74ab32faaf@apitzsch.eu

---
André Apitzsch (3):
      dt-bindings: leds: Add Silergy SY7802 flash LED
      leds: sy7802: Add support for Silergy SY7802 flash LED controller
      arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash

 .../devicetree/bindings/leds/silergy,sy7802.yaml   | 100 ++++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  26 +
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-sy7802.c                   | 546 +++++++++++++++++++++
 5 files changed, 684 insertions(+)
---
base-commit: 6a03b35e4395eb2d6e89a38aca00a9fe9cb39ba1
change-id: 20240325-sy7802-f40fc6f56525

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



