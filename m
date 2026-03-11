Return-Path: <linux-leds+bounces-7304-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLkUFgy+sWkwFAAAu9opvQ
	(envelope-from <linux-leds+bounces-7304-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 20:10:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8E269158
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 20:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E60903179B43
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BF435AC33;
	Wed, 11 Mar 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Nituiih2"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115CA2D47E4;
	Wed, 11 Mar 2026 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256122; cv=pass; b=nEAp157riUrorikJ+VKKxI8Leg8Z9P8560smOghKm7Ypy47OMTkuF6ObrYiU0JqEAix2rs1Ya6nA/32rL7FWjeHeJveaxu3x3Qv8abdWTaYOf3vF5+DiM7xXkm0PGI8CS2I6gx+tyt/3lCXOp4OEKRU7brmYzQ2IcoB3bfkdbio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256122; c=relaxed/simple;
	bh=fm+wmA4LpGbp6Da62EKXGMGEpQSmPaBJyzXXCekBW2U=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Bzktmm2ml5hWNXLF9v5QghpNYeNdMEc38xQ+TwAkegEz6OzIoJQIHz7jJ+NZfMabnylomXaJtQ9WR6r0XZhU4oCZbzdbgzj60EppNl5k0/ANNGjAbW1psf105YKMpLl+nojrIQfPUZyVtVj52R4jFw/UdHj3LsiKnzYlwErePhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Nituiih2; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773256100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y3ndiAUomtseOgQ4ejOBjpM+d6ajSZ1tVY/ptVNTB+gQs7yMY9LkA5EQFFwh8DVri41W8Udyg0MQH2kExSnEUx8rGo5gz9CngE4bEaRCf2TBSFlc3dI4v19IckT8+hTkvvczI9uRbWDmqv0ojzEGMvSx/Qf/QJKvOTZyiYV0sl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773256100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pe604p+NpvE62oRyxEGaPR9uXhoNA0pyGMAh7oD0p/A=; 
	b=A0LO166Z7PCcOVVtbiflXX3wiWlFrM9uxUzClmbtZTnSNgBX5zgjDWBxxu8Dq/nOQ6VWRSlkYDPpOPp9U6k7XrB4OBYlP5bcG5qHKzUqbvCcW3DLTf2Essm8ueCKUxF7m5iWmpYoT56yglnesefP051oBmEWVz+WzTU6rdkQWdg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773256099;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Pe604p+NpvE62oRyxEGaPR9uXhoNA0pyGMAh7oD0p/A=;
	b=Nituiih2xYvBGjcJGTVdwTaoy3FoOGJKWZ0IYuH2wrhMzAbJ/b/zb7iiyuEMAHwq
	OF0FNVCz1IDTDGhJaP8tHvbzqzpbND5LSVGrnV6wH7Ha/o/iVnI8THbuW56eZAH2SwD
	Ve3Fi5dOyqg8lIKRFymEXnrlg2g0EMI0+ibwCoafPTmhnmtcygHnK3k3SS69tfJKX6u
	ti2tS8o6pQPxiwaBtjRJ9nPf0evrrmlYhkzpvjbKJcbMtXrLKkhYzfMWeWw7+00zY8k
	eL2CvNmYVA1rTpMabLTcMx55SLZ2LOk1dse1N1rZF0IqNzVD7a5i265bGrKPN45NEm8
	Dlahw0Aa+w==
Received: by mx.zohomail.com with SMTPS id 177325609746683.96081152911302;
	Wed, 11 Mar 2026 12:08:17 -0700 (PDT)
Message-ID: <78c71bb40829328a84629a9601aa7911834f45ff.camel@rong.moe>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, vsankar@lenovo.com,
 linux-kernel@vger.kernel.org, 	linux-leds@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <c61a58df-8211-4f6a-8f60-b66b565123e4@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
	 <c61a58df-8211-4f6a-8f60-b66b565123e4@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2026 03:03:10 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7304-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:dkim,rong.moe:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADE8E269158
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

Thanks for your review.

On Tue, 2026-03-10 at 20:57 +0100, Andrew Lunn wrote:
> On Sat, Feb 28, 2026 at 03:05:57AM +0800, Rong Zhang wrote:
> > Hi all,
> >=20
> > Some laptops can tune their keyboard backlight according to ambient
> > light sensors (auto mode). This capability is essentially a hw control
> > trigger. Meanwhile, such laptops also offer a shrotcut for cycling
> > through brightness levels and auto mode. For example, on ThinkBook,
> > pressing Fn+Space cycles keyboard backlight levels in the following
> > sequence:
> >=20
> >   1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...
> >=20
> > Recent ThinkPad models should have similar sequence too.
>=20
> With networking, we consider the hardware as an accelerator for what
> the Linux network stack can already do in software. We let the user
> configure the network stack however they want it, and then we ask the
> hardware, can you accelerate this, so we don't need to do it in
> software? It might say -EOPNOTSUPP, so it is left in software. It
> might say 0, and we never see the packets, because the hardware is
> doing the work. The user is not really aware acceleration is
> happening, because they just configure the network stack how they
> want, independent of acceleration or not.
>=20
> For PHY and MAC LEDs it is exactly the same. Generally, the LEDs in
> RJ45 connectors, or on the front panel can be turned on/off. The
> netdev LED trigger knows if the link is 10M, 100M, 1G etc. It knows if
> packets are being transmitted or received. It can make the LEDs show
> the link speed, or blink for packet activity, in software, using
> simple set_brightness calls. It will also ask the LED, can you
> accelerate this? Can you get the state directly from the PHY/MAC? The
> LED in my keyboard shift lock will say -EOPNOTSUPP, and the netdev
> trigger will keep blinking it in software. The LED driver by the PHY
> might say 0, and blink the LED itself. Or it might say -EOPNOTSUPP,
> because the vendor decided to only support RX+TX, not only RX.
>=20
> My preference is this model of accelerating what Linux can already do
> should be used everywhere.

Well, there's a thing Linux can't do -- it can't prevent the keyboard
to autonomously activate/deactivate auto brightness after the shortcut
is pressed. The shortcut is processed by EC with zero OS involvement.
That's why brightness_hw_changed exists -- we can't prevent the
hardware to change the brightness on its own, so the best thing we can
do is to notify userspace about the event.

Now the same situation happens on a special brightness control mode
(auto brightness), which is essentially a hw control trigger. Hence I
figured out this series.=20

>=20
> You know how many levels the LED supports, so the trigger can easily
> implement the steps, 0, 1, 2, 0, 1, 2, based on receiving some event
> from somewhere.  You can also accelerate this, you can ask the LED,
> can you directly receive the event? -EOPNOTSUPP, keep controlling it
> from software. 0, stop driving it from software, the hardware will
> accelerate it.
>=20
> If the system has access to a light sensor,=C2=A0

At least on my device (ThinkBook) I can access the als sensor through
iio bus (driver: hid-sensor-als). But I am unsure if ThinkPad also
exposes it to the OS.

> the trigger can also
> decide on 0, 1, or 2, based on polling the light sensor every
> second.=C2=A0

I hardly see the advantages of a kernel mode trigger with 1s polling
interval compared to a trigger implemented in userspace, especially
when considering the inconvenience of configuring brightness curves.

AFAIK, KDE already implement a userspace trigger for screen backlight.
So that's also another issue: even if we implement a als-based software
trigger, it can't be used by video backlight and vice versa.

> It can then ask the LED, do you have direct access to the
> light sensor, can you accelerate this?

No, ThinkBook/ThinkPad doesn't report the curve or accept custom curves
so we can't really determine whether a specific curve can be offloaded.

>=20
> The experience from networking is, once you get into the mindset of
> the hardware is there to accelerate what Linux can already do, a lot
> of problems just disappear. It might you first need to implement the
> software version, but once you have that, acceleration is easy.
>=20
> Does Linux already have a software version of what you want? Can you
> accelerate it?

Such a trigger doesn't exist yet.

If some day in the future we have a als-based software trigger, this
series also provides a migration path thanks to the trigger_may_offload
attribute. Userspace are supposed to query it for the hw control
trigger's name.

Thanks,
Rong

>=20
> 	Andrew

