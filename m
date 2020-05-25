Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5561E0C36
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2020 12:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389952AbgEYKwj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 May 2020 06:52:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41032 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389484AbgEYKwj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 25 May 2020 06:52:39 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A87A21C02C1; Mon, 25 May 2020 12:52:37 +0200 (CEST)
Date:   Mon, 25 May 2020 12:52:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     nikitos.tr@gmail.com, dmurphy@ti.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shanghai Awinic
 Technology Co., Ltd.
Message-ID: <20200525105236.GB27989@amd>
References: <20200511111128.16210-1-nikitos.tr@gmail.com>
 <20200518221435.GA6734@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20200518221435.GA6734@bogus>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-05-18 16:14:35, Rob Herring wrote:
> On Mon, 11 May 2020 16:11:26 +0500,  wrote:
> > From: Nikita Travkin <nikitos.tr@gmail.com>
> >=20
> > Add the "awinic" vendor prefix for Shanghai Awinic Technology Co., Ltd.
> > Website: https://www.awinic.com/
> >=20
> > Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

I can take 2/ and 3/ of the series, but I believe we'll get conflicts
if I change vendor-prefixes.yaml in the LED tree. Can you take this
one?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7Lo3QACgkQMOfwapXb+vIXcQCgwzeqqb2RBF4DwjAchybzAzL2
eBwAnA8T0LcV9sK0bhIpwF/M37uhjgj9
=JbAo
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
