Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAFF214886
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jul 2020 22:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGDUHY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jul 2020 16:07:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49756 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgGDUHY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Jul 2020 16:07:24 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4D0C11C0BD2; Sat,  4 Jul 2020 22:07:21 +0200 (CEST)
Date:   Sat, 4 Jul 2020 22:07:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200704200720.GA24405@amd>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200704120459.GE16083@amd>
 <20200704121737.xiwcqzsfuzy3k3qf@core.my.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200704121737.xiwcqzsfuzy3k3qf@core.my.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Add support for registering per-LED device trigger.
> > >=20
> > > Names of private triggers need to be globally unique, but may clash
> > > with other private triggers. This is enforced during trigger
> >=20
> > Globally unique name is going to be a problem, no? If you have two
> > keyboards with automatical backlight support...
>=20
> Only globally unique in a sense that they must not clash with non
> per-LED trigger names. So you can have two keyboards with 'self-working'
> trigger on their LED devices in sysfs.
>=20
> This requirement only comes from the fact that this shares the
> same sysfs configuration interface as regular non-private triggers.

Ok. That looks sane.

And if you tweak code a bit (don't compare pointers to struct led;
have struct hw_trigger_group, and compare pointers to that), you
should be able to fix the uglyness Marek mentioned without major changes.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8A4XgACgkQMOfwapXb+vLbsgCgvokoJmSQ7pb80ed7OiSTkrex
pGUAoK0jV5UJHvqnGrfAtKVpolFF98nO
=SesQ
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
