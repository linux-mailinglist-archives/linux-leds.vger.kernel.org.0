Return-Path: <linux-leds+bounces-1900-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092AE90759E
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ACB31C23C56
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3591411D6;
	Thu, 13 Jun 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V6ueiE8Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB50139CFE;
	Thu, 13 Jun 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290130; cv=none; b=gozpOzTbGHz3u/elN1zJ61tX8CdubzFfEa1d8LeN6M2fxMeS8D9akP8a1ACQAjYAnIL/rW1IC8Ud59lv3wJ68rwaJeQibQsh/D8ha/j+dnIlIrSRXnjTJDXhTcuwPGSPxh5CI+rEJVOTCZrfuyKUCCOZ42L3WfyCZEamU1SKRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290130; c=relaxed/simple;
	bh=vj3/g8xi/rqsVBNNGGFadxLIBohU3ZNx5pprWK/Fs70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mYiTykbJhn+ZiG7oHoBAQpRpATW87EINqi+tb/a1ncr6u4FCSUK+0/7oWBCyBqDAO7ElztOjtvRl4+VhE5QtCVYGoHLpzzs9/cTpajnemE/RhjUvFrahuVq0YcAYqF/pXLKv021SeVcI0WZgIlhzu6p0yythd+P2FyU0u3OQQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V6ueiE8Z; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290120;
	bh=vj3/g8xi/rqsVBNNGGFadxLIBohU3ZNx5pprWK/Fs70=;
	h=From:Subject:Date:To:Cc:From;
	b=V6ueiE8ZnYjEcsZDV//CL73SC7OXpdUlk+xQ2PVw6lC7dvp5jt7po+hOPdYSOTCpQ
	 lP+4qsahJtPDNG4aQzXXnkZJCCYgYT4ashJgFHcqKXiZzvgpytmgzSm3Tz32gKzOQb
	 DRmRVZ/M8sWXwnqDbnq4sO5ydynTOzuH7UzXPhYg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/5] ChromeOS Embedded Controller LED driver
Date: Thu, 13 Jun 2024 16:48:35 +0200
Message-Id: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMMGa2YC/2XN3QqCQBCG4VuRPW5j/xTtqPuICBvHdiBUdmwrx
 HtvlQ6SDt8P5plJMAZCFodsEgEjMfVdCrvLBPi6u6GkJrUwyjiV60pC6PmCIO/YSIttbRzaqtI
 o0sUQsKXXqp3OqT3x2If3ike9rF/HqI0TtVTSqaJsIYf0pT4+kZgZ/MPvOxzFgkXzA1i9BUwCC
 gDrnCqvTjV/wDzPHz+ZYx/sAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718290119; l=2145;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vj3/g8xi/rqsVBNNGGFadxLIBohU3ZNx5pprWK/Fs70=;
 b=JZaCj+2EKSUjqtG09d0GNhSypb4H14/noMrvE7EiLXUeUzYjRkV4dGQ5xp5WfM8fZqtLsK8mS
 RgosXfYio7cCz+JgiSZJk53itTMlWgOf47EH+kN/zrzMbomRIBInS5k
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
Changes in v3:
- Set default_trigger explicitly as the LED core doesn't do this anymore
- Only set intensity for first subled by default
- Link to v2: https://lore.kernel.org/r/20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net

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
 drivers/leds/leds-cros_ec.c         | 299 ++++++++++++++++++++++++++++++++++++
 drivers/leds/leds.h                 |   1 -
 drivers/mfd/cros_ec_dev.c           |   9 ++
 include/linux/leds.h                |  10 ++
 9 files changed, 350 insertions(+), 4 deletions(-)
---
base-commit: 2ccbdf43d5e758f8493a95252073cf9078a5fea5
change-id: 20240519-cros_ec-led-3efa24e3991e

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


