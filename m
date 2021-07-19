Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53193CD458
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jul 2021 14:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236571AbhGSL1z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Jul 2021 07:27:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33574 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236505AbhGSL1y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Jul 2021 07:27:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DE24B1C0B76; Mon, 19 Jul 2021 14:08:33 +0200 (CEST)
Date:   Mon, 19 Jul 2021 14:08:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Amy Parker <apark0006@student.cerritos.edu>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
Message-ID: <20210719120832.GB20484@duo.ucw.cz>
References: <cover.1626383424.git.apark0006@student.cerritos.edu>
 <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This commit changes how led_brightness, declared in header file
> include/linux/leds.h, works throughout the kernel, and updates other
> files in accordance.
>=20
> The TODO located at drivers/leds/TODO requests:
>=20
> * Get rid of led_brightness
>=20
> It is really an integer, as maximum is configurable. Get rid of it, or
> make it into typedef or something.
>=20
> This patch changes the declaration of led_brightness from an enum to a
> typedef. In order to hold the currently existing enum values, macro
> definitions are provided. Files which use led_brightness are updated to
> conform to the new types.

Hmm... thanks.

But I can't really pull this through the LED tree as it touches other
people's code.


> index bfa60fa1d812..e1d771513b98 100644
> --- a/drivers/leds/TODO
> +++ b/drivers/leds/TODO
> @@ -1,7 +1,7 @@
>  -*- org -*-
> =20
>  * On/off LEDs should have max_brightness of 1
> -* Get rid of enum led_brightness
> +* Get rid of led_brightness
> =20
>  It is really an integer, as maximum is configurable. Get rid of it, or
>  make it into typedef or something.

You can delete this.

Probably new type should be called led_brightness_t. And probably it
should be typedef for the enum _for now_, so that we can switch users
gradually.

It should also be more than u8, I believe someone has more than 255
levels at this point.

> +++ b/include/linux/leds.h
> @@ -26,12 +26,11 @@ struct device_node;
>   */
> =20
>  /* This is obsolete/useless. We now support variable maximum brightness.=
 */
> -enum led_brightness {
> -	LED_OFF		=3D 0,
> -	LED_ON		=3D 1,
> -	LED_HALF	=3D 127,
> -	LED_FULL	=3D 255,
> -};
> +typedef u8 led_brightness;
> +#define LED_OFF 0
> +#define LED_ON 1
> +#define LED_HALF 127
> +#define LED_FULL 255
>

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYPVrQAAKCRAw5/Bqldv6
8oxQAJ4vpVLkMFtBxHpILlZoMm4jZWC72QCfSwt/mUMRhACR502Sg0mOnLGWDmg=
=LRWf
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
