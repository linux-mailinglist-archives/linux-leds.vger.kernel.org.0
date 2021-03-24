Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A199834765D
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 11:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbhCXKmL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 06:42:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35646 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235877AbhCXKlj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 06:41:39 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0136A1C0B82; Wed, 24 Mar 2021 11:41:37 +0100 (CET)
Date:   Wed, 24 Mar 2021 11:41:37 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
Subject: Re: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Message-ID: <20210324104137.GB6035@duo.ucw.cz>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-2-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <20210324075631.5004-2-chenhui.zhang@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-03-24 15:56:30, Hermes Zhang wrote:
> From: Hermes Zhang <chenhuiz@axis.com>
>=20
> Introduce a new multiple GPIOs LED driver. This LED will made of
> multiple GPIOs (up to 8) and will map different brightness to different
> GPIOs states which defined in dts file.
>=20
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> ---
>  drivers/leds/Kconfig           |  12 +++
>  drivers/leds/Makefile          |   1 +
>  drivers/leds/leds-multi-gpio.c | 140 +++++++++++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
>  create mode 100644 drivers/leds/leds-multi-gpio.c

Let's put it into drivers/leds/simple. You may need to create it.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYFsXYQAKCRAw5/Bqldv6
8vr0AKCew0KzdsUTgWoblm82wwtxPzZ76wCbBU31559zXH7Khbr+fpV3mrk0/DM=
=hSWh
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
