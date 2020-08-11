Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCBE2419CB
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 12:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgHKKbI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 06:31:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54190 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgHKKbH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 06:31:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 790E91C0BD8; Tue, 11 Aug 2020 12:31:03 +0200 (CEST)
Date:   Tue, 11 Aug 2020 12:31:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Message-ID: <20200811103103.bxzvodpkypianz55@duo.ucw.cz>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kb6l2l7yabx4fbbs"
Content-Disposition: inline
In-Reply-To: <20200722153146.8767-3-dmurphy@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kb6l2l7yabx4fbbs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
> The difference in these parts are the number of
> LED outputs where the:
>=20
> LP5036 can control 36 LEDs
> LP5030 can control 30 LEDs
> LP5024 can control 24 LEDs
> LP5018 can control 18 LEDs
> LP5012 can control 12 LEDs
> LP5009 can control 9 LEDs
>=20

> +		fwnode_for_each_child_node(child, led_node) {
> +			ret =3D fwnode_property_read_u32(led_node, "color",
> +						       &color_id);
> +			if (ret) {
> +				dev_err(priv->dev, "Cannot read color\n");
> +				goto child_out;
> +			}
> +
> +			mc_led_info[num_colors].color_index =3D color_id;
> +			num_colors++;
> +		}
> +
> +		led->priv =3D priv;
> +		led->mc_cdev.num_colors =3D num_colors;
> +		led->mc_cdev.subled_info =3D mc_led_info;
> +		led_cdev =3D &led->mc_cdev.led_cdev;
> +		led_cdev->brightness_set_blocking =3D lp50xx_brightness_set;
> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					    &led_cdev->default_trigger);
> +
> +		ret =3D devm_led_classdev_multicolor_register_ext(&priv->client->dev,
> +						       &led->mc_cdev,
> +						       &init_data);
> +		if (ret) {
> +			dev_err(&priv->client->dev, "led register err: %d\n",
> +				ret);
> +			goto child_out;
> +		}
> +		i++;
> +	}
> +
> +	return 0;
> +
> +child_out:
> +	fwnode_handle_put(child);
> +	return ret;
> +}

Are you really sure fwnode_handle_put() handling is okay here? In
particular, where does that happen in non-error path?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kb6l2l7yabx4fbbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzJzZwAKCRAw5/Bqldv6
8gCSAKDB2ZKwOy+nFuyd25QUkFchDqzNNgCfSk3cRBI/45CyEkiXQQhPOB6qnsI=
=GteR
-----END PGP SIGNATURE-----

--kb6l2l7yabx4fbbs--
