Return-Path: <linux-leds+bounces-3182-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC99B4B6E
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7D7C1F24286
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8362071E5;
	Tue, 29 Oct 2024 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZY8zWP1X"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9A206E76;
	Tue, 29 Oct 2024 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210193; cv=none; b=ARUePmRfaCEIc5vj+QrXXca07YflRG87ruFYKLudqC+7T5C1UIiUtQEvAWXYNyzN7FeKUOovWueI/SfJm6kkUZuRH7ah6WzNJjQswmaoEsLTkAs2Xa//+Ak1gC+FNwB4oWHrTPzOXqYk84CHInu56zpzrcZ/uvx+TSFzOBQNGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210193; c=relaxed/simple;
	bh=vgzAeV+QgCiYr0n/cWTXTZqBE4QIkiily2oQVrtjb0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LV2RWQ/GIjF9aFUzsVprmWOuQpSzfMjOzCnAeQtnvA8Zuqox0D4P8p+iVrLDngig4HKutWhMPHLlgpqmdWxKB8hcuLNmtw5LFr/WRQuPBDUOJzFRixjGmP0ibOZBMLfEPD70HfuIN4acSWjp04+g5lAHTQuee3gbxNxqKQz11jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZY8zWP1X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA70C4CECD;
	Tue, 29 Oct 2024 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210192;
	bh=vgzAeV+QgCiYr0n/cWTXTZqBE4QIkiily2oQVrtjb0I=;
	h=From:To:Cc:Subject:Date:From;
	b=ZY8zWP1XnhZgBzD+SikMIkIRxcTDr/w3Yax+kVTscDIRcIdhPHFXedYjsfGrsjpLt
	 lMSq/7VFd2Q9ZO5hVpj6o2tnjiklMWQ+vtPc77yS0zJeIfoZE/BjS6ZjHNXm3PsK+Z
	 FaT528cVnSEE7kkGHkH6YeD9vnZ7DmzpwAEmV4UYEFHeByBLEbP3DXIjLu1RWmo+ZV
	 2Bj3NTFdM0S9N+U0i2dBRn+rvAytTLw1esqt4xZfadASklMxZwYubp1C9mK2Jr0psa
	 LpxsR/7yuVzt6t8uDLiyYHxACvqvjqsTSeii/Lf9ppA4gXY986TEcRvocVzeqRDOM5
	 Z80yIcuUAOpJA==
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
Subject: [PATCH leds v4 00/12] Turris Omnia LED driver changes
Date: Tue, 29 Oct 2024 14:56:09 +0100
Message-ID: <20241029135621.12546-1-kabel@kernel.org>
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

this is v4 of Turris Omnia LED driver changes.
v1, v2 and v3 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240913123103.21226-1-kabel@kernel.org/

Changes since v3:
- fixed kernel test robot warning for patch 2 by adding dependency to
  the TURRIS_OMNIA_MCU module
- added Krzysztof's Acked-by to patch 5
- added patch documenting driver private `struct omnia_leds` and
  `struct omnia_led`
- addressed your notes for patch 7 (6 in v3)
- added `select TURRIS_OMNIA_MCU_GPIO` to KConfig. The driver already
  depends on TURRIS_OMNIA_MCU, but for the global brightness changed
  interrupt it needs the GPIO functionality from the turris-omnia-mcu
  driver

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
 drivers/leds/Kconfig                          |   2 +
 drivers/leds/leds-turris-omnia.c              | 291 ++++++++----------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 --------
 include/linux/turris-omnia-mcu-interface.h    | 148 ++++++++-
 7 files changed, 288 insertions(+), 295 deletions(-)

-- 
2.45.2


