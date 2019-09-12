Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A753B119B
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 16:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732841AbfILO6a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 10:58:30 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:33632 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732799AbfILO6a (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Sep 2019 10:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=diUgc0I/ohhBLoo+DfzpNbJII4nieNRP6PUcXuYVoMU=; b=hRoSE76zUVKfkeRCwX+M76w5G
        A7L271OHeTUZtSSmDD3PBAO03jMYGiqNFzxpzp2TuNks8KyeaelhToRr13Axa+wk172htXGHVov6M
        4vw+oU2WUUmlVUgilSrqTXOHbJije70cX/0hQNIkcrbAsrgHVk/0Lq+o2wGv+q2P/1wSE=;
Received: from [77.247.85.104] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i8QY5-0005Vh-M2; Thu, 12 Sep 2019 16:58:18 +0200
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i8QY3-0006dy-3x; Thu, 12 Sep 2019 16:58:15 +0200
Date:   Thu, 12 Sep 2019 16:58:08 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
        <jingoohan1@gmail.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: lm3630a: add
 enable_gpios
Message-ID: <20190912165808.3c38b7a2@kemnade.info>
In-Reply-To: <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
References: <20190911172106.12843-1-andreas@kemnade.info>
        <20190911172106.12843-2-andreas@kemnade.info>
        <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p=GURwKtHNf6YhQ_WKbnjoL"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--Sig_/p=GURwKtHNf6YhQ_WKbnjoL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Sep 2019 06:39:50 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Andreas
>=20
> On 9/11/19 12:21 PM, Andreas Kemnade wrote:
> > add enable-gpios to describe HWEN pin
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> > changes in v2: added example
> > changes in v3: added Acked-by
> >   .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-b=
acklight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-ba=
cklight.yaml
> > index dc129d9a329e..1fa83feffe16 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backligh=
t.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backligh=
t.yaml
> > @@ -29,6 +29,10 @@ properties:
> >     '#size-cells':
> >       const: 0
> >  =20
> > +  enable-gpios:
> > +    description: GPIO to use to enable/disable the backlight (HWEN pin=
).
> > +    maxItems: 1
> > +
> >   required:
> >     - compatible
> >     - reg
> > @@ -92,6 +96,7 @@ examples:
> >       i2c {
> >           #address-cells =3D <1>;
> >           #size-cells =3D <0>;
> > +        enable-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> >  =20
> >           led-controller@38 {
> >                   compatible =3D "ti,lm3630a"; =20
>=20
> Looks good to me
>=20
well, the enable-gpios is still at the same place as in v2. This was sent
before your comments to v2 have been arrived.

Regards,
Andreas

--Sig_/p=GURwKtHNf6YhQ_WKbnjoL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl16XQAACgkQl4jFM1s/
ye8SEw/+IjRu/Eq+1Wkt7PlbCz3K+lHCVv+BKCe5EZrbK5rIIs6Xy/HaIH+R4aEX
JNyDe6TkjAreOLuSSFoZcE3CLA7lzhi5NGVGXfpdvNSFkJfvMGL0y8AJmhcbsQUf
4tMGEJVpF7WiUiwNynxGWKxRU1Q/++kBzcFiC0eFnewx4/0kELVCVwx+uLJQkm84
OInsI/5n+9huEmB/I2SUr5Wa0luaMDWH2XzKYvLSzM1x1L8yMFPbwrqSuU+c83mR
hEad0DRscDJhca01BZTiRpyf5HSRnPPwS8Q7YuWXDTY5VIs6QJNbdB2NfooYFnFb
bKLXfSkGBfB5mNfJq0nEP7F6RumBJ5W68gokNF0uQxy8kfR9Qz9INZjOzNIphI3z
jWvIraehnGd/1Qsu7046bj+seQIj7OjXVgsqvl2GvgYH8g9sM69sDJWvWEkXAH+8
Y8ltoMngNcW9BMf01FPpaY/LcprUPA1ylOISy6orWbFoEczKKySovOvrBOscNXTG
wUaz7yPeRzgJwHMfUQpw6r0TjWo424U3gqDQN38SCfiKhoo3GoInfRBemdU/Vh9E
vjHdTKyCx3xeWiy8a4o4lVa/YGNz3dvnZSdShMu+hxD5cpcL+iHl2kMEMVMHwDit
hjS3YcYEbtQHEtlQ88Zwv0wJmgQJ9SOExUTd8dPtJra05qtfdL0=
=1gCA
-----END PGP SIGNATURE-----

--Sig_/p=GURwKtHNf6YhQ_WKbnjoL--
