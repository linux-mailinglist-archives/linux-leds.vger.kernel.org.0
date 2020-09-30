Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41ABE27F073
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 19:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbgI3RYp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 13:24:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60648 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgI3RYp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:24:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 144EF1C0B76; Wed, 30 Sep 2020 19:24:42 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:24:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: Re: [PATCH v5 1/3] leds: pwm: Remove platform_data support
Message-ID: <20200930172441.GI27760@duo.ucw.cz>
References: <20200919053145.7564-1-post@lespocky.de>
 <20200919053145.7564-2-post@lespocky.de>
 <20200919094418.GC12294@duo.ucw.cz>
 <11962635.BNa8PrgvAO@ada>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline
In-Reply-To: <11962635.BNa8PrgvAO@ada>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +__attribute__((nonnull))
> > >=20
> > >  static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> > > =20
> > >  		       struct led_pwm *led, struct fwnode_handle *fwnode)
> > > =20
> > >  {
> >=20
> > This normally goes elsewhere -- right? I'd expect:
> >=20
> >=20
> >   static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> >   		       struct led_pwm *led, struct fwnode_handle *fwnode)
> > 	  __attribute__((nonnull))
>=20
> I found both variants in kernel code.  I can live with both variants and =
have=20
> no strong preference.
>=20
> My initial intention to add it was to get a compiler warning in case some=
one=20
> does not pass a fwnode here, e.g. when using that old platform_data appro=
ach=20
> (which is supposed to be removed with this patch).  You might call it a s=
elf=20
> check on my own changes.  I can also drop that attribute if you don't wan=
t=20
> that kind of stuff in linux-leds.

I'm okay with it at the second place :-).

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S/WQAKCRAw5/Bqldv6
8rDKAKCNDbu5Rgb8esUqr42ANlpnrNDlzgCgotvZMGrIVuUyMCrK5Q++5jbr4BE=
=XHap
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
