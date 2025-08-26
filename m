Return-Path: <linux-leds+bounces-5323-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAAFB373FB
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 22:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB4BD363F38
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 20:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495E32F658F;
	Tue, 26 Aug 2025 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c23xzbQJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7888C30CDA9;
	Tue, 26 Aug 2025 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756241094; cv=none; b=lvq4V1fin4rIzFSw3CKCPtMZuaIzyHShwQBdUSyPNm9CdtOjT37yldcZAkuBzblhaP1m8xCK/BM0pBF4JAGL2HOE/bjiLqgaqRecwL/rXZQL6uSSTS7nhgzf/M/VEz0uQU1h5J42tQPujORUZgClryv+Hpc1M5WHGzsa0PFC9ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756241094; c=relaxed/simple;
	bh=Q2NHS5iqDVryuYyh9B1tKi9aeKOgNo1f+b85FoTh8B8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tH0h1OyhIMF5s4Bu66F/kvqBI10zfNsMt8FBsh9+d8UcMH6ug1mptX4B93EPz1w3XnOYfU2UX3IsfVEOH08AlYPm07RvSwroEW4IUyqGPOcYTsdBeZ16koI1H/I34T0aiDYFAPx4PlwEpJtd3yGzQ+ORR/daKnbpj9uQe6dn2Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c23xzbQJ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109919a09so74676851cf.0;
        Tue, 26 Aug 2025 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756241091; x=1756845891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jpdEFZ68Z6QmuwqtC4DFclEIZy27nm2u8sRlSiR6SxE=;
        b=c23xzbQJMjVUui3aJw9BX2lcPaNkXMhqhBfw8u2YIf8C7BP7WRX1WHzZNjVoA6n3Z2
         U+BItZWSCPB/wAx3FboOItXbIx6iKzT6MDuVKrjHjzzn/Yo7jFGFtcCvhNObmqCvTHks
         GaK+dMWCCPZcMGmujA36Lun5fo11n+y1elCLiQZpdu5RKFmNuFyIhGjh0WQ4cjRnfi1B
         5KFkhCxZcSZOVDQa13z6nMQzG2YWDG/5XX9YGEwx+6mEKrb3agpW8Ji2yuVkYsbjsa9P
         hNfsfdv7FkuIc4ycO65P7rQk8ubyZhhzsHmyhKkT9enC1A0IX088/zqG6aWgrYx/4PPG
         3nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756241091; x=1756845891;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpdEFZ68Z6QmuwqtC4DFclEIZy27nm2u8sRlSiR6SxE=;
        b=M0KFGt+Q/kwNYNxnMZPRmSjYDOLJSVH9t5frIhKL4ZJN9r78sABTPuhJ0GrdmBOGLD
         Toij19QRyEf8KXSJpRBk+yc8c0aT7owH2eOmwifnKMY3ACjNArTL48EDh1tCs/M99hCj
         UqeOlTvoTQlzxusM6l8zhdMjXaI4KllTHRvAoB1zfMT5JhnE108mcr6/v+SZ4pjAx2fZ
         Rr43/GBaBqQ5r5B5q5A0iB5jzDgQNKGyBmDJhsFrSlkYViRJ/kIMQ93J8l46/hUNL8Ow
         +j6Pj8Tfudf5hKZbhkuSiArwhDuRDs2xSR6fRuxgRzHerRssqKjrwY3l44vbWb2LHfNk
         +mgg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Li1myNd3Cu6mSWllnpUHeQGg6TNzvAF7jgw/YBNcoDs4/o/v0bch3qE9rvgytLYI6h/HCSqp+ZBUi9wF@vger.kernel.org, AJvYcCVVRHYNE1G4MFzHrCz1lEya2bgEXzwgOw/1SKLW2KnQIfmh+3RuUjamKRJ5oGw77Tfi9Hl8OZNS9y1A@vger.kernel.org, AJvYcCWJsKVDliOqgZF51xHsz2ATj3N+92ujtnZxkIRmQdsG0ft/nSCcsw2+dBvhTKPabMX8/wWadHGVXx8n8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+UwJ4oeJZeqdfhr4MN78H8ga/GKVk1f7+CN4jKY5mwc6DzS8J
	r76pijmF/JrQ+Yyej32bBfYh8kkX4Btk1ctpqZ3QWaYFV6dA5sgS43Ln
X-Gm-Gg: ASbGnctiJ1yozJwulYya1hr1V9Y0uRfzXboi8GW9raYviQwqzukBlUdhBRn3UfKFezP
	3gcD8EeCkkvF4MBxoVlvBUfrwvyT7wJbPOqL6X8093EIY5GRhyonDRAboVLNK4w8/njpXkpJms4
	xXTI76HVaLvTPnOCLWJM3Wgax2aFgOoA2rN/3SGobBw4ke/H4QWh+pZ/3wmGSRqCHfa96UJb9g2
	FuC7lWK3L8mQv1ZTszDDtMMI6XKse/tSLR45TWDO/kvPkBs8JveinFGr3moid31Wgg1MFFyQODx
	QHt8DUKrlvGXKlAZNhvRR4ym0rji+LUatwl8xd1TxIeOO0Km+G5+mAywCwgO8S25C+hfXiMwGU6
	DT1S4yb3B2ffrwSwpJ4iXw3x2d5n8GPPnWJWU6Y9eOsc8zv+FQ26b1aIB9F57wDh8Hq/woj+OB8
	BdzQNgTbUMbvIbfig=
