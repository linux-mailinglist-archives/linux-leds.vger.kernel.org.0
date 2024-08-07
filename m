Return-Path: <linux-leds+bounces-2416-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20994A88B
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 15:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 634981C22427
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 13:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3D61EA0BC;
	Wed,  7 Aug 2024 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0tcJCDQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465E1E7A46;
	Wed,  7 Aug 2024 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037175; cv=none; b=Jbn2X+maFo63ZNN2YH+46HsLkY/Kbe1xKuoh2U2E9xwmim/m6ZVR/0XMshVCmKz8Dg33hFAa/sD3iDJZiY+ocGU2DE6MUpbLqYIm1BcM1LpW/qjI8YDD3oq5g1RU+FDlpFg8D+/+YzSx7EysPpX8p0ljXhUXYSicpOTWSGLtO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037175; c=relaxed/simple;
	bh=gL7n9uXmHZyJ+yDT1OZz1PX2f5RVP26iLVFEIiVKF9s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HU6BfJWdTd54rZrEukYLP2q0Qgsf1n6BZb22+Hc4+On67diC0au7euJFEr0/Tu82hpetec5vtACKF6DJdDUPMzcdM5eiTdyBk74QRdafROsw+I05awrqMtpjRYQ8bkiUtoqtVI9KhfoaN8KqZjwG3nr8xmI8n0dE/cJtcQv9xKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0tcJCDQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723037173; x=1754573173;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=gL7n9uXmHZyJ+yDT1OZz1PX2f5RVP26iLVFEIiVKF9s=;
  b=W0tcJCDQR+uxmF7KthQ5YMTC5mD55c+Y9sOhx4rjCjWnrZYYlu2bCiTr
   tCp+70VlFmr2m3GP8sYaUApZDOVq0j0rOiTdm6xCtInClRN0lEY/xx+10
   bJTRWnEVM0h+Tgm4Hw+4eO4M0Y4sfwjKvUFDu70pYn5qMupm7eVz78Qrg
   26p3Ereja/UNi5RvzRu4w60MQEwKPeScHFuLdMalvUi2c+k944yJ9uyu/
   5ucx1DCTmuozpjoASp3vbKqwjjFOQcnFSAJFJ/sCIPpjxZb4yMCkcBpeQ
   H8O/so6b/rgyzs1BcSJb2dT6FaBrKOfk9zEeo7RMPy61jeRwr8/k93N8k
   A==;
X-CSE-ConnectionGUID: BWwpBMxtS+CZWR60s3/h4w==
X-CSE-MsgGUID: thqDf5JyTMq0YJPOUpr4yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24982025"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="24982025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 06:26:11 -0700
X-CSE-ConnectionGUID: Ats+F/MaRROsyn13m/d8zA==
X-CSE-MsgGUID: Y4b17o/SRJKYdqVDaxcCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61248404"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 06:26:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 16:26:02 +0300 (EEST)
To: =?ISO-8859-2?Q?Mustafa_Ek=BAi?= <mustafa.eskieksi@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com, linux@roeck-us.net, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, pavel@ucw.cz, lee@kernel.org, 
    linux-leds@vger.kernel.org, rishitbansal0@gmail.com, bahaku@elrant.team, 
    carlosmiguelferreira.2003@gmail.com, alviro.iskandar@gnuweeb.org, 
    ammarfaizi2@gnuweeb.org, bedirhan_kurt22@erdogan.edu.tr
Subject: Re: [PATCH v7 1/1] platform/x86: Add wmi driver for Casper Excalibur
 laptops
In-Reply-To: <20240806205001.191551-2-mustafa.eskieksi@gmail.com>
Message-ID: <477eb97e-7f27-7927-de02-9a702f1e96c0@linux.intel.com>
References: <20240806205001.191551-1-mustafa.eskieksi@gmail.com> <20240806205001.191551-2-mustafa.eskieksi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-27863865-1723035405=:1138"
Content-ID: <8a43107c-8277-1d2d-be9b-e63c1a0eb541@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-27863865-1723035405=:1138
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ecb7dc5d-e7fa-f3a7-3ad3-e019a7a8be31@linux.intel.com>

On Tue, 6 Aug 2024, Mustafa Ek=BAi wrote:

