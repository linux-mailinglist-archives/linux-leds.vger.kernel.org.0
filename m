Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5537D262AD0
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 10:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIIIqy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 04:46:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49220 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbgIIIqr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 04:46:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F21A51C0B87; Wed,  9 Sep 2020 10:46:43 +0200 (CEST)
Date:   Wed, 9 Sep 2020 10:46:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>,
        jacek.anaszewski@gmail.com, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200909084643.GB10891@amd>
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
 <1b6e8bf7-fc11-542b-f570-cebb0b6c3442@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
In-Reply-To: <1b6e8bf7-fc11-542b-f570-cebb0b6c3442@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
>=20
> >@@ -271,6 +271,17 @@ config LEDS_MT6323
> >  	  This option enables support for on-chip LED drivers found on
> >  	  Mediatek MT6323 PMIC.


=2E..522 lines...

> >+static int mt6360_init_isnk_properties(struct mt6360_led *led, struct l=
ed_init_data *init_data)
> >+{
> >+	struct led_classdev *isnk =3D &led->isnk;
> >+
> >+	isnk->max_brightness =3D mt6360_get_isnk_max_level(led->led_no);

> This function is called once seems a bit much to have a service function =
for
> a simple switch case.

Please remove code you are not commenting on. That a) reduces
bandwidth requirements but more importantly b) makes it easier to find
your comments.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YlnMACgkQMOfwapXb+vLvDgCgi0jys/9Gg6FdVPAtrooeRyXJ
TPMAoIHj0ruueSBPPi4OfU/aJK0VNp3O
=kq07
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
