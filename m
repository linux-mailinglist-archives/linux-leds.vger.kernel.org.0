Return-Path: <linux-leds+bounces-7474-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OZrI7i6w2nUtgQAu9opvQ
	(envelope-from <linux-leds+bounces-7474-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 11:36:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23025323195
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 11:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4505E31001F9
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 10:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B23396D38;
	Wed, 25 Mar 2026 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="MTtRrTua"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C253612FB;
	Wed, 25 Mar 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434093; cv=none; b=H7s9gjgtkKqH6efQEOvzHuJNKphjsYWEYvqf8+pUA4gQ/nLeC5GWDcBdIpJXwEBE6PG7L1I6xYqbvAN46ojVqntCWOo6vnG1Mn4TUmtDYFsHrm/jV414fLbyONkAMe+fKLbIHphH6oAUMz9Lz5xcBhUUPxwgnKEO7x5wRM3oV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434093; c=relaxed/simple;
	bh=1+0FAKYb4hb8lsCA9iAYb71PnzDVB1gl0LWn+HYp0Jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qv82AMxwtTjTS3ShZ9VXP2CQrGhdelZL9zoP0pS8RCeiscUSdQ9ZARdQ26oY9YgOCyPfIGFBDxOJ0Rqhk04W0I4YfqaP2jJw5OqK2xDBxnUoBKqOS7PzjQ1IA0HFx50NBOQDNG/c5BmfoO6Qdb9rlNVqMWHsifRdkrSIx0ZTKRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=MTtRrTua; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.24] (i5C75F6C1.versanet.de [92.117.246.193])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 710382FC021B;
	Wed, 25 Mar 2026 11:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774434086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3KmP1/ahV5DGvcLzMhqCLxOzrTalQioh3sG1l75hCCQ=;
	b=MTtRrTua7QbvbXv9k+tXCUyXwS7V34tIr8f+hTI6okuMFo4YtcqzXKcGp28eRd5zXtP7Xl
	Ipo/0P3ejZFw01klgvo4CflvcDr72Gb0o/4zQ1/SW/crDD2ld+eqhRfiwny2hnUCVnd17J
	lir+NSxOgDRAFx6RMNvY4fKpsplxp1k=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <52ddeec1-d651-4aa3-bb0f-7a45d8620b26@tuxedocomputers.com>
Date: Wed, 25 Mar 2026 11:21:26 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] HID: generic: add LampArray support via hid-lamparray
 helper
To: Tim Guttzeit <tgu@tuxedocomputers.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
References: <20260223083954.131099-1-tgu@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260223083954.131099-1-tgu@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7474-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxedocomputers.com:dkim,tuxedocomputers.com:email,tuxedocomputers.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23025323195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

as Tim went on to other endeavors, I'm taking over this patch. I have yet to 
test it myself, but i was already in the feedback loop while he was writing it, 
so I'm not unfamiliar with the code.

Is there already some initial feedback or thoughts about this?

This patch implements the

- (Optional) Implement a generic LampArray leds subsystem driver that maps to
the single zone control and ads the use_leds_uapi sysfs switch to the virtual
HID device

sub point from the rough outline described back here 
https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/

Best regards,

Werner

