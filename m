Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3792735E8
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 00:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgIUWmQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 18:42:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56078 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728591AbgIUWmQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2020 18:42:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5CFFB1C0B8C; Tue, 22 Sep 2020 00:42:13 +0200 (CEST)
Date:   Tue, 22 Sep 2020 00:42:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
Message-ID: <20200921224212.GA13299@amd>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
 <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Can I get details of your setup?
>=20
> I don't use this trigger, but I can imagine that someone does.

Well, if someone exists, we can increase the limit, or convince them
to change their setup.

> >What CPU type that is, and how are you mapping CPU activity to LEDs?
>=20
> The type of CPU is irrelevant here. What is important is the fact
> that with this trigger it is possible to visually monitor CPU core
> online state. Probably it would be good to ask the author of that
> trigger about his use case.

It is relevant -- cpu trigger never worked on x86. I had patch fixing
it, but got pushback.

> I have spoken up, because I don't get the reason for your patch.
> This driver was reworked year ago to remove PAGE_SIZE limit,
> and I even applied it to my for-next tree, but that was at
> the time of handling maintainership to yourself, and you
> seem to not have picked that commit.
>=20
> Was that intentional? We had even Greg's ack [0].

I checked, and I believe the commit is in:

#ifdef CONFIG_LEDS_TRIGGERS
static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write,
0);
static struct bin_attribute *led_trigger_bin_attrs[] =3D {

So.. no, it is not causing kernel crashes or something. But it is
example of bad interface, and _that_ is causing problems. (And yes, if
I realized it is simply possible to limit it, maybe the BIN_ATTR
conversion would not be neccessary...)

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9pLEQACgkQMOfwapXb+vKQkQCdEHZE9Urf7rCD0NLk6hcOgiU4
nEoAnArg8S/GPNjmuPSxEBm8aYRiOAed
=Kd18
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
