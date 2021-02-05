Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DE4310943
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 11:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhBEKhq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 05:37:46 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:38410 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbhBEKfZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Feb 2021 05:35:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A93511C0B77; Fri,  5 Feb 2021 11:34:39 +0100 (CET)
Date:   Fri, 5 Feb 2021 11:34:38 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210205103438.GB27854@amd>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-02-05 09:59:19, Sven Schuchmann wrote:
> Hello Pavel,
>=20
> > > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > > index f13117eed976..4b40bf66483c 100644
> > > --- a/drivers/leds/leds-lp50xx.c
> > > +++ b/drivers/leds/leds-lp50xx.c
> > > @@ -267,7 +267,6 @@ struct lp50xx_led {
> > >  	struct led_classdev_mc mc_cdev;
> > >  	struct lp50xx *priv;
> > >  	unsigned long bank_modules;
> > > -	int led_intensity[LP50XX_LEDS_PER_MODULE];
> > >  	u8 ctrl_bank_enabled;
> > >  	int led_number;
> > >  };
> >=20
> > ? Does not make sense and changelog does not help.
>=20
> This is an unused variable which is in the driver
> (same as the regulator). Should I provide a patch on its own for that
> or just describe in the changelog?

Lets do separate patch here. DT changes will need Ack from Rob, this
can go in directly.

Can you or Dan submit patch getting the regulator support to work? If
not, I guess we should remove the regulator support after all.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAdHz4ACgkQMOfwapXb+vKA+ACeLp1dQc6RSRQU1sKNLCNENWBw
S9kAoIs6k+22co4C5R0TPxCQ7JQxCJmM
=0pUB
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
