Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917F02C3DF4
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgKYKi0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:38:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35474 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgKYKiZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:38:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0BC401C0B7D; Wed, 25 Nov 2020 11:38:23 +0100 (CET)
Date:   Wed, 25 Nov 2020 11:38:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree v2 0/2] Parse DT property
 `trigger-sources` for netdev LED trigger
Message-ID: <20201125103822.GC25562@amd>
References: <20200915152616.20591-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline
In-Reply-To: <20200915152616.20591-1-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In this proposal the specific netdev LED trigger mode is determined
> from the `function` LED DT property.
>=20
> Example:
>   eth0: ethernet@30000 {
>     compatible =3D "xyz";
>     #trigger-source-cells =3D <0>;
>   };
>=20
>   led {
>     color =3D <LED_COLOR_ID_GREEN>;
>     function =3D LED_FUNCTION_LINK;
>     trigger-sources =3D <&eth0>;
>   };

>=20
> When led is registered, the netdev trigger is automatically activated
> and set to light the LED on if eth0 is linked.
>=20
> Please let me know if this binding is OK, or if the binding should
> instead of the `function` property determine the trigger settings from
> arguments of the `trigger-sources` property :
>   led {
>     color =3D <LED_COLOR_ID_GREEN>;
>     trigger-sources =3D <&eth0 (NETDEV_ATTR_LINK | NETDEV_ATTR_RX)>;
>   };

So... Both interfaces look relatively sane.

I might preffer the second one. For development boards, the LEDs
really have no labels (etc), thus no function -- they are user LEDs 1
to 4. But we still may want to say "user LED one should have mmc0
trigger by default".

Of course, we might also want to simply say that the LED is really mmc LED.=
=2E.

> I prefer the first binding, since we already have the `function`
> property. Multiple modes can be achieved by string array, but this is
> not yet implemented:
>   led {
>     color =3D <LED_COLOR_ID_GREEN>;
>     function =3D LED_FUNCTION_LINK, LED_FUNCTION_ACTIVITY;
>     trigger-sources =3D <&eth0>;
>   };

I don't see how multiple functions would work.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++NB4ACgkQMOfwapXb+vLopACfanGSVV63A42KFVzvpk5G+rxi
8roAn0oFaQOP44ESGblAmLEcj8vDV+tr
=mf5+
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
