Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A69610751
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 13:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfEALCI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 07:02:08 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56043 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfEALCI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 07:02:08 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 8AC628094C; Wed,  1 May 2019 13:01:56 +0200 (CEST)
Date:   Wed, 1 May 2019 13:02:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
Message-ID: <20190501110205.GA25045@amd>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com>
 <20190430230215.GF20410@amd>
 <20190501024153.643f86f9@nic.cz>
 <6e22f510-c105-35af-d424-a641714318b8@gmail.com>
 <a99cf020-cea5-9405-6d8d-f2c4b089f681@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <a99cf020-cea5-9405-6d8d-f2c4b089f681@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-05-01 12:44:47, Jacek Anaszewski wrote:
> On 5/1/19 12:12 PM, Jacek Anaszewski wrote:
> [...]
> >>Hi,
> >>I am aware of this issue. I plan to change the driver to multicolor led
> >>class as soon as it is available. But from the discussions I have read
> >>it does not seem it will be available in the next kernel release. I
> >>would like at least full brigthness for the next release and maybe hw
> >>triggering, for which the first version I plan to send this week...
> >
> >If you used led-sources property in your DT bindings it would be all
> >fine. It will justify having three channels controlled by single LED
> >class device.
>=20
> I've just dropped the driver from linux-leds.git. Please resend
> with added led-sources property.
>=20
> You should provide identifiers in the bindings for each iout and list
> them in each child node like below:
>=20
> LED sub-node properties:
>  - reg :                Must be from 0x0 to 0xb, since there are 12 RGB L=
EDs
> on this
>                         controller.
>  - label :              (optional)
>    see Documentation/devicetree/bindings/leds/common.txt
>  - linux,default-trigger : (optional)
>    see Documentation/devicetree/bindings/leds/common.txt
>  - led-sources : Each child node should describe RGB LED it controls,
>                  by listing corresponding iout identifiers:
>         0 - RGB LED 0: red
>         1 - RGB LED 0: green
>         2 - RGB LED 0: blue



>         led-controller@2b {
>                 compatible =3D "cznic,turris-omnia-leds";
>                 reg =3D <0x2b>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>=20
>                 led@0 {
>                         reg =3D <0x0>;
>                         label =3D "userB";
>                         linux,default-trigger =3D "heartbeat";
> 			led-sources =3D <0 1 2>;
>                 };

> Then, there is an issue of what configurations we should allow for.
> In the simplest form you could restrict that it is possible to do
> only single RGB LED -> LED class device mapping.
>=20
> But maybe it would be useful to allow for grouping more RGB LEDs
> under single LED class deivce. It's up to you. It will complicate
> the in-driver logic for sure, so for now we can abide by the simplest
> mapping - it will need to be stated in the bindings.

I'd propose to keep it simple... we are unlikely to see different
configurations in future. I'm not even sure if we should have it in
the dts, as this hardware is fixed -- this is not some kind of
reusable component.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzJfK0ACgkQMOfwapXb+vJAGACcDf6vJgTRPPJd2Fo6ZfeBrUdv
/s0AnRdt28qLx8RxGyYJLE925Md22GK7
=cJEp
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
