Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0541E1E68
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 11:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388638AbgEZJWx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 05:22:53 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52848 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388425AbgEZJWx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 05:22:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6BB7C1C02C5; Tue, 26 May 2020 11:22:51 +0200 (CEST)
Date:   Tue, 26 May 2020 11:22:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: fix macro names for pca955x
Message-ID: <20200526092250.GB12838@amd>
References: <20200526092052.24172-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <20200526092052.24172-1-f.suligoi@asem.it>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-05-26 11:20:52, Flavio Suligoi wrote:
> The documentation reports the wrong macro names
> related to the pca9532 instead of the pca955x
>=20
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Nothing obviously wrong, but why did you send it twice within half an
hour?
								Pavel

>  Documentation/devicetree/bindings/leds/leds-pca955x.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Do=
cumentation/devicetree/bindings/leds/leds-pca955x.txt
> index 7984efb767b4..7a5830f8d5ab 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pca955x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
> @@ -26,9 +26,9 @@ LED sub-node properties:
>  		from 0 to 15 for the pca9552
>  		from 0 to  3 for the pca9553
>  - type: (optional) either
> -	PCA9532_TYPE_NONE
> -	PCA9532_TYPE_LED
> -	PCA9532_TYPE_GPIO
> +	PCA955X_TYPE_NONE
> +	PCA955X_TYPE_LED
> +	PCA955X_TYPE_GPIO
>  	see dt-bindings/leds/leds-pca955x.h (default to LED)
>  - label : (optional)
>  	see Documentation/devicetree/bindings/leds/common.txt

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7M3+oACgkQMOfwapXb+vL1iQCgnMFgoyAI93TGZbBPfLRftwVb
ZD8An2uhQlu0n1Bcfem0zYVqj+KELHWc
=BxPE
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
