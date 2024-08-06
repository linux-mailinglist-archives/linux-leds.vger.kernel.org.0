Return-Path: <linux-leds+bounces-2411-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C5949994
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 22:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD44A1F2286F
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 20:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D21016A95E;
	Tue,  6 Aug 2024 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxyeHWcK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DC15C121;
	Tue,  6 Aug 2024 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722977429; cv=none; b=VCMLb4/MRYrbhZOZF9ow/RlY8aosaBTVta9ol/2OAsNwWisCmA32kQQF562OWnOif6OmAC1DZOVKIxI3M1b7C5cqDesCd8wgSPGFHMDVePnavK0reMn1k5JzSF06LU3aetlXq/AZZxBK55GGPLtQCSEe56sNACHwTW30Hg0QDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722977429; c=relaxed/simple;
	bh=u2RftV1kT2yCNYQdI1OHNi1g32a4+7CPV0W6TbO1mmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttlyE/XQKlXSIo2NSZc6EsxZBc/jRdyTCAwoMAH+KjjtOrRIgke2nLpiJeDTIVCti76Bk/kkeBBpSOJ3co7P1f3LiXpRJjhxVY2Jdvdr/pbRi4h4jFlVjHqXiFggLjZfrDnU3uy5IZl4TPyoOCFSMWdyLvShU09oh1YPAoz9CPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxyeHWcK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso128946466b.2;
        Tue, 06 Aug 2024 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722977425; x=1723582225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsoIKSbAe/jboSbuGHZnYxwkJPK1DJ3+1IgpkNXyx1Y=;
        b=dxyeHWcKc7rN1VytgNAQG09+G7JV1rXZ8NVoSKAYPyHm7EaVncvqebeipGZVQ+RcQV
         gDnO9I+nkAPnsi34H0z18cVL7S9PTKq5+OdRWYQy/FmcvO5dhX1qX8eKNMWdVhXVVRjL
         wGp4bMQ/F1Al3XDpDnkgnmZPn98My+9hD2V9YjvzEbitTVLTHtoHyJNiB8gMaGLDigoT
         Ok1ux9o6BgidluzkviW8vv8Dtwg/YLGPbEa2YEMPwnYkTpF/e+k18GVKV8NkfYPQXfNG
         OzWupboywCpntkqX3lJ8Gc3dtmMz+52d0OwK1eEpAZIanxwaEqlA1EtTk/sqcBxSMVHb
         Sg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722977425; x=1723582225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsoIKSbAe/jboSbuGHZnYxwkJPK1DJ3+1IgpkNXyx1Y=;
        b=aRYBvjeeTWRopzttYytVJpwVlXzGMS5rhaeXGZdedrClEThI8fBAZAqOi3NMJ7hMtc
         ITrc2PmfPyF9gIfHB3luYiM5B7MDmNfzeNN7fs6rsUPmcCzVa3a5HAc+ODwZiTkJx33C
         MQ6UZBS5iqRrgcHTgSCMgROSc6oqFRvMTBtqOu7HwL4qKDLNPm91qaqT3Afp23b2drBx
         +qjB72O6nn7Lx1sdfxg3r71TsjhJvglDnrQzbXk8CJ4/Ffu1NdPaaR4W8F8F2L6YJAMx
         MXx0s7zvG5QFBGy3rzRShYXY5kOlGAfrowXhjYPM4C63qwHapGf+XC2tr7t7cvab41yA
         ySFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKNWII/Ti/56SuViGNYv80ZcEyz4hUMgcwPs7Ko/iZ4+O1D5RZFctQ0UNNqFHnboUO2GEzmQ5UfnOy61O2JE8RKp/2MrL53FN7ckr8UQ8xCg9NmujGcb3oyhZcXNljBZb/bmlYllmQsMVjZvuWnThSFxl2qmxhBJqGDjeM1TC7AZQTu0PcKZkpl/2FbbZnSk7iygzRwofiicCONaHsD5Q+ra/e8/0UKOp7bQ==
