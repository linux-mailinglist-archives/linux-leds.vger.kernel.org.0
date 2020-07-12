Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED0821CB2C
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 21:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729382AbgGLTxA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 15:53:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50846 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgGLTxA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 15:53:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DF04B1C0BD2; Sun, 12 Jul 2020 21:52:57 +0200 (CEST)
Date:   Sun, 12 Jul 2020 21:52:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH v29 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200712195257.GB20592@amd>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-2-dmurphy@ti.com>
 <20200709192421.GA748160@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20200709192421.GA748160@bogus>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-07-09 13:24:21, Rob Herring wrote:
> On Mon, 22 Jun 2020 13:59:04 -0500, Dan Murphy wrote:
> > Add DT bindings for the LEDs multicolor class framework.
> > Add multicolor ID to the color ID list for device tree bindings.
> >=20
> > CC: Rob Herring <robh@kernel.org>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > ---
> >  .../bindings/leds/leds-class-multicolor.yaml  | 37 +++++++++++++++++++
> >  include/dt-bindings/leds/common.h             |  3 +-
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-m=
ulticolor.yaml
> >=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you for the review!

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8LahkACgkQMOfwapXb+vJY6QCfefS/vt49I44uOsqQdMeJ3lBZ
9tkAoJeFAqZlbdF2AbsGyZpZ3LIGdUvd
=3qMs
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
