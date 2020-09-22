Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EBC2746C5
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 18:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVQio (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 12:38:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56678 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgIVQio (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 12:38:44 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A3FA11C0BAC; Tue, 22 Sep 2020 18:38:42 +0200 (CEST)
Date:   Tue, 22 Sep 2020 18:38:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH leds v3 6/9] leds: lm36274: use devres LED registering
 function
Message-ID: <20200922163842.GB25550@duo.ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-7-marek.behun@nic.cz>
 <20200920214532.GB31397@duo.ucw.cz>
 <20200920235436.185ceebc@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20200920235436.185ceebc@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-09-20 23:54:36, Marek Behun wrote:
> On Sun, 20 Sep 2020 23:45:32 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > Hi!
> >=20
> > > Now that the potential use-after-free issue is resolved we can use
> > > devres for LED registration in this driver.
> > >=20
> > > By using devres version of LED registering function we can remove the
> > > .remove method from this driver.
> > >=20
> > > Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> > > Cc: Dan Murphy <dmurphy@ti.com> =20
> >=20
> > AFAICT this one is buggy, I sent explanation before. Why are you
> > resubmitting it?
>=20
> The previous patch in this series (v3 5/9) should solve this issue and
> th commit message explains how.

Aha, let me see.

Will 5/9 have some side-effects, like device appearing at different
place in sysfs?

First few patches look ok, but it would be really nice someone tested
complete sereies.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2ookgAKCRAw5/Bqldv6
8ls/AJ9Z0an9IF07i0prMJgzY0A1tx8/ywCgm7iDUSeV4eJdUnwU0AEOIps8/iU=
=qKce
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
