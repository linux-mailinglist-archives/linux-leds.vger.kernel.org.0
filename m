Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7AE297B21
	for <lists+linux-leds@lfdr.de>; Sat, 24 Oct 2020 08:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759828AbgJXGtR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 02:49:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54718 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759827AbgJXGtR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 02:49:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 168AC1C0B79; Sat, 24 Oct 2020 08:49:15 +0200 (CEST)
Date:   Sat, 24 Oct 2020 08:48:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <post@lespocky.de>, Luca Weiss <luca@z3ntu.xyz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        bjorn.andersson@linaro.org
Subject: Re: Clarification regarding multicolor leds
Message-ID: <20201024064859.GB28478@amd>
References: <24145961.oFyDssk0vh@g550jk>
 <20201024064238.ahnojlj6b7r3eszn@falbala.internal.home.lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline
In-Reply-To: <20201024064238.ahnojlj6b7r3eszn@falbala.internal.home.lespocky.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Sat, Oct 24, 2020 at 12:48:42AM +0200, Luca Weiss wrote:
> > I'm currently experimenting with the qcom lpg[0] which is a driver for =
the rgb=20
> > notification led found on e.g. Snapdragon 801 devices (and many more),=
=20
> > specifically my example is about the Fairphone 2 (msm8974-fairphone-fp2=
).
>=20
> Great to hear someone is interested in mainline support for Fairphone.
> I just bought a used FP2 on ebay. :-)

You may want to cc phone-devel@vger.kernel.org.

And yes, I'd like to see usable phone running mainline. I currently
have Droid 4, which is close.

> > [0] https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.anderss=
on@linaro.org/
> >=20
> > My dts is looking like the following (abbreviated):
> >=20
> >     [in lpg node]
> >     multi-led {
> >         color =3D <LED_COLOR_ID_MULTI>;
> >         function =3D LED_FUNCTION_STATUS;
> >         ....
> >     };

Make it _ID_RGB.

> > (sidenote: the LED_FUNCTION_INDICATOR should probably also be=20
> > LED_FUNCTION_STATUS there; the dts was made before the better descripti=
ons for=20
> > the defines have been added)
> >=20
> > This gets the following directories created in /sys/class/leds/:
> >=20
> >     blue:indicator
> >     green:indicator
> >     red:indicator
>=20
> That's right.  From Linux point of view these behave like three
> independent LEDs.  It's fully up to userspace to handle this.

Yes. Eventually we'll want to switch Pinephone to newer interface.

> > What's further confusing me is that include/dt-bindings/leds/common.h s=
tates=20
> > (reformatted for clarity):
> >=20
> > /* For multicolor LEDs */
> > #define LED_COLOR_ID_MULTI	8
> >=20
> > /* For multicolor LEDs that can do arbitrary color, so this would inclu=
de RGBW=20
> > and similar */
> > #define LED_COLOR_ID_RGB	9
> >=20
> > It sounds like these comments are the wrong way around as it says that =
RGB=20
> > does RGBW & others while MULTI is normal RGB?

Multi is for strange stuff like Blue-UV combination. Avoid.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+TzlsACgkQMOfwapXb+vLVwgCguQy7VenDgMw1Jgjfpc0CHfZU
+1AAn0kJi7RUDQc9TpiCzhngTAWnJSwI
=wEz6
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
