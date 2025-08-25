Return-Path: <linux-leds+bounces-5308-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77848B34948
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 19:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32BE03A4117
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 17:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3343009E4;
	Mon, 25 Aug 2025 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXPb7x2w"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF54C83;
	Mon, 25 Aug 2025 17:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756144130; cv=none; b=Z4/eo6pbWiDQhTov+Tt5+1+rlQ/SeewGXUcn+iiM3mLpf9gfUp50KUm9PdFjRTs6KHga4pQo0v+6/zKcwelOR9y5WStzknH/nRl6RE8gZLuGEQsA/cOljmGySIfrDKGKD3bi59EhE+Q4C+kjS3yt0BXepc+OSls6KYjaEdjQEvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756144130; c=relaxed/simple;
	bh=+RLS9KeKyLCwlFMsziZ86EgWGYyHUgQHVcrrxzylfCU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kAZzDl9OasJ6s9b5JpTaTramjRkntzpNq6ZVdZ5pM9dIz41HItFN0vLLAOPYj6wc99z9JezIoyRFla35xrAzZUJvXxYzEx0Rglp2/79IWyriI0mamI3fRaMGAvNQLayf9zzb9mKDjI+j69AHCopk9NU3Cm9vRa72nzGIag+9dvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXPb7x2w; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b109bcceb9so56110871cf.2;
        Mon, 25 Aug 2025 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756144127; x=1756748927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwywas10dgjaEcbmg8qmp39F5Fk5vrfI+nR2BfdeE1Q=;
        b=mXPb7x2wrjlnFVf7vFYactbW+H7E2mpuXiU2WPILxwic/6VTz4b1dceDC2T3pWFJML
         gpnbfdRrYrT2knjMGgTXZRaj3u5EYniwAl2tMvlhZn6JgvDBXZdjyKemTsbfApIbHX6e
         Xwwr6hBM0ZnmCKr6Q4YAqUBe5btdl3OZqzm87JFOjJyQ+PZPM720Vi1zpt+s2iFIXlu4
         UUoZo7hjieHAyvHUuf1ltcKeN4new0RB5sW/mvQjrHGxFIEwRgPWZNxUBhPBLtg+zYMR
         TRWxyRfLYwb3rnWLwdKnpfryj5AeXlMX/oQd/3NRvHA1B/tevyW2SP0DfQdIMB9qHfyp
         o1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756144127; x=1756748927;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwywas10dgjaEcbmg8qmp39F5Fk5vrfI+nR2BfdeE1Q=;
        b=N05iY4sirLRqi2LJigvK8DEf26OQS0dRdIPl73w3Q7oSCwAo6+qr3EiEFMTjaEQbuB
         LUnf9ZHKoxiZhH4PzNOQ1tlumIBiO62i//Q10EmYH3VBVAPlxZQSROyt7oru+sX83cO2
         oN/7N1hPq+OhB1R/PmqqA2ZDf08raJ8MDsPSg1mcOlQCUVbJwLNmGPK6eVzpPm7Tfs5f
         sjQrYlgK4XifyHLkbiIJ1omh5Kw9F3OG5NP8IcZJNGAemmq636dtnwhXRsj9BeI60YEv
         LKLIbM0kRRE6H/N9J1cWrg88GLYh9jgL4KssRg4kBg1jhqImgDV4uB57LfC8q43em1gU
         O0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUesy5O5GXidS3J873k9QmM+v8XmqCMYD+GVGHLGJT1q/wOyBoJxgS6YtxydnrapVBjX7xPWpLdIUZy@vger.kernel.org, AJvYcCUmu1+3xDnfmhgBwBuYuAa21O+TFB8eaTsqutUSiaJgVtil5zUu8l8X+21xk+j5S0M9Kv85VR3+OWqWRcla@vger.kernel.org, AJvYcCUqKEWNTZC9e8Nc66f09n0odbBYwjU/8hvfQXaYSzOjEeEHprqlgXrFIVZKarHJCUxHrw14s7bfxLRgsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybQca2wrVy5AVCVw4ffMf5biikM6PHyWI7OAeaps0C0BNf52SF
	BmfXf4wGSBTWIfkBVce+5tWdxgHvnk6vmjpvZZmdEkPZ51aMLCklfulhxFECxnHD
