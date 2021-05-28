Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C36394034
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbhE1Jlk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:41:40 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58648 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234456AbhE1Jlg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:41:36 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 555BE1C0B76; Fri, 28 May 2021 11:40:01 +0200 (CEST)
Date:   Fri, 28 May 2021 11:40:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 05/15] leds: leds-as3645a: Fix function name
 'as3645a_set_current()'
Message-ID: <20210528094000.GB2209@amd>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-6-lee.jones@linaro.org>
 <20210528093150.GN3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <20210528093150.GN3@paasikivi.fi.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >  drivers/leds/leds-as3645a.c:198: warning: expecting prototype for as36=
45a_set_config(). Prototype was for as3645a_set_current() instead
> >=20
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: linux-leds@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/leds/leds-as3645a.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> > index e8922fa033796..c41937ff8fd33 100644
> > --- a/drivers/leds/leds-as3645a.c
> > +++ b/drivers/leds/leds-as3645a.c
> > @@ -185,7 +185,7 @@ static int as3645a_read(struct as3645a *flash, u8 a=
ddr)
> >   */
> > =20
> >  /**
> > - * as3645a_set_config - Set flash configuration registers
> > + * as3645a_set_current - Set flash configuration registers
> >   * @flash: The flash
> >   *
> >   * Configure the hardware with flash, assist and indicator currents, a=
s well as
>=20
> Thanks for the patch.
>=20
> The entire comment could be removed. It's wrong and doesn't really tell
> more than what you can read in the two functions below (the two are result
> of splitting one the documentation was written for).

I just took the patch, I'll happily take a follow up.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwunAACgkQMOfwapXb+vIDIQCdHkA8F8khXqwhmjMMcWMpsTtP
aSgAoJuoZZk12F07SAqprrX+0qPKegcj
=kGEW
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
