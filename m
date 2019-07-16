Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A176A6AFD7
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 21:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfGPTaE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 15:30:04 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47375 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbfGPTaE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 15:30:04 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5FE218058B; Tue, 16 Jul 2019 21:29:50 +0200 (CEST)
Date:   Tue, 16 Jul 2019 21:30:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/6] leds: apu: drop superseeded apu2/3 led support
Message-ID: <20190716193001.GG10400@amd>
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-2-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Content-Disposition: inline
In-Reply-To: <1563202653-20994-2-git-send-email-info@metux.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 16:57:28, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
>=20
> This driver only supports gpio-attached LEDs on apu1/2/3 boards,
> but neither gpio's themselves, nor other gpio-attached devices
> (eg. front button).
>=20
> For apu2+ a newer, more complete driver exists, based on a generic
> driver for the AMD SOCs gpio-controller, supporting LEDs as well
> other devices. Therefore these boards don't need legacy support
> from this driver anymore.
>=20
> Both drivers claim the same device, so only one driver may exist
> in a system, putting distros in the position to decide between
> either apu2+ keys or apu1 led support.
>=20
> Therefore drop the apu2+ led support from the old driver, solve
> the conflict and reduce unnecessary code.
>=20
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/leds/Kconfig    |   5 +-
>  drivers/leds/leds-apu.c | 124 +++---------------------------------------=
------
>  2 files changed, 10 insertions(+), 119 deletions(-)
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b0fdeef..f7a3dd7 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -74,9 +74,12 @@ config LEDS_APU
>  	depends on LEDS_CLASS
>  	depends on X86 && DMI
>  	help
> -	  This driver makes the PC Engines APU/APU2/APU3 front panel LEDs
> +	  This driver makes the PC Engines APU1 front panel LEDs
>  	  accessible from userspace programs through the LED subsystem.
> =20
> +	  If you're looking for APU2/3, use the pcengines-apu2 driver.
> +	  (symbol CONFIG_PCENGINES_APU2)
> +
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called leds-apu.
> =20

Ok, so I understand the reasons, but people updating from old kernels
(make oldconfig) will see nothing and their LEDs will stop working.

Can we do something to help them?

Rest is ok.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0uJbkACgkQMOfwapXb+vJinQCgwRl5ed75Fdyxo+6W2ijBiMDS
Pc0An2UzFuvrMmY7nvINhfNApS6FxUXD
=wc14
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--