X-Gm-Gg: ASbGncu4TyCWBzPraNYADl8V1v8tnzStsJ7oyYuvd2C6AUFwqnSq1cT7dpplIOh/bCz
	3aW/T0N3wRfViXL6bzhDOk3gYyD82i6ygsHEiAJPR2LIE6/BiLnhW+U+4I8YDZWZJm4fypuShyA
	L7PPN3Z+53qnV+UE1up4BVEW34m3gmuKvXAXNzIfWA/n5XNS1dor113GgXQ0c5pnEbDy6gneuMX
	ncNX9sZlxznyO8XB/IzW0uC5vmGtcRZnOShl3cn5wheSBEC96M3X+YpN+TnnorQL5TwmVvaaSYH
	DmnnxAcnsWElzSX05dGGl94kXhJXHa0N6P0jg7Iqr+xmXFnIbGpevoI9JqoL7NdrInwgjV6tPmB
	eCP1zkWvVSme+2b59n6uDrU89
X-Google-Smtp-Source: AGHT+IG8eF/JBJ1IUtX0i7wFJbJudI4v0Rchu8/x/z8TFW6STNr2q4OwZuYHVytSW2k7qXniwX4sRA==
X-Received: by 2002:ac8:5fc2:0:b0:4b2:8ac4:ef60 with SMTP id d75a77b69052e-4b2aab0944dmr139536521cf.67.1756144126684;
        Mon, 25 Aug 2025 10:48:46 -0700 (PDT)
Received: from [127.0.0.1] ([172.110.70.234])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e572acsm56639791cf.52.2025.08.25.10.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 10:48:46 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:48:45 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/6=5D_auxdisplay=3A_Add_TM16xx_7-?=
 =?US-ASCII?Q?segment_LED_matrix_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <aKx9zQNppjNNMJEt@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-4-jefflessard3@gmail.com> <aKx9zQNppjNNMJEt@smile.fi.intel.com>
Message-ID: <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 11 h 14 min 21 s HAE, Andy Shevchenko <andriy=2Eshevch=
enko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Sun, Aug 24, 2025 at 11:32:29PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add driver for TM16xx family LED controllers and compatible chips from
>> multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, a=
nd
>> Winrise=2E These controllers drive 7-segment digits and individual LED =
icons
>> through either I2C or SPI buses=2E
>>=20
>> Successfully tested on various ARM TV boxes including H96 Max, Magicsee=
 N5,
>> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platfo=
rms
>> (Rockchip, Amlogic, Allwinner)=2E
>
>=2E=2E=2E
>
>> Notes:
>>     checkpatch reports false positives that are intentionally ignored:
>>     DEVICE_ATTR_FUNCTIONS: Functions are correctly prefixed with driver
>>     name (tm16xx_*) following standard kernel practice for device
>>     attribute functions to avoid namespace conflicts=2E
>>     BIT_MACRO: bit shifts are used for field values while GENMASK/BIT
>>     are used for bit positions per semantic convention
>
>>     include <linux/of=2Eh> is required for the default name of the main=
 led
>>     device, excluding the unit address, as implemented in
>>     drivers/leds/led-core=2Ec which relies on of_node->name
>
>Sorry, but I do not see how of=2Eh is related to all this=2E=2E=2E Please=
, drop it=2E
>

This relates to the LED subsystem integration question below=2E
I'll address both together and remove the include if not needed=2E

>>     LED registration uses non-devm variant on-purpose to allow explicit
>>     unregistration on device removal, ensuring LED triggers are
>>     immediately stopped=2E This prevents stale LED trigger activity fro=
m
>>     continuing after the hardware is gone, avoiding the need for comple=
x
>>     state tracking in brightness callbacks=2E
>
>=2E=2E=2E
>
>> +What:		/sys/class/leds/<led>/value
>
>> +Date:		August 2025
>> +KernelVersion:	6=2E17
>
>The Date should be approximate date of the kernel release (alternatively,=
 -rc1
>of that)=2E The version is estimated version where ABI can be found first=
=2E
>
>Both of these need to be changed=2E
>
>

Given that 6=2E17-rc3 was just released, should I target 6=2E18 for the ke=
rnel
version and use a March 2025 date for the estimated release timeframe?

