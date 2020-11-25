Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875F02C3DB7
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgKYKdC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:33:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35010 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbgKYKdC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:33:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9DFDF1C0B7D; Wed, 25 Nov 2020 11:32:59 +0100 (CET)
Date:   Wed, 25 Nov 2020 11:32:58 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree v2 1/2] leds: trigger: add trigger
 sources validating method and helper functions
Message-ID: <20201125103258.GB25562@amd>
References: <20200915152616.20591-1-marek.behun@nic.cz>
 <20200915152616.20591-2-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline
In-Reply-To: <20200915152616.20591-2-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Currently we use the `linux,default-trigger` device tree property of a
> LED to define the default trigger which should be activated for a LED.
>=20
> But the LED device tree binding also documents the `trigger-sources`
> property, which specifies the source device which should be triggering
> the LED.
>=20
> The `trigger-sources` property is currently implemented only in
> drivers/usb/core/ledtrig-usbport.c.
>=20
> Lets add a method to struct led_trigger which, if implemented, can check
> whether this trigger should be enabled as default. This check shall be
> done by checking whether the specified `trigger-sources` refers to a
> device compatible with the trigger. For this two new helper functions,
> of_led_count_trigger_sources and of_led_get_trigger_source, are
> implemented.

> +int of_led_count_trigger_sources(struct led_classdev *led_cdev)
> +{
> +	struct device_node *np;
> +	int count;
> +
> +	np =3D dev_of_node(led_cdev->dev);
> +	if (!np)
> +		return 0;
> +
> +	count =3D of_count_phandle_with_args(np, "trigger-sources",
> +					   "#trigger-source-cells");
> +	if (count =3D=3D -ENOENT)
> +		return 0;
> +	else if (count < 0)
> +		dev_warn(led_cdev->dev,
> +			 "Failed parsing trigger sources for %pOF!\n", np);
> +
> +	return count;
> +}

Will this need of_node_put() somewhere?

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++MtoACgkQMOfwapXb+vIf0gCaAz1JcbXMTpGsZfPcDBiZj+Ng
QsAAnjWVVG0ktkq/hSXVmdfBw8aHOHfJ
=YaAm
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
