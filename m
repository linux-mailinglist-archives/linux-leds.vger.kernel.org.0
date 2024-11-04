Return-Path: <linux-leds+bounces-3256-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C09BB773
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA7E0B2350F
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 14:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841C74502B;
	Mon,  4 Nov 2024 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXLq86xt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31CAD24;
	Mon,  4 Nov 2024 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729972; cv=none; b=A8LMbUgLoWndsoR203WQhWpQESYICXtpF/IuSx4QbE5PG25OiUqdwCwSGwnRmcxxPZeXsW73ZDtf7C77NfSBghCJE4oziTeOmC81VJAN5c74BdrPf54k/o7fQdw33tdTG44blB9QViXTkjvrwV7j9VEFfDrEgKDXYVHxElJuW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729972; c=relaxed/simple;
	bh=JhFNXixVI6LoLn/UIp5izX3h/kj/BU4WbxVI+NQJB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b/Rr+5JWarpTgTo32C0IgVtMONdTnQcaKZA+PLdnjG/8FRKhPmv/yGMGuQQNz6EjKnAlQOvLm2Wujyg6+znIvASyisvHmCDpTsBuqlBQdo4uKeDFinJlF8oTGO1huBOGCENu2n5MZQV9I7j4UCXNhC7p+qgPff2PpjCW46Jy9nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXLq86xt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64086C4CECE;
	Mon,  4 Nov 2024 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729972;
	bh=JhFNXixVI6LoLn/UIp5izX3h/kj/BU4WbxVI+NQJB8E=;
	h=From:To:Cc:Subject:Date:From;
	b=mXLq86xt7G/cozgLlRT60EhML9LfBKQyBX8q+JyBgaMd7xPHJ0oRFgmJFtcFbbTch
	 GDI2k3yOtHobgsBTE5MEZiiRqXHhU40IMoWtHnCkq7vYpW5Oal6N/MLRD0Hn+HrGO3
	 F9VgOGeQkv24b1O5dSwb0Eb+b2dkVRPUMdOtCyUVB1P4aWUHqWJrBdtiKfG3jgj8iP
	 8IKLxow7ku2QH+iTEcVvIX9Nc2Mfo/BMvKeuZXVow5k1WjpAim5Tw4YT37r7svjBiC
	 rhtlb8nF40gjFd2g1xvUrVQnhZXPZ51ZvCfbWKqXpjmUF4yGiprJTUPJK/xfpK8dYY
	 n4FuvaWjbLozg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v5 00/12] Turris Omnia LED driver changes
Date: Mon,  4 Nov 2024 15:19:12 +0100
Message-ID: <20241104141924.18816-1-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Lee,

this is v5 of Turris Omnia LED driver changes.
v1 to v4 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240913123103.21226-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20241029135621.12546-1-kabel@kernel.org/

Changes since v4:
- patch 2: correctly get MCU I2C device with device_find_child() when
  trying to determine features supported by MCU firmware
- patch 7: don't select TURRIS_OMNIA_MCU_GPIO, depend on it instead.
  Selecting it causes kernel test robot to warn on some unmet
  dependencies since GPIOLIB is dependency for TURRIS_OMNIA_MCU_GPIO
- patch 7: request brighhtness changed IRQ only if it is defined in
  the device-tree
- patch 7: fix check for return value of devm_request_threaded_irq()

Marek

Marek Behún (12):
  turris-omnia-mcu-interface.h: Move command execution function to
    global header
  leds: turris-omnia: Use command execution functions from the MCU
    driver
  turris-omnia-mcu-interface.h: Add LED commands related definitions to
    global header
  leds: turris-omnia: Use global header for MCU command definitions
  dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
  leds: turris-omnia: Document driver private structures
  leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
  platform: cznic: turris-omnia-mcu: Inform about missing LED panel
    brightness change interrupt feature
  leds: turris-omnia: Inform about missing LED gamma correction feature
    in the MCU driver
  leds: turris-omnia: Use dev_err_probe() where appropriate
  leds: turris-omnia: Use uppercase first letter in all comments
  ARM: dts: turris-omnia: Add global LED brightness change interrupt

 .../leds/cznic,turris-omnia-leds.yaml         |   8 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   1 +
 drivers/leds/Kconfig                          |   1 +
 drivers/leds/leds-turris-omnia.c              | 318 +++++++++---------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 -------
 include/linux/turris-omnia-mcu-interface.h    | 148 +++++++-
 7 files changed, 312 insertions(+), 297 deletions(-)

-- 
2.45.2


