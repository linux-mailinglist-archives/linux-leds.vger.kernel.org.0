Return-Path: <linux-leds+bounces-4759-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76375AD15A3
	for <lists+linux-leds@lfdr.de>; Mon,  9 Jun 2025 01:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D9C318838FD
	for <lists+linux-leds@lfdr.de>; Sun,  8 Jun 2025 23:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD10266EE6;
	Sun,  8 Jun 2025 23:19:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF7266EFE;
	Sun,  8 Jun 2025 23:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749424762; cv=none; b=I8n+W34B/UcYSBZYH7bF8HwvRocoK9909DHd3d3ad6bcMP6w1foUA5lB9PbQ5cl8qS99UBva4gRGAUQiaDt5s5uGfYOSuVNHb34pHqy7c8JLOWx9U8BNGc3KjjRQUph98mUPNvtXd12e4tJhv9sgSbdvK2VWwR10abHQVADzvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749424762; c=relaxed/simple;
	bh=1zN3+2MJ6FEXsCEUEk+PRff98eDgn6xyGV9w1N2dOQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kClpBbgIWR7CFr/HX8YK6IGOBTA0uNYkqVUblPPJ9VS1/ZDvmYPf0AEWPHw4Omc4+ciyq0keckD4zjnuV8lzgRuN2jBm3D1a62t5+CmbI0gg9mFXpAK6vJtUPPrhcB6DNRVj0WvKI6pA01CrdeHhOQwWT2TC8u1CqlcXs2w+Vjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bFrbk4zSSz9sd7;
	Mon,  9 Jun 2025 01:19:14 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@timmermann.space
Subject: [PATCH v5 0/2] Support for Osram as3668 LED driver
Date: Mon,  9 Jun 2025 01:18:52 +0200
Message-ID: <20250608231854.75668-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bFrbk4zSSz9sd7

This patch adds basic support for the as3668 driver IC via I2C interface. 
The IC is capable of driving four individual LEDs up to 25.5mA per 
channel. Hardware blinking would be theoretically possible, but this chip
only supports a few set on/off-delays which makes using that feature 
unfeasable, therefore my driver doesn't offer that capability. 
It's intended applications is in mobile devices such as phones, 
tablets and cameras. This driver was tested and is working on 
a samsung-manta which is running postmarketOS with a near mainline kernel.

Please note: This is my first suggested patch to the kernel. 
checkpatch.pl runs without warnings or errors. 
I've read the docs in regards to the led subsystem, 
coding style and submission of patches, 
but I'm still a bit unsure about the general workflow. 

I will try my best.

Changes in v5:
- Fixed debug and error messages using wrong format specifiers.
- Fixed missing include bitwise.h.
- Changed commit message for dt file to fit expected style.
- Link to v4: https://lore.kernel.org/lkml/20250607215049.29259-1-linux@timmermann.space/
Changes in v4:
- Fixed some mistakes made in the dt file pointed out in v3.
- Swapped dt and driver in patch series. DT now comes first.
- Fixed errors in Kconfig due to last minute changes.
- Added dt file into MAINTAINERS file.
- Link to v3: https://lore.kernel.org/lkml/20250604225838.102910-2-linux@timmermann.space/
Changes in v3:
- Fixed an extra whitespace in the dt bindings documentation.
- Sent patch to all related lists and maintainers.
- Link to v2: https://lore.kernel.org/lkml/20250531120715.302870-4-linux@timmermann.space/
Changes in v2:
- Fixed reading led subnodes in dt incorrectly, 
  which caused wrong numbering and a segfault when removing the driver module
- Fixed calling of_property_read_u8 with an int, causing a compiler error
- Added more error checking during writes to the i2c bus
- Link to v1: https://lore.kernel.org/linux-leds/20250530184219.78085-3-linux@timmermann.space/

Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Lukas Timmermann (2):
  dt-bindings: leds: Add new as3668 support
  leds: as3668: Driver for the ams Osram 4-channel i2c LED driver

 .../devicetree/bindings/leds/ams,as3668.yaml  |  74 +++++++
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  13 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-as3668.c                    | 197 ++++++++++++++++++
 5 files changed, 292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ams,as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.49.0


