Return-Path: <linux-leds+bounces-7964-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XAiMF97K92klmQIAu9opvQ
	(envelope-from <linux-leds+bounces-7964-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 00:23:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F54B7ACE
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 00:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3A8E3005756
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 22:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C256374187;
	Sun,  3 May 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dcQlmnOq"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938D21D3D6
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 22:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777847003; cv=none; b=Ras9BM2xMID3uV5SVPUbmaJjsHqeOe/i2AQRhLPhAPTFik/cKi/Fr+3DnHrfTckGp/a3eCZmrUXNalrExtOPDkAq4iBiIbXXVkOJ2Ied+G0HU8Lot6NocYMiXhmgUzivVSYAHCs/QfTDF0vkI/BWQOue/Rt+S71mMiktzrOptY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777847003; c=relaxed/simple;
	bh=9fhISSEjEljI+YFj2CEgMlJYTahbYUFiMYNtnnbK9xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRbPoxNR/ZJ2fswJAZYiG6Ghule6q5NRFc0c9t/DTEKTJCTwQMuleM+smg+FaKLYv+i7Yr8w9DfNQc4ni/QFS4T5E22vw+nab5WdmX62WuGZY2/W1Da2Mjky2nA9mROedgOI8UfyNyzUi6r5QlBBB1P4desd66fOYDBC8ME+hdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dcQlmnOq; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <2974e45f-24ff-4999-be0e-02cf2e00ed59@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777846999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJy9agwAL2TNxkPqvEGKUYqRpmr/ZbXYC7ogel4yNy4=;
	b=dcQlmnOqURdSyOFWBwF5URbFd+zJvlItR/pqLEIXBQboCqflAtH9yJsmWG08AYMgMlr1Zb
	knv+DRFz3+bgCKCEiEU4Ug95Bqmb2WAF1o18HlIU7x4onJJyMaoFD6d8osN7JqGlyAd0oZ
	Q4JEwSUkrAzCWQVT5lfvtC4K28BFtn0=
Date: Mon, 4 May 2026 00:23:17 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] HID: asus: add support for T3304 detachable keyboard
To: James Ye <jye836@gmail.com>, jikos@kernel.org, bentiss@kernel.org,
 lee@kernel.org, pavel@kernel.org
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260503072643.2774762-1-jye836@gmail.com>
 <20260503072643.2774762-4-jye836@gmail.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260503072643.2774762-4-jye836@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: A36F54B7ACE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7964-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[denis.benato@linux.dev,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]


