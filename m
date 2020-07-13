Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8024921D044
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 09:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgGMHM6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 03:12:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53478 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgGMHM6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 03:12:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 321031C0BDD; Mon, 13 Jul 2020 09:12:56 +0200 (CEST)
Date:   Mon, 13 Jul 2020 09:12:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200713071255.GB30654@amd>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
 <20200711210111.5ysijhexgyzyr7u7@core.my.home>
 <20200712072554.GC4721@duo.ucw.cz>
 <20200712134911.r3lig4hgyqhmslth@core.my.home>
 <20200712191111.GA20592@amd>
 <20200712223821.742ljr4qxdrx3aqv@core.my.home>
 <20200713011544.0adc51f1@nic.cz>
 <20200713011841.25904273@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <20200713011841.25904273@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-07-13 01:18:41, Marek Behun wrote:
> On Mon, 13 Jul 2020 01:15:44 +0200
> Marek Behun <marek.behun@nic.cz> wrote:
>=20
> > On Mon, 13 Jul 2020 00:38:21 +0200
> > Ond=C5=99ej Jirman <megous@megous.com> wrote:
> >=20
> > > So after trying to use this, this seems to disallow the use of multip=
le HW
> > > triggers per LED. That's fine by me, because using one HW sysfs confi=
gured
> > > trigger per LED that use case is my proposal, but is it desireable in=
 general? =20
> >=20
> > Why? If you register one LED and several triggers, all sharing the same
> > trigger_type pointer, I think it should work.
> >=20
> > Marek
>=20
> The problem arises when I have two LEDs and two HW triggers, and the
> hardware allows setting one HW trigger on both LEDs and other HW
> trigger only on one LED. But this could simply be ignored - the
> set_trigger function could simply return -ENOTSUPP or something.

In this case you should have two trigger_type pointers (since two LEDs
are different), and yes, you'll have duplication for one of the
triggers. I don't think thats a problem.

Best regards,

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8MCXcACgkQMOfwapXb+vI3EACfTTWAUjxR+z+O0wW07CTZg6nY
OyQAnRovoM7dyl5LTNqQyJETm6JPstLb
=M34O
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