Am 23.02.26 um 09:39 schrieb Tim Guttzeit:
> Add a new hid-lamparray helper module and integrate it with the
> hid-generic driver.
>
> The helper provides basic support for devices exposing a
> Lighting/LampArray application collection (usage page 0x59) and
> registers a single-zone RGB LED representation via the LED
> subsystem.
>
> hid-generic now checks for LampArray support after hid_parse() and
> optionally registers a lamparray instance. Failures in the helper
> do not abort device probe to keep the device functional.
>
> LampArray resources are released on driver remove.
>
> Signed-off-by: Tim Guttzeit <tgu@tuxedocomputers.com>
> ---
> V1 -> V2: Fix Kconfig to avoid build errors when LEDS_CLASS_MULTICOLOR is disabled
> V2 -> V3: Squash V1 and V2 into one patch
> V3 -> V4: Restrict CONFIG_HID_LAMPARRAY to built-in configurations only
>            to fix additional randconfig build errors
>
>   drivers/hid/Kconfig         |  10 +
>   drivers/hid/Makefile        |   2 +
>   drivers/hid/hid-generic.c   |  41 +-
>   drivers/hid/hid-lamparray.c | 855 ++++++++++++++++++++++++++++++++++++
>   drivers/hid/hid-lamparray.h |  91 ++++
>   5 files changed, 997 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/hid/hid-lamparray.c
>   create mode 100644 drivers/hid/hid-lamparray.h
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 920a64b66b25..548dc708e5cd 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -92,6 +92,16 @@ config HID_GENERIC
>   
>   	If unsure, say Y.
>   
> +config HID_LAMPARRAY
> +	bool "HID LampArray helper"
> +	depends on HID=y && HID_GENERIC=y && LEDS_CLASS=y && LEDS_CLASS_MULTICOLOR=y
> +	default y
> +	help
> +	Helper for HID devices exposing a Lighting/LampArray collection.
> +	Treats LampArray devices as a single-zone device and exposes a sysfs
> +	interface for changing color and intensity values. Also exposes a
> +	sysfs flag to be disabled e.g. by a userspace driver.
> +
>   config HID_HAPTIC
>   	bool "Haptic touchpad support"
>   	default n
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 361a7daedeb8..5a14b4b0970d 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -13,6 +13,8 @@ obj-$(CONFIG_UHID)		+= uhid.o
>   
>   obj-$(CONFIG_HID_GENERIC)	+= hid-generic.o
>   
> +obj-$(CONFIG_HID_LAMPARRAY) += hid-lamparray.o
> +
>   hid-$(CONFIG_HIDRAW)		+= hidraw.o
>   
>   hid-logitech-y		:= hid-lg.o
> diff --git a/drivers/hid/hid-generic.c b/drivers/hid/hid-generic.c
> index c2de916747de..57b81c86982c 100644
> --- a/drivers/hid/hid-generic.c
> +++ b/drivers/hid/hid-generic.c
> @@ -20,6 +20,7 @@
>   #include <asm/byteorder.h>
>   
>   #include <linux/hid.h>
> +#include "hid-lamparray.h"
>   
>   static struct hid_driver hid_generic;
>   
> @@ -31,7 +32,7 @@ static int __check_hid_generic(struct device_driver *drv, void *data)
>   	if (hdrv == &hid_generic)
>   		return 0;
>   
> -	return hid_match_device(hdev, hdrv) != NULL;
> +	return !!hid_match_device(hdev, hdrv);
>   }
>   
>   static bool hid_generic_match(struct hid_device *hdev,
> @@ -60,6 +61,7 @@ static int hid_generic_probe(struct hid_device *hdev,
>   			     const struct hid_device_id *id)
>   {
>   	int ret;
> +	struct lamparray *la = NULL;
>   
>   	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
>   
> @@ -67,7 +69,31 @@ static int hid_generic_probe(struct hid_device *hdev,
>   	if (ret)
>   		return ret;
>   
> -	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Optional: attach LampArray support if present.
> +	 * Never fail probe on LampArray errors; keep device functional.
> +	 */
> +	if (IS_ENABLED(CONFIG_HID_LAMPARRAY) && lamparray_is_supported_device(hdev)) {
> +		const struct lamparray_init_state init = {
> +			.r = 0xff,
> +			.g = 0xff,
> +			.b = 0xff,
> +			.brightness = LED_FULL,
> +		};
> +
> +		la = lamparray_register(hdev, &init);
> +		if (IS_ERR(la)) {
> +			hid_warn(hdev, "LampArray init failed: %ld\n", PTR_ERR(la));
> +			la = NULL;
> +		}
> +	}
> +
> +	hid_set_drvdata(hdev, la);
> +	return 0;
>   }
>   
>   static int hid_generic_reset_resume(struct hid_device *hdev)
> @@ -78,6 +104,16 @@ static int hid_generic_reset_resume(struct hid_device *hdev)
>   	return 0;
>   }
>   
> +static void hid_generic_remove(struct hid_device *hdev)
> +{
> +	struct lamparray *la = hid_get_drvdata(hdev);
> +
> +	if (IS_ENABLED(CONFIG_HID_LAMPARRAY) && la)
> +		lamparray_unregister(la);
> +
> +	hid_hw_stop(hdev);
> +}
> +
>   static const struct hid_device_id hid_table[] = {
>   	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, HID_ANY_ID, HID_ANY_ID) },
>   	{ }
> @@ -90,6 +126,7 @@ static struct hid_driver hid_generic = {
>   	.match = hid_generic_match,
>   	.probe = hid_generic_probe,
>   	.reset_resume = hid_generic_reset_resume,
> +	.remove = hid_generic_remove,
>   };
>   module_hid_driver(hid_generic);
>   
> diff --git a/drivers/hid/hid-lamparray.c b/drivers/hid/hid-lamparray.c
> new file mode 100644
> index 000000000000..5be46fff0191
> --- /dev/null
> +++ b/drivers/hid/hid-lamparray.c
> @@ -0,0 +1,855 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * hid-lamparray.c - HID LampArray helper module (single-zone RGB)
> + *
> + * Helper module for HID drivers supporting devices that expose a
> + * Lighting and Illumination (LampArray) application collection
> + * (usage page 0x59).
> + *
> + * The module provides a minimal integration with the LED subsystem
> + * and treats the device as a single zone: all lamps share one RGB
> + * value and a global brightness level. It does not implement multi-
> + * zone layouts or hardware effects.
> + *
> + *
> + * If enabled, one multicolor LED class device is registered under
> + * /sys/class/leds/<HID-ID> to expose the single-zone RGB control.
> + *
> + * The use_leds_uapi sysfs attribute is attached directly to the HID device
> + * under /sys/bus/hid/devices/<HID-ID>/use_leds_uapi.Writing 0 to use_leds_uapi
> + * unregisters the LED class device. The last state is kept cached. Writing 1
> + * registers it again and restores the cached state to hardware.
> + *
> + * State is cached as last known RGB + brightness. Setting sends a HID
> + * SET_REPORT. Getting issues a HID GET_REPORT and updates the cache on
> + * mismatch. Since the device is handled as single-zone, readback only queries
> + * lamp 0 when a lamp range is available.
> + *
> + * The module does not bind to devices on its own. Instead, a HID
> + * driver may query support via lamparray_is_supported_device() after
> + * hid_parse() and create an instance using lamparray_register().
> + *
> + * Copyright (C) 2026 Tim Guttzeit <tgu@tuxedocomputers.com>
> + */
> +
> +#include "hid-lamparray.h"
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +#include <linux/mutex.h>
> +#include <linux/bitops.h>
> +#include <linux/xarray.h>
> +
> +/* Constants */
> +
> +/* HID usages (LampArray, etc.) */
> +#define HID_LIGHTING_ILLUMINATION_USAGE_PAGE	0x0059
> +
> +#define HID_LAIP_LAMP_COUNT			0x0003
> +#define HID_LAIP_LAMP_ID			0x0021
> +#define HID_LAIP_RED_UPDATE_CHANNEL		0x0051
> +#define HID_LAIP_GREEN_UPDATE_CHANNEL		0x0052
> +#define HID_LAIP_BLUE_UPDATE_CHANNEL		0x0053
> +#define HID_LAIP_INTENSITY_UPDATE_CHANNEL	0x0054
> +#define HID_LAIP_LAMP_ID_START			0x0061
> +#define HID_LAIP_LAMP_ID_END			0x0062
> +#define HID_LAIP_AUTONOMOUS_MODE		0x0071
> +
> +#define HID_APPLICATION_COLLECTION_USAGE_TYPE	0x0001
> +
> +/* Device state */
> +
> +struct lamparray_quirks {
> +	unsigned long flags;
> +	int fixed_lamp_count;
> +};
> +
> +#define LAMPARRAY_QUIRK_LAMPCOUNT_FIXED BIT(0)
> +
> +struct lamparray_quirk_entry {
> +	u16 vendor;
> +	u16 product;
> +	unsigned long flags;
> +	int fixed_lamp_count;
> +};
> +
> +static const struct lamparray_quirk_entry lamparray_quirk_table[] = {
> +	{ 0xcafe, 0x4005, LAMPARRAY_QUIRK_LAMPCOUNT_FIXED, 12 },
> +	{}
> +};
> +
> +static const struct lamparray_quirk_entry *
> +lamparray_lookup_quirks(struct hid_device *hdev)
> +{
> +	const struct lamparray_quirk_entry *e;
> +
> +	for (e = lamparray_quirk_table; e->vendor; e++) {
> +		if (hdev->vendor == e->vendor && hdev->product == e->product)
> +			return e;
> +	}
> +	return NULL;
> +}
> +
> +struct lamparray_device {
> +	const struct lamparray_quirk_entry *quirks;
> +
> +	struct hid_device *hdev;
> +	struct hid_report *update_report;
> +
> +	struct hid_field *red_field;
> +	int red_index;
> +	struct hid_field *green_field;
> +	int green_index;
> +	struct hid_field *blue_field;
> +	int blue_index;
> +	struct hid_field *intensity_field;
> +	int intensity_index;
> +
> +	struct hid_report *autonomous_report;
> +	struct hid_field *autonomous_field;
> +
> +	struct hid_field *range_start_field;
> +	int range_start_index;
> +
> +	struct hid_field *range_end_field;
> +	int range_end_index;
> +
> +	struct hid_field *lamp_count_field;
> +	int lamp_count;
> +	int lamp_count_index;
> +
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subleds[3];
> +
> +	struct mutex lock; /* protects cached state and HID access */
> +
> +	u8 last_r;
> +	u8 last_g;
> +	u8 last_b;
> +	enum led_brightness last_brightness;
> +
> +	bool use_leds_uapi;
> +	bool led_registered;
> +};
> +
> +/*
> + * Opaque handle exposed to callers via the header.
> + * Keep the actual state in lamparray_device, but return a stable pointer.
> + */
> +struct lamparray {
> +	struct lamparray_device ldev;
> +};
> +
> +static DEFINE_XARRAY(lamparray_by_hdev);
> +
> +/* HID helper functions */
> +
> +#ifdef DEBUG
> +static void lamparray_dump_reports(struct hid_device *hdev)
> +{
> +	struct hid_report_enum *re;
> +	struct hid_report *report;
> +	int i, j, report_type;
> +
> +	for (report_type = 0; report_type < HID_REPORT_TYPES; report_type++) {
> +		re = &hdev->report_enum[report_type];
> +		hid_dbg(hdev, "Dumping reports for report type %d",
> +			report_type);
> +		list_for_each_entry(report, &re->report_list, list) {
> +			hid_dbg(hdev,
> +				"lamparray: report id=%u type=%d maxfield=%u\n",
> +				report->id, report->type, report->maxfield);
> +
> +			for (i = 0; i < report->maxfield; i++) {
> +				struct hid_field *field = report->field[i];
> +
> +				for (j = 0; j < field->maxusage; j++) {
> +					u32 usage = field->usage[j].hid;
> +					u16 page = usage >> 16;
> +					u16 id = usage & 0xFFFF;
> +
> +					hid_dbg(hdev,
> +						"lamparray: report %u field %d usage[%d]: page=0x%04x id=0x%04x\n",
> +						report->id, i, j, page, id);
> +				}
> +			}
> +		}
> +	}
> +}
> +#else
> +static inline void lamparray_dump_reports(struct hid_device *hdev)
> +{}
> +#endif
> +
> +static int lamparray_read_lamp_count(struct lamparray_device *ldev)
> +{
> +	struct hid_device *hdev = ldev->hdev;
> +	struct hid_report *report;
> +
> +	if (ldev->quirks &&
> +	    (ldev->quirks->flags & LAMPARRAY_QUIRK_LAMPCOUNT_FIXED)) {
> +		ldev->lamp_count = ldev->quirks->fixed_lamp_count;
> +		hid_dbg(hdev, "LampCount from quirk: %d\n", ldev->lamp_count);
> +		return 0;
> +	}
> +	if (!ldev->lamp_count_field) {
> +		hid_warn(hdev, "No LampCount field found\n");
> +		return -ENODEV;
> +	}
> +
> +	report = ldev->lamp_count_field->report;
> +
> +	if (!report) {
> +		hid_warn(hdev, "LampCount field has no report\n");
> +		return -ENODEV;
> +	}
> +	hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
> +	ldev->lamp_count =
> +		ldev->lamp_count_field->value[ldev->lamp_count_index];
> +
> +	hid_dbg(hdev, "LampCount from device: %d\n", ldev->lamp_count);
> +
> +	if (ldev->lamp_count <= 0) {
> +		hid_warn(hdev, "LampCount is %d (invalid)\n", ldev->lamp_count);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lamparray_parse_update_report(struct lamparray_device *ldev)
> +{
> +	struct hid_device *hdev = ldev->hdev;
> +	struct hid_report_enum *re;
> +	struct hid_report *report;
> +	struct hid_field *field;
> +	int i, j;
> +
> +	lamparray_dump_reports(hdev);
> +
> +	re = &hdev->report_enum[HID_FEATURE_REPORT];
> +
> +	list_for_each_entry(report, &re->report_list, list) {
> +		for (i = 0; i < report->maxfield; i++) {
> +			field = report->field[i];
> +			if (!field)
> +				continue;
> +
> +			if (!field->usage || !field->maxusage)
> +				continue;
> +
> +			for (j = 0; j < field->maxusage; j++) {
> +				u32 usage = field->usage[j].hid;
> +				u16 page = usage >> 16;
> +				u16 id = usage & 0xffff;
> +
> +				if (page !=
> +				    HID_LIGHTING_ILLUMINATION_USAGE_PAGE)
> +					continue;
> +				switch (id) {
> +				case HID_LAIP_LAMP_COUNT:
> +					ldev->lamp_count_field = field;
> +					ldev->lamp_count_index = j;
> +					break;
> +				case HID_LAIP_RED_UPDATE_CHANNEL:
> +					ldev->update_report = report;
> +					ldev->red_field = field;
> +					ldev->red_index = j;
> +					break;
> +				case HID_LAIP_GREEN_UPDATE_CHANNEL:
> +					ldev->update_report = report;
> +					ldev->green_field = field;
> +					ldev->green_index = j;
> +					break;
> +				case HID_LAIP_BLUE_UPDATE_CHANNEL:
> +					ldev->update_report = report;
> +					ldev->blue_field = field;
> +					ldev->blue_index = j;
> +					break;
> +				case HID_LAIP_INTENSITY_UPDATE_CHANNEL:
> +					ldev->update_report = report;
> +					ldev->intensity_field = field;
> +					ldev->intensity_index = j;
> +					break;
> +				case HID_LAIP_LAMP_ID_START:
> +					ldev->range_start_field = field;
> +					ldev->range_start_index = j;
> +					break;
> +				case HID_LAIP_LAMP_ID_END:
> +					ldev->range_end_field = field;
> +					ldev->range_end_index = j;
> +					break;
> +				case HID_LAIP_AUTONOMOUS_MODE:
> +					ldev->autonomous_field = field;
> +					ldev->autonomous_report = report;
> +					break;
> +				default:
> +					break;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (!ldev->update_report || !ldev->red_field || !ldev->green_field ||
> +	    !ldev->blue_field || !ldev->autonomous_report || !ldev->autonomous_field)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int lamparray_hw_set_autonomous(struct lamparray_device *ldev,
> +				       bool enable)
> +{
> +	struct hid_device *hdev = ldev->hdev;
> +	struct hid_field *field = ldev->autonomous_field;
> +	struct hid_report *report = ldev->autonomous_report;
> +
> +	if (!field || !report)
> +		return -ENODEV;
> +
> +	field->value[0] = enable ? 1 : 0;
> +
> +	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
> +	return 0;
> +}
> +
> +static int lamparray_hw_set_state(struct lamparray_device *ldev, u8 r, u8 g,
> +				  u8 b, u8 intensity)
> +{
> +	struct hid_device *hdev = ldev->hdev;
> +	struct hid_report *report = ldev->update_report;
> +	int i, j;
> +
> +	if (!report || !ldev->red_field || !ldev->green_field ||
> +	    !ldev->blue_field || !ldev->intensity_field)
> +		return -ENODEV;
> +
> +	if (ldev->range_start_field && ldev->range_end_field) {
> +		ldev->range_start_field->value[ldev->range_start_index] = 0;
> +		ldev->range_end_field->value[ldev->range_end_index] = ldev->lamp_count - 1;
> +	}
> +
> +	for (i = 0; i < report->maxfield; i++) {
> +		struct hid_field *field = report->field[i];
> +
> +		if (!field || !field->usage || !field->maxusage)
> +			continue;
> +
> +		for (j = 0; j < field->maxusage; j++) {
> +			u32 usage = field->usage[j].hid;
> +			u16 page = usage >> 16;
> +			u16 id = usage & 0xffff;
> +
> +			if (page != HID_LIGHTING_ILLUMINATION_USAGE_PAGE)
> +				continue;
> +
> +			switch (id) {
> +			case HID_LAIP_RED_UPDATE_CHANNEL:
> +				field->value[j] = r;
> +				break;
> +			case HID_LAIP_GREEN_UPDATE_CHANNEL:
> +				field->value[j] = g;
> +				break;
> +			case HID_LAIP_BLUE_UPDATE_CHANNEL:
> +				field->value[j] = b;
> +				break;
> +			case HID_LAIP_INTENSITY_UPDATE_CHANNEL:
> +				field->value[j] = intensity;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
> +
> +	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
> +	return 0;
> +}
> +
> +static int lamparray_hw_get_state(struct lamparray_device *ldev, u8 *r, u8 *g,
> +				  u8 *b, enum led_brightness *brightness)
> +{
> +	struct hid_device *hdev = ldev->hdev;
> +	struct hid_report *report = ldev->update_report;
> +
> +	if (!report || !ldev->red_field || !ldev->green_field ||
> +	    !ldev->blue_field || !ldev->intensity_field)
> +		return -ENODEV;
> +
> +	if (!r || !g || !b || !brightness)
> +		return -EINVAL;
> +
> +	/* Single-zone: Reading lamp 0 only suffices */
> +	if (ldev->range_start_field && ldev->range_end_field) {
> +		ldev->range_start_field->value[ldev->range_start_index] = 0;
> +		ldev->range_end_field->value[ldev->range_end_index] = 0;
> +	}
> +
> +	hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
> +
> +	*r = ldev->red_field->value[ldev->red_index];
> +	*g = ldev->green_field->value[ldev->green_index];
> +	*b = ldev->blue_field->value[ldev->blue_index];
> +	*brightness = ldev->intensity_field->value[ldev->intensity_index];
> +
> +	return 0;
> +}
> +
> +/* Helper functions */
> +
> +static int lamparray_restore_state(struct lamparray_device *ldev)
> +{
> +	u8 r, g, b;
> +	int ret;
> +	enum led_brightness brightness;
> +
> +	mutex_lock(&ldev->lock);
> +
> +	if (!ldev->use_leds_uapi) {
> +		mutex_unlock(&ldev->lock);
> +		return 0;
> +	}
> +
> +	r = ldev->last_r;
> +	g = ldev->last_g;
> +	b = ldev->last_b;
> +	brightness = ldev->last_brightness;
> +
> +	ldev->mc_cdev.subled_info[0].brightness = r;
> +	ldev->mc_cdev.subled_info[1].brightness = g;
> +	ldev->mc_cdev.subled_info[2].brightness = b;
> +	ldev->mc_cdev.led_cdev.brightness = brightness;
> +
> +	mutex_unlock(&ldev->lock);
> +
> +	ret = lamparray_hw_set_state(ldev, r, g, b, brightness);
> +	return ret;
> +}
> +
> +/* LEDs API */
> +
> +static int lamparray_led_brightness_set(struct led_classdev *cdev,
> +					enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> +	struct lamparray_device *ldev =
> +		container_of(mc, struct lamparray_device, mc_cdev);
> +	struct lamparray *la = container_of(ldev, struct lamparray, ldev);
> +	u8 r, g, b;
> +	int ret;
> +
> +	if (!la)
> +		return -ENODEV;
> +	ldev = &la->ldev;
> +
> +	ret = led_mc_calc_color_components(mc, brightness);
> +	if (ret)
> +		return ret;
> +
> +	r = mc->subled_info[0].brightness;
> +	g = mc->subled_info[1].brightness;
> +	b = mc->subled_info[2].brightness;
> +
> +	ret = lamparray_hw_set_state(ldev, r, g, b, brightness);
> +	if (ret)
> +		hid_err(ldev->hdev, "Failed to send LampArray update: %d\n",
> +			ret);
> +
> +	mutex_lock(&ldev->lock);
> +	ldev->last_r = r;
> +	ldev->last_g = g;
> +	ldev->last_b = b;
> +	ldev->last_brightness = brightness;
> +	mutex_unlock(&ldev->lock);
> +
> +	return 0;
> +}
> +
> +static enum led_brightness
> +lamparray_led_brightness_get(struct led_classdev *cdev)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> +	struct lamparray_device *ldev =
> +		container_of(mc, struct lamparray_device, mc_cdev);
> +	enum led_brightness brightness;
> +	struct lamparray *la = container_of(ldev, struct lamparray, ldev);
> +	u8 rr, gg, bb;
> +	enum led_brightness br;
> +	int ret;
> +
> +	/* Default: cache (also used while registering LED classdev) */
> +	mutex_lock(&ldev->lock);
> +	brightness = ldev->last_brightness;
> +	mutex_unlock(&ldev->lock);
> +
> +	/* Only do HID readback after registration completed */
> +	if (READ_ONCE(ldev->led_registered)) {
> +		if (!la)
> +			return brightness;
> +		ldev = &la->ldev;
> +
> +		ret = lamparray_hw_get_state(ldev, &rr, &gg, &bb, &br);
> +		if (ret) {
> +			hid_warn(ldev->hdev,
> +				 "Failed to read LampArray state (%d), using cached brightness %u\n",
> +				 ret, brightness);
> +			return brightness;
> +		}
> +
> +		mutex_lock(&ldev->lock);
> +		if (ldev->last_r != rr || ldev->last_g != gg ||
> +		    ldev->last_b != bb || ldev->last_brightness != br) {
> +			ldev->last_r = rr;
> +			ldev->last_g = gg;
> +			ldev->last_b = bb;
> +			ldev->last_brightness = br;
> +
> +			if (ldev->led_registered && ldev->mc_cdev.subled_info) {
> +				ldev->mc_cdev.subled_info[0].brightness = rr;
> +				ldev->mc_cdev.subled_info[1].brightness = gg;
> +				ldev->mc_cdev.subled_info[2].brightness = bb;
> +			}
> +		}
> +		mutex_unlock(&ldev->lock);
> +		return br;
> +	}
> +	return brightness;
> +}
> +
> +static int lamparray_register_led(struct lamparray_device *ldev)
> +{
> +	struct device *dev = &ldev->hdev->dev;
> +	struct led_classdev *cdev = &ldev->mc_cdev.led_cdev;
> +	u8 r_i, g_i, b_i;
> +	int ret;
> +
> +	mutex_lock(&ldev->lock);
> +
> +	if (ldev->led_registered) {
> +		mutex_unlock(&ldev->lock);
> +		return 0;
> +	}
> +
> +	if (!cdev->name) {
> +		cdev->name =
> +			devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
> +		if (!cdev->name) {
> +			mutex_unlock(&ldev->lock);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	cdev->max_brightness = 255;
> +	cdev->brightness_set_blocking = lamparray_led_brightness_set;
> +	cdev->brightness_get = lamparray_led_brightness_get;
> +	cdev->brightness = ldev->last_brightness;
> +
> +	ldev->subleds[0].color_index = LED_COLOR_ID_RED;
> +	ldev->subleds[1].color_index = LED_COLOR_ID_GREEN;
> +	ldev->subleds[2].color_index = LED_COLOR_ID_BLUE;
> +
> +	/*
> +	 * Initialize the color mix (multi_intensity) from the last known HW/init
> +	 * state so that writing only /brightness scales the expected default color
> +	 * instead of white.
> +	 *
> +	 * If last_brightness is non-zero, treat last_r/g/b as per-channel
> +	 * brightness and normalize back to intensities (0..255).
> +	 * If last_brightness is zero, keep last_r/g/b as the intended mix.
> +	 */
> +	if (ldev->last_brightness) {
> +		r_i = (u8)min_t(unsigned int, 255,
> +				(ldev->last_r * 255u) / ldev->last_brightness);
> +		g_i = (u8)min_t(unsigned int, 255,
> +				(ldev->last_g * 255u) / ldev->last_brightness);
> +		b_i = (u8)min_t(unsigned int, 255,
> +				(ldev->last_b * 255u) / ldev->last_brightness);
> +	} else {
> +		r_i = ldev->last_r;
> +		g_i = ldev->last_g;
> +		b_i = ldev->last_b;
> +	}
> +
> +	ldev->subleds[0].intensity = r_i;
> +	ldev->subleds[1].intensity = g_i;
> +	ldev->subleds[2].intensity = b_i;
> +
> +	ldev->mc_cdev.subled_info = ldev->subleds;
> +	ldev->mc_cdev.num_colors = ARRAY_SIZE(ldev->subleds);
> +
> +	/* Ensure subled_info[].brightness matches intensity + brightness */
> +	led_mc_calc_color_components(&ldev->mc_cdev, cdev->brightness);
> +
> +	ldev->mc_cdev.subled_info = ldev->subleds;
> +	ldev->mc_cdev.num_colors = ARRAY_SIZE(ldev->subleds);
> +
> +	mutex_unlock(&ldev->lock);
> +
> +	ret = led_classdev_multicolor_register(dev, &ldev->mc_cdev);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&ldev->lock);
> +	ldev->led_registered = true;
> +	mutex_unlock(&ldev->lock);
> +
> +	return 0;
> +}
> +
> +static void lamparray_unregister_led(struct lamparray_device *ldev)
> +{
> +	bool was_registered;
> +
> +	mutex_lock(&ldev->lock);
> +	was_registered = ldev->led_registered;
> +	ldev->led_registered = false;
> +	mutex_unlock(&ldev->lock);
> +
> +	if (!was_registered)
> +		return;
> +
> +	led_classdev_multicolor_unregister(&ldev->mc_cdev);
> +}
> +
> +/* Sysfs */
> +
> +static struct lamparray_device *
> +lamparray_ldev_from_sysfs_dev(struct device *dev)
> +{
> +	struct hid_device *hdev = to_hid_device(dev);
> +
> +	return xa_load(&lamparray_by_hdev, (unsigned long)hdev);
> +}
> +
> +static ssize_t use_leds_uapi_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct lamparray_device *ldev = lamparray_ldev_from_sysfs_dev(dev);
> +
> +	if (!ldev)
> +		return -ENODEV;
> +
> +	return sysfs_emit(buf, "%d\n", ldev->use_leds_uapi);
> +}
> +
> +static ssize_t use_leds_uapi_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct lamparray_device *ldev = lamparray_ldev_from_sysfs_dev(dev);
> +	int val;
> +	int old_val;
> +	int ret;
> +
> +	if (!ldev)
> +		return -ENODEV;
> +
> +	ret = kstrtoint(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != 0 && val != 1)
> +		return -EINVAL;
> +
> +	mutex_lock(&ldev->lock);
> +	old_val = ldev->use_leds_uapi;
> +
> +	if (val == old_val) {
> +		mutex_unlock(&ldev->lock);
> +		return count;
> +	}
> +
> +	ldev->use_leds_uapi = val;
> +	mutex_unlock(&ldev->lock);
> +
> +	if (val == 1) {
> +		ret = lamparray_register_led(ldev);
> +		if (ret) {
> +			mutex_lock(&ldev->lock);
> +			ldev->use_leds_uapi = old_val;
> +			mutex_unlock(&ldev->lock);
> +			return ret;
> +		}
> +		ret = lamparray_restore_state(ldev);
> +		if (ret) {
> +			hid_err(ldev->hdev, "Could not restore state: %d", ret);
> +			return ret;
> +		}
> +
> +	} else {
> +		lamparray_unregister_led(ldev);
> +	}
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(use_leds_uapi);
> +
> +static struct attribute *lamparray_attrs[] = {
> +	&dev_attr_use_leds_uapi.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lamparray_attr_group = {
> +	.attrs = lamparray_attrs,
> +};
> +
> +static int lamparray_register_sysfs(struct lamparray_device *ldev)
> +{
> +	struct device *dev = &ldev->hdev->dev;
> +	int ret;
> +
> +	ret = sysfs_create_group(&dev->kobj, &lamparray_attr_group);
> +	if (ret)
> +		hid_err(ldev->hdev,
> +			"Failed to create lamparray sysfs group: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void lamparray_remove_sysfs(struct lamparray_device *ldev)
> +{
> +	sysfs_remove_group(&ldev->hdev->dev.kobj, &lamparray_attr_group);
> +}
> +
> +/* Public API */
> +
> +bool lamparray_is_supported_device(struct hid_device *hdev)
> +{
> +	unsigned int i;
> +
> +	hid_dbg(hdev, "lamparray: walking %u collections\n",
> +		hdev->maxcollection);
> +
> +	for (i = 0; i < hdev->maxcollection; i++) {
> +		struct hid_collection *col = &hdev->collection[i];
> +		u16 page = (col->usage & HID_USAGE_PAGE) >> 16;
> +		u16 code = col->usage & HID_USAGE;
> +
> +		hid_dbg(hdev,
> +			"lamparray:  collection[%u]: type=%u level=%u usage=0x%08x page=0x%04x code=0x%04x\n",
> +			i, col->type, col->level, col->usage, page, code);
> +
> +		if (col->type == HID_COLLECTION_APPLICATION &&
> +		    page == HID_LIGHTING_ILLUMINATION_USAGE_PAGE &&
> +		    code == HID_APPLICATION_COLLECTION_USAGE_TYPE) {
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(lamparray_is_supported_device);
> +
> +struct lamparray *
> +lamparray_register(struct hid_device *hdev,
> +		   const struct lamparray_init_state *led_init_state)
> +{
> +	int ret;
> +	struct lamparray *la;
> +	struct lamparray_device *ldev;
> +
> +	if (!hdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	la = kzalloc(sizeof(*la), GFP_KERNEL);
> +	if (!la)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ldev = &la->ldev;
> +
> +	mutex_init(&ldev->lock);
> +	ldev->hdev = hdev;
> +	ldev->quirks = lamparray_lookup_quirks(hdev);
> +	ldev->use_leds_uapi = 1;
> +	ldev->led_registered = false;
> +	if (!led_init_state) {
> +		ldev->last_r = 255;
> +		ldev->last_g = 255;
> +		ldev->last_b = 255;
> +		ldev->last_brightness = LED_OFF;
> +	} else {
> +		ldev->last_r = led_init_state->r;
> +		ldev->last_g = led_init_state->g;
> +		ldev->last_b = led_init_state->b;
> +		ldev->last_brightness = led_init_state->brightness;
> +	}
> +	ret = lamparray_parse_update_report(ldev);
> +	if (ret) {
> +		hid_err(hdev, "No LampArray update report found: %d\n", ret);
> +		goto err_free;
> +	}
> +
> +	ret = lamparray_read_lamp_count(ldev);
> +	if (ret) {
> +		hid_err(hdev,
> +			"Could not determine LampCount. This device needs a quirk for a fixed LampCount: %d\n",
> +			ret);
> +		goto err_unregister_led;
> +	}
> +
> +	ret = lamparray_register_led(ldev);
> +	if (ret) {
> +		hid_warn(hdev, "Failed to register LED UAPI: %d\n", ret);
> +		mutex_lock(&ldev->lock);
> +		ldev->use_leds_uapi = 0;
> +		mutex_unlock(&ldev->lock);
> +	}
> +
> +	ret = xa_err(xa_store(&lamparray_by_hdev, (unsigned long)hdev, ldev,
> +			      GFP_KERNEL));
> +	if (ret)
> +		goto err_unregister_led;
> +
> +	ret = lamparray_register_sysfs(ldev);
> +	if (ret)
> +		goto err_xa_erase;
> +
> +	ret = lamparray_hw_set_autonomous(ldev, false);
> +	if (ret) {
> +		hid_err(hdev, "Could not disable autonomous mode: %d", ret);
> +		goto err_remove_sysfs;
> +	}
> +
> +	hid_info(hdev, "LampArray device registered\n");
> +
> +	ret = lamparray_restore_state(ldev);
> +	if (ret) {
> +		hid_err(hdev, "Failed to set standard state: %d", ret);
> +		goto err_remove_sysfs;
> +	}
> +	return la;
> +
> +err_remove_sysfs:
> +	lamparray_remove_sysfs(ldev);
> +err_xa_erase:
> +	xa_erase(&lamparray_by_hdev, (unsigned long)hdev);
> +err_unregister_led:
> +	lamparray_unregister_led(ldev);
> +err_free:
> +	kfree(la);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(lamparray_register);
> +
> +void lamparray_unregister(struct lamparray *la)
> +{
> +	struct lamparray_device *ldev;
> +
> +	if (!la)
> +		return;
> +
> +	ldev = &la->ldev;
> +
> +	lamparray_unregister_led(ldev);
> +	lamparray_remove_sysfs(ldev);
> +	xa_erase(&lamparray_by_hdev, (unsigned long)ldev->hdev);
> +
> +	kfree(la);
> +}
> +EXPORT_SYMBOL_GPL(lamparray_unregister);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("HID LampArray helper module (single-zone RGB)");
> diff --git a/drivers/hid/hid-lamparray.h b/drivers/hid/hid-lamparray.h
> new file mode 100644
> index 000000000000..ac3edd366a5b
> --- /dev/null
> +++ b/drivers/hid/hid-lamparray.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef _HID_LAMPARRAY_H
> +#define _HID_LAMPARRAY_H
> +
> +#include <linux/types.h>
> +#include <linux/leds.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +
> +struct hid_device;
> +struct lamparray;
> +
> +/*
> + * Optional initial LED state for lamparray_register().
> + * Used to define the initial state of a LampArray's LEDs.
> + */
> +struct lamparray_init_state {
> +	u8 r;
> +	u8 g;
> +	u8 b;
> +	enum led_brightness brightness;
> +};
> +
> +#if IS_ENABLED(CONFIG_HID_LAMPARRAY)
> +
> +/**
> + * lamparray_is_supported_device() - check whether a HID device supports LampArray
> + * @hdev: HID device to inspect
> + *
> + * Check whether the given HID device exposes a Lighting/LampArray application
> + * collection as defined by the HID Lighting specification.
> + *
> + * This helper can be used by HID drivers to determine whether LampArray
> + * functionality should be enabled for a device.
> + *
> + * Return: %true if LampArray support is detected, %false otherwise.
> + */
> +bool lamparray_is_supported_device(struct hid_device *hdev);
> +
> +/**
> + * lamparray_register() - initialize LampArray support for a HID device
> + * @hdev: HID device
> + * @led_init_state: Optional LED state at init specification
> + *
> + * Allocate and initialize internal LampArray state for the given HID device.
> + * The function parses required HID reports and fields and registers the
> + * associated miscdevice and sysfs attributes.
> + *
> + * If enabled, a multicolor LED class device is also registered to expose the
> + * LampArray functionality via the LED subsystem. If specified, the desired
> + * initial LED state is applied. If led_init_state is NULL, a default state is
> + * applied.
> + *
> + * Return: pointer to a LampArray handle on success, or ERR_PTR() on failure.
> + */
> +struct lamparray *lamparray_register(struct hid_device *hdev,
> +				     const struct lamparray_init_state *led_init_state);
> +
> +/**
> + * lamparray_unregister() - tear down LampArray support
> + * @la: LampArray handle returned by lamparray_register()
> + *
> + * Remove all resources associated with a LampArray instance.
> + *
> + * This unregisters the LED class device (if present), removes the miscdevice
> + * and sysfs interfaces and frees all internal state associated with @la.
> + */
> +void lamparray_unregister(struct lamparray *la);
> +
> +#else /* !CONFIG_HID_LAMPARRAY */
> +
> +static inline bool lamparray_is_supported_device(struct hid_device *hdev)
> +{
> +	return false;
> +}
> +
> +static inline struct lamparray *
> +lamparray_register(struct hid_device *hdev,
> +		   const struct lamparray_init_state *led_init_state)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +static inline void lamparray_unregister(struct lamparray *la)
> +{
> +}
> +
> +#endif /* CONFIG_HID_LAMPARRAY */
> +
> +#endif /* _HID_LAMPARRAY_H */

