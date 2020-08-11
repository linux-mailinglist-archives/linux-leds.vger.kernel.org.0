Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289E3242276
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 00:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgHKW0H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 18:26:07 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42196 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgHKW0G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 18:26:06 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BDAFA1C0BDD; Wed, 12 Aug 2020 00:26:02 +0200 (CEST)
Date:   Wed, 12 Aug 2020 00:26:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Message-ID: <20200811222602.GA10181@amd>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
 <20200811105413.r2m2f7bubuz55rrt@duo.ucw.cz>
 <935119fa-6d1f-8e99-51f9-87966b4d03ad@ti.com>
 <20200811220109.GA9105@amd>
 <3ce38a31-a4f0-4cd7-ad09-6bdad27e6756@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <3ce38a31-a4f0-4cd7-ad09-6bdad27e6756@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>Well it depends on where we want to create the default cache values.
> >>
> >>Either we run through a for..loop during driver probe and delay device =
start
> >>up or we keep the simple arrays and increase the driver total size.
> >for loop will be better.
> >
> >Plus, REGCACHE_RBTREE is very likely overkill.
>=20
> Well if I eliminate the reg_cache then I can eliminate the defaults too.

I'm not asking for that. But please investigate REGCACHE_FLAT.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8zGvoACgkQMOfwapXb+vKqKwCfVq3338ANSF7hhWh4LO+FHY1M
td8An2qT9W5mNi/fOLBur3okqzpJuiqH
=yrsu
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