On 5/3/26 09:26, James Ye wrote:
> ASUSTek Computer, Inc. T3304 Soft Keyboard [0b05:1aad] is the detachable
> keyboard of the ASUS Vivobook 13 Slate OLED (T3304). It presents as a
> USB device with two interfaces: a keyboard and a pointing device
> (touchpad).
>
> Basic keyboard and full touchpad functionality work out-of-the-box with
> hid-generic and hid-multitouch, but function key combos e.g. volume,
> brightness control, home/end/pgup/pgdown require initialization.
>
> Bind the keyboard interface to hid-asus for initialization. The
> OEM-specific report descriptors required for this are present only on
> the touchpad interface, not the keyboard, so a quirk is used to add the
> required feature descriptor.
Reviewed-By: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: James Ye <jye836@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 58 +++++++++++++++++++++++++++++++++++++++---
>  drivers/hid/hid-ids.h  |  1 +
>  2 files changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index ef9d5eba4dc9..e4c97fddfaf1 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -99,6 +99,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD	BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
>  #define QUIRK_HID_FN_LOCK		BIT(14)
> +#define QUIRK_T3304_KEYBOARD		BIT(15)
>
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -494,6 +495,14 @@ static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  		return ret;
>  	}
>
> +	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> +
> +	/* T3304 keyboard always replies with 16 0xff bytes. Don't check for
> +	 * acknowledgment.
> +	 */
> +	if (drvdata->quirks & QUIRK_T3304_KEYBOARD)
> +		return 0;
> +
>  	u8 *readbuf __free(kfree) = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
>  	if (!readbuf)
>  		return -ENOMEM;
> @@ -1312,10 +1321,12 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>
>  	/*
> -	 * For ROG keyboards, skip rename for consistency and ->input check as
> -	 * some devices do not have inputs.
> +	 * For ROG and T3304 keyboards, skip rename for consistency.
> +	 * For ROG keyboards, skip ->input check as some devices do not have
> +	 * inputs.
>  	 */
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD ||
> +	    drvdata->quirks & QUIRK_T3304_KEYBOARD)
>  		return 0;
>
>  	/*
> @@ -1369,6 +1380,22 @@ static const __u8 asus_g752_fixed_rdesc[] = {
>          0x2A, 0xFF, 0x00,		/*   Usage Maximum (0xFF)       */
>  };
>
> +static const __u8 asus_t3304_fixed_rdesc[] = {
> +	0x06, 0x31, 0xff,              // Usage Page (Vendor Usage Page 0xff31)
> +	0x09, 0x76,                    // Usage (Vendor Usage 0x76)
> +	0xa1, 0x01,                    // Collection (Application)
> +	0x05, 0xff,                    //  Usage Page (Vendor Usage Page 0xff)
> +	0x85, 0x5a,                    //  Report ID (90)
> +	0x19, 0x00,                    //  Usage Minimum (0)
> +	0x2a, 0xff, 0x00,              //  Usage Maximum (255)
> +	0x15, 0x00,                    //  Logical Minimum (0)
> +	0x26, 0xff, 0x00,              //  Logical Maximum (255)
> +	0x75, 0x08,                    //  Report Size (8)
> +	0x95, 0x0f,                    //  Report Count (15)
> +	0xb1, 0x02,                    //  Feature (Data,Var,Abs)
> +	0xc0,                          // End Collection
> +};
> +
>  static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		unsigned int *rsize)
>  {
> @@ -1473,6 +1500,28 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		}
>  	}
>
> +	/* T3304 keyboard's vendor descriptors are on the touchpad interface,
> +	 * not the keyboard. But we need hid-multitouch to handle the touchpad,
> +	 * Add a descriptor with only the config report so that this driver can
> +	 * perform initialization.
> +	 */
> +	if (drvdata->quirks & QUIRK_T3304_KEYBOARD) {
> +		__u8 *new_rdesc;
> +		size_t new_size = *rsize + sizeof(asus_t3304_fixed_rdesc);
> +
> +		new_rdesc = devm_kzalloc(&hdev->dev, new_size, GFP_KERNEL);
> +		if (new_rdesc == NULL)
> +			return rdesc;
> +
> +		hid_info(hdev, "Fixing up Asus T3304 keyboard report descriptor\n");
> +		memcpy(new_rdesc, rdesc, *rsize);
> +		memcpy(new_rdesc + *rsize, asus_t3304_fixed_rdesc,
> +		       sizeof(asus_t3304_fixed_rdesc));
> +
> +		*rsize = new_size;
> +		rdesc = new_rdesc;
> +	}
> +
>  	return rdesc;
>  }
>
> @@ -1536,6 +1585,9 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T3304_KEYBOARD),
> +	  QUIRK_T3304_KEYBOARD },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(hid, asus_devices);
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0cf63742315b..ecf30e36a99d 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -219,6 +219,7 @@
>  #define USB_DEVICE_ID_ASUSTEK_T100CHI_KEYBOARD	0x8502
>  #define USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD	0x183d
>  #define USB_DEVICE_ID_ASUSTEK_T304_KEYBOARD	0x184a
> +#define USB_DEVICE_ID_ASUSTEK_T3304_KEYBOARD	0x1aad
>  #define USB_DEVICE_ID_ASUSTEK_I2C_KEYBOARD	0x8585
>  #define USB_DEVICE_ID_ASUSTEK_I2C_TOUCHPAD	0x0101
>  #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
> --
> 2.54.0

