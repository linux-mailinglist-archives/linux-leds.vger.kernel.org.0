Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB9949734D
	for <lists+linux-leds@lfdr.de>; Sun, 23 Jan 2022 17:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238985AbiAWQ5k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 23 Jan 2022 11:57:40 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50651 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238987AbiAWQ5k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 23 Jan 2022 11:57:40 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.36.100]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MdNTy-1mcLMW2ejA-00ZTBo; Sun, 23 Jan 2022 17:57:28 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <post@lespocky.de>)
        id 1nBgBB-0005Jc-On; Sun, 23 Jan 2022 17:57:26 +0100
Date:   Sun, 23 Jan 2022 17:57:21 +0100
From:   Alexander Dahl <post@lespocky.de>
To:     Sven Schwermer <sven@svenschwermer.de>
Cc:     linux-leds@vger.kernel.org, pavel@ucw.cz, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com
Subject: Re: Combining multiple PWM LEDs into RGB LED?
Message-ID: <20220123165721.GA5951@falbala.internal.home.lespocky.de>
Mail-Followup-To: Alexander Dahl <post@lespocky.de>,
        Sven Schwermer <sven@svenschwermer.de>, linux-leds@vger.kernel.org,
        pavel@ucw.cz, lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        thierry.reding@gmail.com
References: <37540afd-f2f1-52dd-f4f1-6e7b436e9595@svenschwermer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <37540afd-f2f1-52dd-f4f1-6e7b436e9595@svenschwermer.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: e1f067384573de2ad163b9fa9874dcb1
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:DFJ+Yi8LAQxmIfGAYpxTR5l9l2dWCrU4PbopNsVbKynxcNriurW
 gJQXkuXfYueBqnXleMXdEAxr/Za8aLlMjevG4nH0ZffUnuu6+5eYCoer6bL2xC0G4fDBeym
 y0ZsWE6LFJGP6M4Y67k6OzTS+nIDbExuVNgn15Idn5MgbzzTHMaVSpVMVpFO/N+fDGSMWi2
 sy3XUrC9d/vJjGVgJ5vzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AIca8BifFlk=:o4zxCf+Rsgx+5ERXgJFuVx
 jCaseMtr+DWtZJezfmjariPwV4rjz7Vv2qTXjGQqiztX6v0VlHLoEWEqhpUWUZm+owSFg1MPM
 rju2pcyaWkY+NgkZ5wKr/4HYnda2kBIfGDgGFSzTAT11onJJcKl7tjxzDl9qSZA6tiU2d4obO
 p/GBzZ0IkWN4UMHhEaVQ0Sue5tq87nzaE7dAnrPDLS0RqLXL7enZiGgH28cemfVvvFbyDTDNn
 b6AwtGRquQs4d/a/hPPYiJQFwagPrZBKmRcZDrztvJor8vK4Jiq78RlluEWA6OLV4i8VohAIR
 EasnYIDxsiaQ5op7U3bJO7ih2kmp+CU+3/N0CBmv9oHCPGdXAwu7YgcfzFqgn9wa+spQ1Bpoa
 /hmPWl5zvDiECCcPNWX9/MIoMUhZtuqAGUfeSS2yCORkPPlRgPLRTAj7vDLoCway3hdt8usOU
 6GQfuqWU05tfom7U/Ta+1B9JHYVoG8mowzRJ5mQgM0mHd2E7KUmlrPGyc33MnGMKAi2Wstlpl
 zmvOOXTk+rcfg29YF6FCoA7LMIQjHNuB21oNpVbRuOm8yVfQtYEdlE0sqHVnMU7Z3qJlweauU
 K8ebfwP0gKX3n9OekuNKQXcDcrO124p7el5egVVpQZgmR3Zj6+tinkJsNI0G08HLqhJ8wCeNQ
 wGgYCTHqVG/f5lwP60xJLvjNd01dJt/5Uk0WlvA9A04DygjHlE/BuGmTAmjO7O0lnzbE=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sven,

On Thu, Jan 20, 2022 at 03:07:26PM +0100, Sven Schwermer wrote:
> I'm wondering about the correct device tree syntax for organizing multiple
> PWM LEDs into a multi-color (RGB) LED. This is my device tree:
>=20
> / {
>   rgb-led {
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&pinctrl_leds>;
>     compatible =3D "pwm-leds";
>     multi-led@0 {
>       color =3D <LED_COLOR_ID_RGB>;
>       led-red {
>         pwms =3D <&pwm1 0 1000000>;
>         color =3D <LED_COLOR_ID_RED>;
>         max-brightness =3D <65535>;
>       };
>       led-green {
>         pwms =3D <&pwm2 0 1000000>;
>         color =3D <LED_COLOR_ID_GREEN>;
>         max-brightness =3D <65535>;
>       };
>       led-blue {
>         pwms =3D <&pwm3 0 1000000>;
>         color =3D <LED_COLOR_ID_BLUE>;
>         max-brightness =3D <65535>;
>       };
>     };
>   };
>   /* ... */
> };
>=20
> My kernel complains as follows:
>=20
> of_pwm_get(): can't parse "pwms" property
> leds_pwm rgb-led: unable to request PWM for multi-led: -2
> leds_pwm: probe of rgb-led failed with error -2
>=20
> Is my syntax incorrect or is this not a use case that is currently
> supported? I should also note that I back-ported the multi-LED feature to
> 5.4.158 so I may have missed some relevant patches.

AFAIK nodody implemented multicolor functionality for the LEDs PWM
driver yet.  I think it should go to drivers/leds/leds-pwm.c and I
would offer to test it, once anybody sends patches for this. O:-)

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmHtiOMACgkQNK3NAHIh
XMbALg//ea9TBDrFmPIcJvovY5XjJf4VbINh/u3rlNhWuB0xH0eMR8Eh/wc/qgUs
3UkuC2hQSx2TOEDw3IzQEoOdGBH8gMYwzlevqvZxaA4sUYnFB2YKPQr/E6vjjTnv
puY5BO4S8pOrQVc4LoyLAkqnqU7UYIpQtZbGxy2Mi9Kl6Fv6Nb5jSo1Y0rZ3ttoa
bmF2019mtHtzKxYeOyzB+99kTju6kMehrtkFdlWUH/RPgAY2WTN+ozh4vS2ZmgaU
iFtzoeUTCJvUiTYqIskNr2UjzuQ10DeEsqE33AdlOlXayMKlNBSkHETRi6vUzozs
C6IpeAfV1wrpmwDg8CpU/58HljiYtV3+fKiPUXMFD2OP925RZBoewVkEcv9Ndjts
8ayyVutWWDHW0uqqcuU7XMyKpO9Om0MPcTQpb9nyb5wsVca7whIT2bxiHPVc2cZi
X31MOWPDo7+xwoss/kxLg+Z+0PnEJglOvQ8MGdsY9pVu2wv+Seg55WaFwkNa5E/2
6XULAAjQhK/kvyOaWMgZmlGzgZf7ExKe4FbyE1vrGmNHtNpUIYZrcDu4MTCPUYkI
JHC0wG+N+3CsjxZ9pBACRwZ0pIJMk1rx/Ehe1wUJ5VImbXzsg22rhfAVjd3uyLGf
0+Nla2qqmYMgSTSnyg85poGqBEoemKzOTOa4xiUF2Ddqv9Nt5Jk=
=crLE
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