X-Google-Smtp-Source: AGHT+IEj1b/HGjlVsX7elKxdMUcos2Tf6hIZZ9YFNy0ce07JjeH3t8E0fPWTZRKSqiZ6Pf4GQ2mX4Q==
X-Received: by 2002:a05:622a:118d:b0:4b2:d43d:8d37 with SMTP id d75a77b69052e-4b2d43d8fe4mr99389661cf.6.1756241091240;
        Tue, 26 Aug 2025 13:44:51 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e514fesm79343361cf.50.2025.08.26.13.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 13:44:50 -0700 (PDT)
Date: Tue, 26 Aug 2025 16:44:48 -0400
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
In-Reply-To: <aK3RUIt0O-uzEo4-@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-4-jefflessard3@gmail.com> <aKx9zQNppjNNMJEt@smile.fi.intel.com> <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com> <aK3RUIt0O-uzEo4-@smile.fi.intel.com>
Message-ID: <6E522C4F-AED7-4C19-9AC5-6C8F2F096E1A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 26 ao=C3=BBt 2025 11 h 22 min 56 s HAE, Andy Shevchenko <andriy=2Eshevch=
enko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Mon, Aug 25, 2025 at 01:48:45PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Le 25 ao=C3=BBt 2025 11 h 14 min 21 s HAE, Andy Shevchenko <andriy=2Esh=
evchenko@intel=2Ecom> a =C3=A9crit=C2=A0:
>> >On Sun, Aug 24, 2025 at 11:32:29PM -0400, Jean-Fran=C3=A7ois Lessard w=
rote:
>
>=2E=2E=2E
>
>> >> +Date:		August 2025
>> >> +KernelVersion:	6=2E17
>> >
>> >The Date should be approximate date of the kernel release (alternative=
ly, -rc1
>> >of that)=2E The version is estimated version where ABI can be found fi=
rst=2E
>
>> >Both of these need to be changed=2E
>>=20
>> Given that 6=2E17-rc3 was just released, should I target 6=2E18 for the=
 kernel
>> version and use a March 2025 date for the estimated release timeframe?
>
>6=2E18
>The date is not in the past, obviously=2E You can consult with this site:
>https://hansen=2Ebeer/~dave/phb/
>

Thanks for the correction and link=2E I'll update to 6=2E18 with appropria=
te future
date=2E

>=2E=2E=2E
>
>> >So, the driver is under auxdisplay, but at the same time it completely=
 relies
>> >on LED subsystem=2E=2E=2E What's going on here?
>>=20
>> The design integrates with the LED subsystem for two main reasons:
>>=20
>> 1=2E Brightness control:
>> The entire display brightness is controlled at the display level
>> (individual LED icons can only be on/off via their brightness attribute=
s)=2E
>> The LED subsystem provides established mechanisms for this=2E
>>=20
>> 2=2E Coherent sysfs interface:
>> This provides consistent /sys/class/leds/display for display-level cont=
rols
>> and /sys/class/leds/display::{function} for individual icons=2E
>>=20
>> I'm seeking your guidance on the best design for the auxdisplay subsyst=
em=2E
>>=20
>> >Btw, have you seen
>> >https://lore=2Ekernel=2Eorg/linux-leds/20231011190017=2E1230898-1-wse@=
tuxedocomputers=2Ecom/
>> >? And  if so, what're your takeaways? (Yes, I know that's about differ=
ent HW)
>>=20
>> I've read the thread but I'm not clear on the specific point you're mak=
ing=2E
>> Could you clarify what aspect I should focus on?
>
>If you have a LED matrix, perhaps we can consider different approaches as=
 well=2E
>(It's all about the current HW, is it a 7-segment or arbitrary display, i=
f the
> former, that discussion is unrelated)
>

TM16xx devices are primarily 7-segment displays with additional LED icon a=
nd
key scanning capabilities=2E

>> (Though, my personal opinion is that using auxdisplay for keyboard LEDs
>> doesn't really make sense=2E I think it would be better to properly imp=
lement
>> it the required mechanism into input subsystem, with maybe some
>> integration with the leds subsystem=2E Just a quick opinion, I do not
>> master all aspects of this question at all=2E)
>
>=2E=2E=2E
>
>> >> + * Copyright (C) 2024 Jean-Fran=C3=A7ois Lessard
>> >
>> >My calendar shows something different=2E
>>=20
>> The original code was developed in 2024, though it's being submitted in=
 2025=2E
>
>But haven't you changed it in 2025?
>

You're right, I'll update the copyright to 2025=2E

