Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6D9173431
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2020 10:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgB1Jgt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Feb 2020 04:36:49 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33362 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgB1Jgs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2020 04:36:48 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D3C591C030F; Fri, 28 Feb 2020 10:36:46 +0100 (CET)
Date:   Fri, 28 Feb 2020 10:36:46 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 1/2 v2] leds: ns2: Absorb platform data
Message-ID: <20200228093646.GB27860@amd>
References: <20200210101354.287045-1-linus.walleij@linaro.org>
 <20200226135006.GF4080@duo.ucw.cz>
 <1f1b52dd-d702-efe3-cb62-bbf4ae67a25b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <1f1b52dd-d702-efe3-cb62-bbf4ae67a25b@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>Cc: Vincent Donnefort <vdonnefort@gmail.com>
> >>Tested-by: Simon Guinot <simon.guinot@sequanux.org>
> >>Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >>---
> >>ChangeLog v1->v2:
> >>- Collect Simon's Tested-by tag
> >Aha, I applied v1, but collected tested-by tag manually, so we should
> >be ok.
>=20
> You took the wrong version of the patch set.
>=20
> I had comments on v2 (you seemed to have ignored) and v3 was submitted.

Yes, I took wrong version.

But AFAICT the difference is not really signifcant.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5Y3y4ACgkQMOfwapXb+vLPYACfZobMjz77HYQ+PzxAHdvSCbD5
2w0An3S8SuZ7VwEtV1YHifQAbHXV9A9v
=W7mj
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
