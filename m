Return-Path: <linux-leds+bounces-1778-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AFB8D66F6
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 18:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405C61F26772
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C339C16D9AC;
	Fri, 31 May 2024 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Vy73u8ZE"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF0C17D88B;
	Fri, 31 May 2024 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173223; cv=none; b=pP6R537Iv0/Wdj/+M2w8mVFG33c9X6Jpb/1ljyseliUe6JNAA+EFx6EvgwntROQHdmt3DwE3wGVzBMhbUepAqs2laTqg5zDNgIsJiUYuuiZgQe7/0nGDLeR+LfPuPqO62pl2fOQjDBVw5MhM5FWYcWGxJ+j/6/OOFUtZ9okrsIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173223; c=relaxed/simple;
	bh=e2te239z+IMC3DLyCMZhhGTdOGk4cQaQ5/c2y2b6aw4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YdF0dCd75kuo85BvXJSyYcj+NLo0gHKkffmAvI/4ylZGa0uBbuk+V3vcnmyGOLFC4b143i+vmqztVVR+xZiiYM3HyxW9/8oOVkq5q8lBnGjehlyAXAEY0qFeDjiOkgbfyWPFaA0DNiiQi0lCx6zGcSbVslACZ74Klq6PBC8GiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Vy73u8ZE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717173219;
	bh=e2te239z+IMC3DLyCMZhhGTdOGk4cQaQ5/c2y2b6aw4=;
	h=From:Subject:Date:To:Cc:From;
	b=Vy73u8ZEZLwTakdGLIKfGU24TkxF+maBbw/W83eDUfm6qAAXzEWE3EXJ0NQX+VYQO
	 mYv7Tmz/O+RwwNjsYJeDrI/xquDfjFYMrh4+39xY45lPC8IMkTd4FI4sMvKjrFTyAo
	 aYFa1B/N2BZA1a9VrkMkDy55iTs0T78FwlmnYEx8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/5] ChromeOS Embedded Controller LED driver
Date: Fri, 31 May 2024 18:33:30 +0200
Message-Id: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANv7WWYC/1XNwQrCMAzG8VcZOVtpu06sp72HDBlZagOySTOnM
 vru1uHF4/+D/LKCUGISOFUrJFpYeBpL2F0FGPvxSoqH0mC1dboxXmGa5EKobjSomkJvHdXeG4J
 ycU8U+LVp5650ZJmn9N7wxXzXn2P1n7MYpZXTh2PABsuXvn0SiwjGR9yPNEOXc/4ALzC2vasAA
 AA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717173219; l=1908;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=e2te239z+IMC3DLyCMZhhGTdOGk4cQaQ5/c2y2b6aw4=;
 b=NHD08KUBJhTBh3EnOoD/BK3VaPTZHQaAwXoN71tMUzG6ucDCI5B8MhC2JZTQVUllmZ2V6cPxi
 XzzG9oCVh7aBR9eMYJC9VgksaFx7HXuuH7Dv8dbVkvI81VKvYPxay8R
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a LED driver that supports the LED devices exposed by the
ChromeOS Embedded Controller.

Patch 1-3 add a utility function to the led subsystem.
Patch 4 introduces the actual driver.
Patch 5 registers the driver through the cros_ec mfd devices.

Currently the driver introduces some non-standard LED functions.
(See "cros_ec_led_functions")

Tested on a Framework 13 AMD, Firmware 3.05.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Cosmetic cleanups (Tzung-Bi)
- Add trailing comma to MFD cell array
- Rename LEDs and trigger to "chromeos" prefix, to align with kbd
  backlight driver
- Don't use type "rgb" anymore, they are only "multicolor"
- Align commit messages and subject to subsystem standards (Lee)
- Rename led_color_name() to led_get_color_name()
- The same for cros_ec_led_color_name()
- Link to v1: https://lore.kernel.org/r/20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net

---
Thomas Weißschuh (5):
      leds: core: Introduce led_get_color_name() function
      leds: multicolor: Use led_get_color_name() function
      leds: core: Unexport led_colors[] array
      leds: Add ChromeOS EC driver
      mfd: cros_ec: Register LED subdevice

 MAINTAINERS                         |   5 +
 drivers/leds/Kconfig                |  15 ++
 drivers/leds/Makefile               |   1 +
 drivers/leds/led-class-multicolor.c |   2 +-
 drivers/leds/led-core.c             |  12 +-
 drivers/leds/leds-cros_ec.c         | 297 ++++++++++++++++++++++++++++++++++++
 drivers/leds/leds.h                 |   1 -
 drivers/mfd/cros_ec_dev.c           |   9 ++
 include/linux/leds.h                |  10 ++
 9 files changed, 348 insertions(+), 4 deletions(-)
---
base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
change-id: 20240519-cros_ec-led-3efa24e3991e

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


