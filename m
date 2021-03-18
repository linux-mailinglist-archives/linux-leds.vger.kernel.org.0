Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54D9340081
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 08:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCRH4E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Mar 2021 03:56:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44970 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhCRHz4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Mar 2021 03:55:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F1E2C1C0B7C; Thu, 18 Mar 2021 08:55:52 +0100 (CET)
Date:   Thu, 18 Mar 2021 08:55:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
Message-ID: <20210318075552.GA2331@amd>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Remove unnecessary Kconfig symbol LEDS_BLINK
> Improve Kconfig help text to make it more useful.
>=20
> Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>

> +++ b/drivers/leds/blink/Kconfig
> @@ -1,21 +1,19 @@
> -menuconfig LEDS_BLINK
> -       bool "LED Blink support"
> -       depends on LEDS_CLASS
> -       help
> -         This option enables blink support for the leds class.
> -         If unsure, say Y.
> -
> -if LEDS_BLINK
> -
> -config LEDS_BLINK_LGM
> -       tristate "LED support for Intel LGM SoC series"
> +config LEDS_LGM
> +       tristate "LED support for LGM SoC series"
>          depends on GPIOLIB
>          depends on LEDS_CLASS
>          depends on MFD_SYSCON
>          depends on OF
>          help
> -         Parallel to serial conversion, which is also called SSO=20
> controller,
> -         can drive external shift register for LED outputs.
> -         This enables LED support for Serial Shift Output controller(SSO=
).
> +         This option enables support for LEDs connected to GPIO lines on
> +         Lightning Mountain(LGM) SoC. These LEDs are driven by a Serial
> +         Shift Output(SSO) controller. The driver supports hardware

What is Lightning Mountain? The codename is not widely known. Where
can we find that hardware? Notebooks? Phones? Only some development
boards?

If user is not likely to need the driver, say so.

> +         blinking with a configurable LED update/blink frequency in two
> +         modes, 2/4/8/10 Hz in low speed mode and 50/100/200/250
> KHz in

kHz? But I guess we don't need that here.

>    *
> - * Copyright (c) 2020 Intel Corporation.
> + * Copyright (c) 2021 MaxLinear, Inc.
>    */
>=20

I don't think you can do that, and I don't think you should be doing
it in the same patch.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBTB4cACgkQMOfwapXb+vIVGACgth9ev/h83Tnn3C4aAvexU2tY
z9cAni/D6znXSqZUsVl9tMG980xesjPS
=nECn
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
