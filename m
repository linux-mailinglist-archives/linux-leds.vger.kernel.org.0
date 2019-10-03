Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5B9C9CA0
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 12:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfJCKrQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 06:47:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbfJCKrQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 3 Oct 2019 06:47:16 -0400
Received: from earth.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de [37.138.174.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A68022086A;
        Thu,  3 Oct 2019 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570099634;
        bh=4/jqkcYsyVl7PVz1U0O5BHXPwf5v1eSpGmRa7CAYYNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U9iw0PUcu5hRY1AjfLRiTUkjIPliuDqf5dvsnkDevgkletJ3VzrmeV1XusuSqvu/k
         eQ8l2JYb2Rv3aHCkNb+dG4HLwL9IdXMbPLErtxoJ1nxI2+U0TPxtA9Or2LmcKKUvqy
         0AwMveLHdFM8Ceha9K8BVVcfKfyTWeZ97REClaz8=
Received: by earth.universe (Postfix, from userid 1000)
        id E6A053C0CA1; Thu,  3 Oct 2019 12:47:11 +0200 (CEST)
Date:   Thu, 3 Oct 2019 12:47:11 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH v8 3/5] leds: Add managed API to get a LED from a device
 driver
Message-ID: <20191003104711.4if2jiu2utd4bvux@earth.universe>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-4-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5j2vkzm4gjo4nlb3"
Content-Disposition: inline
In-Reply-To: <20191003082812.28491-4-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5j2vkzm4gjo4nlb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 03, 2019 at 10:28:10AM +0200, Jean-Jacques Hiblot wrote:
> If the LED is acquired by a consumer device with devm_led_get(), it is
> automatically released when the device is detached.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-class.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  2 ++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 455545f5d663..80c96dd96afc 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -258,6 +258,55 @@ void led_put(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_put);
> =20
> +static void devm_led_release(struct device *dev, void *res)
> +{
> +	struct led_classdev **p =3D res;
> +
> +	led_put(*p);
> +}
> +
> +/**
> + * devm_of_led_get - Resource-managed request of a LED device
> + * @dev:	LED consumer
> + * @index:	index of the LED to obtain in the consumer
> + *
> + * The device node of the device is parse to find the request LED device.
> + * The LED device returned from this function is automatically released
> + * on driver detach.
> + *
> + * @return a pointer to a LED device or ERR_PTR(errno) on failure.
> + */
> +struct led_classdev *__must_check devm_of_led_get(struct device *dev,
> +						  int index)
> +{
> +	struct led_classdev *led;
> +	struct led_classdev **dr;
> +
> +	if (!dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Not using device tree? */
> +	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
> +		return ERR_PTR(-ENOTSUPP);

I suggested to move the CONFIG_OF check and the NULL check for
of_node into of_led_get(). Otherwise

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> +
> +	led =3D of_led_get(dev->of_node, index);
> +	if (IS_ERR(led))
> +		return led;
> +
> +	dr =3D devres_alloc(devm_led_release, sizeof(struct led_classdev *),
> +			  GFP_KERNEL);
> +	if (!dr) {
> +		led_put(led);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	*dr =3D led;
> +	devres_add(dev, dr);
> +
> +	return led;
> +}
> +EXPORT_SYMBOL_GPL(devm_of_led_get);
> +
>  static int led_classdev_next_name(const char *init_name, char *name,
>  				  size_t len)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 6f7371bc7757..9b94cf752012 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -199,6 +199,8 @@ extern void led_classdev_resume(struct led_classdev *=
led_cdev);
> =20
>  extern struct led_classdev *of_led_get(struct device_node *np, int index=
);
>  extern void led_put(struct led_classdev *led_cdev);
> +struct led_classdev *__must_check devm_of_led_get(struct device *dev,
> +						  int index);
> =20
>  /**
>   * led_blink_set - set blinking with software fallback
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--5j2vkzm4gjo4nlb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2V0a8ACgkQ2O7X88g7
+pqLfQ//bLoy6PAfhHkVMlYpocMT1HWz0GOnUexrCDeuGLfjg7/phLgDuzndzOe7
wsnZPol30W8vTBcJg0drFzMDORv3UJ8POZZMLuPlonYN9e5sGOH+GBb8PVS1Rq61
KKqNV7yXcm8Lo6DwMWei5GN1wO2L3yJ7lWmBPEhR8FWgmVqbpifC41h0ISpoIys6
NKJL2r/rwLH/b5uSm8LqgT+aCVztpha83NkT8JuQN/UbbvMYitz0CL8eoG9Hunuj
0nMHDsVKu/ZLnmJN30c/CjDyX+7PZZYhLIhWD11VTCHxM8NC+fjS07XS/J55R8QZ
u+DQO29nXREPGfP1rYk6FJe8BYdejYMxkMaCPyhdk4xNSjmx+u1lBh96jM8DoX4s
T1PSbhQYMOo6II75Xs+2eGrVNZKMCtipddPHMTtiXduqPIsXa8YnCIKWvBueWkKx
SwVXbZEBtmnEsYhXQm19vjCpuuqnElYosWd3N7KHrHw8JqX1L5UZi5nXofZLdg1Z
rde+cXdQJeBmtOY46EbyVVJ1iL0iV61i6+LYbC/vUO6XLPib2aZ8Pdsh/vLZUBnB
wyXptqaPY51dFNo71sU9Q7movxvD3LC8drxCOT0YqBzWs7CGjmMnlozIuKdsZNgF
HGrZD2xp0kUAogM49CcPqd8FH804TfPwv+rllfxOrmy4kPUiaTg=
=PbO3
-----END PGP SIGNATURE-----

--5j2vkzm4gjo4nlb3--
