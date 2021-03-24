Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECE3347660
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 11:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhCXKmq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 06:42:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35828 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhCXKmW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 06:42:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 627F81C0B7D; Wed, 24 Mar 2021 11:42:20 +0100 (CET)
Date:   Wed, 24 Mar 2021 11:42:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Hermes Zhang <chenhui.zhang@axis.com>, dmurphy@ti.com,
        robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
Subject: Re: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Message-ID: <20210324104220.GC6035@duo.ucw.cz>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-2-chenhui.zhang@axis.com>
 <20210324103431.4b945915@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline
In-Reply-To: <20210324103431.4b945915@thinkpad>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +	of_property_read_string(node, "default-state", &state);
> > +	if (!strcmp(state, "on"))
> > +		multi_gpio_led_set(&priv->cdev, LED_FULL);
> > +	else
> > +		multi_gpio_led_set(&priv->cdev, LED_OFF);
>=20
> Again LED_FULL and LED_OFF...
> What about default-state =3D "keep" ?

Let's not support default-state unless you need it.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYFsXjAAKCRAw5/Bqldv6
8oBsAKCrUYkCicLSpdbBtC34/b1tEkxOdwCgh2q9i9aSIzBTZdg8Ts7aJB4BEKc=
=NkP/
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