> This wmi driver supports changing Casper Excalibur laptops' keyboard
> backlight brightness and color, reading fan speeds and changing power
> profiles. Multicolor led device is used for backlight, platform_profile
> for power management and hwmon for fan speeds. It supports both old (10th
> gen or older) and new (11th gen or newer) laptops. It uses x86_match_cpu
> to check if the laptop is old or new.
>=20
> Signed-off-by: Mustafa Ek=BAi <mustafa.eskieksi@gmail.com>
> ---
> Changes in v7:
>  - Sorted includes
>  - Changed corner led's name to biaslight.
>  - Better mutex usage.
>  - Get current brightness value when setting a new color.
> Changes in v6:
>  - Added "rgb" to zone names and changed kbd_zoned_backlight-corners to
>    backlight.
>  - Changed led structure to have 3 seperate subleds instead of one rgb
>    subled.
>  - Removed led_cache.
>  - Removing platform_profile and destroying casper_mutex is managed by
>    devm_add_action_or_reset now.
>  - Removed casper_wmi_remove.
>  - Reordered some variables.
> Changes in v5:
>  - Added mutex_destroy to casper_wmi_probe error handling
>  - casper_multicolor_register now sets all leds to CASPER_DEFAULT_COLOR
>  - Some minor changes
> Changes in v4:
>  - Renamed casper_driver to casper_drv
>  - Moved all global variables to casper_drv struct. Devices access
>   casper_drv via wdev's driver_data.
>  - Removed struct led_cache, because only its u32 array was used. It is
>    replaced with color_cache.
>  - Added mutex_locks in casper_set and casper_query, so they now accept
>    casper_drv instead of wmi_device as argument.
>  - Changed endianess conversion in hwmon_read to something sparse doesn't
>    complain about.
>  - Moved registrations of multicolor leds and platform profile to their
>    own functions. This makes casper_wmi_probe more readable.
>  - Added .no_singleton to wmi_device.
>  - Some minor changes.
> Changes in v3:
>  - Replaced led_control attribute with multicolor led interface.
>  - Added struct led_cache, instead of storing only last color change.
>  - Added dmi list to prevent registering platform_profile driver in model=
s
>    that doesn't have this feature.
>  - Added a x86_cpu_id to differentiate older laptops that are reporting
>    fan speeds in big-endian. Also newer laptops have a different power
>    profile scheme. I'm using x86_cpu_id because they don't have a
>    difference in model names, only in cpu generations (the official drive=
r
>    download page makes you select your cpu's generation too).
>  - Removed hwmon_pwm device in favor of platform_profile driver. It
>    indirectly affects fans' speed but they also affect frequency and
>    power consumption as well.
>  - Replaced handwritten masks with GENMASK equivalents.
>  - Replaced led_classdev_register with
>    devm_led_classdev_multicolor_register. This should solve the bug
>    where led_classdev remains registered even if casper_wmi_probe
>    returns -ENODEV.
>  - Removed select NEW_LEDS and LEDS_CLASS, because it creates recursive
>    dependencies.
>  - And some minor changes.
> Changes in v2:
>  - Added masks for
>  - Changed casper_set and casper_query returns Linux error code rather
>    than acpi_status.
>  - replaced complicated bit operations with FIELD_GET.
>  - Fixed some indentation and spacing.
>  - Broke fan speeds further.
>  - Moved module metadata to the end of the file.
> ---
>  MAINTAINERS                       |   6 +
>  drivers/platform/x86/Kconfig      |  14 +
>  drivers/platform/x86/Makefile     |   1 +
>  drivers/platform/x86/casper-wmi.c | 640 ++++++++++++++++++++++++++++++
>  4 files changed, 661 insertions(+)
>  create mode 100644 drivers/platform/x86/casper-wmi.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8766f3e5e87..7b03fd1239a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5005,6 +5005,12 @@ S:=09Maintained
>  W:=09https://wireless.wiki.kernel.org/en/users/Drivers/carl9170
>  F:=09drivers/net/wireless/ath/carl9170/
> =20
> +CASPER EXCALIBUR WMI DRIVER
> +M:=09Mustafa Ek=BAi <mustafa.eskieksi@gmail.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09drivers/platform/x86/casper-wmi.c
> +
>  CAVIUM I2C DRIVER
>  M:=09Robert Richter <rric@kernel.org>
>  S:=09Odd Fixes
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 665fa952498..7560d90ce75 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1182,6 +1182,20 @@ config SEL3350_PLATFORM
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called sel3350-platform.
> =20
> +config CASPER_WMI
> +=09tristate "Casper Excalibur Laptop WMI driver"
> +=09depends on ACPI_WMI
> +=09depends on HWMON
> +=09depends on LEDS_CLASS_MULTICOLOR
> +=09select ACPI_PLATFORM_PROFILE
> +=09help
> +=09  Say Y here if you want to support WMI-based fan speed reporting,
> +=09  power management and keyboard backlight support on Casper Excalibur
> +=09  Laptops.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called casper-wmi.
> +
>  endif # X86_PLATFORM_DEVICES
> =20
>  config P2SB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b14294706..639509f9afa 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_MXM_WMI)=09=09=09+=3D mxm-wmi.o
>  obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)=09+=3D nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_XIAOMI_WMI)=09=09+=3D xiaomi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)=09=09+=3D gigabyte-wmi.o
> +obj-$(CONFIG_CASPER_WMI)=09=09+=3D casper-wmi.o
> =20
>  # Acer
>  obj-$(CONFIG_ACERHDF)=09=09+=3D acerhdf.o
> diff --git a/drivers/platform/x86/casper-wmi.c b/drivers/platform/x86/cas=
per-wmi.c
> new file mode 100644
> index 00000000000..a02fea46f78
> --- /dev/null
> +++ b/drivers/platform/x86/casper-wmi.c
> @@ -0,0 +1,640 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/mutex_types.h>
> +#include <linux/platform_profile.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +#define CASPER_WMI_GUID "644C5791-B7B0-4123-A90B-E93876E0DAAD"
> +
> +#define CASPER_READ 0xfa00
> +#define CASPER_WRITE 0xfb00
> +#define CASPER_GET_HARDWAREINFO 0x0200
> +#define CASPER_SET_LED 0x0100
> +#define CASPER_POWERPLAN 0x0300
> +
> +#define CASPER_KEYBOARD_LED_1 0x03
> +#define CASPER_KEYBOARD_LED_2 0x04
> +#define CASPER_KEYBOARD_LED_3 0x05
> +#define CASPER_ALL_KEYBOARD_LEDS 0x06
> +#define CASPER_CORNER_LEDS 0x07

