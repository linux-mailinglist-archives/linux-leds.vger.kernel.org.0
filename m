Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E287258398
	for <lists+linux-leds@lfdr.de>; Mon, 31 Aug 2020 23:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbgHaVbs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Aug 2020 17:31:48 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44145 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHaVbr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Aug 2020 17:31:47 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.54.199]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mj8iJ-1kpEcF1hWn-00fF1f; Mon, 31 Aug 2020 23:31:34 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kCrOl-0004Dq-PT; Mon, 31 Aug 2020 23:31:32 +0200
Date:   Mon, 31 Aug 2020 23:31:30 +0200
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20200831213129.6o4nuqgh7aurantv@falbala.internal.home.lespocky.de>
Mail-Followup-To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>
References: <20200831210232.28052-1-post@lespocky.de>
 <20200831210232.28052-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bqxk4ppyznh6xyvt"
Content-Disposition: inline
In-Reply-To: <20200831210232.28052-3-post@lespocky.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: f41cc761d791b9a06623163ee6e33981
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:1RiyH8glb6y88EbhRcg8mn5lxJ1wnZN5zb0xJnDZZQpZLgMl3Ji
 qDESUgAKrXFv4bFRhlhKURaVcSLGLlSV2O0NrRk4huZIiHMwXG6qbAwE0Dm77OkOuFqPSqh
 bfQDg/OHYX9D6DNXUuv3uNqevjlHa0euwDKO8YMiBzpMhk1ZxM/cUW2Xr8Iy4dJ8LZ/jJCX
 /36hLeXs76XhlYIq8aGfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GTlt4jacSxY=:lyFoUefKyl6tpG54hfVTRy
 FLP3KEkJIY4niTv/NKdU87Wb73oVmTDp79FJjEFn4TqqcruFqyTcZNV8WXZESNzWy1ZnXI91f
 AJHcQ0Mnv4jKW710RhxAblV5UOwBn1ZNkSocHiGArS5j2AtSsu3V4354q7DU6/XzDKXAPI8Ev
 PWdwxxs9STjgiX5D2pw9sYyRbOfuGzbtJn89nJpITdosJWz5XHEF/X3wMFMoyiD0cOYv3O9rN
 9Q1yQwiaGWDRn6ZKdhgR+iutNjxkfQzuZmIADTnQ+G5VxalKfhMz1zaSc6IrEZo9/sM/inXad
 U1ihErOmE1Phr5uIvF3BOU3CwKVRuJTF9x9DkMhiypiceiZvKK6wT8g1QkzI9ZvgVphQJjPeF
 mY20k5Yv9bggSmM5xVDSavWm4dcG+TsNbzjzI6b5tbT+FB4UGS+QPMpleZlw1fXTiuHLbRzH+
 y4c1p8g3QOd9FotPS0gJaJH+dsDjzENs9x5WVHMb8OpeG7PsXuVCBIKDehl1BQoKIHrezVMmt
 LD4eDHdk2qej12s8EqWVWPaq10XfuQK4gtP87ZwQXtQgYmytMgjSy9cXv3odv88vkBZ5Aworu
 +7jKeZWe06FDAh4nSLJQJi6voKMFKPcU4fnhYaGhzzSutk7UZpwq6HoXZGaerw61U/07/yDn8
 K0/bBlT7JD1R2qBf0tr/P7z/emKDG4383sjweWSlJyu23yay96vdIfl8EFJFgkAXsONJE5KW3
 tTpWnQ4BXZd5Z8PaaOJ4805xldvja1Mm9dSQ3f6I0k2LXi/2q41WmD4sZ5jlWdc8eQFxlbDbp
 5QhbcWuSedxAsQfbcxzEnUXVghLrMeyz+Ni9CBm0QIxN14CLiu9gzoiYomVNI5C6W4GrCqn
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bqxk4ppyznh6xyvt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

I forgot to run checkpatch (it's late today already), and it warns:

  WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-C=
lause)
  #80: FILE: Documentation/devicetree/bindings/leds/leds-pwm.yaml:1:
  +# SPDX-License-Identifier: GPL-2.0-only

tbh, I just copied that line from leds-gpio.yaml, can be changed in a
v3 of course.

Greets
Alex

On Mon, Aug 31, 2020 at 11:02:31PM +0200, Alexander Dahl wrote:
> The example was adapted slightly to make use of the 'function' and
> 'color' properties.
>=20
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Docume=
ntation/devicetree/bindings/leds/leds-pwm.txt
> deleted file mode 100644
> index 6c6583c35f2f..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -LED connected to PWM
> -
> -Required properties:
> -- compatible : should be "pwm-leds".
> -
> -Each LED is represented as a sub-node of the pwm-leds device.  Each
> -node's name represents the name of the corresponding LED.
> -
> -LED sub-node properties:
> -- pwms : PWM property to point to the PWM device (phandle)/port (id) and=
 to
