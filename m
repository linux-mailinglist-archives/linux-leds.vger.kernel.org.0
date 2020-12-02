Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DBB2CBCEC
	for <lists+linux-leds@lfdr.de>; Wed,  2 Dec 2020 13:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgLBMYL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Dec 2020 07:24:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50542 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbgLBMYL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Dec 2020 07:24:11 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5BDDE1C0B9E; Wed,  2 Dec 2020 13:23:29 +0100 (CET)
Date:   Wed, 2 Dec 2020 13:23:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201202122329.GA30929@duo.ucw.cz>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-12-02 18:46:49, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add LED_FUNCTION_MOONLIGHT definitions
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/leds/common.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index 52b619d..843e65d 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -78,6 +78,7 @@
>  #define LED_FUNCTION_INDICATOR "indicator"
>  #define LED_FUNCTION_LAN "lan"
>  #define LED_FUNCTION_MAIL "mail"
> +#define LED_FUNCTION_MOONLIGHT "moonlight"

There's "torch" function that should be used for this. I guess comment
should be added with explanation what exactly that is and how should
the LED be named.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX8eHQQAKCRAw5/Bqldv6
8pVXAJ4tYF70hprb4/4PCWCbjb4eUQZMggCfTWFQi7Zc8SFGxzn0gUYPceNUWSg=
=d03t
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
