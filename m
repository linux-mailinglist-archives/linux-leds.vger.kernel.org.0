Return-Path: <linux-leds+bounces-5035-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6FB014C3
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 09:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44BD2177E01
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 07:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390A9197A6C;
	Fri, 11 Jul 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="J6r//GAT"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF631F237A
	for <linux-leds@vger.kernel.org>; Fri, 11 Jul 2025 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219193; cv=none; b=BCGLpiyWet1pzdb0nO8LbHLVoanjLuRAJkddEshSfO8TIKT8RL+vFFrju0LGhr30x+Q1KBzR27OXO2K35F+/X41QDqlRxBiLbMAz8gLTsdJlyIkhcYgLrcX38wwH7QI7LcqjK8xOZv6YoFD/VkeC0o7/vQE8qEejSc428DYC+1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219193; c=relaxed/simple;
	bh=bpy2jcueKt1Ab57TxBxzLvg09Ia/Q3/uloQIepkFi9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4jMbYE5E+TF93TRidOEA/4OuCZPDJJBfFdvLDYvGAnTYOpHD0BRQuIW27LV9QDgMenh/MKayQCG9V9/fw+5v9BpZmLEE7C85WqKG9LUdNOf6paxSCYCSL2p2zZCzJgSokLyij+pqh2H0oIoHTLex18owT0hAKlW+LurHvt6TZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=J6r//GAT; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id BE1551C00AB; Fri, 11 Jul 2025 09:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1752219181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QY76ROL4AteXNQhr/airw/l02pb3Cz7bQYdhRFrvuU=;
	b=J6r//GATfA8rQqCgNlQgDGt7R6kFEsmx3rUXN3kC+4RnKr/6WhLRLUMZrLZmjyGzDPaELD
	dwNPD9Q4GL2yJq1NeW11w7yY9uJU/OoBvXcMwqbn+Cq9Hbb4b4eOvxVMCxEp/fH1QUgmqf
	ilMn9esY2/j5flLuRSw1XE8KkynAnUw=
Date: Fri, 11 Jul 2025 09:33:01 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>,
	nyanmisaka <nst799610810@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-leds@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] leds: trigger: netdev: Configure LED blink interval for
 HW offload
Message-ID: <aHC+LU9egAa/3srw@duo.ucw.cz>
References: <20250120113740.91807-1-marex@denx.de>
 <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>
 <aHBZEh0q_FBh6urS@makrotopia.org>
 <4856875f-72cc-45ce-bd5b-8097122dac5c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5gdxEB97EQOEyfCW"
Content-Disposition: inline
In-Reply-To: <4856875f-72cc-45ce-bd5b-8097122dac5c@lunn.ch>


--5gdxEB97EQOEyfCW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-07-11 03:04:04, Andrew Lunn wrote:
> On Fri, Jul 11, 2025 at 01:21:38AM +0100, Daniel Golle wrote:
> > On Tue, Jul 08, 2025 at 01:14:52AM +0800, nyanmisaka wrote:
> > > On 1/20/2025 7:36 PM, Marek Vasut wrote:
> > > > In case a PHY LED implements .blink_set callback to set LED blink
> > > > interval, call it even if .hw_control is already set, as that LED
> > > > blink interval likely controls the blink rate of that HW offloaded
> > > > LED. For PHY LEDs, that can be their activity blinking interval.
> > > >=20
> > > > The software blinking is not affected by this change.
> > > >=20
> > > > With this change, the LED interval setting looks something like thi=
s:
> > > > $ echo netdev > /sys/class/leds/led:green:lan/trigger
> > > > $ echo 1 > /sys/class/leds/led:green:lan/brightness
> > > > $ echo 250 > /sys/class/leds/led:green:lan/interval
> > > >=20
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > ---
> > > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > > Cc: Christian Marangi <ansuelsmth@gmail.com>
> > > > Cc: Heiner Kallweit <hkallweit1@gmail.com>
> > > > Cc: Lee Jones <lee@kernel.org>
> > > > Cc: Lukasz Majewski <lukma@denx.de>
> > > > Cc: Pavel Machek <pavel@ucw.cz>
> > > > Cc: linux-leds@vger.kernel.org
> > > > ---
> > > >   drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++---
> > > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > >=20
> > >=20
> > > Hi there, a while ago OpenWRT 24.10 was updated to linux kernel 6.6.9=
3 [1]
> > > which contains the backport of this commit. Unfortunately this caused=
 the
> > > LAN and WAN port LEDs on some MediaTek based routers to not work prop=
erly,
> > > they just kept blinking.
> > >=20
> > > According to a comment [2] by an experienced OpenWRT developer and fr=
om my
> > > understanding this is a breaking change. Could you please take some t=
ime to
> > > review the issue in the link and help revert the commit if necessary.=
 Thanks
> > > in advance.
> > >=20
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
commit/?h=3Dlinux-6.6.y&id=3D3648ddabcdc25aad8af95778d7f87225272815e9
> > > [2] https://github.com/openwrt/openwrt/issues/19263#issuecomment-3032=
228022
> >=20
> > To clarify: This patch, which also got backported to Linux stable trees,
>=20
> Why was it back ported? This is clearly not a fix, and does not have a
> Fixes: tag.

LLM decides what to backport, with little to no human oversight :-(.

BR,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--5gdxEB97EQOEyfCW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaHC+LQAKCRAw5/Bqldv6
8nhpAKCjzTPPvSyt1tfppxErBkEkNcEaSgCeOZk7moT6+Y7FxhyURQmxM8d/SAU=
=RPrr
-----END PGP SIGNATURE-----

--5gdxEB97EQOEyfCW--

