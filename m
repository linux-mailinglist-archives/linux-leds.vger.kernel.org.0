Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1CB13C15
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 22:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfEDUeu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 16:34:50 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44702 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbfEDUeu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 16:34:50 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 3E45580317; Sat,  4 May 2019 22:34:38 +0200 (CEST)
Date:   Sat, 4 May 2019 22:34:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Christian Mauderer <list@c-mauderer.de>, oss@c-mauderer.de,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
Message-ID: <20190504203448.GA24856@amd>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >I wasn't aware of that list. Maybe "power" or even better "status" would
> >match the function.
>=20
> Hmm, I've just found out that there are two "wlan-ap" occurrences in
> the existing mainline bindings, so I propose to follow that.
>=20
> >Should I add the color too? So "white:status"?
>=20
> Yes, why not if it is known. So, having the above I propose:
>=20
> 		label =3D "white:wlan-ap";

Linux now runs on many different devices, and I believe userland wants
to know "this is main notification LED for this device" (and the only
one in this case).

Phones normally have at most one such LED. Now access point. Someone
will make ethernet switch with just one LED. Maybe thermostat will
have only one LED. Bluetooth GPS. ...

I'd prefer not to mention type of device, and simply state that this
is status LED for the device. Droid 4 uses
"status-led:{red,green,blue}", so "status-led:white" would seem
reasonable.

"white:status" sounds good, too. But I'd prefer not to mention type of
the device, it is simply status LED.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzN92gACgkQMOfwapXb+vL9MQCfY2e5IRx5LbBsfQeF25qYn147
y1EAoLh1wTw7azf3Ikp4+awsB3aMwPXO
=h9G+
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
