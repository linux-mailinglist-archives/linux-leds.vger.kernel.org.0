Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9586E21C7DD
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 09:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgGLHZ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 03:25:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47008 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLHZ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 03:25:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 481441C0BD2; Sun, 12 Jul 2020 09:25:55 +0200 (CEST)
Date:   Sun, 12 Jul 2020 09:25:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Cc:     marek.behun@nic.cz
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200712072554.GC4721@duo.ucw.cz>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
 <20200711210111.5ysijhexgyzyr7u7@core.my.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <20200711210111.5ysijhexgyzyr7u7@core.my.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-07-11 23:01:11, Ond=C5=99ej Jirman wrote:
> Hello Pavel,
>=20
> On Sat, Jul 11, 2020 at 12:04:09PM +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > Some LED controllers may come with an internal HW triggering mechanism
> > > for the LED and an ability to switch between user control of the LED,
> > > or the internal control. One such example is AXP20X PMIC, that allows
> > > wither for user control of the LED, or for internal control based on
> > > the state of the battery charger.
> > >=20
> > > Add support for registering per-LED device trigger.
> > >=20
> > > Names of private triggers need to be globally unique, but may clash
> > > with other private triggers. This is enforced during trigger
> > > registration. Developers can register private triggers just like
> > > the normal triggers, by setting private_led to a classdev
> > > of the LED the trigger is associated with.
> >=20
> > What about this? Should address Marek's concerns about resource use...
>=20
> What concerns? Marek's concerns seem to be about case where we register
> a trigger for (each led * self-working configuration) which I admit
> can be quite a lot of triggers if there are many functions. But that's
> not my proposal.
>=20
> My proposal is to only register on trigger per LED at most. So on my
> system that's 1 extra trigger and on Marek's system that'd be 48 new
> triggers. Neither seems like a meaningful problem from resource
> use perspective.

So.. 48 triggers on Marek's systems means I'll not apply your patch.

Please take a look at my version, it is as simple and avoids that
problem.

If it works for you, you can submit it properly and I'll likely accept
it.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXwq7AgAKCRAw5/Bqldv6
8lvJAKCU/pM9yDor3xjFX40apgClgoYgeACgsGQ11cWstI1FTKDEPeMIUy2icKc=
=DZKL
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
