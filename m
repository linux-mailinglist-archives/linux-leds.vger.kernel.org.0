Return-Path: <linux-leds+bounces-1697-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB418CF553
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 20:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4911E281086
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 18:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865353BBE6;
	Sun, 26 May 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pUlo7Uoq"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30112BF1F;
	Sun, 26 May 2024 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747514; cv=none; b=sA4kZGZxWxh5/jKBsjpzgPP0lH4fBsnPsf37BmfmY3e0qADRzqjWloGV4f6qEHkZjyWxS83/nPs5cX7W7wjjeoMgCchEMD7sIJwEOl0eTPRb61P1fTfUaEG7tb0IPseAIllfsYOdV1/4fcgLTcdMrk5M3dSGWpbQXtyBIYwLjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747514; c=relaxed/simple;
	bh=KC/TRarvgs7SYNDEshZDwV92vrtoHyo8D9b8NVbqSj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf9VETrwjKp9pwop5RrQLhoVbowcZXKMGBFdciNhyXHRKxodQs7Bbkj8uBrORZzYHXvonEiUG7Wj7JWEkUB9J93gsL0Yu41HSppNlDrmTSNyNfFG4ZSygRZlQBmpkMHa42mBFdZ8w7TmRf1xIwc1bcg6v75nKGSrja2uTOS/U2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pUlo7Uoq; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716747502;
	bh=KC/TRarvgs7SYNDEshZDwV92vrtoHyo8D9b8NVbqSj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pUlo7UoqvCt2hKNjomg112e4CjZDW7SQzNHNqP2qU/FL8GTONofbMhwN3LEl9jIVI
	 QEjftnoeGQCXXQxLUfIgDdKKr+EgG5i6K7us0sKqI+22LCuWw2ifEnMVd2QM67oCjF
	 hdum9kNVKike3MQVNGMbUqfswajciYpJ9GvTS5wg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 26 May 2024 20:17:17 +0200
Subject: [PATCH v3 3/4] platform/chrome: cros_kbd_led_backlight: allow
 binding through mfd device
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
 Rajas Paranjpe <paranjperajas@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716747501; l=4015;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KC/TRarvgs7SYNDEshZDwV92vrtoHyo8D9b8NVbqSj0=;
 b=+C/B13+2008IRCXdR+q2epMz/eBidKzeYrip9lHnqwu+xOiESAxjTZvJXOsGxL8PBhFJB40Ft
 xl25fZE5BLqCG3c5YHWQdG8bof3GCQdY4imntnDMXyd8wKrHgLxyFtr
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The ChromeOS EC used in Framework laptops supports the standard CrOS EC
keyboard backlight protocol.
However the firmware on these laptops doesn't implement the ACPI ID
GOOG0002 that is recognized by cros_kbd_led_backlight and they also
don't use device tree.

Prepare the existing cros_kbd_led_backlight driver to be probed through
the CrOS EC mfd device which works without ACPI or OF support.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/Kconfig                  |  2 +-
 drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 073616b5b5a0..7dbeb786352a 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -150,7 +150,7 @@ config CROS_EC_PROTO
 
 config CROS_KBD_LED_BACKLIGHT
 	tristate "Backlight LED support for Chrome OS keyboards"
-	depends on LEDS_CLASS && (ACPI || CROS_EC)
+	depends on LEDS_CLASS && (ACPI || CROS_EC || MFD_CROS_EC_DEV)
 	help
 	  This option enables support for the keyboard backlight LEDs on
 	  select Chrome OS systems.
diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index b83e4f328620..78097c8a4966 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/mfd/core.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -194,13 +195,46 @@ static const __maybe_unused struct keyboard_led_drvdata keyboard_led_drvdata_ec_
 
 #endif /* IS_ENABLED(CONFIG_CROS_EC) */
 
+#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
+static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev)
+{
+	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
+	struct keyboard_led *keyboard_led = platform_get_drvdata(pdev);
+
+	keyboard_led->ec = cros_ec;
+
+	return 0;
+}
+
+static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
+	.init = keyboard_led_init_ec_pwm_mfd,
+	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
+	.brightness_get = keyboard_led_get_brightness_ec_pwm,
+	.max_brightness = KEYBOARD_BACKLIGHT_MAX,
+};
+
+#else /* IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) */
+
+static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {};
+
+#endif /* IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) */
+
+static int keyboard_led_is_mfd_device(struct platform_device *pdev)
+{
+	return IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) && mfd_get_cell(pdev);
+}
+
 static int keyboard_led_probe(struct platform_device *pdev)
 {
 	const struct keyboard_led_drvdata *drvdata;
 	struct keyboard_led *keyboard_led;
 	int error;
 
-	drvdata = device_get_match_data(&pdev->dev);
+	if (keyboard_led_is_mfd_device(pdev))
+		drvdata = &keyboard_led_drvdata_ec_pwm_mfd;
+	else
+		drvdata = device_get_match_data(&pdev->dev);
 	if (!drvdata)
 		return -EINVAL;
 
@@ -216,13 +250,15 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	}
 
 	keyboard_led->cdev.name = "chromeos::kbd_backlight";
-	keyboard_led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	keyboard_led->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_REJECT_NAME_CONFLICT;
 	keyboard_led->cdev.max_brightness = drvdata->max_brightness;
 	keyboard_led->cdev.brightness_set = drvdata->brightness_set;
 	keyboard_led->cdev.brightness_set_blocking = drvdata->brightness_set_blocking;
 	keyboard_led->cdev.brightness_get = drvdata->brightness_get;
 
 	error = devm_led_classdev_register(&pdev->dev, &keyboard_led->cdev);
+	if (error == -EEXIST) /* Already bound via other mechanism */
+		return -ENODEV;
 	if (error)
 		return error;
 

-- 
2.45.1


