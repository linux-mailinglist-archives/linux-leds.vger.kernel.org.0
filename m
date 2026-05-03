Return-Path: <linux-leds+bounces-7965-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCSXCADQ92nBmQIAu9opvQ
	(envelope-from <linux-leds+bounces-7965-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 00:45:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 896044B7B41
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 00:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C4BB300514A
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 22:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D16382F10;
	Sun,  3 May 2026 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TYh54jYt"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF441A238F
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 22:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777848317; cv=none; b=tPgwqRfroWoNz7h66bKXh8F9ojkQlbKintlIhkYWWU27DCw2Bc7ykpAV3ecsRU68//Tki+j+R0+mLDD7PYAsPZoRbqjLozqM1uTgDP/MKvnVLuopKJ3uhj7h0JNSG36rPuHQkha0vz0NFY1ry0klMCLlrGgASQLBt+ZrPFqARPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777848317; c=relaxed/simple;
	bh=jEBnJL30isogjB1gWG2CwQutedg1PqXtxnHBHMZXP4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfhk2iHoXcDb/yQUBXF+XiJjrpABsKpQtka1H1Qtk2742H1XpNEmpWhDUYJeSMn/OvGru17D0CAUjdy8Wux4HEYMZUKdkFJlWd/oy8FqcoBNxiURQ6cGwTyCnN/vJ0gyczSVG++t2Sbq3/LhGF+DsflaZujPQFMkFjDH+cxYcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TYh54jYt; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <769ce05a-3148-408f-b012-74a85c1a2343@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777848303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09YnTtSFx5JEHn5ZHH5nW53KtVkIO6gYciU7VNJW1rg=;
	b=TYh54jYtmIXvyXtVidvFYKWnJRszjGA/Qmx4+W/JnE1W8MsVE2w77CbS7B1vtM/lQKUPho
	n2ggteMmZsdspDqihgSi0Zw/mY+l7fwwnq4G6oIolQrdO0WGWZ1Erm1H1EmkWMGhqjtA8J
	mZlpifPe+GU0n+I8MSv4x5yOfYOUdvs=
Date: Mon, 4 May 2026 00:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] HID: asus: add microphone mute LED support for T3304
To: James Ye <jye836@gmail.com>, jikos@kernel.org, bentiss@kernel.org,
 lee@kernel.org, pavel@kernel.org
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260503072643.2774762-1-jye836@gmail.com>
 <20260503072643.2774762-6-jye836@gmail.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260503072643.2774762-6-jye836@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 896044B7B41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7965-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[denis.benato@linux.dev,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[]


On 5/3/26 09:26, James Ye wrote:
> T3304 keyboard has a microphone mute LED indicator on the same key
> (Fn+F9). Look this up with a led_classdev.
>
> It does not have backlight LEDs, so return without failure from
> asus_kbd_register_leds if backlight support is not present.
>
> Signed-off-by: James Ye <jye836@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 51 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index e4c97fddfaf1..4f68bc40b8bf 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -100,6 +100,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
>  #define QUIRK_HID_FN_LOCK		BIT(14)
>  #define QUIRK_T3304_KEYBOARD		BIT(15)
> +#define QUIRK_HID_MICMUTE		BIT(16)
>  
Isn't QUIRK_T3304_KEYBOARD enough? Or are you saying you know there is more than one keyboard
model that requires this?
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -144,6 +145,7 @@ struct asus_drvdata {
>  	unsigned long battery_next_query;
>  	struct work_struct fn_lock_sync_work;
>  	bool fn_lock;
> +	struct led_classdev led_micmute;
>  };
>  
>  static int asus_report_battery(struct asus_drvdata *, u8 *, int);
> @@ -578,6 +580,26 @@ static int asus_kbd_disable_oobe(struct hid_device *hdev)
>  	return 0;
>  }
>  
> +static int asus_kbd_set_micmute_led(struct hid_device *hdev, bool enabled)
> +{
> +	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xd0, 0x7c, enabled };
> +
> +	return asus_kbd_set_report(hdev, buf, sizeof(buf));
> +}
> +
> +static int asus_led_brightness_set(struct led_classdev *led_cdev,
> +		enum led_brightness value)
> +{
> +	struct device *dev = led_cdev->dev->parent;
> +	struct hid_device *hdev = to_hid_device(dev);
> +	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> +
> +	if (led_cdev == &drvdata->led_micmute)
> +		return asus_kbd_set_micmute_led(hdev, !!value);
> +
> +	return -ENODEV;
> +}
> +
>  static int asus_kbd_set_fn_lock(struct hid_device *hdev, bool enabled)
>  {
>  	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xd0, 0x4e, !!enabled };
> @@ -752,9 +774,31 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (drvdata->quirks & QUIRK_HID_MICMUTE) {
> +		char *name_micmute;
> +		size_t name_sz = strlen(dev_name(&hdev->dev)) + 16;
> +
Do we really want to use strlen?

Do we really want to use strlen on the result of a function without additional checks?
> +		name_micmute = devm_kzalloc(&hdev->dev, name_sz, GFP_KERNEL);
> +		if (name_micmute == NULL)
> +			return -ENOMEM;
> +
> +		snprintf(name_micmute, name_sz, "%s::micmute", dev_name(&hdev->dev));
> +		drvdata->led_micmute.name = name_micmute;
> +		drvdata->led_micmute.default_trigger = "audio-micmute";
> +		drvdata->led_micmute.brightness_set_blocking = asus_led_brightness_set;
> +		drvdata->led_micmute.max_brightness = 1;
> +		drvdata->led_micmute.flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> +		drvdata->led_micmute.dev = &hdev->dev;
> +		ret = devm_led_classdev_register(&hdev->dev, &drvdata->led_micmute);
> +		if (ret < 0) {
> +			hid_err(hdev, "Failed to register LED: %d.\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	/* Check for backlight support */
>  	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -		return -ENODEV;
> +		return 0;
>  
This doesn't look like a good idea to change this for all laptops under the sun...


Perhaps might make sense to move this check before? Maybe not?

Denis
>  	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>  		ret = asus_kbd_disable_oobe(hdev);
> @@ -1315,7 +1359,8 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  
>  	/* Laptops keyboard backlight is always at 0x5a */
> -	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> +	if (is_vendor &&
> +	    (drvdata->quirks & (QUIRK_USE_KBD_BACKLIGHT | QUIRK_HID_MICMUTE)) &&
>  	    (asus_has_report_id(hdev, FEATURE_KBD_REPORT_ID)) &&
>  		(asus_kbd_register_leds(hdev)))
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
> @@ -1587,7 +1632,7 @@ static const struct hid_device_id asus_devices[] = {
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T3304_KEYBOARD),
> -	  QUIRK_T3304_KEYBOARD },
> +	  QUIRK_T3304_KEYBOARD | QUIRK_HID_MICMUTE },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(hid, asus_devices);

