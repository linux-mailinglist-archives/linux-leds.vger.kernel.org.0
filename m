Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DD23B783
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 16:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389498AbfFJOg3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 10:36:29 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34238 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388932AbfFJOg3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 10:36:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id EA4FB80253; Mon, 10 Jun 2019 16:36:16 +0200 (CEST)
Date:   Mon, 10 Jun 2019 16:36:26 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Simplify LED registeration by
 devm_led_classdev_register()
Message-ID: <20190610143626.GA7475@amd>
References: <20190608143039.13454-1-oleg@kaa.org.ua>
 <20190608143039.13454-2-oleg@kaa.org.ua>
 <ab1404dc-0a1f-ec23-3e3d-8eec86d24c8b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <ab1404dc-0a1f-ec23-3e3d-8eec86d24c8b@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-06-10 09:26:14, Dan Murphy wrote:
> Oleh
>=20
> On 6/8/19 9:30 AM, Oleh Kravchenko wrote:
> >Then there is no need to set np or store it.
>=20
> Huh?=A0 This does not really explain much about what this patch is
doing.

ledm_ variant does not need np, so it can be deleted. Sounds like a
good cleanup to me.

Acked-by: Pavel Machek <pavel@ucw.cz>


> >diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114=
=2Ec
> >index 91deb40db307..880089ef9a9b 100644
> >--- a/drivers/leds/leds-cr0014114.c
> >+++ b/drivers/leds/leds-cr0014114.c
> >@@ -183,12 +183,10 @@ static int cr0014114_probe_dt(struct cr0014114 *pr=
iv)
> >  	size_t			i =3D 0;
> >  	struct cr0014114_led	*led;
> >  	struct fwnode_handle	*child;
> >-	struct device_node	*np;
> >  	int			ret;
> >  	const char		*str;
> >  	device_for_each_child_node(priv->dev, child) {
> >-		np =3D to_of_node(child);
> >  		led =3D &priv->leds[i];
> >  		ret =3D fwnode_property_read_string(child, "label", &str);
> >@@ -207,8 +205,7 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
> >  		led->ldev.max_brightness	  =3D CR_MAX_BRIGHTNESS;
> >  		led->ldev.brightness_set_blocking =3D cr0014114_set_sync;
> >-		ret =3D devm_of_led_classdev_register(priv->dev, np,
> >-						    &led->ldev);
> >+		ret =3D devm_led_classdev_register(priv->dev, &led->ldev);
> >  		if (ret) {
> >  			dev_err(priv->dev,
> >  				"failed to register LED device %s, err %d",
> >@@ -217,8 +214,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
> >  			return ret;
> >  		}
> >-		led->ldev.dev->of_node =3D np;
> >-
> >  		i++;
> >  	}

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz+auoACgkQMOfwapXb+vJGNQCgvcr2OzAHjSQEkHF+hsmwzOPf
pVgAoLp7/LDHIoKZkK03gdV+kuuHEgEZ
=CLEP
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
