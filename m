Return-Path: <linux-leds+bounces-6350-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628DC92DCF
	for <lists+linux-leds@lfdr.de>; Fri, 28 Nov 2025 18:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C6B3AD5C8
	for <lists+linux-leds@lfdr.de>; Fri, 28 Nov 2025 17:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6FA334366;
	Fri, 28 Nov 2025 17:59:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476DF332EA5;
	Fri, 28 Nov 2025 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352743; cv=none; b=jdClCoyRXKHmU2mE4/hm2azKE2PixuaYGtaFk9BUG+8cdTnbnAWhlR9zN4GcqJ9NSIcSkM+Lq/51qXOwXAo5oMM8sM8DnMgpjMOVZjeZ587igKrAtHvVEgNBSm55EHRUyuV3V6v7WZy7JRYvP10/7wCqy/JvzaT/W8EWydafUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352743; c=relaxed/simple;
	bh=eIR+4ZoRXo9gVjdTs/J+esokOeV0XYwD4+B14GAEskM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLuNtkSvB/li2XHITkIwhIxHMocWAhtX1Ldwp7bObHMcRC/PYAa+JzMqmszQz2swKaN3NEcg+RGRj2lGVbW1hY0BU1dckWcwkyD/PWoyCTLk4P1tbfWbDErQOKs+9ZbFbPNShnD71AH/G2ju2BdLX4sAtsvnpYotNf+E+VW/aC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dJ1J75dScz9t8m;
	Fri, 28 Nov 2025 18:58:47 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
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
Subject: [PATCH v12 0/2] Support for Osram as3668 LED driver
Date: Fri, 28 Nov 2025 18:58:25 +0100
Message-ID: <20251128175827.649481-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4dJ1J75dScz9t8m

This patch adds basic support for the as3668 driver IC via I2C interface. 
The IC is capable of driving four individual LEDs up to 25.5mA per 
channel. Hardware blinking would be theoretically possible, but this chip
only supports a few set on/off-delays which makes using that feature 
unfeasable, therefore my driver doesn't offer that capability. 
It's intended applications is in mobile devices such as phones, 
tablets and cameras. This driver was tested and is working on 
a google-manta which is running postmarketOS with a near mainline kernel.
Also there is a patch in the linux mailing list for that device:
https://lore.kernel.org/all/20251120201958.1970828-1-linux@timmermann.space/
The register names and values are taken from the official datasheet which
can be found here:
https://www.mouser.com/datasheet/2/588/AS3668_DS000196_1-00-1512816.pdf

Please note: This is my first suggested patch to the kernel. 
I've read the docs in regards to the led subsystem, 
coding style and submission of patches, 
but I'm still a bit unsure about the general workflow. 

I will try my best.

Changes in v12:
- Fixed error handling in ..channel_mode_set(). (@Lee)
- Link to v11: https://lore.kernel.org/all/20251125114015.355487-1-linux@timmermann.space/
Changes in v11:
- Adding mask and register to struct instead of led_id. (@Lee)
- Renaming reg variables to be more clear. (@Lee)
- Simplified calling of ..channel_mode_set(). (@Lee)
- Removed unnecessary pointer dereferencing. (@Lee)
- Changed error type in ..probe() to -EINVAL. (@Lee)
- Reworded some error messages to be more clear. (@Lee)
- Removed error message when removing module. (@Lee)
- Link to v10: https://lore.kernel.org/all/20251117020008.316648-1-linux@timmermann.space/
Changes in v10:
- Reworded some error messages to be more clear. (@Lee)
- Removed newline. (@Lee)
- Added enabling and disabling of channels during brightness set. (@Lee)
- Rearranged and renamed constants.
- Link to v9: https://lore.kernel.org/all/20251014152604.852487-1-linux@timmermann.space/
Changes in v9:
- Tabbed out values. (@Lee)
- Removed newlines. (@Lee)
- Renamed chip id constant and variables to be more clear. (@Lee)
- Removed unnecessary comments. (@Lee)
- Removed unnecessary debug message. (@Lee)
- Separate declaration and assignment of err variable. (@Lee)
- Link to v8: https://lore.kernel.org/all/20250808213143.146732-1-linux@timmermann.space/
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
 drivers/leds/leds-as3668.c                    | 201 ++++++++++++++++++
 5 files changed, 296 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ams,as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.52.0


