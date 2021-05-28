Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335AD3940FA
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbhE1KhP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236381AbhE1KhL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:37:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ABEC061574
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 03:35:36 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lmZq1-0008LY-79; Fri, 28 May 2021 12:35:33 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lmZq0-0001Tk-PA; Fri, 28 May 2021 12:35:32 +0200
Date:   Fri, 28 May 2021 12:35:32 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 02/15] leds: leds-gpio-register: Supply description for
 param 'id'
Message-ID: <20210528103532.5n6zzr26hqglvz2p@pengutronix.de>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-3-lee.jones@linaro.org>
 <20210528094118.xw53q46i676wx6gb@pengutronix.de>
 <20210528095531.GO543307@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="orhpy32uu5qcw7jc"
Content-Disposition: inline
In-Reply-To: <20210528095531.GO543307@dell>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--orhpy32uu5qcw7jc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lee,

On Fri, May 28, 2021 at 10:55:31AM +0100, Lee Jones wrote:
> On Fri, 28 May 2021, Uwe Kleine-K=F6nig wrote:
> > On Fri, May 28, 2021 at 10:06:16AM +0100, Lee Jones wrote:
> > > diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gp=
io-register.c
> > > index b9187e71e0cf2..de3f12c2b80d7 100644
> > > --- a/drivers/leds/leds-gpio-register.c
> > > +++ b/drivers/leds/leds-gpio-register.c
> > > @@ -11,6 +11,7 @@
> > >  /**
> > >   * gpio_led_register_device - register a gpio-led device
> > >   * @pdata: the platform data used for the new device
> > > + * @id: platform ID
> > >   *
> >=20
> > Given that id is the first parameter and pdata the second I suggest to
> > swap the order here and describe id first.
>=20
> That's super picky.
>=20
> I can do it as a follow-up patch if you *really* care about it.

I'd say introducing the one-line description for id now in the "wrong"
location and then reordering as a followup is ridiculus. But having said
that: I don't care at all.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--orhpy32uu5qcw7jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCwx3IACgkQwfwUeK3K
7AmYMQgAm08olKVQR6dfF4Wu5P6Bqc4husZSDdRqbWvQC8u7FSzA8jBtys9hA6Wr
DWThj/opDyZHhfhlVtS1YRjps0eVkv9Li3HW0Ig77+MvCIJX64jrN0Yfga9j3Qwg
eYr1dss13EEQXy3VD16SBkwOHxYcN1sUM0XBTYiLeIlpvBPTuHfaDdDdK1n5ea6U
pwy4hhaN1GCcYK+Wh9N0brrwB6AT/XTts90fpaCOrs5c3KP1rgZomqUWpMQaMc+C
rny5L6BGY17sbp0j9FGAdl/hN6ammWMPE7Aj+ognh1spdwgFBxBNnTY2//90zE9t
m2khCyRq6mMycxmYwcKYC6hEAyokVQ==
=eRgO
-----END PGP SIGNATURE-----

--orhpy32uu5qcw7jc--
