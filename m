Return-Path: <linux-leds+bounces-5207-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC542B1F040
	for <lists+linux-leds@lfdr.de>; Fri,  8 Aug 2025 23:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 170A4560341
	for <lists+linux-leds@lfdr.de>; Fri,  8 Aug 2025 21:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37791244E8C;
	Fri,  8 Aug 2025 21:32:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395221ADB9;
	Fri,  8 Aug 2025 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754688762; cv=none; b=tDb52TLb2VcQXZW5lq53+lAMWa/RWhA+1E8xvqalNvRPRTSwy9aMFEWGS+TiymX0sHFlb8KfNLzqf/7KI/QJ9D03CG9xo8BTpzDE3w4a0vmY/ITyjvtAzYyZ6YbRH7WKe5c6be5No4Xoy+YH5IVdu9NI++GCPNY20O2odfjQVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754688762; c=relaxed/simple;
	bh=Gq8ONbOWhhXrtnD+A60tkSnJXWc77dh+BSpmudVOJeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTJZFi1bihN4l0nTelijC0jyAkWLuiHFVPM7mw5xY0m7hmzCM0ib0r/MfmQ85fkOCNSrCybTF+7cckByMcMnShAFQ/Wf88yMxniHfih/W1HCwtzs1B5t4lbw19tubdl+U9yspbvQ2jp1xYt5aCjTEMom3wYuNXbr4BQiHZ/5eWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bzHLV4vGXz9srm;
	Fri,  8 Aug 2025 23:32:34 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
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
Subject: [PATCH v8 0/2] Support for Osram as3668 LED driver
Date: Fri,  8 Aug 2025 23:31:41 +0200
Message-ID: <20250808213143.146732-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bzHLV4vGXz9srm

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

Changes in v8:
- Rearranged constants.
- Removed more newlines.
- Changed error messages to be more clear.
- Renamed variables.
- Removed revision check.
- Removed extra i2c read&write functions.
- Made initalisation code more readable with bitmasks.
- The code now wraps around before 100 chars instead of 80.
- Link to v7: https://lore.kernel.org/all/20250708141114.134950-1-linux@timmermann.space/
Changes in v7:
- Simplified multiple error messages. They now use dev_err_probe().
- Removed some newlines.
- Link to v6: https://lore.kernel.org/all/20250611083151.22150-1-linux@timmermann.space/
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
 drivers/leds/leds-as3668.c                    | 196 ++++++++++++++++++
 5 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ams,as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.50.1