X-Gm-Message-State: AOJu0Yy+JQWraffspNBpefnE2VDo75aL8HMo5ejIs82/x4eIznowEWH7
	lotlmFUWlJbvd5y2xqgTq9yNgHvrhDIZ/PzQ1Do9EEiRGFL2hek2
X-Google-Smtp-Source: AGHT+IHKbuhe24K1/YEE8uZ1EgXZKifdSScRcoHxxN873r9xButryhEfXuQa3yGVyQpF5PCn8zUw6Q==
X-Received: by 2002:a17:907:970e:b0:a7d:2a62:40e9 with SMTP id a640c23a62f3a-a7dc509872dmr1061014466b.50.1722977424499;
        Tue, 06 Aug 2024 13:50:24 -0700 (PDT)
Received: from localhost.localdomain ([94.120.87.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e8674dsm588730066b.146.2024.08.06.13.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 13:50:24 -0700 (PDT)
From: =?UTF-8?q?Mustafa=20Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: mustafa.eskieksi@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	rishitbansal0@gmail.com,
	bahaku@elrant.team,
	carlosmiguelferreira.2003@gmail.com,
	alviro.iskandar@gnuweeb.org,
	ammarfaizi2@gnuweeb.org,
	bedirhan_kurt22@erdogan.edu.tr
Subject: [PATCH v7 1/1] platform/x86: Add wmi driver for Casper Excalibur laptops
Date: Tue,  6 Aug 2024 23:50:01 +0300
Message-ID: <20240806205001.191551-2-mustafa.eskieksi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806205001.191551-1-mustafa.eskieksi@gmail.com>
References: <20240806205001.191551-1-mustafa.eskieksi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This wmi driver supports changing Casper Excalibur laptops' keyboard
backlight brightness and color, reading fan speeds and changing power
profiles. Multicolor led device is used for backlight, platform_profile
for power management and hwmon for fan speeds. It supports both old (10th
gen or older) and new (11th gen or newer) laptops. It uses x86_match_cpu
to check if the laptop is old or new.

Signed-off-by: Mustafa Ekşi <mustafa.eskieksi@gmail.com>
---
Changes in v7:
 - Sorted includes
 - Changed corner led's name to biaslight.
 - Better mutex usage.
 - Get current brightness value when setting a new color.
Changes in v6:
 - Added "rgb" to zone names and changed kbd_zoned_backlight-corners to
   backlight.
 - Changed led structure to have 3 seperate subleds instead of one rgb
   subled.
 - Removed led_cache.
 - Removing platform_profile and destroying casper_mutex is managed by
   devm_add_action_or_reset now.
 - Removed casper_wmi_remove.
 - Reordered some variables.
Changes in v5:
 - Added mutex_destroy to casper_wmi_probe error handling
 - casper_multicolor_register now sets all leds to CASPER_DEFAULT_COLOR
 - Some minor changes
Changes in v4:
 - Renamed casper_driver to casper_drv
 - Moved all global variables to casper_drv struct. Devices access
  casper_drv via wdev's driver_data.
 - Removed struct led_cache, because only its u32 array was used. It is
   replaced with color_cache.
 - Added mutex_locks in casper_set and casper_query, so they now accept
   casper_drv instead of wmi_device as argument.
 - Changed endianess conversion in hwmon_read to something sparse doesn't
   complain about.
 - Moved registrations of multicolor leds and platform profile to their
   own functions. This makes casper_wmi_probe more readable.
 - Added .no_singleton to wmi_device.
 - Some minor changes.
Changes in v3:
 - Replaced led_control attribute with multicolor led interface.
 - Added struct led_cache, instead of storing only last color change.
 - Added dmi list to prevent registering platform_profile driver in models
   that doesn't have this feature.
 - Added a x86_cpu_id to differentiate older laptops that are reporting
   fan speeds in big-endian. Also newer laptops have a different power
   profile scheme. I'm using x86_cpu_id because they don't have a
   difference in model names, only in cpu generations (the official driver
   download page makes you select your cpu's generation too).
 - Removed hwmon_pwm device in favor of platform_profile driver. It
   indirectly affects fans' speed but they also affect frequency and
   power consumption as well.
 - Replaced handwritten masks with GENMASK equivalents.
 - Replaced led_classdev_register with
   devm_led_classdev_multicolor_register. This should solve the bug
   where led_classdev remains registered even if casper_wmi_probe
   returns -ENODEV.
 - Removed select NEW_LEDS and LEDS_CLASS, because it creates recursive
   dependencies.
 - And some minor changes.
Changes in v2:
 - Added masks for
 - Changed casper_set and casper_query returns Linux error code rather
   than acpi_status.
 - replaced complicated bit operations with FIELD_GET.
 - Fixed some indentation and spacing.
 - Broke fan speeds further.
 - Moved module metadata to the end of the file.
---
 MAINTAINERS                       |   6 +
 drivers/platform/x86/Kconfig      |  14 +
 drivers/platform/x86/Makefile     |   1 +
 drivers/platform/x86/casper-wmi.c | 640 ++++++++++++++++++++++++++++++
 4 files changed, 661 insertions(+)
 create mode 100644 drivers/platform/x86/casper-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87..7b03fd1239a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5005,6 +5005,12 @@ S:	Maintained
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/carl9170
 F:	drivers/net/wireless/ath/carl9170/
 
+CASPER EXCALIBUR WMI DRIVER
+M:	Mustafa Ekşi <mustafa.eskieksi@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/casper-wmi.c
+
 CAVIUM I2C DRIVER
 M:	Robert Richter <rric@kernel.org>
 S:	Odd Fixes
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 665fa952498..7560d90ce75 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1182,6 +1182,20 @@ config SEL3350_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called sel3350-platform.
 
+config CASPER_WMI
+	tristate "Casper Excalibur Laptop WMI driver"
+	depends on ACPI_WMI
+	depends on HWMON
+	depends on LEDS_CLASS_MULTICOLOR
+	select ACPI_PLATFORM_PROFILE
+	help
+	  Say Y here if you want to support WMI-based fan speed reporting,
+	  power management and keyboard backlight support on Casper Excalibur
+	  Laptops.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called casper-wmi.
+
 endif # X86_PLATFORM_DEVICES
 
 config P2SB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b14294706..639509f9afa 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
+obj-$(CONFIG_CASPER_WMI)		+= casper-wmi.o
 
 # Acer
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
diff --git a/drivers/platform/x86/casper-wmi.c b/drivers/platform/x86/casper-wmi.c
new file mode 100644
index 00000000000..a02fea46f78
--- /dev/null
+++ b/drivers/platform/x86/casper-wmi.c
@@ -0,0 +1,640 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/mutex_types.h>
+#include <linux/platform_profile.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+#define CASPER_WMI_GUID "644C5791-B7B0-4123-A90B-E93876E0DAAD"
+
+#define CASPER_READ 0xfa00
+#define CASPER_WRITE 0xfb00
+#define CASPER_GET_HARDWAREINFO 0x0200
+#define CASPER_SET_LED 0x0100
+#define CASPER_POWERPLAN 0x0300
+
+#define CASPER_KEYBOARD_LED_1 0x03
+#define CASPER_KEYBOARD_LED_2 0x04
+#define CASPER_KEYBOARD_LED_3 0x05
+#define CASPER_ALL_KEYBOARD_LEDS 0x06
+#define CASPER_CORNER_LEDS 0x07
+#define CASPER_LED_COUNT 4
+
+static const char * const zone_names[CASPER_LED_COUNT] = {
+	"casper:rgb:kbd_zoned_backlight-right",
+	"casper:rgb:kbd_zoned_backlight-middle",
+	"casper:rgb:kbd_zoned_backlight-left",
+	"casper:rgb:biaslight",
+};
+
+#define CASPER_LED_ALPHA GENMASK(31, 24)
+#define CASPER_LED_RED	 GENMASK(23, 16)
+#define CASPER_LED_GREEN GENMASK(15, 8)
+#define CASPER_LED_BLUE  GENMASK(7, 0)
+#define CASPER_DEFAULT_COLOR (CASPER_LED_RED | CASPER_LED_GREEN | \
+			      CASPER_LED_BLUE)
+#define CASPER_FAN_CPU 0
+#define CASPER_FAN_GPU 1
+
+enum casper_power_profile_old {
+	CASPER_HIGH_PERFORMANCE = 1,
+	CASPER_GAMING		= 2,
+	CASPER_TEXT_MODE	= 3,
+	CASPER_POWERSAVE	= 4
+};
+
+enum casper_power_profile_new {
+	CASPER_NEW_HIGH_PERFORMANCE	= 0,
+	CASPER_NEW_GAMING		= 1,
+	CASPER_NEW_AUDIO		= 2
+};
+
+struct casper_quirk_entry {
+	bool big_endian_fans;
+	bool no_power_profiles;
+	bool new_power_scheme;
+};
+
+struct casper_fourzone_led {
+	struct led_classdev_mc mc_led;
+	struct mc_subled subleds[3];
+};
+
+struct casper_drv {
+	struct platform_profile_handler handler;
+	struct mutex mutex;
+	struct casper_fourzone_led *leds;
+	struct wmi_device *wdev;
+	struct casper_quirk_entry *quirk_applied;
+};
+
+struct casper_wmi_args {
+	u16 a0, a1;
+	u32 a2, a3, a4, a5, a6, a7, a8;
+};
+
+enum casper_led_mode {
+	LED_NORMAL = 0x10,
+	LED_BLINK = 0x20,
+	LED_FADE = 0x30,
+	LED_HEARTBEAT = 0x40,
+	LED_REPEAT = 0x50,
+	LED_RANDOM = 0x60
+};
+
+static int casper_set(struct casper_drv *drv, u16 a1, u8 led_id, u32 data)
+{
+	struct casper_wmi_args wmi_args;
+	struct acpi_buffer input;
+	acpi_status status;
+
+	wmi_args = (struct casper_wmi_args) {
+		.a0 = CASPER_WRITE,
+		.a1 = a1,
+		.a2 = led_id,
+		.a3 = data
+	};
+
+	input = (struct acpi_buffer) {
+		(acpi_size) sizeof(struct casper_wmi_args),
+		&wmi_args
+	};
+
+	guard(mutex)(&drv->mutex);
+
+	status = wmidev_block_set(drv->wdev, 0, &input);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int casper_query(struct casper_drv *drv, u16 a1,
+			struct casper_wmi_args *out)
+{
+	struct casper_wmi_args wmi_args;
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = 0;
+
+	wmi_args = (struct casper_wmi_args) {
+		.a0 = CASPER_READ,
+		.a1 = a1
+	};
+	input = (struct acpi_buffer) {
+		(acpi_size) sizeof(struct casper_wmi_args),
+		&wmi_args
+	};
+
+	guard(mutex)(&drv->mutex);
+
+	status = wmidev_block_set(drv->wdev, 0, &input);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = wmidev_block_query(drv->wdev, 0);
+	if (!obj)
+		return -EIO;
+
+	if (obj->type != ACPI_TYPE_BUFFER) { // obj will be 0x10 on failure
+		ret = -EINVAL;
+		goto freeobj;
+	}
+	if (obj->buffer.length != sizeof(struct casper_wmi_args)) {
+		ret = -EIO;
+		goto freeobj;
+	}
+
+	memcpy(out, obj->buffer.pointer, sizeof(struct casper_wmi_args));
+
+freeobj:
+	kfree(obj);
+	return ret;
+}
+
+static u32 get_zone_color(struct casper_fourzone_led z)
+{
+	return  FIELD_PREP(CASPER_LED_RED, z.subleds[0].intensity) |
+		FIELD_PREP(CASPER_LED_GREEN, z.subleds[1].intensity) |
+		FIELD_PREP(CASPER_LED_BLUE, z.subleds[2].intensity);
+}
+
+static enum led_brightness get_casper_brightness(struct led_classdev *led_cdev)
+{
+	struct casper_drv *drv = dev_get_drvdata(led_cdev->dev->parent);
+	struct casper_wmi_args hardware_alpha = {0};
+
+	if (strcmp(led_cdev->name, zone_names[3]) == 0)
+		return drv->leds[3].mc_led.led_cdev.brightness;
+
+	casper_query(drv, CASPER_GET_HARDWAREINFO, &hardware_alpha);
+
+	return hardware_alpha.a6;
+}
+
+static void set_casper_brightness(struct led_classdev *led_cdev,
+				  enum led_brightness brightness)
+{
+	u32 bright_with_mode, bright_prep, led_data, led_data_no_alpha;
+	struct casper_drv *drv;
+	u8 zone_to_change;
+	size_t zone;
+
+	drv = dev_get_drvdata(led_cdev->dev->parent);
+
+	for (size_t i = 0; i < CASPER_LED_COUNT; i++)
+		if (strcmp(led_cdev->name, zone_names[i]) == 0)
+			zone = i;
+	if (zone == 3)
+		zone_to_change = CASPER_CORNER_LEDS;
+	else
+		zone_to_change = zone + CASPER_KEYBOARD_LED_1;
+
+	led_data_no_alpha = get_zone_color(drv->leds[zone]) & ~CASPER_LED_ALPHA;
+
+	if (brightness == drv->leds[zone].mc_led.led_cdev.brightness)
+		brightness = get_casper_brightness(&drv->leds[zone].mc_led.led_cdev);
+	bright_with_mode = brightness | LED_NORMAL;
+
+	bright_prep = FIELD_PREP(CASPER_LED_ALPHA, bright_with_mode);
+	led_data = bright_prep | led_data_no_alpha;
+	casper_set(drv, CASPER_SET_LED, zone_to_change, led_data);
+}
+
+static int casper_platform_profile_get(struct platform_profile_handler *pprof,
+				       enum platform_profile_option *profile)
+{
+	struct casper_drv *drv = container_of(pprof, struct casper_drv,
+					      handler);
+	struct casper_wmi_args ret_buff = {0};
+	int ret;
+
+	ret = casper_query(drv, CASPER_POWERPLAN, &ret_buff);
+	if (ret)
+		return ret;
+
+	if (drv->quirk_applied->new_power_scheme) {
+		switch (ret_buff.a2) {
+		case CASPER_NEW_HIGH_PERFORMANCE:
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		case CASPER_NEW_GAMING:
+			*profile = PLATFORM_PROFILE_BALANCED;
+			break;
+		case CASPER_NEW_AUDIO:
+			*profile = PLATFORM_PROFILE_LOW_POWER;
+			break;
+		default:
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	switch (ret_buff.a2) {
+	case CASPER_HIGH_PERFORMANCE:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case CASPER_GAMING:
+		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+		break;
+	case CASPER_TEXT_MODE:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case CASPER_POWERSAVE:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int casper_platform_profile_set(struct platform_profile_handler *pprof,
+				       enum platform_profile_option profile)
+{
+	struct casper_drv *drv = container_of(pprof, struct casper_drv,
+					      handler);
+	enum casper_power_profile_old prf_old;
+	enum casper_power_profile_new prf_new;
+
+	if (drv->quirk_applied->new_power_scheme) {
+
+		switch (profile) {
+		case PLATFORM_PROFILE_PERFORMANCE:
+			prf_new = CASPER_NEW_HIGH_PERFORMANCE;
+			break;
+		case PLATFORM_PROFILE_BALANCED:
+			prf_new = CASPER_NEW_GAMING;
+			break;
+		case PLATFORM_PROFILE_LOW_POWER:
+			prf_new = CASPER_NEW_AUDIO;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return casper_set(drv, CASPER_POWERPLAN, prf_new, 0);
+	}
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		prf_old = CASPER_HIGH_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		prf_old = CASPER_GAMING;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		prf_old = CASPER_TEXT_MODE;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		prf_old = CASPER_POWERSAVE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return casper_set(drv, CASPER_POWERPLAN, prf_old, 0);
+}
+
+static umode_t casper_wmi_hwmon_is_visible(const void *drvdata,
+					   enum hwmon_sensor_types type,
+					   u32 attr, int channel)
+{
+	return 0444;
+}
+
+static int casper_wmi_hwmon_read(struct device *dev,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel, long *val)
+{
+	struct casper_drv *drv = dev_get_drvdata(dev->parent);
+	struct casper_wmi_args out = { 0 };
+	int ret;
+
+	ret = casper_query(drv, CASPER_GET_HARDWAREINFO, &out);
+	if (ret)
+		return ret;
+
+	switch (channel) {
+	case CASPER_FAN_CPU:
+		if (drv->quirk_applied->big_endian_fans)
+			*val = be16_to_cpu(*(__be16 *)&out.a4);
+		else
+			*val = out.a5;
+		break;
+	case CASPER_FAN_GPU:
+		if (drv->quirk_applied->big_endian_fans)
+			*val = be16_to_cpu(*(__be16 *)&out.a5);
+		else
+			*val = out.a5;
+		break;
+	}
+
+	return 0;
+}
+
+static int casper_wmi_hwmon_read_string(struct device *dev,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel, const char **str)
+{
+	if (channel == CASPER_FAN_CPU)
+		*str = "cpu_fan_speed";
+	else if (channel == CASPER_FAN_GPU)
+		*str = "gpu_fan_speed";
+	return 0;
+}
+
+static const struct hwmon_ops casper_wmi_hwmon_ops = {
+	.is_visible = &casper_wmi_hwmon_is_visible,
+	.read = &casper_wmi_hwmon_read,
+	.read_string = &casper_wmi_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *const casper_wmi_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info casper_wmi_hwmon_chip_info = {
+	.ops = &casper_wmi_hwmon_ops,
+	.info = casper_wmi_hwmon_info,
+};
+
+static struct casper_quirk_entry gen_older_than_11 = {
+	.big_endian_fans = true,
+	.new_power_scheme = false
+};
+
+static struct casper_quirk_entry gen_newer_than_11 = {
+	.big_endian_fans = false,
+	.new_power_scheme = true
+};
+
+static const struct x86_cpu_id casper_gen[] = {
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE, &gen_older_than_11),
+	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE, &gen_older_than_11),
+	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE, &gen_newer_than_11),
+	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE, &gen_newer_than_11),
+	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE, &gen_newer_than_11),
+	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE, &gen_newer_than_11),
+	{}
+};
+
+static struct casper_quirk_entry quirk_no_power_profile = {
+	.no_power_profiles = true
+};
+
+static struct casper_quirk_entry quirk_has_power_profile = {
+	.no_power_profiles = false
+};
+
+static const struct dmi_system_id casper_quirks[] = {
+	{
+		.ident = "CASPER EXCALIBUR G650",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G650")
+		},
+		.driver_data = &quirk_no_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G670",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G670")
+		},
+		.driver_data = &quirk_no_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G750",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G750")
+		},
+		.driver_data = &quirk_no_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G770",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G770")
+		},
+		.driver_data = &quirk_has_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G780",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G780")
+		},
+		.driver_data = &quirk_has_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G870",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G870")
+		},
+		.driver_data = &quirk_has_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G900",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G900")
+		},
+		.driver_data = &quirk_has_power_profile
+	},
+	{
+		.ident = "CASPER EXCALIBUR G911",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G911")
+		},
+		.driver_data = &quirk_has_power_profile
+	},
+	{ }
+};
+
+static void casper_pp_remove(void *data)
+{
+	platform_profile_remove();
+}
+
+static int casper_platform_profile_register(struct casper_drv *drv)
+{
+	int ret = 0;
+
+	drv->handler.profile_get = casper_platform_profile_get;
+	drv->handler.profile_set = casper_platform_profile_set;
+
+	set_bit(PLATFORM_PROFILE_LOW_POWER, drv->handler.choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, drv->handler.choices);
+	if (!drv->quirk_applied->new_power_scheme)
+		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+			drv->handler.choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, drv->handler.choices);
+
+	ret = platform_profile_register(&drv->handler);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&drv->wdev->dev, casper_pp_remove,
+				       NULL);
+	if (ret)
+		platform_profile_remove();
+
+	return ret;
+}
+
+static int casper_multicolor_register(struct casper_drv *drv)
+{
+	int ret = 0;
+
+	drv->leds = devm_kcalloc(&drv->wdev->dev,
+		CASPER_LED_COUNT, sizeof(*drv->leds), GFP_KERNEL);
+	if (!drv->leds)
+		return -ENOMEM;
+
+	for (size_t i = 0; i < CASPER_LED_COUNT; i++) {
+		for (size_t j = 0; j < 3; j++) {
+			drv->leds[i].subleds[j] = (struct mc_subled) {
+				.color_index = LED_COLOR_ID_RED + j,
+				.brightness = 255,
+				.intensity = 255
+			};
+		}
+		drv->leds[i].mc_led = (struct led_classdev_mc){
+			.led_cdev = {
+				.name = zone_names[i],
+				.brightness = 0,
+				.max_brightness = 2,
+				.brightness_set = &set_casper_brightness,
+				.brightness_get = &get_casper_brightness,
+				.color = LED_COLOR_ID_MULTI,
+			},
+			.num_colors = 3,
+			.subled_info = drv->leds[i].subleds
+		};
+
+		ret = devm_led_classdev_multicolor_register(&drv->wdev->dev,
+							&drv->leds[i].mc_led);
+		if (ret)
+			return -ENODEV;
+	}
+
+	// Setting leds to the default color
+	ret = casper_set(drv, CASPER_SET_LED, CASPER_ALL_KEYBOARD_LEDS,
+			 CASPER_DEFAULT_COLOR);
+	if (ret)
+		return ret;
+
+	ret = casper_set(drv, CASPER_SET_LED, CASPER_CORNER_LEDS,
+			 CASPER_DEFAULT_COLOR);
+	return ret;
+}
+
+static int casper_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct casper_quirk_entry *pp_quirk;
+	const struct dmi_system_id *dmi_id;
+	const struct x86_cpu_id *gen_id;
+	struct device *hwmon_dev;
+	struct casper_drv *drv;
+	int ret;
+
+	drv = devm_kzalloc(&wdev->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	drv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, drv);
+
+	gen_id = x86_match_cpu(casper_gen);
+	if (!gen_id)
+		return -ENODEV;
+
+	drv->quirk_applied = (struct casper_quirk_entry *)gen_id->driver_data;
+
+	dmi_id = dmi_first_match(casper_quirks);
+	if (!dmi_id)
+		return -ENODEV;
+
+	pp_quirk = (struct casper_quirk_entry *)dmi_id->driver_data;
+	drv->quirk_applied->no_power_profiles = pp_quirk->no_power_profiles;
+
+	mutex_init(&drv->mutex);
+	ret = devm_mutex_init(&wdev->dev, &drv->mutex);
+	if (ret)
+		return ret;
+
+	ret = casper_multicolor_register(drv);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
+						"casper_wmi", wdev,
+						&casper_wmi_hwmon_chip_info,
+						NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	if (!drv->quirk_applied->no_power_profiles) {
+		ret = casper_platform_profile_register(drv);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct wmi_device_id casper_wmi_id_table[] = {
+	{ CASPER_WMI_GUID, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, casper_wmi_id_table);
+
+static struct wmi_driver casper_drv = {
+	.driver = {
+		.name = "casper-wmi",
+	},
+	.id_table = casper_wmi_id_table,
+	.probe = casper_wmi_probe,
+	.no_singleton = true,
+};
+
+module_wmi_driver(casper_drv);
+
+MODULE_AUTHOR("Mustafa Ekşi <mustafa.eskieksi@gmail.com>");
+MODULE_DESCRIPTION("Casper Excalibur Laptop WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.46.0


