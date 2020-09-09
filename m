Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34626262D54
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 12:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgIIKgo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 06:36:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36858 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIIKgn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 06:36:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C1E371C0B87; Wed,  9 Sep 2020 12:36:39 +0200 (CEST)
Date:   Wed, 9 Sep 2020 12:36:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        luka.perkov@sartura.hr
Subject: Re: [PATCH 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
Message-ID: <20200909103638.GB9222@amd>
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-5-luka.kovacic@sartura.hr>
 <CAHp75VfwPa9zL6HCz+qqXJ1rK2JB=ewRiK1qdrgsyxixA5R5Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <CAHp75VfwPa9zL6HCz+qqXJ1rK2JB=ewRiK1qdrgsyxixA5R5Lg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Add support for the iEi WT61P803 PUZZLE LED driver.
> > Currently only the front panel power LED is supported.
> >
> > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
>=20
> Can we make it OF independent?
> See below how to achieve this.

Is there reason to believe this will be found in non-OF systems?

Best regards,

   								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YsDYACgkQMOfwapXb+vJslgCgoSZUq4z6IMNe6JitvA0C97bR
sTcAn1oe9GP22EOmkvUIfkb/bRuTSCaA
=eiiK
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
