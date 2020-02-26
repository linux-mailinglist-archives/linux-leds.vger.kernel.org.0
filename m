Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D3216FFE8
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 14:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBZNaL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 08:30:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37630 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgBZNaL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 08:30:11 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A924A1C0411; Wed, 26 Feb 2020 14:30:09 +0100 (CET)
Date:   Wed, 26 Feb 2020 14:30:09 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: Re: [PATCH 2/2] leds: ns2: Convert to GPIO descriptors
Message-ID: <20200226133009.GA4080@duo.ucw.cz>
References: <20200107141030.74052-1-linus.walleij@linaro.org>
 <20200107141030.74052-2-linus.walleij@linaro.org>
 <20200112135630.GF21102@kw.sim.vm.gnt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20200112135630.GF21102@kw.sim.vm.gnt>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-01-12 14:56:30, Simon Guinot wrote:
> On Tue, Jan 07, 2020 at 03:10:29PM +0100, Linus Walleij wrote:
> > This converts the NS2 LED driver to use GPIO descriptors.
> > We take care to request the GPIOs "as is" which is what
> > the current driver goes to lengths to achieve, then we use
> > GPIOs throughout.
> >=20
> > As the nodes for each LED does not have any corresponding
> > device, we need to use the DT-specific accessors to get these
> > GPIO descriptors from the device tree.
> >=20
> > Cc: Simon Guinot <simon.guinot@sequanux.org>
> > Cc: Vincent Donnefort <vdonnefort@gmail.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Hi Linus and Pavel,
>=20
> I have tested this patches on a LaCie d2 Network v2 board and the LEDs
> are still working as expected.
>=20
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks, applied to my for-next branch.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZy4QAKCRAw5/Bqldv6
8mEHAJ977K2ds5AwZWGk81TYWWq6AMpyNwCgv77YsVwJncap8th/H1OYf+Tq+oY=
=pEt3
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
