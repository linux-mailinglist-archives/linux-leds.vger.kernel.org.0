Return-Path: <linux-leds+bounces-1698-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0118CF555
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 20:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE0A281084
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 18:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED6341A88;
	Sun, 26 May 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="cHBy0WsF"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16412BF02;
	Sun, 26 May 2024 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747514; cv=none; b=Lb3YJGhXVL4JXmS2otthJ8jehrs7oq7Y0xG/tqB/NVD/bVhuEp6wrMa7rwQyYK7Zi+6FvQKDqXfO9JLARkfzS/8U0JBgZQcmNg8M9FAn1AhtAbgwYbeU3d8ZocMhxF2z9NWYokX4YoH+cbnMZx7zqhegO1IIor+F779/E9/+emI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747514; c=relaxed/simple;
	bh=5oMowGkqzJsbgrsbE3KVNxytAh6f1E17OgBqP3p91cA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kStEXxI7TJO2fj2txxh+4scYFmTGD0KG/I4ahTlzjlvfITOmR4aWbk2uPgLmbhn9V/J/odjbOE9MEn/sxRvurTCZNCqGmZ469I7kcTsau+PnU3ttDdcEhu30TpKInPwugBQgfq99U5pe8GJgTvVLTcA/vTj78cLwiHHp7an/c+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=cHBy0WsF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716747502;
	bh=5oMowGkqzJsbgrsbE3KVNxytAh6f1E17OgBqP3p91cA=;
	h=From:Subject:Date:To:Cc:From;
	b=cHBy0WsF4PLV0FrUm42Y1zonWWPhGgq+1uJDUWrxXAhHFS2nN8gIhAfiQPivqgLsW
	 e4eptCA2uKWbRqrafdGoCarKYcHbmX2E5wUzdq2f/cHFsBQf/poq/wWer1OQHd897V
	 WqFwBCGqS7by8gexZDh7eHEuFW98v14M/UVL7T8U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/4] cros_kbd_led_backlight: allow binding through
 cros_ec mfd device
Date: Sun, 26 May 2024 20:17:14 +0200
Message-Id: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKp8U2YC/43NTQrCMBCG4atI1o4k6b8r7yEi7WRqQrWRpKZK6
 d1NuxIEcfl+MM9MzJMz5Nl+MzFHwXhj+xjJdsNQ1/2FwKjYTHKZ8oxngM76MyF0jYIrKWhdfaP
 Rug4KklQmosGiQhbv745a81zt4ym2Nn6w7rW+CmJZ/1GDAAFNi1jnFReJkoeRjPce9UPvehrYQ
 gf5wQnxi5PAoZEc01LwitL8i5vn+Q2N7qCMFgEAAA==
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
 Rajas Paranjpe <paranjperajas@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716747501; l=2693;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5oMowGkqzJsbgrsbE3KVNxytAh6f1E17OgBqP3p91cA=;
 b=zWV2+zpnlF/9WHtH2W0I/+gtloQmSDiZwRDdjyswEtjbkhOrbLzO4bL5bE29puRJnyvRZ9/4g
 dRCyAjTHblGBQFEyhRTLKm8kC7/HPCOVj/dkFfUR2rGme3HURAX3TFO
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the cros_ec MFD device to also load cros_kbd_led_backlight
when the EC reports EC_FEATURE_PWM_KEYB.
As the driver can now be probed multiple times, some preparation in the
LED core is necessary to avoid name collisions.

Patch 1 is a general cleanup for the LED core.
Patch 2 modifies the LED core to skip the default collision handling.
Patch 3 adds the new probing logic to cros_kbd_led_backlight.
Patch 4 wires up the driver to the cros_ec mfd devices.

The helper keyboard_led_is_mfd_device is a bit iffy.
But using match data doesn't work.

* driver_data from platform_device_id is overwritten by the mfd platform data
* Setting the driver_data in drivers/mfd/cros_ec_dev.c would expose the
internals of cros_kbd_led_backlight

Tested on a Framework 13 AMD, Firmware 3.05, and a Jinlon Chromebook.

To: Lee Jones <lee@kernel.org>
To: Benson Leung <bleung@chromium.org>
To: Guenter Roeck <groeck@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: Dustin Howett <dustin@howett.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-leds@vger.kernel.org
Cc: Rajas Paranjpe <paranjperajas@gmail.com>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Changes in v3:
- Avoid probing multiple times (Confirmed by Rajas)
- Add Kconfig dependency on MFD_CROS_EC_DEV
- Link to v2: https://lore.kernel.org/r/20240511-cros_ec-kbd-led-framework-v2-0-b20c48109e46@weissschuh.net

Changes in v2:
- Fix build with CONFIG_MFD_CROS_EC_DEV=n (kernel test robot)
- Split out mfd registration into own commit (Lee)
- Simplify keyboard_led_is_mfd_device() with mfd_get_cell()
- Link to v1: https://lore.kernel.org/r/20240505-cros_ec-kbd-led-framework-v1-1-bfcca69013d2@weissschuh.net

---
Thomas Weißschuh (4):
      leds: class: warn about name collisions earlier
      leds: add flag to avoid automatic renaming of led devices
      platform/chrome: cros_kbd_led_backlight: allow binding through mfd device
      mfd: cros_ec: Register keyboard backlight subdevice

 drivers/leds/led-class.c                         |  9 +++---
 drivers/mfd/cros_ec_dev.c                        |  9 ++++++
 drivers/platform/chrome/Kconfig                  |  2 +-
 drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
 include/linux/leds.h                             |  1 +
 5 files changed, 54 insertions(+), 7 deletions(-)
---
base-commit: 6fbf71854e2ddea7c99397772fbbb3783bfe15b5
change-id: 20240505-cros_ec-kbd-led-framework-7e2e831bc79c

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


