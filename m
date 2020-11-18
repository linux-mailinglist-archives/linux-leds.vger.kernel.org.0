Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3444C2B86E6
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 22:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgKRVhW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 16:37:22 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:60534 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgKRVhP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 16:37:15 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CC16F1C0B87; Wed, 18 Nov 2020 22:37:12 +0100 (CET)
Date:   Wed, 18 Nov 2020 22:37:12 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Message-ID: <20201118213712.GA22371@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add LED_COLOR_ID_MOONLIGHT definitions

Why is moonlight a color? Camera flashes are usually white, no?

At least it needs a comment...

Best regards,
								Pavel
							=09


> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  include/dt-bindings/leds/common.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index 52b619d..1409e9a 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -33,7 +33,8 @@
>  #define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
>  #define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary =
color,
>  					   so this would include RGBW and similar */
> -#define LED_COLOR_ID_MAX	10
> +#define LED_COLOR_ID_MOONLIGHT	10
> +#define LED_COLOR_ID_MAX	11
> =20
>  /* Standard LED functions */
>  /* Keyboard LEDs, usually it would be input4::capslock etc. */

--=20
http://www.livejournal.com/~pavelmachek

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+1lAgACgkQMOfwapXb+vL26wCeLtwDg4oxx0PYQmJyevNM3Ckd
2IIAmQGlhDWSRiDQqYO8KZnDIql3iy6g
=k8BQ
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