>> +Contact:	Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> +Description:
>> +		Controls the text displayed on the TM16xx 7-segment display=2E
>> +
>> +		Reading returns the current display content as ASCII characters,
>> +		one character per digit position, followed by a newline=2E
>> +
>> +		Writing sets new display content=2E Input characters are mapped
>> +		to 7-segment patterns using the configured character map=2E The
>> +		string length should not exceed the number of available digits
>> +		(see num_digits)=2E Shorter strings will clear remaining digits=2E
>> +
>> +		Example:
>> +		  echo "1234" > value    # Display "1234"
>> +		  cat value              # Returns "1234\n"
>> +
>> +What:		/sys/class/leds/<led>/num_digits
>> +Date:		August 2025
>> +KernelVersion:	6=2E17
>> +Contact:	Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> +Description:
>> +		Read-only attribute showing the number of 7-segment digit
>> +		positions available on this TM16xx display controller=2E
>> +
>> +		The value is determined by the device tree configuration
>> +		and represents the maximum length for the 'value' attribute=2E
>> +
>> +		Example:
>> +		  cat num_digits         # Returns "4\n" for 4-digit display
>> +
>> +What:		/sys/class/leds/<led>/map_seg7
>> +Date:		August 2025
>> +KernelVersion:	6=2E17
>> +Contact:	Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> +Description:
>> +		Read/write binary blob representing the ASCII-to-7-segment
>> +		display conversion table used by the TM16xx driver, as defined
>> +		by struct seg7_conversion_map in <linux/map_to_7segment=2Eh>=2E
>> +
>> +		This attribute is not human-readable=2E Writes must match the
>> +		struct size exactly, else -EINVAL is returned; reads return the
>> +		entire mapping as a binary blob=2E
>> +
>> +		This interface and its implementation match existing conventions
>> +		used in auxdisplay and segment-mapped display drivers since 2005=2E
>> +
>> +		ABI note: This style of binary sysfs attribute *is an exception*
>> +		to current "one value per file, text only" sysfs rules, for
>> +		historical compatibility and driver uniformity=2E New drivers are
>> +		discouraged from introducing additional binary sysfs ABIs=2E
>> +
>> +		Reference interface guidance:
>> +		- include/uapi/linux/map_to_7segment=2Eh
>
>So, the driver is under auxdisplay, but at the same time it completely re=
lies
>on LED subsystem=2E=2E=2E What's going on here?
>

The design integrates with the LED subsystem for two main reasons:

1=2E Brightness control:
The entire display brightness is controlled at the display level
(individual LED icons can only be on/off via their brightness attributes)=
=2E
The LED subsystem provides established mechanisms for this=2E

2=2E Coherent sysfs interface:
This provides consistent /sys/class/leds/display for display-level control=
s
and /sys/class/leds/display::{function} for individual icons=2E

I'm seeking your guidance on the best design for the auxdisplay subsystem=
=2E

>Btw, have you seen
>https://lore=2Ekernel=2Eorg/linux-leds/20231011190017=2E1230898-1-wse@tux=
edocomputers=2Ecom/
>? And  if so, what're your takeaways? (Yes, I know that's about different=
 HW)
>

I've read the thread but I'm not clear on the specific point you're making=
=2E
Could you clarify what aspect I should focus on?
(Though, my personal opinion is that using auxdisplay for keyboard LEDs
doesn't really make sense=2E I think it would be better to properly implem=
ent
it the required mechanism into input subsystem, with maybe some
integration with the leds subsystem=2E Just a quick opinion, I do not
master all aspects of this question at all=2E)

>> +Users:		Display configuration utilities and embedded system scripts/to=
ols=2E
>
>=2E=2E=2E
>
>> + * Copyright (C) 2024 Jean-Fran=C3=A7ois Lessard
>
>My calendar shows something different=2E
>
>

The original code was developed in 2024, though it's being submitted in 20=
25=2E

>> +#include <linux/bitfield=2Eh>
>
>> +#include <linux/bitmap=2Eh>
>
>Is this used?
>

Yes, display->state is a bitmap=2E I'll move this include to tm16xx_core=
=2Ec
since it's not used in the header itself=2E

>> +#include <linux/leds=2Eh>
>> +#include <linux/workqueue=2Eh>
>
>=2E=2E=2E
>
>> +#define TM16XX_DIGIT_SEGMENTS	7
>
>Why do we even need this?
>

