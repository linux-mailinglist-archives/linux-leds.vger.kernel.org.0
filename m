Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0AB270CB3
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 11:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISJ4U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 05:56:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44530 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISJ4U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 05:56:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 15EA31C0B85; Sat, 19 Sep 2020 11:56:17 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:56:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Rod Whitby <rod@whitby.id.au>
Subject: Re: [PATCH leds v2 03/50] leds: fsg: compile if COMPILE_TEST=y
Message-ID: <20200919095616.GA14795@duo.ucw.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-4-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-4-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-09-18 00:32:51, Marek Beh=FAn wrote:
> This driver can be compiled on other platforms with small change if
> COMPILE_TEST=3Dy.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>

> +++ b/drivers/leds/leds-fsg.c
> @@ -16,7 +16,13 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/io.h>
> +
> +#if IS_ENABLED(MACH_FSG)
>  #include <mach/hardware.h>
> +#else
> +/* for COMPILE_TEST */
> +#define IXP4XX_EXP_BUS_BASE(x) (0x12345678 + (x))
> +#endif

This is _way_ too ugly and I'd have to read the driver to understand
what prevents it from using this address and corrupting something, somewher=
e.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XVwAAKCRAw5/Bqldv6
8s+DAJ9yZPWsnilPO6oUxxol1S6NKoTVQgCdHpNcrf1DKv4OWZreFG6XSBZeJis=
=BX3v
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
