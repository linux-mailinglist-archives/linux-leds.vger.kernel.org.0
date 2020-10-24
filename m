Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CF2297B16
	for <lists+linux-leds@lfdr.de>; Sat, 24 Oct 2020 08:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759792AbgJXGmp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 02:42:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:35791 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759788AbgJXGmp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 02:42:45 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.62.159]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N6bTa-1kLb5w3aMo-0185h0; Sat, 24 Oct 2020 08:42:42 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kWDGC-00050B-3j; Sat, 24 Oct 2020 08:42:41 +0200
Date:   Sat, 24 Oct 2020 08:42:38 +0200
From:   Alexander Dahl <post@lespocky.de>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        bjorn.andersson@linaro.org
Subject: Re: Clarification regarding multicolor leds
Message-ID: <20201024064238.ahnojlj6b7r3eszn@falbala.internal.home.lespocky.de>
Mail-Followup-To: Alexander Dahl <post@lespocky.de>,
        Luca Weiss <luca@z3ntu.xyz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        bjorn.andersson@linaro.org
References: <24145961.oFyDssk0vh@g550jk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dus6obxrkuth5kqq"
Content-Disposition: inline
In-Reply-To: <24145961.oFyDssk0vh@g550jk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 98a917a92abcc2d28a6d62367cc24fe7
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:sqEfGIndijSMXtz82YgePXIx0zLt1zkQnSEBr6E8oO4YnyDE5wE
 bY9PZH+anz8B4ySe9N5lc7XXhB+H1/Ntn72mepHFZ3NrFcR0SX+v8if/wjqVOPNCP+WaY6f
 S5kuDdP8+XIPlstTU4rxuyF0s1zQuwGc5covdG9CnxeWuRcA1v23AiRZWy7oReCeEhAIgly
 vb7PF1hTjXqAVY6j53CHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GSNZg4DO1J8=:1ahP1/Z7UicPqD4aDo5nJp
 l8bCWHpjdphNRzamaFhUjGhSjW+tUkO5Fw/WO6RXVEaibH9ey9bbpmwCjNF7rK03o5y6ZH+0v
 Z3jKu/wbfBGA8AIjgm+aqSXvezprIhri2iJNz2NHlWUW7UMeVlFVfdfoAFA25Jlj6g1tmNMsE
 Z0YEjA1e4mbhC4qV0ujSyxLk8kh0IWM6tlwyIwwFu/xEw5uDcz0Py4+DXa/1zvoOwdrGwpzC/
 Rp8NMlVoE7BMrQyPAp+j4CmHriviuUfZHYiRGDFD9SloJ4IXK2YKk634A2rIdFHZn5g91IDHS
 UELHo7/Wv24zq3BHKBHR92UAmn/1VITz8EvtcaeyOm29wwaAUeK6f5nif95xhy7LCzKnKmp4T
 Cgoi4ReSm8KOiOr3++EVUJEMYvXtTkt6sAL7A2i33y8EVkUlUlfdUdqh6J88F
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--dus6obxrkuth5kqq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Luca,

On Sat, Oct 24, 2020 at 12:48:42AM +0200, Luca Weiss wrote:
> I'm currently experimenting with the qcom lpg[0] which is a driver for th=
e rgb=20
> notification led found on e.g. Snapdragon 801 devices (and many more),=20
> specifically my example is about the Fairphone 2 (msm8974-fairphone-fp2).

Great to hear someone is interested in mainline support for Fairphone.
I just bought a used FP2 on ebay. :-)

>=20
> [0] https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson=
@linaro.org/
>=20
> My dts is looking like the following (abbreviated):
>=20
>     [in lpg node]
>     multi-led {
>         color =3D <LED_COLOR_ID_MULTI>;
>         function =3D LED_FUNCTION_STATUS;
>         ....
>     };
>=20
> I'm comparing this to the PinePhone where the leds are defined as follows:
>=20
>     [in gpio-leds node]
>     blue {
>         function =3D LED_FUNCTION_INDICATOR;
>         color =3D <LED_COLOR_ID_BLUE>;
>     };
>    =20
>     green {
>         function =3D LED_FUNCTION_INDICATOR;
>         color =3D <LED_COLOR_ID_GREEN>;
>     };
>    =20
>     red {
>         function =3D LED_FUNCTION_INDICATOR;
>         color =3D <LED_COLOR_ID_RED>;
>     };
>=20
> (sidenote: the LED_FUNCTION_INDICATOR should probably also be=20
> LED_FUNCTION_STATUS there; the dts was made before the better description=
s for=20
> the defines have been added)
>=20
> This gets the following directories created in /sys/class/leds/:
>=20
>     blue:indicator
>     green:indicator
>     red:indicator

