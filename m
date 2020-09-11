Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FEC2659F9
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 09:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgIKHFX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 03:05:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41208 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgIKHFJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 03:05:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D936F1C0B76; Fri, 11 Sep 2020 09:05:03 +0200 (CEST)
Date:   Fri, 11 Sep 2020 09:05:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200911070503.GA9818@amd>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >+{
> >+	struct mt6360_led *led =3D container_of(lcdev, struct mt6360_led, flas=
h.led_cdev);
> >+	struct mt6360_priv *priv =3D led->priv;
> >+	u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_=
no);
> >+	u32 val =3D (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> >+	u32 prev =3D priv->fled_torch_used, curr;
> >+	int ret;
> >+
> >+	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> >+	if (priv->fled_strobe_used) {
> >+		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled=
_strobe_used);
>=20
> Doesn't hardware handle that? IOW, what happens when you have enabled
> both torch and flash? If flash just overrides torch mode, than you
> should not prevent enabling torch in this case.

Yep, this is strange/confusing... and was reason why I asked for not
supporting strobe from sysfs.

Could I get you to remove code you are not commenting at when
reviewing?

> >+MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> >+MODULE_DESCRIPTION("MT6360 Led Driver");

Led -> LED.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9bIZ8ACgkQMOfwapXb+vIelgCePgj6nGNi1tecOoGv2il2xaai
cg8An3XTOtdxJXBTbkGrDdoc9j8KA4Wx
=c1KM
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
