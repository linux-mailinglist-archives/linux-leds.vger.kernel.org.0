Return-Path: <linux-leds+bounces-7696-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2uShBDzN2mlm6ggAu9opvQ
	(envelope-from <linux-leds+bounces-7696-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 00:37:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751A3E1D70
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 00:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CAB3301BCD2
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 22:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1142E0914;
	Sat, 11 Apr 2026 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UsfULlIa"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648DC1862;
	Sat, 11 Apr 2026 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775947064; cv=pass; b=UiwsgJjUZvwAau6VJ+A3UmfRBMIuUOgafcGJYXuCWP0XJ6I5rljSC1RIH1FbntQ2MFxWeOg2SSB7880UoRa/ukn6rvdGrP+dS/PVfXBlRuQ7SuLP0d8IpxXVg2HUu+Qu6i9tOCJyN1a7mc8qXIWcypb2LV7KKuOJd5TK5/864qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775947064; c=relaxed/simple;
	bh=YFzDcMGTo503e8HjbuFdNKlbfcCU4S4C5DjI2dWNWCg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qxgUDRDGrzckaxh7CMf5uo3aHJ8dKtFr1X3FROdSV4kwOH5rTEsGkokY+mSpgJ5NTUKDj3HapPLDKZ60R6UPMMJhUKnIEU0U3OfABlXmet3Pihc0f4dFBLWdCiGMk2gMHMbGsUfuSpochuNZ0OaEpLq57qGW5EVppuCPBjBSaJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UsfULlIa; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1775947040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RXV69iCB66igDd9h3bw9ByP/uU/uG7SEwfCV/lpOBHdiRRCTzpigPtezZruec4QF9G/odbfxb9S6w/JNUuxAKtx8wXLPi622W0fiMFM4DV0H6dvpFoTEKyAjji4eYSmDtGymNSmawhUBsOCmpWdDiNuzn7O9fid8C+iCMv5gL3k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775947040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=flwqPFmVI+dvB8OaxOpBOZENS6A39u5Hf5gToiKRdbE=; 
	b=llh7YFytT05lWxOgBnhJxFO+g9N/82is0nwyhjnRz6p1ZbJEiWm4l36TUbUKF7Lt0sps3nptvIS8c78UHw+y13fWzYoA2nRWmuDXDectHJ6mQNElmGCW6xGq+AxeWjli9z6rXsBskxgYiyxk75lKtbcNHa1Ul8wngDXOUSS55uU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775947040;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=flwqPFmVI+dvB8OaxOpBOZENS6A39u5Hf5gToiKRdbE=;
	b=UsfULlIaB317uABg3yREb/dOgAB0EszRi8lv+9LHPkAYOGq+vNlSg5t7ySLizaUN
	Eo+QIJlSrUDJKRa6vcX4TNgfQ72tLYCxFN4rRclHF2lNY1IEkCMyKYfIWMBnw5qmtX5
	uCT0S9KYWSkIU2KSj3dQ1AXXdJnivfQx8gss+13y1juepRabPW7h1ve60NyR/E/Wv8G
	Xs9UU3Ujb8oATu7YAMq2/OyEayJapISkusoqAIyrhpeo/xrwbP8Lzr/ISRAR6Cn4fiJ
	nqvPwzPEnidOb5sZaSZBkC+WSiSjjuTXjmFmJfOrkvNWJunEhrGRKa7wqsrqaf1Zota
	RJ5Z2P4QbA==
Received: by mx.zohomail.com with SMTPS id 1775947037522108.32564365614166;
	Sat, 11 Apr 2026 15:37:17 -0700 (PDT)
Message-ID: <9c17a159b81db81e83a9e5553a5b4105624ecc81.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  "Derek J . Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Vishnu Sankar	 <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>, 	linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 	chrome-platform@lists.linux.dev,
 "platform-driver-x86@vger.kernel.org"	 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <6697bb96-6ae7-4cff-b218-2aa099977dc9@lunn.ch>
References: <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
	 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
	 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
	 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
	 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
	 <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
	 <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
	 <cc4398e1512dceb531ba3bd5dd0d20cf2042bb84.camel@rong.moe>
	 <2ac0c46c-805d-4749-a6e0-94b16b104a72@app.fastmail.com>
	 <7437cc09-7958-4172-aec2-4429cfa98141@app.fastmail.com>
	 <6697bb96-6ae7-4cff-b218-2aa099977dc9@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Apr 2026 06:32:10 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7696-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:dkim,rong.moe:mid]
X-Rspamd-Queue-Id: 4751A3E1D70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

On Sat, 2026-04-11 at 22:42 +0200, Andrew Lunn wrote:
> > Hi maintainers - a gentle nudge on this one. Would like some
> > direction if we can move ahead with the series. If not, what is
> > required?
> =C2=A0
>=20
>=20
>=20
> > On our side I know Vishnu has implemented the thinkpad driver using
> > this and confirmed the design works there too.
> =C2=A0
>=20
>=20
>=20
> > Would like to get this upstream so we can start working with the
> > user-space folk on updating their pieces.
>=20
> I'm not the Maintainer here, so i would not be too unhappy if i was
> ignored.

