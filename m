Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FC924780F
	for <lists+linux-leds@lfdr.de>; Mon, 17 Aug 2020 22:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgHQUZM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Aug 2020 16:25:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39384 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHQUZM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2020 16:25:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B40CA1C0BB6; Mon, 17 Aug 2020 22:25:08 +0200 (CEST)
Date:   Mon, 17 Aug 2020 22:25:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Eddie James <eajames@linux.ibm.com>, vishwa@linux.ibm.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmurphy@ti.com,
        jacek.anaszewski@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: pca955x: Add IBM
 implementation compatible string
Message-ID: <20200817202508.GA13123@amd>
References: <20200803145055.5203-1-eajames@linux.ibm.com>
 <20200803145055.5203-2-eajames@linux.ibm.com>
 <20200812195747.GA2605701@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20200812195747.GA2605701@bogus>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-08-12 13:57:47, Rob Herring wrote:
> On Mon, 03 Aug 2020 09:50:54 -0500, Eddie James wrote:
> > IBM created an implementation of the PCA9552 on a PIC16F
> > microcontroller. Document the new compatible string for this device.
> >=20
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-pca955x.txt | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, I applied the series.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8656QACgkQMOfwapXb+vJ/vgCggeE9wN9rcZ//IBVRvJwgJupz
L5cAoKKJ85ZMJGg6Sf/GbCNP2talpcIQ
=wI1t
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