>=2E=2E=2E
>
>> >> +#include <linux/bitmap=2Eh>
>> >
>> >Is this used?
>>=20
>> Yes, display->state is a bitmap=2E I'll move this include to tm16xx_cor=
e=2Ec
>> since it's not used in the header itself=2E
>
>Yes, that's what I meant "used by this header file"=2E
>

I'll move bitmap=2Eh to the source file=2E

>=2E=2E=2E
>
>> >> +	union {
>> >> +		struct i2c_client *i2c;
>> >> +		struct spi_device *spi;
>> >> +	} client;
>> >
>> >Why? Just drop it=2E struct device *dev is enough and I can't see the =
need
>> >in this at all=2E
>>=20
>> I'll remove this union and use container_of(dev, struct i2c_client, dev=
)
>> or container_of(dev, struct spi_device, dev) where the specific client =
type
>> is needed=2E
>
>This is in correlation with the regmap proposal=2E
>

I'll address the regmap evaluation in the cover letter of the next submiss=
ion
as you requested=2E

The union removal will be addressed too=2E

>=2E=2E=2E
>
>> >> +static ssize_t tm16xx_map_seg7_show(struct device *dev,
>> >> +				    struct device_attribute *attr, char *buf)
>> >> +{
>> >> +	memcpy(buf, &map_seg7, sizeof(map_seg7));
>> >> +	return sizeof(map_seg7);
>> >> +}
>> >
>> >Can we use LINEDISP library?
>>=20
>> I considered this but have two concerns:
>>=20
>> 1=2E It creates attributes under a virtual "linedisp=2E{n}" device,
>> which conflicts with the coherent LED sysfs design
>
>It creates the specific attributes for the 7-segment HW, So look at it
>from this angle=2E We have well established library and we expect 7-seg
>drivers will use it to make sure that user space may be written in unifor=
m
>way=2E
>

To provide a coherent user interface, I'd like to propose extending linedi=
sp to
optionally attach attributes to an existing device rather than always crea=
ting
virtual devices=2E This would create a unified /sys/class/leds/{label}/ in=
terface
for content, brightness, and icons while maintaining linedisp's establishe=
d
APIs=2E

If device attachment isn't feasible, could linedisp at minimum accept a de=
vice
name parameter to create /sys/virtual/linedisp-{label} instead of generic
linedisp=2E{n}?

I'm happy to implement these linedisp enhancements as part of the TM16xx
integration if you find the approach acceptable=2E

>> 2=2E Messages scroll indefinitely=2E There should be control for single=
-pass scrolling
>
>If we miss that, add it to linedisp=2E I wouldn't mind, actually I will b=
e in
>favour of the development of that library=2E
>

I'll submit patches to extend linedisp with missing functionality (like
single-pass scrolling control) as part of this integration=2E

>> I'm willing to contribute improvements to line-display if needed,
>> but this depends on resolving the main LED design question above=2E
>
>=2E=2E=2E
>
>> >> +		display->num_digits =3D 0;
>> >> +		fwnode_for_each_child_node(digits_node, child)
>> >> +			display->num_digits++;
>> >
>> >Don't we have a _count API for this?
>>=20
>> I'll use device_get_child_node_count() instead of manual counting loops=
=2E
>
>fwnode_get_child_node_count() I assume you meant=2E
>

Correct, my oversight=2E I'll use the fwnode variant=2E

>=2E=2E=2E
>
>> >> +	dev_dbg(dev, "Number of grids: %u\n", display->num_grids);
>> >> +	dev_dbg(dev, "Number of segments: %u\n", display->num_segments);
>> >
>> >I didn't get this=2E You mean that they are not strictly 7-segment one=
s?
>>=20
>> The terminology is confusing - "segment" is used both for 7-segment dig=
its
>> (which are indeed 7-segment) and for controller matrix coordinates
>> (grid,segment) from datasheets=2E Controllers support varying numbers o=
f segments
>> For individual LED icons, not necessarily related to 7-segment displays=
=2E
>> I'll add a comment to clarify this distinction=2E
>
>Hmm=2E=2E=2E Maybe try to rename these 'segments' to something else, like=
 'hwseg'
>(find a better name)=2E
>

Good point=2E I'll use a different name to distinguish from 7-segment term=
inology=2E

>=2E=2E=2E
>
>> >> +	/* Initialize main LED properties */
>> >> +	if (dev->of_node)
>> >> +		main->name =3D dev->of_node->name;
>> >> +	if (!main->name)
>> >> +		main->name =3D "display";
>> >> +	device_property_read_string(dev, "label", &main->name);
>> >
>> >My gosh=2E This is done in the LED core if we even need this=2E=2E=2E
>>=20
>> This relates to the LED subsystem integration question=2E If my design =
approach
>> is acceptable, I'll review the LED core implementation to avoid duplica=
ting
>> this logic if possible=2E
>
>I think if you integrate LED for special LED icons and linedisp for 7-seg=
ment
>into a single driver, it's fine=2E I just can't speak about LED icons cas=
e=2E
>The 7-seg LGTM (assuming linedisp and other existing APIs/ABIs to use, if=
 required)=2E
>

I think linedisp is the way to go if we can provide a consistent user spac=
e API=2E


