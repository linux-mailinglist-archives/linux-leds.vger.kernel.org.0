Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FE015139
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 18:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfEFQ2s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 12:28:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49345 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfEFQ2s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 12:28:48 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 24CC280176; Mon,  6 May 2019 18:28:37 +0200 (CEST)
Date:   Mon, 6 May 2019 18:28:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     oss@c-mauderer.de,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Message-ID: <20190506162848.GA9522@amd>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +* Single Byte SPI LED Device Driver.
> > +
> > +The driver can be used for controllers with a very simple SPI protocol=
: Only one
> > +byte will be sent. The value of the byte can be any value between the =
off-value
> > +and max-value defined in the properties.
> > +
> > +One example where the driver can be used is the controller in Ubiquiti=
 airCube
> > +ISP devices. That LED controller is based on a 8 bit microcontroller (=
SONiX
> > +8F26E611LA) that has been programmed to control the single LED of the =
device.
>=20
> What about power control of the uC?
>=20
> > +The controller supports four modes depending on the highest two bits i=
n a byte:
> > +One setting for brightness, the other three provide different blink pa=
tterns.
>=20
> This part seems in no way generic.
>=20
> How does one support the blink patterns?
>=20
> > +With the leds-spi-byte driver a basic support for the brightness mode =
of that
> > +controller can be easily achieved by setting the minimum and maximum t=
o the
> > +brightness modes minimum and maximum byte value.
> > +
> > +Required properties:
> > +- compatible:          Should be "leds-spi-byte".
>=20
> Generally, we don't do "generic" bindings like this. The exceptions
> are either we have confidence they really can be generic or they where
> created before we knew better. A sample size of 1 doesn't convince me
> the former is true.
>=20
> This comment *only* applies to the binding, not the driver. Specific
> bindings can easily be bound to generic drivers.

Ok, I'm afraid I caused this. What should the compatible be, then?

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzQYMAACgkQMOfwapXb+vJqcACfUBuvX1ehuIeuKW+uI4OQawWH
2WsAniARehfC0UTHPFhyjFMFsM9QVLDd
=uXUc
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
