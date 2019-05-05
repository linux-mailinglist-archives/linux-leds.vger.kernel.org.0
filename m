Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5AA13F42
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 13:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfEELyO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 07:54:14 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36250 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfEELyO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 07:54:14 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id AF2FA803A9; Sun,  5 May 2019 13:54:02 +0200 (CEST)
Date:   Sun, 5 May 2019 13:54:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Christian Mauderer <list@c-mauderer.de>, oss@c-mauderer.de,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
Message-ID: <20190505115413.GA13722@amd>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com>
 <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd>
 <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-05-05 12:56:35, Jacek Anaszewski wrote:
> Hi,
>=20
> On 5/5/19 12:17 AM, Pavel Machek wrote:
> >Hi!
> >
> >>>>I wasn't aware of that list. Maybe "power" or even better "status" wo=
uld
> >>>>match the function.
> >>>
> >>>Hmm, I've just found out that there are two "wlan-ap" occurrences in
> >>>the existing mainline bindings, so I propose to follow that.
> >
> >Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".
> >
> >>>>Should I add the color too? So "white:status"?
> >>>
> >>>Yes, why not if it is known. So, having the above I propose:
> >>>
> >>>		label =3D "white:wlan-ap";
> >>
> >>Linux now runs on many different devices, and I believe userland wants
> >>to know "this is main notification LED for this device" (and the only
> >>one in this case).
>=20
> This LED is on the access point, so it should have this affiliation
> somehow represented in the name.
>=20
> >...and I guess if you have single LED it will be used for more than
> >"is AP active". IOW it will likely to be more similar to "status" than
> >"wlan-ap".
>=20
> IMO if a LED is on some specific device, then it should be reflected
> in the "function" section of the LED name. It facilitates locating in
> physically. If usersapce wants to change its purpose it is free to do
> so. e.g. via triggers. But it will not affect the LED name.

I'd prefer not to do that. Existing ":wlan-ap" LED is a LED probably
indicating that access point is on; while this will normally indicate
system status. Its function is more similar to "status" on
dove-d3plug.dts.

I'd prefer LED names not to depend on function of system they are
in. Status LED on phone should be named same way status LED of
wireless AP is.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzOzuUACgkQMOfwapXb+vIxHwCcDb426C0UNQvr0uOXNn/bNHlW
gfYAoKIPub+tMBlGtc9dcHbOeEHt/E4V
=NUUd
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
