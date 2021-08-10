Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E313E5C3B
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 15:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbhHJNxI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 09:53:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59464 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241105AbhHJNxH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 09:53:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EB3BF1C0B77; Tue, 10 Aug 2021 15:52:43 +0200 (CEST)
Date:   Tue, 10 Aug 2021 15:52:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Phil Sutter <phil@nwl.cc>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Add invert attribute to ledtrig-audio
Message-ID: <20210810135243.GB28089@amd>
References: <20210809122910.11580-1-phil@nwl.cc>
 <20210809181118.GA16184@duo.ucw.cz>
 <20210810092246.GB3673@orbyte.nwl.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20210810092246.GB3673@orbyte.nwl.cc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>=20
> On Mon, Aug 09, 2021 at 08:11:18PM +0200, Pavel Machek wrote:
> > > Inverting micmute LED used to be possible via a mixer setting, but
> > > conversion to LEDs class (probably) killed it. Re-establish the old
> > > functionality via sysfs attribute in audio LED triggers.
> >=20
> > So we have both invert and inverted attributes. Fun :-).
>=20
> Hmm! :)
>=20
> Are you talking about LED_BLINK_INVERT flag? I see a few triggers allow
> inversion but didn't find LED drivers exporting such a property.
>=20
> > See sysfs-class-led and sysfs-class-led-trigger-oneshot.
>=20
> I think I "copied" from oneshot trigger when writing this patch.
>=20
> > We definitely want this documented. We probably want this for most
> > triggers, maybe it should get one implementation in library somewhere?
>=20
> Should this be an implicit attribute of simple triggers only or all? In
> the latter case (which could simplify some triggers) I guess the value
> inversion has to take place in led_set_brightness_nopm(), the lowest
> level function triggers may use.

Actual inversion is trivial (so it may not make sense to share), but
sysfs interface is not. Sharing that would be good.

> How does inversion work, actually? LED_OFF <-> LED_ON is trivial, but
> what about LED_HALF and LED_FULL? Leaving LED_HALF as-is seems logical,
> but the opposite of LED_OFF might be LED_ON or LED_FULL. Does
> max_brightness determine that?

max_brightness determines that, and it would be simply

if (->inverted)
   b =3D ->max_brighntess-b;
  =20
Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEShKsACgkQMOfwapXb+vIp7QCgnzxX+34NpY5A5xKUluyaySyM
aukAoKjSjKVBnfd+XkVqbS839v5N3rKC
=ykOf
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
