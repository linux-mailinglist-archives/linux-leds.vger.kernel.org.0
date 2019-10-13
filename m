Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F42D5627
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 14:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbfJMMLR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 08:11:17 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41997 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbfJMMLR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 08:11:17 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 32CB38025E; Sun, 13 Oct 2019 14:10:59 +0200 (CEST)
Date:   Sun, 13 Oct 2019 14:11:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
Message-ID: <20191013121110.GP5653@amd>
References: <20190918105250.22855-1-oleg@kaa.org.ua>
 <20190918105250.22855-2-oleg@kaa.org.ua>
 <5219879e-84af-a98e-2fca-10684548d416@gmail.com>
 <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gQt10JDuGyDb0HQ5"
Content-Disposition: inline
In-Reply-To: <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gQt10JDuGyDb0HQ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Regarding this ASCII art - I presume you wanted to follow
> > Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt.
> >=20
> > It was added to bindings because we support 'pattern' value
> > for linux,default-trigger, which in turn looks for 'led-pattern'
> > property, whose format needs to be documented in the LED bindings.
> >=20
> > leds-trigger-pattern.txt documents only common syntax for software
> > pattern engine. Currently we don't have a means to setup hw_pattern
> > for the pattern trigger from DT, which is obvious omission and your
> > patch just brings it to light.
> >=20
> > That said, I propose to fix it alongside and introduce led-hw-pattern
> > property. When present, ledtrig-pattern would setup the pattern
> > using pattern_set op, similarly as if it was set via sysfs hw_pattern
> > file.
> >=20
> > Only in this case placing the pattern depiction here would be justified.
> > Otherwise, it would have to land in the ABI documentation.
>=20
> You are okay, if I move it to Documentation/ABI/testing/sysfs-class-led-d=
river-el15203000 ?

I don't see if this got a reply. Yes,
Documentation/ABI/testing/sysfs-class-led-driver-el15203000 sounds
like a right place for the sysfs description.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gQt10JDuGyDb0HQ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFF4ACgkQMOfwapXb+vIaZQCgr6IJKemp2lsU7hH6fuadU6Lx
/5kAoJAeFC1LOjO6ltqebBcz5OjB05RH
=4791
-----END PGP SIGNATURE-----

--gQt10JDuGyDb0HQ5--
