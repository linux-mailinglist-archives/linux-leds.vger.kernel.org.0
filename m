Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F93A128AFE
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 20:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfLUTPS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 14:15:18 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42042 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfLUTPS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:15:18 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5C9751C24DF; Sat, 21 Dec 2019 20:15:16 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:15:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt: bindings: lm3692x: Document new properties
Message-ID: <20191221191515.GF32732@amd>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline
In-Reply-To: <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-12-16 13:28:05, Guido G=FCnther wrote:
> We allow configuration of brightness mode and over voltage
> protection.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -18,6 +18,10 @@ Required properties:
>  Optional properties:
>  	- enable-gpios : gpio pin to enable/disable the device.
>  	- vled-supply : LED supply
> +	- ti,brightness-mapping-exponential: Whether to use exponential
> +	    brightness mapping
> +	- ti,overvoltage-volts: Overvoltage protection in Volts, can
> +	    be 0 (unprotected), 21, 25 or 29V
> =20

We usually use microvolts in various device tree properties...

Exponential mapping s not really property of the hardware, is it? Does
it belong here or somewhere in the backlight binding?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+b0MACgkQMOfwapXb+vKP5gCfW7lmZrPM2RwqiUQvlaxI8MeP
0NkAoLH84rBzrjKgFcLJK9HmlR9F1R0e
=EmGh
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