That's right.  From Linux point of view these behave like three
independent LEDs.  It's fully up to userspace to handle this.

>=20
> But with the multicolor led on the Fairphone 2 only a directory with the =
name=20
> of "multi-led" gets created which I would have expected to be=20
> "multicolor:status" instead.

Obviously it's named after the node label.  If I read
Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
correctly, that's how it is supposed to be named?

>=20
>=20
> What's further confusing me is that include/dt-bindings/leds/common.h sta=
tes=20
> (reformatted for clarity):
>=20
> /* For multicolor LEDs */
> #define LED_COLOR_ID_MULTI	8
>=20
> /* For multicolor LEDs that can do arbitrary color, so this would include=
 RGBW=20
> and similar */
> #define LED_COLOR_ID_RGB	9
>=20
> It sounds like these comments are the wrong way around as it says that RG=
B=20
> does RGBW & others while MULTI is normal RGB?
>=20
> I have also found this commit[1] while browsing through lkml which seems =
to=20
> validate my suspicions that _ID_RGB should be used normally? This commit =
seems=20
> have been applied early September but hasn't been merged in the 5.10 merg=
e=20
> window?
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
> commit/?h=3Dfor-next&id=3D3d93edc77515c6f51fa9bbbe2185e2ec32bad024
>=20
> But drivers/leds/led-core.c also states "We want to label LEDs that can=
=20
> produce full range of colors as RGB, not multicolor" - not sure what "ful=
l=20
> range" means here.
>=20
> Thanks for reading through my long email and I'd appreciate any clarifica=
tion=20
> on the situation!

I just read
https://www.kernel.org/doc/html/latest/leds/leds-class-multicolor.html
and apart from formatting and inter-doc-link issues due to not used
markup features, I can understand how it's supposed to be used from
userspace.

However, multicolor is still quite new, maybe drivers/leds/TODO gives
some hints?  It seems to me some open issues are already known. ;-)

HTH & Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--dus6obxrkuth5kqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl+TzNgACgkQNK3NAHIh
XMZzHhAA0gsvMl8tlPM7QibjMKKmWvUNiguAdBrmJ/yZLG0bXuMlh9Nyd5YGRrWy
ckGWdFv0G2ZgI4cHW9Q4E0uMCDoC8sN6chq4xzcAk2EVStahp0gWBD4emMbg1+Z3
pWVH/pl3T+n+qee5tJAhKSqUhgmnSoPbJo4hgTJ46NVsJKgzCU5KoY0OQUedBb9x
AlOqZbX25PQSQhNc4iLqM3ZRaUVjlO6s4vEJ02ixdY3rlCveLRpVcIXu7wzC8vlq
vHvIb8KKRoSlTcv4VvCxI2MDmKsFnP5lFIp6xqMPdRgOX68cPXZn/HT5pc9GsgZA
X4OZ9wPGXpY1qE5fF7WualINjh2GTnHBIZyEsD553cSSVLawwIz/6PN//VTVTOsb
IwtS/mjrDy0XRoNEsY+/MSfxl8kIPTGhYtryZyHVMwAhFqKSUztjap9Bzr92Nfqc
SNN4Anr2fC5mMaCuFC84yuu1RFeqJJCWJywOz/Z5EvKXdAI1ngF7imD9HvtokDg3
Srcr7GHX29q0Mt+P0olwOhGKWYk2EKAXxlIJgXPeb+KuauNJBYuM5nH376e8uwbk
ciSYMxrGNYL94oVqwYysps1FBwW7g5okSVM0o8pHZlbnAjv8UahbosTy5PXgacmX
G+eGMY3ZAF5+YUUP7jVUHAn00C0Xz5gKXVDIs/op1haXBiykrgI=
=EWEb
-----END PGP SIGNATURE-----

--dus6obxrkuth5kqq--
