Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22888347657
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 11:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbhCXKkh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 06:40:37 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35240 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbhCXKkR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 06:40:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 531131C0B7D; Wed, 24 Mar 2021 11:40:16 +0100 (CET)
Date:   Wed, 24 Mar 2021 11:40:16 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Hermes Zhang <chenhui.zhang@axis.com>, dmurphy@ti.com,
        robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
Subject: Re: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Message-ID: <20210324104016.GA6035@duo.ucw.cz>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-2-chenhui.zhang@axis.com>
 <20210324103431.4b945915@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20210324103431.4b945915@thinkpad>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > From: Hermes Zhang <chenhuiz@axis.com>
> >=20
> > Introduce a new multiple GPIOs LED driver. This LED will made of
> > multiple GPIOs (up to 8) and will map different brightness to different
> > GPIOs states which defined in dts file.
>=20
> I wonder how many boards have such LEDs.
>=20
> Also if it wouldn't be better to expand the original leds-gpio driver.
> Probably depends on how much larger would such expansion make the
> leds-gpio driver.

Let's start with separate.

> Use flexible array members. Allocate with
>   devm_kzalloc(dev, struct_size(priv, states, priv->nr_states),
>                GFP_KERNEL)

Better yet, assume the brightness is 0..2^(num leds) and avoid this
complexity.

> Again LED_FULL and LED_OFF...
> What about default-state =3D "keep" ?
>=20
> Hermes, do you actually have a device that controls LEDs this way? How
> many brightness options do they have?

He has two bits.

> Also I think this functionality could be easily incorporated into the
> existing leds-gpio driver, instead of creating new driver.

> Moreover your driver can control only one LED, so it needs to be
> probed multiple times for multiple LEDs. Meanwhile the leds-gpio driver
> can register multiple LEDs in one probe...

The current version is mostly fine. Let's not overcomplicate it.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYFsXEAAKCRAw5/Bqldv6
8hh3AKC/4zfyRmK8Z5Y/fhcZo2ZpYh2dgQCeLpkpVtX/yTXeX0ft8ohGz7APXnM=
=yIjo
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