Please align these values and the block above it using tabs.

> +#define CASPER_LED_COUNT 4
> +
> +static const char * const zone_names[CASPER_LED_COUNT] =3D {
> +=09"casper:rgb:kbd_zoned_backlight-right",
> +=09"casper:rgb:kbd_zoned_backlight-middle",
> +=09"casper:rgb:kbd_zoned_backlight-left",
> +=09"casper:rgb:biaslight",
> +};
> +
> +#define CASPER_LED_ALPHA GENMASK(31, 24)
> +#define CASPER_LED_RED=09 GENMASK(23, 16)
> +#define CASPER_LED_GREEN GENMASK(15, 8)
> +#define CASPER_LED_BLUE  GENMASK(7, 0)

Something wrong with the alignment with these 4, use tabs only please.

> +#define CASPER_DEFAULT_COLOR (CASPER_LED_RED | CASPER_LED_GREEN | \
> +=09=09=09      CASPER_LED_BLUE)
> +#define CASPER_FAN_CPU 0
> +#define CASPER_FAN_GPU 1
> +
> +enum casper_power_profile_old {
> +=09CASPER_HIGH_PERFORMANCE =3D 1,
> +=09CASPER_GAMING=09=09=3D 2,
> +=09CASPER_TEXT_MODE=09=3D 3,
> +=09CASPER_POWERSAVE=09=3D 4

Add command to any non-terminating entries.

> +};
> +
> +enum casper_power_profile_new {
> +=09CASPER_NEW_HIGH_PERFORMANCE=09=3D 0,
> +=09CASPER_NEW_GAMING=09=09=3D 1,
> +=09CASPER_NEW_AUDIO=09=09=3D 2

Comma.

> +};
> +
> +struct casper_quirk_entry {
> +=09bool big_endian_fans;
> +=09bool no_power_profiles;
> +=09bool new_power_scheme;
> +};
> +
> +struct casper_fourzone_led {
> +=09struct led_classdev_mc mc_led;
> +=09struct mc_subled subleds[3];
> +};
> +
> +struct casper_drv {
> +=09struct platform_profile_handler handler;
> +=09struct mutex mutex;
> +=09struct casper_fourzone_led *leds;
> +=09struct wmi_device *wdev;
> +=09struct casper_quirk_entry *quirk_applied;
> +};
> +
> +struct casper_wmi_args {
> +=09u16 a0, a1;
> +=09u32 a2, a3, a4, a5, a6, a7, a8;
> +};
> +
> +enum casper_led_mode {
> +=09LED_NORMAL =3D 0x10,
> +=09LED_BLINK =3D 0x20,
> +=09LED_FADE =3D 0x30,
> +=09LED_HEARTBEAT =3D 0x40,
> +=09LED_REPEAT =3D 0x50,
> +=09LED_RANDOM =3D 0x60

Align.

> +};
> +
> +static int casper_set(struct casper_drv *drv, u16 a1, u8 led_id, u32 dat=
a)
> +{
> +=09struct casper_wmi_args wmi_args;
> +=09struct acpi_buffer input;
> +=09acpi_status status;
> +
> +=09wmi_args =3D (struct casper_wmi_args) {
> +=09=09.a0 =3D CASPER_WRITE,
> +=09=09.a1 =3D a1,
> +=09=09.a2 =3D led_id,
> +=09=09.a3 =3D data
> +=09};
> +
> +=09input =3D (struct acpi_buffer) {
> +=09=09(acpi_size) sizeof(struct casper_wmi_args),
> +=09=09&wmi_args
> +=09};
> +
> +=09guard(mutex)(&drv->mutex);
> +
> +=09status =3D wmidev_block_set(drv->wdev, 0, &input);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09return 0;
> +}
> +
> +static int casper_query(struct casper_drv *drv, u16 a1,
> +=09=09=09struct casper_wmi_args *out)
> +{
> +=09struct casper_wmi_args wmi_args;
> +=09struct acpi_buffer input;
> +=09union acpi_object *obj;
> +=09acpi_status status;
> +=09int ret =3D 0;
> +
> +=09wmi_args =3D (struct casper_wmi_args) {
> +=09=09.a0 =3D CASPER_READ,
> +=09=09.a1 =3D a1
> +=09};
> +=09input =3D (struct acpi_buffer) {
> +=09=09(acpi_size) sizeof(struct casper_wmi_args),
> +=09=09&wmi_args
> +=09};
> +
> +=09guard(mutex)(&drv->mutex);
> +
> +=09status =3D wmidev_block_set(drv->wdev, 0, &input);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09obj =3D wmidev_block_query(drv->wdev, 0);
> +=09if (!obj)
> +=09=09return -EIO;
> +
> +=09if (obj->type !=3D ACPI_TYPE_BUFFER) { // obj will be 0x10 on failure

obj will be -> type is ?

I'd put the comment on the line preceeding the if statement.

> +=09=09ret =3D -EINVAL;
> +=09=09goto freeobj;
> +=09}
> +=09if (obj->buffer.length !=3D sizeof(struct casper_wmi_args)) {
> +=09=09ret =3D -EIO;
> +=09=09goto freeobj;
> +=09}
> +
> +=09memcpy(out, obj->buffer.pointer, sizeof(struct casper_wmi_args));
> +
> +freeobj:
> +=09kfree(obj);
> +=09return ret;
> +}
> +
> +static u32 get_zone_color(struct casper_fourzone_led z)
> +{
> +=09return  FIELD_PREP(CASPER_LED_RED, z.subleds[0].intensity) |
> +=09=09FIELD_PREP(CASPER_LED_GREEN, z.subleds[1].intensity) |
> +=09=09FIELD_PREP(CASPER_LED_BLUE, z.subleds[2].intensity);
> +}
> +
> +static enum led_brightness get_casper_brightness(struct led_classdev *le=
d_cdev)
> +{
> +=09struct casper_drv *drv =3D dev_get_drvdata(led_cdev->dev->parent);
> +=09struct casper_wmi_args hardware_alpha =3D {0};
> +
> +=09if (strcmp(led_cdev->name, zone_names[3]) =3D=3D 0)
> +=09=09return drv->leds[3].mc_led.led_cdev.brightness;

Please name these 3 literals with a define so one doesn't need to look up=
=20
the zone_names to understand this code.

> +
> +=09casper_query(drv, CASPER_GET_HARDWAREINFO, &hardware_alpha);
> +
> +=09return hardware_alpha.a6;
> +}
> +
> +static void set_casper_brightness(struct led_classdev *led_cdev,
> +=09=09=09=09  enum led_brightness brightness)
> +{
> +=09u32 bright_with_mode, bright_prep, led_data, led_data_no_alpha;
> +=09struct casper_drv *drv;
> +=09u8 zone_to_change;
> +=09size_t zone;
> +
> +=09drv =3D dev_get_drvdata(led_cdev->dev->parent);
> +
> +=09for (size_t i =3D 0; i < CASPER_LED_COUNT; i++)
> +=09=09if (strcmp(led_cdev->name, zone_names[i]) =3D=3D 0)
> +=09=09=09zone =3D i;
> +=09if (zone =3D=3D 3)

Use the define you created for the 3 literal above.

> +=09=09zone_to_change =3D CASPER_CORNER_LEDS;
> +=09else
> +=09=09zone_to_change =3D zone + CASPER_KEYBOARD_LED_1;
> +
> +=09led_data_no_alpha =3D get_zone_color(drv->leds[zone]) & ~CASPER_LED_A=
LPHA;

Assign directly to led_data variable.

> +
> +=09if (brightness =3D=3D drv->leds[zone].mc_led.led_cdev.brightness)
> +=09=09brightness =3D get_casper_brightness(&drv->leds[zone].mc_led.led_c=
dev);
> +=09bright_with_mode =3D brightness | LED_NORMAL;
> +
> +=09bright_prep =3D FIELD_PREP(CASPER_LED_ALPHA, bright_with_mode);
> +=09led_data =3D bright_prep | led_data_no_alpha;

=09led_data |=3D FIELD_PREP(CASPER_LED_ALPHA, brightness | LED_NORMAL);

and drop bright_prep and bright_with_mode variables.

> +=09casper_set(drv, CASPER_SET_LED, zone_to_change, led_data);

I think the mutex is too fine-grained. I believe you'd want to protect the=
=20
part covering get_casper_brightness() and casper_set() with a single=20
critical section, and perhaps also get_zone_color(), but I have to admit I=
=20
didn't fully understand what's going on in this function.

> +}
> +
> +static int casper_platform_profile_get(struct platform_profile_handler *=
pprof,
> +=09=09=09=09       enum platform_profile_option *profile)
> +{
> +=09struct casper_drv *drv =3D container_of(pprof, struct casper_drv,
> +=09=09=09=09=09      handler);

These can be put to one line without loss of significant information.

> +=09struct casper_wmi_args ret_buff =3D {0};
> +=09int ret;
> +
> +=09ret =3D casper_query(drv, CASPER_POWERPLAN, &ret_buff);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (drv->quirk_applied->new_power_scheme) {
> +=09=09switch (ret_buff.a2) {
> +=09=09case CASPER_NEW_HIGH_PERFORMANCE:
> +=09=09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +=09=09=09break;
> +=09=09case CASPER_NEW_GAMING:
> +=09=09=09*profile =3D PLATFORM_PROFILE_BALANCED;
> +=09=09=09break;
> +=09=09case CASPER_NEW_AUDIO:
> +=09=09=09*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09return 0;
> +=09}
> +
> +=09switch (ret_buff.a2) {
> +=09case CASPER_HIGH_PERFORMANCE:
> +=09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +=09=09break;
> +=09case CASPER_GAMING:
> +=09=09*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +=09=09break;
> +=09case CASPER_TEXT_MODE:
> +=09=09*profile =3D PLATFORM_PROFILE_BALANCED;
> +=09=09break;
> +=09case CASPER_POWERSAVE:
> +=09=09*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int casper_platform_profile_set(struct platform_profile_handler *=
pprof,
> +=09=09=09=09       enum platform_profile_option profile)
> +{
> +=09struct casper_drv *drv =3D container_of(pprof, struct casper_drv,
> +=09=09=09=09=09      handler);
> +=09enum casper_power_profile_old prf_old;
> +=09enum casper_power_profile_new prf_new;
> +
> +=09if (drv->quirk_applied->new_power_scheme) {
> +
> +=09=09switch (profile) {
> +=09=09case PLATFORM_PROFILE_PERFORMANCE:
> +=09=09=09prf_new =3D CASPER_NEW_HIGH_PERFORMANCE;
> +=09=09=09break;
> +=09=09case PLATFORM_PROFILE_BALANCED:
> +=09=09=09prf_new =3D CASPER_NEW_GAMING;
> +=09=09=09break;
> +=09=09case PLATFORM_PROFILE_LOW_POWER:
> +=09=09=09prf_new =3D CASPER_NEW_AUDIO;
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09return casper_set(drv, CASPER_POWERPLAN, prf_new, 0);
> +=09}
> +
> +=09switch (profile) {
> +=09case PLATFORM_PROFILE_PERFORMANCE:
> +=09=09prf_old =3D CASPER_HIGH_PERFORMANCE;
> +=09=09break;
> +=09case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +=09=09prf_old =3D CASPER_GAMING;
> +=09=09break;
> +=09case PLATFORM_PROFILE_BALANCED:
> +=09=09prf_old =3D CASPER_TEXT_MODE;
> +=09=09break;
> +=09case PLATFORM_PROFILE_LOW_POWER:
> +=09=09prf_old =3D CASPER_POWERSAVE;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return casper_set(drv, CASPER_POWERPLAN, prf_old, 0);
> +}
> +
> +static umode_t casper_wmi_hwmon_is_visible(const void *drvdata,
> +=09=09=09=09=09   enum hwmon_sensor_types type,
> +=09=09=09=09=09   u32 attr, int channel)
> +{
> +=09return 0444;
> +}
> +
> +static int casper_wmi_hwmon_read(struct device *dev,
> +=09=09=09=09 enum hwmon_sensor_types type, u32 attr,
> +=09=09=09=09 int channel, long *val)
> +{
> +=09struct casper_drv *drv =3D dev_get_drvdata(dev->parent);
> +=09struct casper_wmi_args out =3D { 0 };
> +=09int ret;
> +
> +=09ret =3D casper_query(drv, CASPER_GET_HARDWAREINFO, &out);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09switch (channel) {
> +=09case CASPER_FAN_CPU:
> +=09=09if (drv->quirk_applied->big_endian_fans)
> +=09=09=09*val =3D be16_to_cpu(*(__be16 *)&out.a4);
> +=09=09else
> +=09=09=09*val =3D out.a5;
> +=09=09break;
> +=09case CASPER_FAN_GPU:
> +=09=09if (drv->quirk_applied->big_endian_fans)
> +=09=09=09*val =3D be16_to_cpu(*(__be16 *)&out.a5);
> +=09=09else
> +=09=09=09*val =3D out.a5;
> +=09=09break;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int casper_wmi_hwmon_read_string(struct device *dev,
> +=09=09=09=09=09enum hwmon_sensor_types type, u32 attr,
> +=09=09=09=09=09int channel, const char **str)
> +{
> +=09if (channel =3D=3D CASPER_FAN_CPU)
> +=09=09*str =3D "cpu_fan_speed";
> +=09else if (channel =3D=3D CASPER_FAN_GPU)
> +=09=09*str =3D "gpu_fan_speed";
> +=09return 0;
> +}
> +
> +static const struct hwmon_ops casper_wmi_hwmon_ops =3D {
> +=09.is_visible =3D &casper_wmi_hwmon_is_visible,
> +=09.read =3D &casper_wmi_hwmon_read,
> +=09.read_string =3D &casper_wmi_hwmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info *const casper_wmi_hwmon_info[] =
=3D {
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_LABEL),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info casper_wmi_hwmon_chip_info =3D {
> +=09.ops =3D &casper_wmi_hwmon_ops,
> +=09.info =3D casper_wmi_hwmon_info,
> +};
> +
> +static struct casper_quirk_entry gen_older_than_11 =3D {
> +=09.big_endian_fans =3D true,
> +=09.new_power_scheme =3D false

Please use comma on any member that isn't a terminator.

> +};
> +
> +static struct casper_quirk_entry gen_newer_than_11 =3D {
> +=09.big_endian_fans =3D false,
> +=09.new_power_scheme =3D true

Ditto.

> +};
> +
> +static const struct x86_cpu_id casper_gen[] =3D {
> +=09X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE, &gen_older_than_11),
> +=09X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE, &gen_older_than_11),
> +=09X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE, &gen_newer_than_11),
> +=09X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE, &gen_newer_than_11),
> +=09X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE, &gen_newer_than_11),
> +=09X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE, &gen_newer_than_11),
> +=09{}
> +};
> +
> +static struct casper_quirk_entry quirk_no_power_profile =3D {
> +=09.no_power_profiles =3D true

Comma.

> +};
> +
> +static struct casper_quirk_entry quirk_has_power_profile =3D {
> +=09.no_power_profiles =3D false

Ditto.

> +};
> +
> +static const struct dmi_system_id casper_quirks[] =3D {
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G650",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G650")
> +=09=09},
> +=09=09.driver_data =3D &quirk_no_power_profile

Comma, more of them below.

> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G670",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G670")
> +=09=09},
> +=09=09.driver_data =3D &quirk_no_power_profile
> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G750",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G750")
> +=09=09},
> +=09=09.driver_data =3D &quirk_no_power_profile
> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G770",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G770")
> +=09=09},
> +=09=09.driver_data =3D &quirk_has_power_profile
> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G780",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G780")
> +=09=09},
> +=09=09.driver_data =3D &quirk_has_power_profile
> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G870",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G870")
> +=09=09},
> +=09=09.driver_data =3D &quirk_has_power_profile
> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G900",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G900")
> +=09=09},
> +=09=09.driver_data =3D &quirk_has_power_profile
> +=09},
> +=09{
> +=09=09.ident =3D "CASPER EXCALIBUR G911",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
> +=09=09=09=09  "CASPER BILGISAYAR SISTEMLERI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G911")
> +=09=09},
> +=09=09.driver_data =3D &quirk_has_power_profile
> +=09},
> +=09{ }
> +};
> +
> +static void casper_pp_remove(void *data)
> +{
> +=09platform_profile_remove();
> +}
> +
> +static int casper_platform_profile_register(struct casper_drv *drv)
> +{
> +=09int ret =3D 0;
> +
> +=09drv->handler.profile_get =3D casper_platform_profile_get;
> +=09drv->handler.profile_set =3D casper_platform_profile_set;
> +
> +=09set_bit(PLATFORM_PROFILE_LOW_POWER, drv->handler.choices);
> +=09set_bit(PLATFORM_PROFILE_BALANCED, drv->handler.choices);
> +=09if (!drv->quirk_applied->new_power_scheme)
> +=09=09set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +=09=09=09drv->handler.choices);
> +=09set_bit(PLATFORM_PROFILE_PERFORMANCE, drv->handler.choices);
> +
> +=09ret =3D platform_profile_register(&drv->handler);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D devm_add_action_or_reset(&drv->wdev->dev, casper_pp_remove,
> +=09=09=09=09       NULL);

