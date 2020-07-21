Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10592228A51
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jul 2020 23:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgGUVF5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Jul 2020 17:05:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44252 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgGUVF5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2020 17:05:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6F7D21C0BD8; Tue, 21 Jul 2020 23:05:54 +0200 (CEST)
Date:   Tue, 21 Jul 2020 23:05:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v31 03/12] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Message-ID: <20200721210554.GC5966@amd>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline
In-Reply-To: <20200716182007.18389-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The device has the ability to group LED output into control banks
> so that multiple LED banks can be controlled with the same mixing and
> brightness.  Inversely the LEDs can also be controlled independently.

Inversely?

> --- /dev/null
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -0,0 +1,784 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// TI LP50XX LED chip family driver
> +// Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
> +

Can we get https here and in the binding document?

Please run this through checkpatch -- I believe it will have some
comments.

> +
> +	device_for_each_child_node(priv->dev, child) {
> +		led =3D &priv->leds[i];
> +		ret =3D fwnode_property_count_u32(child, "reg");
> +		if (ret < 0) {
> +			dev_err(&priv->client->dev,
> +					"reg property is invalid\n");
> +			return -EINVAL;

is handle_put(child) needed here?

> +		}
> +		if (ret > 1) {
> +			priv->num_of_banked_leds =3D ret;
> +			if (priv->num_of_banked_leds >
> +			    priv->chip_info->max_modules) {
> +				dev_err(&priv->client->dev,
> +					"reg property is invalid\n");
> +				ret =3D -EINVAL;
> +				fwnode_handle_put(child);
> +				goto child_out;
> +			}
> +
> +			ret =3D fwnode_property_read_u32_array(child,
> +							     "reg",
> +							     led_banks,
> +							     ret);

Move this to subfunction to reduce the indentation? (Or, just refactor
it somehow).

> +			if (ret) {
> +				dev_err(&priv->client->dev,
> +					"reg property is missing\n");
> +				fwnode_handle_put(child);
> +				goto child_out;
> +			}

Create label that does the handle_put so you don't need to repeat it
quite so often?

> +		fwnode_for_each_child_node(child, led_node) {
> +			ret =3D fwnode_property_read_u32(led_node, "color",
> +						       &color_id);
> +			if (ret)
> +				dev_err(priv->dev, "Cannot read color\n");
> +
> +			mc_led_info[num_colors].color_index =3D color_id;

This uses undefined value.

> +	ret =3D lp50xx_reset(led);

Does the GPIO need to be disabled before enabling it for reset?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8XWLIACgkQMOfwapXb+vKuOQCgoxrMbavmy/NClUkh98BWFE7Z
uvkAnREYqZYfPNmsTX6foeWu/G5wodi/
=XmHi
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
