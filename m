Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D66AEA8A
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbfD2SzO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:55:14 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60846 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbfD2SzO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 14:55:14 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B25E180696; Mon, 29 Apr 2019 20:55:03 +0200 (CEST)
Date:   Mon, 29 Apr 2019 20:55:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH leds/for-next v3 1/1] leds: turris_omnia: add I2C and
 MACH_ARMADA_38X dependencies
Message-ID: <20190429185511.GC24658@amd>
References: <20190429183226.14078-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <20190429183226.14078-1-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 20:32:26, Marek Beh=FAn wrote:
> This driver depends on I2C. There are linking problems otherwise, if for
> example CONFIG_LEDS_TURRIS_OMNIA=3Dy and CONFIG_I2C=3Dm.
>=20
> Also add MACH_ARMADA_38X dependency, since it is unlikely that some
> other device will ever have a microcontroller with software compatible
> to that of Turris Omnia microcontroller.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d5b31a71a112..6b555d31c1be 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -131,6 +131,8 @@ config LEDS_CR0014114
>  config LEDS_TURRIS_OMNIA
>  	tristate "LED support for CZ.NIC's Turris Omnia"
>  	depends on LEDS_CLASS
> +	depends on I2C
> +	depends on MACH_ARMADA_38X

You may want to do || COMPILE_TEST if you resubmit.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHSI8ACgkQMOfwapXb+vIpLQCaAlwvi4pNawac0y0rhn4q/luI
3O8AnjgjhIrjJOXdLcaIFbn33xXE31TQ
=hCXZ
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