Fits to one line.

> +=09if (ret)
> +=09=09platform_profile_remove();
> +
> +=09return ret;
> +}
> +
> +static int casper_multicolor_register(struct casper_drv *drv)
> +{
> +=09int ret =3D 0;
> +
> +=09drv->leds =3D devm_kcalloc(&drv->wdev->dev,
> +=09=09CASPER_LED_COUNT, sizeof(*drv->leds), GFP_KERNEL);
> +=09if (!drv->leds)
> +=09=09return -ENOMEM;
> +
> +=09for (size_t i =3D 0; i < CASPER_LED_COUNT; i++) {

Add a temporary variable for drv->leds[i].

> +=09=09for (size_t j =3D 0; j < 3; j++) {

Use ARRAY_SIZE() instead of 3.

> +=09=09=09drv->leds[i].subleds[j] =3D (struct mc_subled) {
> +=09=09=09=09.color_index =3D LED_COLOR_ID_RED + j,
> +=09=09=09=09.brightness =3D 255,
> +=09=09=09=09.intensity =3D 255

Add comma.

> +=09=09=09};
> +=09=09}
> +=09=09drv->leds[i].mc_led =3D (struct led_classdev_mc){

Inconsistent spacing in ){.

> +=09=09=09.led_cdev =3D {
> +=09=09=09=09.name =3D zone_names[i],
> +=09=09=09=09.brightness =3D 0,
> +=09=09=09=09.max_brightness =3D 2,
> +=09=09=09=09.brightness_set =3D &set_casper_brightness,
> +=09=09=09=09.brightness_get =3D &get_casper_brightness,
> +=09=09=09=09.color =3D LED_COLOR_ID_MULTI,
> +=09=09=09},
> +=09=09=09.num_colors =3D 3,
> +=09=09=09.subled_info =3D drv->leds[i].subleds

comma.

> +=09=09};
> +
> +=09=09ret =3D devm_led_classdev_multicolor_register(&drv->wdev->dev,
> +=09=09=09=09=09=09=09&drv->leds[i].mc_led);
> +=09=09if (ret)
> +=09=09=09return -ENODEV;
> +=09}
> +
> +=09// Setting leds to the default color

LEDs


While there were quite many comments, they're quite minor except for the=20
mutex coverage thing so this feels to be in relatively good shape already.

--=20
 i.

> +=09ret =3D casper_set(drv, CASPER_SET_LED, CASPER_ALL_KEYBOARD_LEDS,
> +=09=09=09 CASPER_DEFAULT_COLOR);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D casper_set(drv, CASPER_SET_LED, CASPER_CORNER_LEDS,
> +=09=09=09 CASPER_DEFAULT_COLOR);
> +=09return ret;
> +}
> +
> +static int casper_wmi_probe(struct wmi_device *wdev, const void *context=
)
> +{
> +=09struct casper_quirk_entry *pp_quirk;
> +=09const struct dmi_system_id *dmi_id;
> +=09const struct x86_cpu_id *gen_id;
> +=09struct device *hwmon_dev;
> +=09struct casper_drv *drv;
> +=09int ret;
> +
> +=09drv =3D devm_kzalloc(&wdev->dev, sizeof(*drv), GFP_KERNEL);
> +=09if (!drv)
> +=09=09return -ENOMEM;
> +
> +=09drv->wdev =3D wdev;
> +=09dev_set_drvdata(&wdev->dev, drv);
> +
> +=09gen_id =3D x86_match_cpu(casper_gen);
> +=09if (!gen_id)
> +=09=09return -ENODEV;
> +
> +=09drv->quirk_applied =3D (struct casper_quirk_entry *)gen_id->driver_da=
ta;
> +
> +=09dmi_id =3D dmi_first_match(casper_quirks);
> +=09if (!dmi_id)
> +=09=09return -ENODEV;
> +
> +=09pp_quirk =3D (struct casper_quirk_entry *)dmi_id->driver_data;
> +=09drv->quirk_applied->no_power_profiles =3D pp_quirk->no_power_profiles=
;
> +
> +=09mutex_init(&drv->mutex);
> +=09ret =3D devm_mutex_init(&wdev->dev, &drv->mutex);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D casper_multicolor_register(drv);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09hwmon_dev =3D devm_hwmon_device_register_with_info(&wdev->dev,
> +=09=09=09=09=09=09"casper_wmi", wdev,
> +=09=09=09=09=09=09&casper_wmi_hwmon_chip_info,
> +=09=09=09=09=09=09NULL);
> +=09if (IS_ERR(hwmon_dev))
> +=09=09return PTR_ERR(hwmon_dev);
> +
> +=09if (!drv->quirk_applied->no_power_profiles) {
> +=09=09ret =3D casper_platform_profile_register(drv);
> +=09=09if (ret)
> +=09=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static const struct wmi_device_id casper_wmi_id_table[] =3D {
> +=09{ CASPER_WMI_GUID, NULL },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, casper_wmi_id_table);
> +
> +static struct wmi_driver casper_drv =3D {
> +=09.driver =3D {
> +=09=09.name =3D "casper-wmi",
> +=09},
> +=09.id_table =3D casper_wmi_id_table,
> +=09.probe =3D casper_wmi_probe,
> +=09.no_singleton =3D true,
> +};
> +
> +module_wmi_driver(casper_drv);
> +
> +MODULE_AUTHOR("Mustafa Ek=BAi <mustafa.eskieksi@gmail.com>");
> +MODULE_DESCRIPTION("Casper Excalibur Laptop WMI driver");
> +MODULE_LICENSE("GPL");
>=20
--8323328-27863865-1723035405=:1138--

