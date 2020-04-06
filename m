Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F007F19FFFC
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 23:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgDFVNK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 17:13:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45032 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFVNK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 17:13:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 403B91C47F0; Mon,  6 Apr 2020 23:13:08 +0200 (CEST)
Date:   Mon, 6 Apr 2020 23:13:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: core: Fix warning message when init_data
Message-ID: <20200406211307.GD12611@amd.ucw.cz>
References: <20200401095147.444353-1-ribalda@kernel.org>
 <ef851b8f-0232-ab09-482e-ae575fb8dbde@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline
In-Reply-To: <ef851b8f-0232-ab09-482e-ae575fb8dbde@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-04-01 21:49:00, Jacek Anaszewski wrote:
> Hi Ricardo,
>=20
> Thank you for the patch.
>=20
> On 4/1/20 11:51 AM, Ricardo Ribalda Delgado wrote:
> > The warning message when a led is renamed due to name collition can fail
> > to show proper original name if init_data is used. Eg:
> >=20
> > [    9.073996] leds-gpio a0040000.leds_0: Led (null) renamed to red_led=
_1 due to name collision
> >=20
> > Fixes: bb4e9af0348d ("leds: core: Add support for composing LED class d=
evice names")
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/leds/led-class.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 1fc40e8af75e..3363a6551a70 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -376,7 +376,7 @@ int led_classdev_register_ext(struct device *parent,
> > =20
> >  	if (ret)
> >  		dev_warn(parent, "Led %s renamed to %s due to name collision",
> > -				led_cdev->name, dev_name(led_cdev->dev));
> > +				proposed_name, dev_name(led_cdev->dev));
> > =20
> >  	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
> >  		ret =3D led_add_brightness_hw_changed(led_cdev);
> >=20
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thanks, applied.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXoubYwAKCRAw5/Bqldv6
8v9UAJwKQZAnZW36XiePXAyyOrCUgSLxCgCgnW6AbwGI7UI3O8EXyEB+c3tRsOA=
=61Fb
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
