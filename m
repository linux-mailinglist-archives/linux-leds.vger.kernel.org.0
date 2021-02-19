Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4577A31F7B9
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 11:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhBSKz6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 05:55:58 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47370 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhBSKyC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 05:54:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2AAE61C0B8B; Fri, 19 Feb 2021 11:53:04 +0100 (CET)
Date:   Fri, 19 Feb 2021 11:53:03 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v13 5/5] leds: mt6360: Add LED driver for MT6360
Message-ID: <20210219105303.GD19207@duo.ucw.cz>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline
In-Reply-To: <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.

What kind of ninja mutant hardware is this?

Can we make this go to  drivers/leds/flash?

> +static int mt6360_flash_brightness_set(struct led_classdev_flash *fl_cde=
v, u32 brightness)
> +{
> +	/*
> +	 * Due to the current spike when turning on flash, let brightness to be=
 kept by framework.
> +	 * This empty function is used to prevent led_classdev_flash register o=
ps check failure.
> +	 */

Please stick to 80 columns.

> +static int mt6360_init_common_properties(struct mt6360_led *led, struct =
led_init_data *init_data)
> +{
> +	const char * const states[] =3D { "off", "keep", "on" };

No need for space between * and const.

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+YjwAKCRAw5/Bqldv6
8renAJ0fPFfR2F+/nrLVIeNTWJMfpcfluwCgknpgj5y/xjX67RIYZ+WE4vP0BqA=
=J0FT
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
