Return-Path: <linux-leds+bounces-3347-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B659C1DF3
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD0E1F214E4
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188301EB9F0;
	Fri,  8 Nov 2024 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFG2eQ8o"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42951E2857;
	Fri,  8 Nov 2024 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072536; cv=none; b=eCYwAx37RPfXEE1ZmSYVeyIZr4Wx0LVLp/DLImLZ1zpXFQtXjYtQ6QUv2/ZzNoHBF1wF+su7brzicnV35aQW7AwExYQupR37I2MIgJ1ARet/vS5na+ImVN69S2TFNdHNznaCJQMx3sDEWVI9NeiMKpWoK+aflZvIBP5bsks16YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072536; c=relaxed/simple;
	bh=vE8iR6QfJRhyKJgIeYq6EXyPw9EA/H6FA/A7mtsq4cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4pvhpcAn5AUrsa0HOx24JdfVvxAN8ESc2f6SCoZb2DiK7VeM5BSB4fv4swWh780fbHKTEiHwvEsU9T0UOf9SKjuAd2WyJBRQfdN/Yjc14hsCq1fWm5LodOpJDARMTCk6KK0I56zdjvKYeZQru6fR/dDfnaDKFm9gSd32HjEb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFG2eQ8o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28988C4CECD;
	Fri,  8 Nov 2024 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072535;
	bh=vE8iR6QfJRhyKJgIeYq6EXyPw9EA/H6FA/A7mtsq4cs=;
	h=From:To:Cc:Subject:Date:From;
	b=pFG2eQ8o7BaOyaFAY9L/LlVNII8fZmllTnZ7VfXFfY2qiIDe8yxF5b/THYlapBPZC
	 4GkKqXecWLh4zsaNOSR3JHptD97sdpYjYHDuqSxAGh8regkaFynroGDwR/V3huSzWL
	 l6KausEg5rbyY5mEbFHGHrfe6ocISD7WA1caGfTeXFgaOm1WFL1AXBAVgZrrRdzKZk
	 nydEcLikwMiW3tNoSnVahacl0c3wVUV1bWlLgDhkFf2St8dCScXl/HnNq7s+OhHThk
	 uzz8Fp+r+KvsNUVQIsYFn/5VDcqhM0gh6TG/qXbuXAi5p91VbXankJ5UFmodh5rDSz
	 XzZ8FPiAyDNQg==
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
Subject: [PATCH leds v6 00/12] Turris Omnia LED driver changes
Date: Fri,  8 Nov 2024 14:28:33 +0100
Message-ID: <20241108132845.31005-1-kabel@kernel.org>
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

this is v6 of Turris Omnia LED driver changes.
v1 to v5 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240913123103.21226-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20241029135621.12546-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20241104141924.18816-1-kabel@kernel.org/

Changes since v5:
- patch 7: dropped the comment regarding drivers/base/dd.c as you
  suggested
- patch 7: fixed kernel test robot warning (hopefully)
- patch 7: fixed brightness_knode destruction on driver removal if
  brightness change interrupt isn't supported by the firmware or
  described in the device-tree
- patch 7: added info message if brightness change interrupt is
  supported by the MCU but not described in the device-tree

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
 drivers/leds/leds-turris-omnia.c              | 336 +++++++++---------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 -------
 include/linux/turris-omnia-mcu-interface.h    | 148 +++++++-
 7 files changed, 329 insertions(+), 299 deletions(-)

-- 
2.45.2


