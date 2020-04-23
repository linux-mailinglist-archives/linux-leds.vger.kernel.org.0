Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53031B54EF
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 08:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgDWGtz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 02:49:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53636 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgDWGtz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2020 02:49:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9C3E91C01E0; Thu, 23 Apr 2020 08:49:53 +0200 (CEST)
Date:   Thu, 23 Apr 2020 08:49:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200423064952.GB22554@amd>
References: <20200421171732.8277-1-marek.behun@nic.cz>
 <20200421171732.8277-2-marek.behun@nic.cz>
 <20200423063552.GA22554@amd>
 <20200423084046.453262a9@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20200423084046.453262a9@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-23 08:40:46, Marek Behun wrote:
> On Thu, 23 Apr 2020 08:35:52 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > Hi!
> >=20
> > > Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> > >=20
> > > Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> > > Cc: Rob Herring <robh+dt@kernel.org> =20
> >=20
> > Rob already reviewed this one. Is there reason not to have his
> > reviewed-by here?
>=20
> This one is written in yaml, the previous was .txt

Aha, ok. I'll need his reviewed-by, then...

Could I ask for license to be gpl-2-or-later or bsd? Forbidding gpl3
while allowing bsd seems strange/wrong.

> > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20190328=
193428.19273-3-marek.behun@nic.cz/
> >=20
> > >  MAINTAINERS                                   |   5 +- =20
> >=20
> > Please put MAINTAINERS change into separate patch. I don't think I can
> > merge it throught the LEDs tree.
>=20
> Ok, I shall send it to someone else then, probably Gregory.

Yes. Should be removed from the second patch in the series, too.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6hOpAACgkQMOfwapXb+vLcpACbBzpvGIelKDdmEGyPKpNzS/2m
yNEAn1fWBpijP6OJ6QAdywx7csUcOTkq
=ZuG0
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