> -  specify the period time to be used: <&phandle id period_ns>;
> -- pwm-names : (optional) Name to be used by the PWM subsystem for the PW=
M device
> -  For the pwms and pwm-names property please refer to:
> -  Documentation/devicetree/bindings/pwm/pwm.txt
> -- max-brightness : Maximum brightness possible for the LED
> -- active-low : (optional) For PWMs where the LED is wired to supply
> -  rather than ground.
> -- label :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -- linux,default-trigger :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -
> -Example:
> -
> -twl_pwm: pwm {
> -	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> -	compatible =3D "ti,twl6030-pwm";
> -	#pwm-cells =3D <2>;
> -};
> -
> -twl_pwmled: pwmled {
> -	/* provides one PWM (id 0 for Charing indicator LED) */
> -	compatible =3D "ti,twl6030-pwmled";
> -	#pwm-cells =3D <2>;
> -};
> -
> -pwmleds {
> -	compatible =3D "pwm-leds";
> -	kpad {
> -		label =3D "omap4::keypad";
> -		pwms =3D <&twl_pwm 0 7812500>;
> -		max-brightness =3D <127>;
> -	};
> -
> -	charging {
> -		label =3D "omap4:green:chrg";
> -		pwms =3D <&twl_pwmled 0 7812500>;
> -		max-brightness =3D <255>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Docum=
entation/devicetree/bindings/leds/leds-pwm.yaml
> new file mode 100644
> index 000000000000..8c5217f2a9f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to PWM
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description:
> +  Each LED is represented as a sub-node of the pwm-leds device.  Each
> +  node's name represents the name of the corresponding LED.
> +
> +properties:
> +  compatible:
> +    const: pwm-leds
> +
> +patternProperties:
> +  "^pwm-led-([0-9a-f])$":
> +    type: object
> +
> +    $ref: common.yaml#
> +
> +    properties:
> +      pwms:
> +        description:
> +          "PWM property to point to the PWM device (phandle)/port (id)
> +          and to specify the period time to be used:
> +          <&phandle id period_ns>;"
> +
> +      pwm-names:
> +        description:
> +          "Name to be used by the PWM subsystem for the PWM device For
> +          the pwms and pwm-names property please refer to:
> +          Documentation/devicetree/bindings/pwm/pwm.txt"
> +
> +      max-brightness:
> +        description:
> +          Maximum brightness possible for the LED
> +
> +      active-low:
> +        description:
> +          For PWMs where the LED is wired to supply rather than ground.
> +
> +    required:
> +      - pwms
> +      - max-brightness
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/leds/common.h>
> +
> +    twl_pwm: pwm {
> +        /* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> +        compatible =3D "ti,twl6030-pwm";
> +        #pwm-cells =3D <2>;
> +    };
> +
> +    twl_pwmled: pwmled {
> +        /* provides one PWM (id 0 for Charing indicator LED) */
> +        compatible =3D "ti,twl6030-pwmled";
> +        #pwm-cells =3D <2>;
> +    };
> +
> +    pwm_leds {
> +        compatible =3D "pwm-leds";
> +
> +        pwm-led-1 {
> +            label =3D "omap4::keypad";
> +            pwms =3D <&twl_pwm 0 7812500>;
> +            max-brightness =3D <127>;
> +        };
> +
> +        pwm-led-2 {
> +            color =3D <LED_COLOR_ID_GREEN>;
> +            function =3D LED_FUNCTION_CHARGING;
> +            pwms =3D <&twl_pwmled 0 7812500>;
> +            max-brightness =3D <255>;
> +        };
> +    };
> +
> +...
> --=20
> 2.20.1

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--bqxk4ppyznh6xyvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl9NbC4ACgkQNK3NAHIh
XMbWLRAAyKU2FTkPnTkZ0P8+VmB5alCBONQnPfxB5lkluokR4N1WOJYv0fyPcQJ4
Vh+g8YWQxiAKh/kfHF4R5TxJeDkgMsg4/cVuL73Vh9q3q6uMgeARImJj8rEzFwMT
44XhIS1aMQnqjbxMNojSVRQIZ7gCaCKkZ6I1UH8tZnEF9UzNxG2/+1GwKpaxBHz7
1UiwedKuw9wjiHx8FFvSZY+Hs2rospNpBiNxUMd4/3nuRP/s3b54BOt0H6gf7fRC
F77KbUhtmIgO2EOlGXZWD/U2UEw6oZ3loZXPYcR3CyQLXVwKJDExG9hUyyYkH3tx
Hk6I3dl/c8/7+eM5oe34woOtFCiiP2k3YlXjKrY+LEqcFOnC+WN+RqDf25RahPIi
RA/niLGbg80g0YTaIn+ZoCatAov2FdhRU9hgj8nNFOhQ5bpQ8yXPPJBIWcs+cqv9
Fbpxv93OvyrnlY31VHvr13spqqmCbtG3hWs42DkY9OiqoUcFy8oWxu/rJwtJsqyc
Bpp50w9NhhKkN2h/GqdzUgDlG/QAeI0iv2ofaJdB+nHNsRPKxUhwLjn4E2ZnbbaO
Nz3PPTeNOBaKuTccJ4T4KMKJAFqnimqrUIfExrhqQ4LVPPrqd2DRVS3/zq5EPqYq
ar03oJwDg5ljaBKZ6gD3k8QtKb5FWTcngocKembWfXtYb5ddN4Y=
=9aT3
-----END PGP SIGNATURE-----

--bqxk4ppyznh6xyvt--