You're right=2E  I'll move it to tm16xx_core=2Ec=2E

>=2E=2E=2E
>
>> +#define TM16XX_CTRL_BRIGHTNESS(on, val, prfx) \
>> +	((on) ? (FIELD_PREP(prfx##_CTRL_BR_MASK, (val)) | prfx##_CTRL_ON) : 0=
)
>
>prefix can be spelled fully, going slightly over 80 is not a crime=2E
>

Acknowledged, I'll use the full prefix name=2E

>=2E=2E=2E
>
>> +struct tm16xx_display {
>> +	struct device *dev;
>> +	const struct tm16xx_controller *controller;
>
>> +	union {
>> +		struct i2c_client *i2c;
>> +		struct spi_device *spi;
>> +	} client;
>
>Why? Just drop it=2E struct device *dev is enough and I can't see the nee=
d
>in this at all=2E
>

I'll remove this union and use container_of(dev, struct i2c_client, dev)
or container_of(dev, struct spi_device, dev) where the specific client typ=
e
is needed=2E

>> +	u8 *spi_buffer;
>> +	u8 num_grids;
>> +	u8 num_segments;
>> +	struct led_classdev main_led;
>> +	struct tm16xx_led *leds;
>> +	u8 num_leds;
>> +	struct tm16xx_digit *digits;
>> +	u8 num_digits;
>> +	struct work_struct flush_init;
>> +	struct work_struct flush_display;
>> +	int flush_status;
>> +	struct mutex lock; /* prevents concurrent work operations */
>> +	unsigned long *state;
>> +};
>
>=2E=2E=2E
>
>> + * Copyright (C) 2024 Jean-Fran=C3=A7ois Lessard
>
>Year?
>

Same as above=2E

>=2E=2E=2E
>
>> +#include <linux/map_to_7segment=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/of=2Eh>
>> +#include <linux/property=2Eh>
>
>Please, follow IWYU principle=2E
>

I'll explicitly include all required headers in each source file
instead of relying on transitive includes from the header=2E

>=2E=2E=2E
>
>> +static ssize_t tm16xx_num_digits_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buf)
>> +{
>> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +	struct tm16xx_display *display =3D dev_get_drvdata(led_cdev->dev->par=
ent);
>> +
>> +	return sprintf(buf, "%u\n", display->num_digits);
>
>Should be sysfs_emit()=2E
>

Well received=2E

>> +}
>
>=2E=2E=2E
>
>> +static ssize_t tm16xx_map_seg7_show(struct device *dev,
>> +				    struct device_attribute *attr, char *buf)
>> +{
>> +	memcpy(buf, &map_seg7, sizeof(map_seg7));
>> +	return sizeof(map_seg7);
>> +}
>
>Can we use LINEDISP library?
>

I considered this but have two concerns:

1=2E It creates attributes under a virtual "linedisp=2E{n}" device,
which conflicts with the coherent LED sysfs design

2=2E Messages scroll indefinitely=2E There should be control for single-pa=
ss scrolling

I'm willing to contribute improvements to line-display if needed,
but this depends on resolving the main LED design question above=2E

>=2E=2E=2E
>
>> +static struct attribute *tm16xx_main_led_attrs[] =3D {
>> +	&dev_attr_value=2Eattr,
>> +	&dev_attr_num_digits=2Eattr,
>> +	&dev_attr_map_seg7=2Eattr,
>
>> +	NULL,
>
>No comma in the terminator entry=2E
>

Well received=2E

>> +};
>> +ATTRIBUTE_GROUPS(tm16xx_main_led);
>
>=2E=2E=2E
>
>> +static int tm16xx_display_init(struct tm16xx_display *display)
>> +{
>> +	unsigned int nbits =3D tm16xx_led_nbits(display);
>
>> +	dev_dbg(display->dev, "Initializing display\n");
>
>Please, drop all these dev_dbg() over the code as they are close to usele=
ss,
>use tracers and other mechanisms to debug if required=2E
>

Understood, I'll remove the debug noise=2E

>Also drop unneeded kernel-doc for the (esp=2E static) functions that have=
 well
>established meaning (e=2Eg=2E, no need a kernel-doc for device attributes=
 as they
>should be documented in the ABI)=2E
>

Understood, I'll remove these kernel-doc=2E

>> +	schedule_work(&display->flush_init);
>> +	flush_work(&display->flush_init);
>> +	if (display->flush_status < 0)
>> +		return display->flush_status;
>> +
>> +	if (tm16xx_init_value) {
>> +		tm16xx_value_store(display->main_led=2Edev, NULL,
>> +				   tm16xx_init_value,
>> +				   strlen(tm16xx_init_value));
>> +	} else {
>> +		bitmap_fill(display->state, nbits);
>> +		schedule_work(&display->flush_display);
>> +		flush_work(&display->flush_display);
>> +		bitmap_zero(display->state, nbits);
>> +		if (display->flush_status < 0)
>> +			return display->flush_status;
>> +	}
>> +
>> +	dev_info(display->dev, "Display turned on\n");
>> +
>> +	return 0;
>> +}
>
>=2E=2E=2E
>
>> +static int tm16xx_parse_dt(struct device *dev, struct tm16xx_display *=
display)
>
>Why DT only? No support for other platforms? Why?
>I think this is just matter of naming the function properly=2E
>

You're right, I'll rename it to tm16xx_parse_fwnode since it uses fwnode A=
PIs=2E

>> +{
>> +	struct fwnode_handle *leds_node, *digits_node, *child;
>> +	struct tm16xx_led *led;
>> +	struct tm16xx_digit *digit;
>
>> +	int max_grid =3D 0, max_segment =3D 0;
>
>Why signed?
>

My oversight - I'll change these to appropriate unsigned types=2E

>> +	int ret, i, j;
>
>Why are i and j signed?
>

Standard kernel practice uses int for simple loop counters=2E
But I will change to unsigned types for consistency=2E

>> +	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
>> +	u32 reg[2];
>> +
>> +	/* parse digits */
>> +	digits_node =3D device_get_named_child_node(dev, "digits");
>> +	if (digits_node) {
>
>> +		display->num_digits =3D 0;
>> +		fwnode_for_each_child_node(digits_node, child)
>> +			display->num_digits++;
>
>Don't we have a _count API for this?
>

I'll use device_get_child_node_count() instead of manual counting loops=2E

>> +		dev_dbg(dev, "Number of digits: %u\n", display->num_digits);
>> +
>> +		if (display->num_digits) {
>> +			display->digits =3D devm_kcalloc(dev, display->num_digits,
>> +						       sizeof(*display->digits),
>> +						       GFP_KERNEL);
>> +			if (!display->digits) {
>
>> +				fwnode_handle_put(digits_node);
>
>Use RAII instead, we have defined __free() method for this=2E
>
>> +				return -ENOMEM;
>> +			}
>> +
>> +			i =3D 0;
>> +			fwnode_for_each_child_node(digits_node, child) {
>
>Ditto=2E Use _scoped variant=2E
>

Well received=2E

>> +				digit =3D &display->digits[i];
>
>> +				ret =3D fwnode_property_read_u32(child, "reg",
>> +							       reg);
>
>One line=2E
>

Well received=2E

>> +				if (ret < 0) {
>
>Can it be positive? Here and everywhere else, if there is no positive ret=
urn,
>use 'if (ret)'=2E
>

I'll change error checks to if (ret) where functions only return 0 on succ=
ess
or negative on error=2E

>> +					fwnode_handle_put(child);
>> +					fwnode_handle_put(digits_node);
>> +					return ret;
>> +				}
>> +
>> +				ret =3D fwnode_property_read_u32_array(child,
>> +								     "segments",
>> +								     segments,
>> +								     TM16XX_DIGIT_SEGMENTS * 2);
>> +				if (ret < 0) {
>> +					fwnode_handle_put(child);
>> +					fwnode_handle_put(digits_node);
>> +					return ret;
>> +				}
>> +
>> +				for (j =3D 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
>> +					digit->segments[j]=2Egrid =3D segments[2 * j];
>> +					digit->segments[j]=2Esegment =3D segments[2 * j + 1];
>
>> +					max_grid =3D umax(max_grid,
>
>Firstly, the variables made signed and then specifically force them to be
>unsigned in the macro=2E Weird=2E Can we make them to be a proper type an=
d use max()?
>

Will change to unsigned types per above=2E

>> +							digit->segments[j]=2Egrid);
>
>One line
>

Well received=2E

>> +					max_segment =3D umax(max_segment,
>> +							   digit->segments[j]=2Esegment);
>
>As per above comments=2E
>

Will change to unsigned types per above=2E

>> +				}
>> +				digit->value =3D 0;
>> +				i++;
>> +			}
>> +
>> +			fwnode_handle_put(digits_node);
>> +		}
>> +	}
>> +
>> +	/* parse leds */
>> +	leds_node =3D device_get_named_child_node(dev, "leds");
>> +	if (leds_node) {
>> +		display->num_leds =3D 0;
>> +		fwnode_for_each_child_node(leds_node, child)
>> +			display->num_leds++;
>
>As per above=2E
>

I'll use device_get_child_node_count() instead of manual counting loops=2E

>> +		dev_dbg(dev, "Number of LEDs: %u\n", display->num_leds);
>> +
>> +		if (display->num_leds) {
>> +			display->leds =3D devm_kcalloc(dev, display->num_leds,
>> +						     sizeof(*display->leds),
>> +						     GFP_KERNEL);
>> +			if (!display->leds) {
>> +				fwnode_handle_put(leds_node);
>> +				return -ENOMEM;
>> +			}
>> +
>> +			i =3D 0;
>> +			fwnode_for_each_child_node(leds_node, child) {
>> +				led =3D &display->leds[i];
>
>> +				ret =3D fwnode_property_read_u32_array(child,
>> +								     "reg", reg,
>> +								     2);
>
>Make it one line=2E
>

Well received=2E

>> +				if (ret < 0) {
>> +					fwnode_handle_put(child);
>> +					fwnode_handle_put(leds_node);
>> +					return ret;
>> +				}
>> +
>> +				led->grid =3D reg[0];
>> +				led->segment =3D reg[1];
>> +				max_grid =3D umax(max_grid, led->grid);
>> +				max_segment =3D umax(max_segment, led->segment);
>> +				i++;
>> +			}
>> +		}
>> +
>> +		fwnode_handle_put(leds_node);
>> +	}
>> +
>> +	if (max_grid >=3D display->controller->max_grids) {
>> +		dev_err(dev, "grid %u exceeds controller max_grids %u\n",
>> +			max_grid, display->controller->max_grids);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (max_segment >=3D display->controller->max_segments) {
>> +		dev_err(dev, "segment %u exceeds controller max_segments %u\n",
>> +			max_segment, display->controller->max_segments);
>> +		return -EINVAL;
>> +	}
>> +
>> +	display->num_grids =3D max_grid + 1;
>> +	display->num_segments =3D max_segment + 1;
>
>> +	dev_dbg(dev, "Number of grids: %u\n", display->num_grids);
>> +	dev_dbg(dev, "Number of segments: %u\n", display->num_segments);
>
>I didn't get this=2E You mean that they are not strictly 7-segment ones?
>

The terminology is confusing - "segment" is used both for 7-segment digits
(which are indeed 7-segment) and for controller matrix coordinates
(grid,segment) from datasheets=2E Controllers support varying numbers of s=
egments
For individual LED icons, not necessarily related to 7-segment displays=2E
I'll add a comment to clarify this distinction=2E

>> +
>> +	return 0;
>> +}
>
>=2E=2E=2E
>
>> +int tm16xx_probe(struct tm16xx_display *display)
>> +{
>> +	struct device *dev =3D display->dev;
>> +	struct led_classdev *main =3D &display->main_led;
>> +	struct fwnode_handle *leds_node, *child;
>> +	unsigned int nbits;
>> +	int ret, i;
>
>Why is i signed?
>

Will change to unsigned types per above=2E

>> +	dev_dbg(dev, "Probing device\n");
>> +	ret =3D tm16xx_parse_dt(dev, display);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to parse device tree\n");
>> +
>> +	nbits =3D tm16xx_led_nbits(display);
>> +	display->state =3D devm_bitmap_zalloc(dev, nbits, GFP_KERNEL);
>> +	if (!display->state)
>> +		return -ENOMEM;
>
>> +	mutex_init(&display->lock);
>
>devm_mutex_init()
>

Well received=2E

>> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
>> +	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
>
>> +	/* Initialize main LED properties */
>> +	if (dev->of_node)
>> +		main->name =3D dev->of_node->name;
>> +	if (!main->name)
>> +		main->name =3D "display";
>> +	device_property_read_string(dev, "label", &main->name);
>
>My gosh=2E This is done in the LED core if we even need this=2E=2E=2E
>

This relates to the LED subsystem integration question=2E If my design app=
roach
is acceptable, I'll review the LED core implementation to avoid duplicatin=
g
this logic if possible=2E

>> +	main->max_brightness =3D display->controller->max_brightness;
>> +	device_property_read_u32(dev, "max-brightness", &main->max_brightness=
);
>> +	main->max_brightness =3D umin(main->max_brightness,
>> +				    display->controller->max_brightness);
>> +
>> +	main->brightness =3D main->max_brightness;
>> +	device_property_read_u32(dev, "default-brightness", &main->brightness=
);
>> +	main->brightness =3D umin(main->brightness, main->max_brightness);
>> +
>> +	main->brightness_set =3D tm16xx_brightness_set;
>> +	main->groups =3D tm16xx_main_led_groups;
>> +	main->flags =3D LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
>> +
>> +	ret =3D led_classdev_register(dev, main);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to register main LED\n");
>
>> +	i =3D 0;
>> +	leds_node =3D device_get_named_child_node(dev, "leds");
>> +	fwnode_for_each_child_node(leds_node, child) {
>> +		struct tm16xx_led *led =3D &display->leds[i];
>> +		struct led_init_data led_init =3D {
>> +			=2Efwnode =3D child,
>> +			=2Edevicename =3D dev_name(main->dev),
>> +			=2Edevname_mandatory =3D true,
>> +			=2Edefault_label =3D "led",
>> +		};
>> +		led->cdev=2Emax_brightness =3D 1;
>> +		led->cdev=2Ebrightness_set =3D tm16xx_led_set;
>> +		led->cdev=2Eflags =3D LED_RETAIN_AT_SHUTDOWN |
>> +				  LED_CORE_SUSPENDRESUME;
>> +
>> +		ret =3D led_classdev_register_ext(dev, &led->cdev, &led_init);
>> +		if (ret < 0) {
>> +			fwnode_handle_put(child);
>> +			dev_err_probe(dev, ret, "Failed to register LED %s\n",
>> +				      led->cdev=2Ename);
>> +			goto unregister_leds;
>> +		}
>> +
>> +		i++;
>> +	}
>> +
>> +	ret =3D tm16xx_display_init(display);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to initialize display\n");
>> +		goto unregister_leds;
>> +	}
>> +
>> +	return 0;
>> +
>> +unregister_leds:
>> +	while (i--)
>> +		led_classdev_unregister(&display->leds[i]=2Ecdev);
>> +
>> +	led_classdev_unregister(main);
>> +	return ret;
>> +}
>
>=2E=2E=2E
>
>> +void tm16xx_remove(struct tm16xx_display *display)
>> +{
>> +	unsigned int nbits =3D tm16xx_led_nbits(display);
>> +	struct tm16xx_led *led;
>
>> +	dev_dbg(display->dev, "Removing display\n");
>
>Unneeded noise=2E
>

Well received=2E

>> +	/*
>> +	 * Unregister LEDs first to immediately stop trigger activity=2E
>> +	 * This prevents LED triggers from attempting to access hardware
>> +	 * after it's been disconnected or driver unloaded=2E
>> +	 */
>> +	for (int i =3D 0; i < display->num_leds; i++) {
>
>Why iterator is signed?
>

Will change to unsigned types per above=2E

>> +		led =3D &display->leds[i];
>> +		led_classdev_unregister(&led->cdev);
>> +	}
>> +	led_classdev_unregister(&display->main_led);
>> +
>> +	/* Clear display state */
>> +	bitmap_zero(display->state, nbits);
>> +	schedule_work(&display->flush_display);
>> +	flush_work(&display->flush_display);
>> +
>> +	/* Turn off display */
>> +	display->main_led=2Ebrightness =3D LED_OFF;
>> +	schedule_work(&display->flush_init);
>> +	flush_work(&display->flush_init);
>
>> +	dev_info(display->dev, "Display turned off\n");
>
>Unneeded noise=2E
>

Well received=2E

>> +}
>

Thank you for the detailed review=2E The main question remains about the L=
ED
subsystem integration approach=2E I'd appreciate your guidance on the best=
 design
direction=2E


