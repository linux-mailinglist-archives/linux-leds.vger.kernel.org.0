Return-Path: <linux-leds+bounces-4786-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC2AD4E77
	for <lists+linux-leds@lfdr.de>; Wed, 11 Jun 2025 10:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 304681766D7
	for <lists+linux-leds@lfdr.de>; Wed, 11 Jun 2025 08:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A19023E355;
	Wed, 11 Jun 2025 08:32:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31D23E336;
	Wed, 11 Jun 2025 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630735; cv=none; b=S0TvTkYkpyY9QaLV0QPiqZeyTLIANXMAklApmsLgvyhMeBwC4E4kjTMwjyzTUDUgsjP4hIUOyRFHKPQqmtCVUyhCzM3f50XPZT5gMBFQ3QH4b8IxaRGpnYGgODtgqilGyphB2Qq9EYsAau+84qKObPhQlJhjT2VRNAuJV+DKDeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630735; c=relaxed/simple;
	bh=PPynbfnkIjXxGpaTo686aW4m3QhtkxNND5E/kPM/9N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9YmqeEha9tV14u1LHI3pF2vIx7SoWWQlbMFxndXDKS5+zsyp9olgOnlekvICt5O9hMkOM3LZJo6drq/HV946lTcQawKZbygZtm7J6KNb/29SAdlDL8vHLYibM5ByFI08EoWJQR/Q2BZDwwrdoowGLL6ZV13Az55ghAX5w84yaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bHJmg5fsLz9tPJ;
	Wed, 11 Jun 2025 10:32:03 +0200 (CEST)
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
Subject: [PATCH v6 0/2] Support for Osram as3668 LED driver
Date: Wed, 11 Jun 2025 10:31:49 +0200
Message-ID: <20250611083151.22150-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bHJmg5fsLz9tPJ

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

Changes in v6:
- Fixed missing error handling during init
- Fixed missing newline in error messages
- Fixed size calculation for memory allocation
- Fixed error handling for memory allocation
- Link to v5: https://lore.kernel.org/lkml/20250608231854.75668-1-linux@timmermann.space/
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
 drivers/leds/leds-as3668.c                    | 204 ++++++++++++++++++
 5 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ams,as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.49.0


