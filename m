Return-Path: <linux-leds+bounces-2926-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00698D07B
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2024 11:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 876941C215D4
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2024 09:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017391E411C;
	Wed,  2 Oct 2024 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2fPzfoF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521B1E203F;
	Wed,  2 Oct 2024 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862762; cv=none; b=kqB/+Nd2HmZTLiWHxPNxdgGffUl3gUxSRTHrvE+qhuzYznuu6g66yBYeGzKBtm3G9i4VU7NqaEJpCRaXMz498l5xFs7jX8O41EW+x4UldV7pe48Q6GtLHICoOjQscxXMF24Al60zoov27oAcy6fW5XYJLPGFrsqDtLRGbWk02Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862762; c=relaxed/simple;
	bh=jtDZohUrq/gXLkTaLeJ6EA266FyNgyldwtKfGLrfr/k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ngN0TN8oGD/Z8JPA0Y1X6PdZDNePsdLmu1gWwFaxyH6w2BxAoERBNZ7pt3wMZUHI4A/LGb05+qLaJXTUWk4+ZGJtI+Pdes7dA5+GG4b84FikzTV6Ezv8KV2AY74wPnDMWcUCWfAZZH5hkgWo6YaCCLQ3sbwib+hsv4QuYh+UALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2fPzfoF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727862759; x=1759398759;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jtDZohUrq/gXLkTaLeJ6EA266FyNgyldwtKfGLrfr/k=;
  b=W2fPzfoFLXnZW1Xa9x1C5qmegV9tHcIhttCGPwWfoN16hlBzxhSHnbC9
   9TzqWP+MlcuQIs7fOw0NJVo+o9ffyerLdxcMwYH8aQdgQkBWnN41Y8Wmr
   oMJ6B3z3UwnWf+PD43Y6jkpR4wg1fynlpe7IlH8t5jvFvv6QJ7TEzjV8m
   nMIj/b7HJSurTUN8f/e27yDLub+m+Qw1A7BPnT80c1NYGAh7akjp3LNa+
   S8EzFfmMsSQVz6cjpAHko3GVq1Y7VerzJ3gfa4L9YGppWVqGjD91BFczx
   OIu/AvzlNmEi3EyaDJ11bamPuXDeAKrJdDaBfy+3TSq5Uvr1LP2D+8/lT
   A==;
X-CSE-ConnectionGUID: z+lfgNOAQGm4Xm/MDkImYQ==
X-CSE-MsgGUID: l4UNvojETnGuqWJbsnV39g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44482756"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="44482756"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:52:38 -0700
X-CSE-ConnectionGUID: wEBvieFoQ7GBLW6bKd3MLg==
X-CSE-MsgGUID: nSVsdI0dT7axkdtX7u9fZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="73834213"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:52:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Oct 2024 12:52:30 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, 
    lee@kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, 
    miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
    pavel@ucw.cz, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
In-Reply-To: <20241001180658.76396-2-wse@tuxedocomputers.com>
Message-ID: <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
References: <20241001180658.76396-1-wse@tuxedocomputers.com> <20241001180658.76396-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Oct 2024, Werner Sembach wrote:

> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
> controllable RGB keyboard backlight. The firmware API for it is implemented
> via WMI.
> 
> To make the backlight userspace configurable this driver emulates a
> LampArray HID device and translates the input from hidraw to the
> corresponding WMI calls. This is a new approach as the leds subsystem lacks
> a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
> needs to be established.
> 
> v2: Integrated Armins feedback and fixed kernel test robot warnings.
> v3: Fixed borked subject line of v2.
> v4: Remove unrequired WMI mutex.
>     Move device checking from probe to init.
>     Fix device checking working exactly reverse as it should.
>     Fix null pointer dereference because, hdev->driver_data != hdev->dev.driver_data.
> 
> Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Link: https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/tuxedo/Kbuild            |   9 +
>  drivers/platform/x86/tuxedo/Kconfig           |  14 +
>  .../x86/tuxedo/tuxedo_nb04_wmi_ab_init.c      |  99 +++
>  .../x86/tuxedo/tuxedo_nb04_wmi_ab_init.h      |  19 +
>  .../tuxedo_nb04_wmi_ab_virtual_lamp_array.c   | 735 ++++++++++++++++++
>  .../tuxedo_nb04_wmi_ab_virtual_lamp_array.h   |  18 +
>  .../x86/tuxedo/tuxedo_nb04_wmi_util.c         |  82 ++
>  .../x86/tuxedo/tuxedo_nb04_wmi_util.h         | 112 +++
>  11 files changed, 1099 insertions(+)
>  create mode 100644 drivers/platform/x86/tuxedo/Kbuild
>  create mode 100644 drivers/platform/x86/tuxedo/Kconfig
>  create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c
>  create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h
>  create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c
>  create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.h
>  create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
>  create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc40a9d9b8cd1..3385ad51af194 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23358,6 +23358,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
>  F:	tools/power/x86/turbostat/
>  F:	tools/testing/selftests/turbostat/
>  
> +TUXEDO DRIVERS
> +M:	Werner Sembach <wse@tuxedocomputers.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/tuxedo/
> +
>  TW5864 VIDEO4LINUX DRIVER
>  M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
>  M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ddfccc226751f..c7cffb222adac 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1196,3 +1196,5 @@ config P2SB
>  	  The main purpose of this library is to unhide P2SB device in case
>  	  firmware kept it hidden on some platforms in order to access devices
>  	  behind it.
> +
> +source "drivers/platform/x86/tuxedo/Kconfig"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b1429470674..1562dcd7ad9a5 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
>  
>  # SEL
>  obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
> +
> +# TUXEDO
> +obj-y					+= tuxedo/
> diff --git a/drivers/platform/x86/tuxedo/Kbuild b/drivers/platform/x86/tuxedo/Kbuild
> new file mode 100644
> index 0000000000000..5a3506ab98131
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/Kbuild
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +tuxedo_nb04_wmi_ab-y			:= tuxedo_nb04_wmi_ab_init.o
> +tuxedo_nb04_wmi_ab-y			+= tuxedo_nb04_wmi_util.o
> +tuxedo_nb04_wmi_ab-y			+= tuxedo_nb04_wmi_ab_virtual_lamp_array.o
> +obj-$(CONFIG_TUXEDO_NB04_WMI_AB)	+= tuxedo_nb04_wmi_ab.o
> diff --git a/drivers/platform/x86/tuxedo/Kconfig b/drivers/platform/x86/tuxedo/Kconfig
> new file mode 100644
> index 0000000000000..b1f7c6ceeaae4
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +menuconfig TUXEDO_NB04_WMI_AB
> +	tristate "TUXEDO NB04 WMI AB Platform Driver"
> +	default m
> +	help
> +	  This driver implements the WMI AB device found on TUXEDO Notebooks
> +	  with board vendor NB04. For the time being only the keyboard backlight
> +	  control is implemented.
> +
> +	  When compiled as a module it will be called tuxedo_nb04_wmi_ab.
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c
> new file mode 100644
> index 0000000000000..bd5bca3b15bc7
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This driver implements the WMI AB device found on TUXEDO Notebooks with board
> + * vendor NB04.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +#include <linux/dmi.h>
> +
> +#include "tuxedo_nb04_wmi_ab_virtual_lamp_array.h"
> +
> +#include "tuxedo_nb04_wmi_ab_init.h"
> +
> +static int probe(struct wmi_device *wdev, const void __always_unused *context)
> +{
> +	struct tuxedo_nb04_wmi_driver_data_t *driver_data;
> +	int ret;
> +
> +	driver_data = devm_kzalloc(&wdev->dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, driver_data);
> +
> +	ret = tuxedo_nb04_virtual_lamp_array_add_device(wdev,
> +							&driver_data->virtual_lamp_array_hdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void remove(struct wmi_device *wdev)
> +{
> +	struct tuxedo_nb04_wmi_driver_data_t *driver_data = dev_get_drvdata(&wdev->dev);
> +
> +	hid_destroy_device(driver_data->virtual_lamp_array_hdev);
> +}
> +
> +static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] = {
> +	{ .guid_string = "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
> +
> +static struct wmi_driver tuxedo_nb04_wmi_ab_driver = {
> +	.driver = {
> +		.name = "tuxedo_nb04_wmi_ab",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = tuxedo_nb04_wmi_ab_device_ids,
> +	.probe = probe,
> +	.remove = remove,
> +	.no_singleton = true,
> +};
> +
> +// We don't know if the WMI API is stable and how unique the GUID is for this ODM. To be on the safe
> +// side we therefore only run this driver on tested devices defined by this list.

Please limit comment length to 80 chars and since you need multiple lines 
here anyway, use the usual /* */ multiline comment formatting.

> +static const struct dmi_system_id tested_devices_dmi_table[] __initconst = {
> +	{
> +		// TUXEDO Sirius 16 Gen1
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
> +		},
> +	},
> +	{
> +		// TUXEDO Sirius 16 Gen2
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static int __init tuxedo_nb04_wmi_ab_init(void)
> +{
> +	if (!dmi_check_system(tested_devices_dmi_table))
> +		return -ENODEV;
> +
> +	return wmi_driver_register(&tuxedo_nb04_wmi_ab_driver);
> +}
> +module_init(tuxedo_nb04_wmi_ab_init);
> +
> +static void __exit tuxedo_nb04_wmi_ab_exit(void)
> +{
> +	return wmi_driver_unregister(&tuxedo_nb04_wmi_ab_driver);
> +}
> +module_exit(tuxedo_nb04_wmi_ab_exit);
> +
> +MODULE_DESCRIPTION("Virtual HID LampArray interface for TUXEDO NB04 devices");
> +MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h
> new file mode 100644
> index 0000000000000..3306e3d28bcab
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This driver implements the WMI AB device found on TUXEDO Notebooks with board
> + * vendor NB04.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_AB_INIT_H
> +#define TUXEDO_NB04_WMI_AB_INIT_H
> +
> +#include <linux/mutex.h>
> +#include <linux/hid.h>
> +
> +struct tuxedo_nb04_wmi_driver_data_t {
> +	struct hid_device *virtual_lamp_array_hdev;
> +};
> +
> +#endif
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c
> new file mode 100644
> index 0000000000000..906eb59c5cfd2
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c
> @@ -0,0 +1,735 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This code gives the built in RGB lighting of the TUXEDO NB04 devices a
> + * standardised interface, namely HID LampArray.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Please add all the includes here for the things you use below (in 
alphabetical order).

> +#include "tuxedo_nb04_wmi_util.h"
> +
> +#include "tuxedo_nb04_wmi_ab_virtual_lamp_array.h"
> +
> +enum report_ids {
> +	LAMP_ARRAY_ATTRIBUTES_REPORT_ID		= 0x01,
> +	LAMP_ATTRIBUTES_REQUEST_REPORT_ID	= 0x02,
> +	LAMP_ATTRIBUTES_RESPONSE_REPORT_ID	= 0x03,
> +	LAMP_MULTI_UPDATE_REPORT_ID		= 0x04,
> +	LAMP_RANGE_UPDATE_REPORT_ID		= 0x05,
> +	LAMP_ARRAY_CONTROL_REPORT_ID		= 0x06,
> +};
> +
> +static const uint8_t sirius_16_ansii_kbl_mapping[] = {

u8 for kernel internal things.

> +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> +	0x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
> +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> +	0x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
> +	0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
> +	0x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
> +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> +	0x4f,                                 0x62, 0x63, 0x58

Why are these aligned in the odd way?

> +};
> +
> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_x[] = {

u32

> +	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600, 175300,
> +	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 327900, 344600,
> +	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000, 190500,
> +	209000, 227500, 246000, 269500,                   294500, 311200, 327900, 344600,
> +	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000, 199500,
> +	218000, 236500, 255000, 273500,                   294500, 311200, 327900,
> +	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500, 205000,
> +	223500, 242000, 267500,                           294500, 311200, 327900, 344600,
> +	 37000,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500, 214000,
> +	232500, 251500, 273500,                           294500, 311200, 327900,
> +	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000, 273500,
> +	292000,                                           311200, 327900, 344600
> +};
> +
> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_y[] = {
> +	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,
> +	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  53000,  53000,
> +	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,
> +	 67500,  67500,  67500,  67500,                    67500,  67500,  67500,  67500,
> +	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,
> +	 85500,  85500,  85500,  85500,                    85500,  85500,  85500,
> +	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500,
> +	103500, 103500, 103500,                           103500, 103500, 103500,  94500,
> +	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500,
> +	121500, 121500, 129000,                           121500, 121500, 121500,
> +	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000, 147000,
> +	147000,                                           139500, 139500, 130500
> +};
> +
> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_z[] = {
> +	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,
> +	  5000,   5000,   5000,   5000,   5000,   5000,     5000,   5000,   5000,   5000,
> +	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,
> +	  5250,   5250,   5250,   5250,                     5250,   5250,   5250,   5250,
> +	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,
> +	  5500,   5500,   5500,   5500,                     5500,   5500,   5500,
> +	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,
> +	  5750,   5750,   5750,                             5750,   5750,   5750,   5625,
> +	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,
> +	  6000,   6000,   6125,                             6000,   6000,   6000,
> +	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375,   6375,
> +	  6375,                                             6250,   6250,   6125
> +};
> +
> +static const uint8_t sirius_16_iso_kbl_mapping[] = {
> +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> +	0x13, 0x2f, 0x30,                     0x5f, 0x60, 0x61,
> +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> +	0x33, 0x34, 0x32, 0x28,               0x5c, 0x5d, 0x5e, 0x57,
> +	0xe1, 0x64, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36,
> +	0x37, 0x38, 0xe5, 0x52,               0x59, 0x5a, 0x5b,
> +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> +	0x4f,                                 0x62, 0x63, 0x58
> +};
> +
> +static const uint32_t sirius_16_iso_kbl_mapping_pos_x[] = {
> +	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600, 175300,
> +	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 327900, 344600,
> +	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000, 190500,
> +	209000, 227500, 246000, 269500,                   294500, 311200, 327900, 344600,
> +	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000, 199500,
> +	218000, 234500, 251000,                           294500, 311200, 327900,
> +	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500, 205000,
> +	223500, 240000, 256500, 271500,                   294500, 311200, 327900, 344600,
> +	 28000,  47500,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500,
> +	214000, 232500, 251500, 273500,                   294500, 311200, 327900,
> +	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000, 273500,
> +	292000,                                           311200, 327900, 344600
> +};
> +
> +static const uint32_t sirius_16_iso_kbl_mapping_pos_y[] = {
> +	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,
> +	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  53000,  53000,
> +	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,
> +	 67500,  67500,  67500,  67500,                    67500,  67500,  67500,  67500,
> +	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,
> +	 85500,  85500,  85500,                            85500,  85500,  85500,
> +	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500,
> +	103500, 103500, 103500,  94500,                   103500, 103500, 103500,  94500,
> +	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500,
> +	121500, 121500, 121500, 129000,                   121500, 121500, 121500,
> +	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000, 147000,
> +	147000,                                           139500, 139500, 130500
> +};
> +
> +static const uint32_t sirius_16_iso_kbl_mapping_pos_z[] = {
> +	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,
> +	  5000,   5000,   5000,   5000, 5000, 5000,         5000,   5000,   5000,   5000,
> +	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,
> +	  5250,   5250,   5250,   5250,                     5250,   5250,   5250,   5250,
> +	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,
> +	  5500,   5500,   5500,                             5500,   5500,   5500,
> +	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,
> +	  5750,   5750,   5750,   5750,                     5750,   5750,   5750,   5625,
> +	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,
> +	  6000,   6000,   6000,   6125,                     6000,   6000,   6000,
> +	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375,   6375,
> +	  6375,                                             6250,   6250,   6125
> +};
> +
> +struct driver_data_t {
> +	uint8_t keyboard_type;
> +	uint8_t lamp_count;
> +	uint8_t next_lamp_id;
> +	union tuxedo_nb04_wmi_496_b_in_80_b_out_input next_kbl_set_multiple_keys_input;
> +};
> +
> +
> +static int ll_start(struct hid_device *hdev)
> +{
> +	struct driver_data_t *driver_data;
> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
> +	int ret;
> +	union tuxedo_nb04_wmi_8_b_in_80_b_out_input input;
> +	union tuxedo_nb04_wmi_8_b_in_80_b_out_output output;

Reverse xmas-tree order.

> +
> +	driver_data = devm_kzalloc(&hdev->dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	input.get_device_status_input.device_type = WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
> +	ret = tuxedo_nb04_wmi_8_b_in_80_b_out(wdev, WMI_AB_GET_DEVICE_STATUS, &input, &output);
> +	if (ret)
> +		return ret;
> +
> +	driver_data->keyboard_type = output.get_device_status_output.keyboard_physical_layout;
> +	driver_data->lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
> +	driver_data->next_lamp_id = 0;
> +
> +	hdev->driver_data = driver_data;
> +
> +	return ret;
> +}
> +
> +
> +static void ll_stop(struct hid_device __always_unused *hdev)
> +{
> +}
> +
> +
> +static int ll_open(struct hid_device __always_unused *hdev)
> +{
> +	return 0;
> +}
> +
> +
> +static void ll_close(struct hid_device __always_unused *hdev)
> +{
> +}
> +
> +
> +static uint8_t report_descriptor[327] = {

Use u8 for things internal to kernel.

> +	0x05, 0x59,			// Usage Page (Lighting and Illumination)
> +	0x09, 0x01,			// Usage (Lamp Array)
> +	0xa1, 0x01,			// Collection (Application)
> +	0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
> +	0x09, 0x02,			//  Usage (Lamp Array Attributes Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x03,			//   Usage (Lamp Count)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> +	0x09, 0x04,			//   Usage (Bounding Box Width In Micrometers)
> +	0x09, 0x05,			//   Usage (Bounding Box Height In Micrometers)
> +	0x09, 0x06,			//   Usage (Bounding Box Depth In Micrometers)
> +	0x09, 0x07,			//   Usage (Lamp Array Kind)
> +	0x09, 0x08,			//   Usage (Min Update Interval In Microseconds)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> +	0x75, 0x20,			//   Report Size (32)
> +	0x95, 0x05,			//   Report Count (5)
> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
> +	0x09, 0x20,			//  Usage (Lamp Attributes Request Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
> +	0x09, 0x22,			//  Usage (Lamp Attributes Response Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x23,			//   Usage (Position X In Micrometers)
> +	0x09, 0x24,			//   Usage (Position Y In Micrometers)
> +	0x09, 0x25,			//   Usage (Position Z In Micrometers)
> +	0x09, 0x27,			//   Usage (Update Latency In Microseconds)
> +	0x09, 0x26,			//   Usage (Lamp Purposes)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> +	0x75, 0x20,			//   Report Size (32)
> +	0x95, 0x05,			//   Report Count (5)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x28,			//   Usage (Red Level Count)
> +	0x09, 0x29,			//   Usage (Green Level Count)
> +	0x09, 0x2a,			//   Usage (Blue Level Count)
> +	0x09, 0x2b,			//   Usage (Intensity Level Count)
> +	0x09, 0x2c,			//   Usage (Is Programmable)
> +	0x09, 0x2d,			//   Usage (Input Binding)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x06,			//   Report Count (6)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
> +	0x09, 0x50,			//  Usage (Lamp Multi Update Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x03,			//   Usage (Lamp Count)
> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x08,			//   Logical Maximum (8)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x02,			//   Report Count (2)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x08,			//   Report Count (8)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x20,			//   Report Count (32)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
> +	0x09, 0x60,			//  Usage (Lamp Range Update Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x08,			//   Logical Maximum (8)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x61,			//   Usage (Lamp Id Start)
> +	0x09, 0x62,			//   Usage (Lamp Id End)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x02,			//   Report Count (2)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x04,			//   Report Count (4)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
> +	0x09, 0x70,			//  Usage (Lamp Array Control Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x71,			//   Usage (Autonomous Mode)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x01,			//   Logical Maximum (1)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0xc0				// End Collection
> +};
> +
> +static int ll_parse(struct hid_device *hdev)
> +{
> +	return hid_parse_report(hdev, report_descriptor, sizeof(report_descriptor));
> +}
> +
> +
> +struct __packed lamp_array_attributes_report_t {
> +	const uint8_t report_id;
> +	uint16_t lamp_count;
> +	uint32_t bounding_box_width_in_micrometers;
> +	uint32_t bounding_box_height_in_micrometers;
> +	uint32_t bounding_box_depth_in_micrometers;
> +	uint32_t lamp_array_kind;
> +	uint32_t min_update_interval_in_microseconds;

Use uXX types.

> +};
> +
> +static int handle_lamp_array_attributes_report(struct hid_device *hdev,
> +					       struct lamp_array_attributes_report_t *rep)
> +{
> +	struct driver_data_t *driver_data = hdev->driver_data;
> +
> +	rep->lamp_count = driver_data->lamp_count;
> +	rep->bounding_box_width_in_micrometers = 368000;
> +	rep->bounding_box_height_in_micrometers = 266000;
> +	rep->bounding_box_depth_in_micrometers = 30000;
> +	// LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of "HID Usage Tables v1.5"

Limit length to 80 chars.

> +	rep->lamp_array_kind = 1;
> +	// Some guessed value for interval microseconds
> +	rep->min_update_interval_in_microseconds = 500;
> +
> +	return sizeof(struct lamp_array_attributes_report_t);

sizeof(*rep) ?

> +}
> +
> +
> +struct __packed lamp_attributes_request_report_t {
> +	const uint8_t report_id;
> +	uint16_t lamp_id;
> +};
> +
> +static int handle_lamp_attributes_request_report(struct hid_device *hdev,
> +						 struct lamp_attributes_request_report_t *rep)
> +{
> +	struct driver_data_t *driver_data = hdev->driver_data;
> +
> +	if (rep->lamp_id < driver_data->lamp_count)
> +		driver_data->next_lamp_id = rep->lamp_id;
> +	else
> +		driver_data->next_lamp_id = 0;
> +
> +	return sizeof(struct lamp_attributes_request_report_t);

sizeof(*rep) ?

> +}
> +
> +
> +struct __packed lamp_attributes_response_report_t {
> +	const uint8_t report_id;
> +	uint16_t lamp_id;
> +	uint32_t position_x_in_micrometers;
> +	uint32_t position_y_in_micrometers;
> +	uint32_t position_z_in_micrometers;
> +	uint32_t update_latency_in_microseconds;
> +	uint32_t lamp_purpose;
> +	uint8_t red_level_count;
> +	uint8_t green_level_count;
> +	uint8_t blue_level_count;
> +	uint8_t intensity_level_count;
> +	uint8_t is_programmable;
> +	uint8_t input_binding;

uXX types.

> +};
> +
> +static int handle_lamp_attributes_response_report(struct hid_device *hdev,
> +						  struct lamp_attributes_response_report_t *rep)
> +{
> +	struct driver_data_t *driver_data = hdev->driver_data;
> +	uint16_t lamp_id = driver_data->next_lamp_id;
> +	const uint8_t *kbl_mapping;
> +	const uint32_t *kbl_mapping_pos_x, *kbl_mapping_pos_y, *kbl_mapping_pos_z;

uXX types.

> +
> +	rep->lamp_id = lamp_id;
> +	// Some guessed value for latency microseconds
> +	rep->update_latency_in_microseconds = 100;
> +	 // LampPurposeControl, see "26.3.1 LampPurposes Flags" of "HID Usage Tables v1.5"

Extra space.

Limit to 80 chars.

> +	rep->lamp_purpose = 1;
> +	rep->red_level_count = 0xff;
> +	rep->green_level_count = 0xff;
> +	rep->blue_level_count = 0xff;
> +	rep->intensity_level_count = 0xff;
> +	rep->is_programmable = 1;
> +
> +	if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII) {
> +		kbl_mapping = &sirius_16_ansii_kbl_mapping[0];
> +		kbl_mapping_pos_x = &sirius_16_ansii_kbl_mapping_pos_x[0];
> +		kbl_mapping_pos_y = &sirius_16_ansii_kbl_mapping_pos_y[0];
> +		kbl_mapping_pos_z = &sirius_16_ansii_kbl_mapping_pos_z[0];
> +	} else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO) {
> +		kbl_mapping = &sirius_16_iso_kbl_mapping[0];
> +		kbl_mapping_pos_x = &sirius_16_iso_kbl_mapping_pos_x[0];
> +		kbl_mapping_pos_y = &sirius_16_iso_kbl_mapping_pos_y[0];
> +		kbl_mapping_pos_z = &sirius_16_iso_kbl_mapping_pos_z[0];
> +	} else
> +		return -EINVAL;
> +
> +	if (kbl_mapping[lamp_id] <= 0xe8)
> +		rep->input_binding = kbl_mapping[lamp_id];
> +	else
> +		// Everything bigger is reserved/undefined, see "10 Keyboard/Keypad Page (0x07)" of
> +		// "HID Usage Tables v1.5" and should return 0, see "26.8.3 Lamp Attributes" of the
> +		// same document.

Use multiline /**/ comment formatting and limit to 80 chars.

> +		rep->input_binding = 0;
> +	rep->position_x_in_micrometers = kbl_mapping_pos_x[lamp_id];
> +	rep->position_y_in_micrometers = kbl_mapping_pos_y[lamp_id];
> +	rep->position_z_in_micrometers = kbl_mapping_pos_z[lamp_id];
> +
> +	driver_data->next_lamp_id = (driver_data->next_lamp_id + 1) % driver_data->lamp_count;
> +
> +	return sizeof(struct lamp_attributes_response_report_t);

sizeof(*rep) ?

> +}
> +
> +
> +#define LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE	BIT(0)
> +
> +struct __packed lamp_multi_update_report_t {
> +	const uint8_t report_id;
> +	uint8_t lamp_count;
> +	uint8_t lamp_update_flags;
> +	uint16_t lamp_id[8];
> +	struct {
> +		uint8_t red;
> +		uint8_t green;
> +		uint8_t blue;
> +		uint8_t intensity;
> +	} update_channels[8];

uXX types.

> +};
> +
> +static int handle_lamp_multi_update_report(struct hid_device *hdev,
> +					   struct lamp_multi_update_report_t *rep)
> +{
> +	struct driver_data_t *driver_data = hdev->driver_data;
> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
> +	int ret;
> +	uint8_t lamp_count = 0, key_id, key_id_j;
> +	union tuxedo_nb04_wmi_496_b_in_80_b_out_input *next =
> +		&driver_data->next_kbl_set_multiple_keys_input;
> +	union tuxedo_nb04_wmi_496_b_in_80_b_out_output output;

Reverse xmas-tree order (to the extent viable).

> +
> +	// Catching missformated lamp_multi_update_report and fail silently according to
> +	// "HID Usage Tables v1.5"
> +	for (int i = 0; i < rep->lamp_count; ++i) {
> +		if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
> +			lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
> +		else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
> +			lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
> +
> +		if (rep->lamp_id[i] > lamp_count) {
> +			pr_debug("Out of bounds lamp_id in lamp_multi_update_report. Skippng whole report!\n");
> +			return sizeof(struct lamp_multi_update_report_t);

sizeof(*rep)?

> +		}
> +
> +		for (int j = i + 1; j < rep->lamp_count; ++j) {
> +			if (rep->lamp_id[i] == rep->lamp_id[j]) {
> +				pr_debug("Duplicate lamp_id in lamp_multi_update_report. Skippng whole report!\n");
> +				return sizeof(struct lamp_multi_update_report_t);
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; i < rep->lamp_count; ++i) {
> +		if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
> +			key_id = sirius_16_ansii_kbl_mapping[rep->lamp_id[i]];
> +		else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
> +			key_id = sirius_16_iso_kbl_mapping[rep->lamp_id[i]];
> +
> +		for (int j = 0; j < WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX; ++j) {
> +			key_id_j = next->kbl_set_multiple_keys_input.lighting_settings[j].key_id;
> +			if (key_id_j == 0x00 || key_id_j == key_id) {

Reverse condition and use continue to lower the indentation level of the 
main loop body.

> +				if (key_id_j == 0x00)
> +					next->kbl_set_multiple_keys_input.lighting_setting_count =
> +						j + 1;
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].key_id =
> +					key_id;
> +				// While this driver respects
> +				// intensity_update_channel according to "HID
> +				// Usage Tables v1.5" also on RGB leds, the
> +				// Microsoft MacroPad reference implementation
> +				// (https://github.com/microsoft/RP2040MacropadHidSample
> +				// 1d6c3ad) does not and ignores it. If it turns
> +				// out that Windows writes intensity = 0 for RGB
> +				// leds instead of intensity = 255, this driver
> +				// should also irgnore the
> +				// intensity_update_channel.
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].red =
> +					rep->update_channels[i].red
> +						* rep->update_channels[i].intensity / 0xff;
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].green =
> +					rep->update_channels[i].green
> +						* rep->update_channels[i].intensity / 0xff;
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].blue =
> +					rep->update_channels[i].blue
> +						* rep->update_channels[i].intensity / 0xff;
> +
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE) {
> +		ret = tuxedo_nb04_wmi_496_b_in_80_b_out(wdev, WMI_AB_KBL_SET_MULTIPLE_KEYS, next,
> +							&output);
> +		memset(next, 0, sizeof(union tuxedo_nb04_wmi_496_b_in_80_b_out_input));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return sizeof(struct lamp_multi_update_report_t);
> +}
> +
> +
> +struct __packed lamp_range_update_report_t {
> +	const uint8_t report_id;
> +	uint8_t lamp_update_flags;
> +	uint16_t lamp_id_start;
> +	uint16_t lamp_id_end;
> +	uint8_t red_update_channel;
> +	uint8_t green_update_channel;
> +	uint8_t blue_update_channel;
> +	uint8_t intensity_update_channel;
> +};
> +
> +static int handle_lamp_range_update_report(struct hid_device *hdev,
> +					   struct lamp_range_update_report_t *report)
> +{
> +	struct driver_data_t *driver_data = hdev->driver_data;
> +	int ret;
> +	uint8_t lamp_count;
> +	struct lamp_multi_update_report_t lamp_multi_update_report = {
> +		.report_id = LAMP_MULTI_UPDATE_REPORT_ID
> +	};
> +
> +	// Catching missformated lamp_range_update_report and fail silently according to
> +	// "HID Usage Tables v1.5"
> +	if (report->lamp_id_start > report->lamp_id_end) {
> +		pr_debug("lamp_id_start > lamp_id_end in lamp_range_update_report. Skippng whole report!\n");
> +		return sizeof(struct lamp_range_update_report_t);
> +	}
> +
> +	if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
> +		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
> +	else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
> +		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
> +
> +	if (report->lamp_id_end > lamp_count - 1) {
> +		pr_debug("Out of bounds lamp_id_* in lamp_range_update_report. Skippng whole report!\n");
> +		return sizeof(struct lamp_range_update_report_t);
> +	}
> +
> +	// Break handle_lamp_range_update_report call down to multiple
> +	// handle_lamp_multi_update_report calls to easily ensure that mixing
> +	// handle_lamp_range_update_report and handle_lamp_multi_update_report
> +	// does not break things.
> +	for (int i = report->lamp_id_start; i < report->lamp_id_end + 1; i = i + 8) {
> +		lamp_multi_update_report.lamp_count = MIN(report->lamp_id_end + 1 - i, 8);
> +		if (i + lamp_multi_update_report.lamp_count == report->lamp_id_end + 1)
> +			lamp_multi_update_report.lamp_update_flags |=
> +				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
> +
> +		for (int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
> +			lamp_multi_update_report.lamp_id[j] = i + j;
> +			lamp_multi_update_report.update_channels[j].red =
> +				report->red_update_channel;
> +			lamp_multi_update_report.update_channels[j].green =
> +				report->green_update_channel;
> +			lamp_multi_update_report.update_channels[j].blue =
> +				report->blue_update_channel;
> +			lamp_multi_update_report.update_channels[j].intensity =
> +				report->intensity_update_channel;
> +		}
> +
> +		ret = handle_lamp_multi_update_report(hdev, &lamp_multi_update_report);
> +		if (ret < 0)
> +			return ret;
> +		else if (ret != sizeof(struct lamp_multi_update_report_t))
> +			return -EIO;
> +	}
> +
> +	return sizeof(struct lamp_range_update_report_t);
> +}
> +
> +
> +struct __packed lamp_array_control_report_t {
> +	const uint8_t report_id;
> +	uint8_t autonomous_mode;
> +};
> +
> +static int handle_lamp_array_control_report(struct hid_device __always_unused *hdev,
> +					    struct lamp_array_control_report_t __always_unused *rep)
> +{
> +	// The keyboard firmware doesn't have any built in effects or controls
> +	// so this is a NOOP.
> +	// According to the HID Documentation (HID Usage Tables v1.5) this
> +	// function is optional and can be removed from the HID Report
> +	// Descriptor, but it should first be confirmed that userspace respects
> +	// this possibility too. The Microsoft MacroPad reference implementation
> +	// (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
> +	// already deviates from the spec at another point, see
> +	// handle_lamp_*_update_report.
> +
> +	return sizeof(struct lamp_array_control_report_t);
> +}
> +
> +
> +static int ll_raw_request(struct hid_device *hdev, unsigned char reportnum, __u8 *buf, size_t len,
> +			   unsigned char rtype, int reqtype)
> +{
> +	int ret;
> +
> +	ret = -EINVAL;
> +	if (rtype == HID_FEATURE_REPORT) {

No, reverse the logic in the condition and return -EINVAL explicitly.
It lets you lower the indentation level of the normal path.

> +		if (reqtype == HID_REQ_GET_REPORT) {
> +			if (reportnum == LAMP_ARRAY_ATTRIBUTES_REPORT_ID
> +			    && len == sizeof(struct lamp_array_attributes_report_t))
> +				ret = handle_lamp_array_attributes_report(
> +					hdev, (struct lamp_array_attributes_report_t *)buf);
> +			else if (reportnum == LAMP_ATTRIBUTES_RESPONSE_REPORT_ID
> +			    && len == sizeof(struct lamp_attributes_response_report_t))
> +				ret = handle_lamp_attributes_response_report(
> +					hdev, (struct lamp_attributes_response_report_t *)buf);
> +		} else if (reqtype == HID_REQ_SET_REPORT) {
> +			if (reportnum == LAMP_ATTRIBUTES_REQUEST_REPORT_ID
> +			    && len == sizeof(struct lamp_attributes_request_report_t))
> +				ret = handle_lamp_attributes_request_report(
> +					hdev, (struct lamp_attributes_request_report_t *)buf);
> +			else if (reportnum == LAMP_MULTI_UPDATE_REPORT_ID
> +			    && len == sizeof(struct lamp_multi_update_report_t))
> +				ret = handle_lamp_multi_update_report(
> +					hdev, (struct lamp_multi_update_report_t *)buf);
> +			else if (reportnum == LAMP_RANGE_UPDATE_REPORT_ID
> +			    && len == sizeof(struct lamp_range_update_report_t))
> +				ret = handle_lamp_range_update_report(
> +					hdev, (struct lamp_range_update_report_t *)buf);
> +			else if (reportnum == LAMP_ARRAY_CONTROL_REPORT_ID
> +			    && len == sizeof(struct lamp_array_control_report_t))
> +				ret = handle_lamp_array_control_report(
> +					hdev, (struct lamp_array_control_report_t *)buf);
> +		}

This is very messy, and should IMHO use switch&case and directly return 
-EINVAL on every len check inside the case blocks.

> +	}
> +
> +	return ret;
> +}
> +
> +static const struct hid_ll_driver ll_driver = {
> +	.start = &ll_start,
> +	.stop = &ll_stop,
> +	.open = &ll_open,
> +	.close = &ll_close,
> +	.parse = &ll_parse,
> +	.raw_request = &ll_raw_request,
> +};
> +
> +int tuxedo_nb04_virtual_lamp_array_add_device(struct wmi_device *wdev, struct hid_device **hdev_out)
> +{
> +	struct hid_device *hdev;
> +	int ret;
> +
> +	pr_debug("Adding TUXEDO NB04 Virtual LampArray device.\n");
> +
> +	hdev = hid_allocate_device();
> +	if (IS_ERR(hdev))
> +		return PTR_ERR(hdev);
> +	*hdev_out = hdev;
> +
> +	strscpy(hdev->name, "TUXEDO NB04 RGB Lighting", sizeof(hdev->name));
> +
> +	hdev->ll_driver = &ll_driver;
> +	hdev->bus = BUS_VIRTUAL;
> +	hdev->vendor = 0x21ba;
> +	hdev->product = 0x0400;
> +	hdev->dev.parent = &wdev->dev;
> +
> +	ret = hid_add_device(hdev);
> +	if (ret)
> +		hid_destroy_device(hdev);
> +	return ret;
> +}
> +EXPORT_SYMBOL(tuxedo_nb04_virtual_lamp_array_add_device);
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.h b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.h
> new file mode 100644
> index 0000000000000..fdc2a01d95c24
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This code gives the built in RGB lighting of the TUXEDO NB04 devices a
> + * standardised interface, namely HID LampArray.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
> +#define TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
> +
> +#include <linux/wmi.h>
> +#include <linux/hid.h>
> +
> +int tuxedo_nb04_virtual_lamp_array_add_device(struct wmi_device *wdev,
> +					      struct hid_device **hdev_out);
> +
> +#endif
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> new file mode 100644
> index 0000000000000..a61b59d225f9f
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This code gives functions to avoid code duplication while interacting with
> + * the TUXEDO NB04 wmi interfaces.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com

The usual custom is to put <> around email addresses.

> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Add all includes for the stuff you use below.

> +#include "tuxedo_nb04_wmi_ab_init.h"
> +
> +#include "tuxedo_nb04_wmi_util.h"
> +
> +static int __wmi_method_acpi_object_out(struct wmi_device *wdev, uint32_t wmi_method_id,
> +					uint8_t *in, acpi_size in_len, union acpi_object **out)
> +{
> +	struct acpi_buffer acpi_buffer_in = { in_len, in };
> +	struct acpi_buffer acpi_buffer_out = { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +	pr_debug("Evaluate WMI method: %u in:\n", wmi_method_id);
> +	print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, in, in_len);
> +
> +	acpi_status status = wmidev_evaluate_method(wdev, 0, wmi_method_id, &acpi_buffer_in,
> +						    &acpi_buffer_out);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("Failed to evaluate WMI method.\n");

You should use dev_err() instead of pr_err().

> +		return -EIO;
> +	}
> +	if (!acpi_buffer_out.pointer) {
> +		pr_err("Unexpected empty out buffer.\n");
> +		return -ENODATA;
> +	}
> +
> +	*out = acpi_buffer_out.pointer;
> +
> +	return 0;
> +}
> +
> +static int __wmi_method_buffer_out(struct wmi_device *wdev, uint32_t wmi_method_id, uint8_t *in,
> +				   acpi_size in_len, uint8_t *out, acpi_size out_len)
> +{
> +	int ret;
> +	union acpi_object *acpi_object_out = NULL;

Reverse xmas tree order.

> +
> +	ret = __wmi_method_acpi_object_out(wdev, wmi_method_id, in, in_len, &acpi_object_out);
> +	if (ret)
> +		return ret;
> +
> +	if (acpi_object_out->type != ACPI_TYPE_BUFFER) {
> +		pr_err("Unexpected out buffer type. Expected: %u Got: %u\n", ACPI_TYPE_BUFFER,
> +		       acpi_object_out->type);
> +		kfree(acpi_object_out);
> +		return -EIO;
> +	}
> +	if (acpi_object_out->buffer.length < out_len) {
> +		pr_err("Unexpected out buffer length.\n");
> +		kfree(acpi_object_out);
> +		return -EIO;

Duplicated error paths should use goto to handle rollback.

> +	}
> +
> +	memcpy(out, acpi_object_out->buffer.pointer, out_len);
> +	kfree(acpi_object_out);
> +
> +	return ret;
> +}
> +
> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
> +				    enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_output *output)
> +{
> +	return __wmi_method_buffer_out(wdev, method, input->raw, 8, output->raw, 80);
> +}
> +
> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
> +				      enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_output *output)
> +{
> +	return __wmi_method_buffer_out(wdev, method, input->raw, 496, output->raw, 80);
> +}
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> new file mode 100644
> index 0000000000000..2765cbe9fcfef
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This code gives functions to avoid code duplication while interacting with
> + * the TUXEDO NB04 wmi interfaces.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_UTIL_H
> +#define TUXEDO_NB04_WMI_UTIL_H
> +
> +#include <linux/wmi.h>
> +
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD	1
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD	2
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES	3
> +
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE		0
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY	1
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE	2
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY	3
> +
> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII	0
> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO	1
> +
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED		1
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN		2
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW	3
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE		4
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE	5
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO	6
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE		7
> +
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD	BIT(0)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS	BIT(1)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL		BIT(2)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS	BIT(3)

All these are quite long, I'd consider ways to make them shorter such as:

DEVICE -> DEV
COLOR_ID -> COLOR
STATUS -> STS ?
KEYBOARD_LAYOUT -> KEY_LAYOUT or KEYBOARD -> KEYB (in general)

> +
> +

Extra newline.

> +union tuxedo_nb04_wmi_8_b_in_80_b_out_input {
> +	uint8_t raw[8];

uXX for types.

> +	struct __packed {

Unnecessary packed.

> +		uint8_t device_type;
> +		uint8_t reserved_0[7];

Why isn't this just reserved[7] ?

> +	} get_device_status_input;
> +};
> +
> +union tuxedo_nb04_wmi_8_b_in_80_b_out_output {
> +	uint8_t raw[80];
> +	struct __packed {

This too looks naturally aligned so packet is unnecessary.

> +		uint16_t return_status;
> +		uint8_t device_enabled;
> +		uint8_t kbl_type;
> +		uint8_t kbl_side_bar_supported;
> +		uint8_t keyboard_physical_layout;
> +		uint8_t app_pages;
> +		uint8_t per_key_kbl_default_color;
> +		uint8_t four_zone_kbl_default_color_1;
> +		uint8_t four_zone_kbl_default_color_2;
> +		uint8_t four_zone_kbl_default_color_3;
> +		uint8_t four_zone_kbl_default_color_4;
> +		uint8_t light_bar_kbl_default_color;
> +		uint8_t reserved_0[1];
> +		uint16_t dedicated_gpu_id;
> +		uint8_t reserved_1[64];
> +	} get_device_status_output;
> +};
> +
> +enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods {
> +	WMI_AB_GET_DEVICE_STATUS	= 2,
> +};
> +
> +
> +#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX	120
> +
> +union tuxedo_nb04_wmi_496_b_in_80_b_out_input {
> +	uint8_t raw[496];
> +	struct __packed {
> +		uint8_t reserved_0[15];

reserved[15] ?

> +		uint8_t lighting_setting_count;
> +		struct {
> +			uint8_t key_id;
> +			uint8_t red;
> +			uint8_t green;
> +			uint8_t blue;
> +		} lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX];
> +	}  kbl_set_multiple_keys_input;
> +};
> +
> +union tuxedo_nb04_wmi_496_b_in_80_b_out_output {
> +	uint8_t raw[80];
> +	struct __packed {
> +		uint8_t return_value;
> +		uint8_t reserved_0[79];

reserved[79] ?

> +	} kbl_set_multiple_keys_output;
> +};
> +
> +enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods {
> +	WMI_AB_KBL_SET_MULTIPLE_KEYS	= 6,
> +};
> +
> +
> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
> +				    enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_output *output);
> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
> +				      enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_output *output);
> +
> +#endif

There are number of similar cases beyond those I've marked. Please go 
through all the cases, not just the ones I marked for you.

My general feel is that this driver is quite heavy to read which is likely 
because of what feels excessively long naming used. I'm not convinved 
being _that verbose_ adds enough value.

E.g., right above you have tuxedo_nb04_wmi_8_b_in_80_b_out_methods which 
mostly contains what looks prefix and some sizes. What is the value of 
having those sizes in the name? It would be much more useful to name 
things by functionality rather than sizes.

-- 
 i.