Thanks for sharing your thoughts.

>=20
> I've had some time to think about this. I guess you are going to go
> with a Linux LED, whatever. With that assumption in place, a trigger
> makes sense. But i think it needs to be a special sort of trigger, and
> a special sort of LED.
>=20
> This is not a general purpose LED, which is a basic assumption for
> Linux LEDs. You cannot make it blink for netdev packets, shift lock,
> heartbeat, etc, because Linux does not control it, the EC does. Linux
> can ask the EC to set it to some state, but the EC might change it,
> and notify Linux afterwards. That is not the normal behaviour of a
> Linux LED.

Such a behavior is mostly handled by brightness_hw_changed (with
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy). It's already there for 9 years.
More details below.

The problem here is more about how to represent the ALS-based auto
brightness mode and how to notify userspace of its (de)activation. The
series demonstrates an approach to achieve both goals.

>=20
> Also, it does not make sense to allow the trigger to be bound to any
> other LED.

I used a private trigger in PATCH 9/9. It can never be bound to any
other LEDs.

>=20
> The trigger and the LED are tightly bound together. So i would put
> them in the same driver. There are triggers which live outside of
> drivers/leds/trigger/. So it is not a problem it lives somewhere
> else. It also solves the ordering problem you had, getting the trigger
> registered. Since it lives in the same driver as the LED, you know it
> is registered, you do it before registering the LED.

I intentionally included PATCH 9/9 in the series to demonstrate how to
use the new interface. It registers a private trigger before registering
the LED, so there is no ordering problem.

>=20
> I think you need some additional logic in the core. This LED must have
> this trigger.=C2=A0I would look at using the is_visible() attribute
> callback to make the trigger file in sysfs invisible for this LED, so
> it cannot be changed.=C2=A0
>=20

Doing so breaks userspace. The LED device has been already there and
worked with LED triggers for so many years. Not having 100% pure
software control is not a convictive reason to break userspace from my
perspective. Of course I am not a maintainer too so that's just my
personal thoughts.

Moreover, LEDs without 100% pure software control are already there for
at least 9 years. All LEDs with the LED_BRIGHT_HW_CHANGED flag set fall
into this category. They've worked with LED triggers for 9 years. See
also commit 0cb8eb30d425 ("leds: class: Add new optional
brightness_hw_changed attribute")

All these LEDs are keyboard backlight. As long as the user doesn't press
the shortcut (e.g., Fn+Space), all these LEDs works with any LED
triggers perfectly. If an user presses the shortcut, they know what they
are doing. If an user enables a trigger by writing to the trigger file,
they know they shouldn't press the shortcut afterward.

> I would somehow get this trigger attached to the
> LED when it is created.=C2=A0
>=20

I've done this in PATCH 9/9.

> The trigger_relevant() call needs to be
> extended so that you cannot attach this trigger to any other LED.

trigger_relevant() already supports this.

I set .trigger_type to the same value on both the private trigger and
the LED device in PATCH 9/9. Doing so is enough to prevent the trigger
from being attached to any other LED. See also commit 93690cdf3060
("leds: trigger: add support for LED-private device triggers").

>=20
> I would also think about naming. The behaviour is i guess specific to
> X86 laptops? Do Apple laptops have the same behaviour? What about
> Snapdragon X Series laptops? Chromebooks? USB keyboards? What about
> things like the Unihertz Titan 2?

   $ grep -rl LED_BRIGHT_HW_CHANGED
   Documentation/leds/leds-class.rst
   drivers/hid/hid-lg-g15.c
   drivers/leds/led-class.c
   drivers/platform/x86/dell/dell-laptop.c
   drivers/platform/x86/system76_acpi.c
   drivers/platform/x86/lenovo/ideapad-laptop.c
   drivers/platform/x86/lenovo/thinkpad_acpi.c
   drivers/platform/x86/samsung-galaxybook.c
   drivers/platform/x86/asus-wmi.c
   drivers/platform/x86/lg-laptop.c
   drivers/platform/x86/toshiba_acpi.c
   drivers/platform/arm64/lenovo-thinkpad-t14s.c
   include/linux/leds.h

There are arm64 laptops and Logitech's USB keyboards that change their
backlight brightness without consulting with the OS. If these devices
support auto brightness, they will benefit from this series too.

Also, the series aims to eliminate problems on naming. Userspace doesn't
need to know the trigger's name beforehand. Instead, the new interface
provides the name to userspace, see PATCH 6/9.

>=20
> Somebody in the future might produce a generic solution. Linux
> controls the LED. The Linux input system gets the key presses and
> sends them to the trigger. You can bind an iio ambient sensor to the
> trigger, etc. So you should leave the name space open for other
> implementations.

I agree with that, but we are already living in a world that most Fn
keys on keyboards are always translated before reaching the OS. I don't
think we will have a keyboard that behave like the ideal way any soon,
especially considering that nowadays some compact keyboards even send
Meta+Shift+S instead of SysRq when the Fn key combination for screenshot
is pressed -- they can't even work with magic SysRq. And in an ideal
world the Copilot key (sends RCtrl+RShift+F23) shouldn't appear at
all...

Thanks,
Rong

>=20
> 	 Andrew

