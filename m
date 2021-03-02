Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05AE32B22C
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhCCCjg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449174AbhCBQQS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Mar 2021 11:16:18 -0500
X-Greylist: delayed 775 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Mar 2021 08:15:20 PST
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [IPv6:2a00:da80:fff0:2::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCB8C0617A9
        for <linux-leds@vger.kernel.org>; Tue,  2 Mar 2021 08:15:19 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D755D1C0B88; Tue,  2 Mar 2021 16:55:34 +0100 (CET)
Date:   Tue, 2 Mar 2021 16:55:34 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        linux-leds <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        malliamireddy009@gmail.com, yixin.zhu@intel.com
Subject: Re: [PATCH v3 2/2] leds: lgm: Add LED controller driver for LGM SoC
Message-ID: <20210302155534.GA19849@duo.ucw.cz>
References: <49ebc8e27958cb77cde36e5f95ad530803259907.1607591119.git.mallikarjunax.reddy@linux.intel.com>
 <dfd39387b1f72eb22a29bad516398a47b20c47bc.1607591119.git.mallikarjunax.reddy@linux.intel.com>
 <CAMuHMdW=M6wougrQMjBdTfFQzPbEQOM-Svq=DTQi8Rvzabxc_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=M6wougrQMjBdTfFQzPbEQOM-Svq=DTQi8Rvzabxc_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > --- /dev/null
> > +++ b/drivers/leds/blink/Kconfig
> > @@ -0,0 +1,20 @@
> > +menuconfig LEDS_BLINK
> > +       bool "LED Blink support"
> > +       depends on LEDS_CLASS
> > +       help
> > +         This option enables blink support for the leds class.
> > +         If unsure, say Y.
>=20
> What is the purpose of the LEDS_BLINK config symbol?
> Blink support for the leds class is always available, regardless of the
> value of this symbol, and controlled for individual drivers by filling
> in the led_classdev.blink_set() callback.

We don't really need the symbol.

> > +if LEDS_BLINK
> > +
> > +config LEDS_BLINK_LGM
> > +       tristate "LED support for Intel LGM SoC series"
> > +       depends on LEDS_CLASS
> > +       depends on MFD_SYSCON
> > +       depends on OF
> > +       help
> > +         Parallel to serial conversion, which is also called SSO contr=
oller,
> > +         can drive external shift register for LED outputs.
> > +         This enables LED support for Serial Shift Output controller(S=
SO).
>=20
> What's so special about this driver that it needs a new "blink" subdir?
> Isn't it an ordinary LED driver?
> Looking at the code filling in the .blink_set() callback, the hardware
> blink feature seems to be even optional?

So idea is to start putting drivers into subdirectories, because we
have too many of them at the moment.

simple/blink/flash/rgb, or something like that.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYD5f9gAKCRAw5/Bqldv6
8l5kAJ9h0LDI6czkDFin/4mLftjT1OgocACgh0SaQO7AXg+i11GYB3ZAl8Zzmrs=
=brLz
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
