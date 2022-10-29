Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A27B612484
	for <lists+linux-leds@lfdr.de>; Sat, 29 Oct 2022 18:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiJ2QwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 Oct 2022 12:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJ2QwX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 Oct 2022 12:52:23 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2515D8AA
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 09:52:21 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 50C141C09D8; Sat, 29 Oct 2022 18:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1667062339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7o2F+y+WBXax/zU1Ep9l3M9NLX3735fMqY8pYUbeRl4=;
        b=KWsg+QiWnW76mZWS7kH6kMFvCH+ykZo3Z/65ps+kR3WtCqJkgQX5sttyrgLSKNEMbJuIuM
        bsLo4vmgBJAVN+Td9IsuGwxOauC/Tegf7p36QK1Di8Jtitwft9y7FtcPVq0/mU5UeCq63q
        EGZpYaMQq7yJBBkanxAfCNZVqGcm8eE=
Date:   Sat, 29 Oct 2022 18:52:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Proposal: Add color_temperature support
Message-ID: <20221029165218.GA3337@duo.ucw.cz>
References: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On the device Logitech Litra Glow it is possible to set not only the
> brightness but also the color temperature (both via usb as well as via
> hardware).
> I am currently trying to add support for the device - and expose it
> via LED - into the kernel.
> So to support all device capabilities I am proposing to extend LEDs by
> color temperature:
> And initial patch for the headers:

Internally, the litra glow is something like RGB LED, right? Can we
support it as a multicolor LED?

Best regards,
								Pavel

>  diff --git a/include/linux/leds.h b/include/linux/leds.h
> index ba4861ec7..494eab49b 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -72,6 +72,9 @@ struct led_classdev {
> unsigned int brightness;
> unsigned int max_brightness;
> int flags;
> + unsigned int color_temperature;
> + unsigned int min_color_temperature;
> + unsigned int max_color_temperature;
> /* Lower 16 bits reflect status */
> #define LED_SUSPENDED BIT(0)
> @@ -123,6 +126,21 @@ struct led_classdev {
> unsigned long *delay_on,
> unsigned long *delay_off);
> + /* Set LED color temperature
> + * Must not sleep. Use color_temperature_set_blocking for drivers
> + * that can sleep while setting color temperature.
> + */
> + void (*color_temperature_set)(struct led_classdev *led_cdev,
> + unsigned int color_temperature);
> + /*
> + * Set LED color temperature immediately - it can block the caller for
> + * the time required for accessing a LED device register.
> + */
> + int (*color_temperature_set_blocking)(struct led_classdev *led_cdev,
> + unsigned int color_temperature);
> + /* Get LED color temperature */
> + unsigned int (*color_temperature_get)(struct led_classdev *led_cdev);
> +
> int (*pattern_set)(struct led_classdev *led_cdev,
> struct led_pattern *pattern, u32 len, int repeat);
> int (*pattern_clear)(struct led_classdev *led_cdev);
> @@ -140,6 +158,7 @@ struct led_classdev {
> void (*flash_resume)(struct led_classdev *led_cdev);
> struct work_struct set_brightness_work;
> + struct work_struct set_color_temperature_work;
> int delayed_set_value;
> #ifdef CONFIG_LEDS_TRIGGERS
> @@ -160,6 +179,10 @@ struct led_classdev {
> int brightness_hw_changed;
> struct kernfs_node *brightness_hw_changed_kn;
> #endif
> +#ifdef CONFIG_LEDS_COLOR_TEMPERATURE_HW_CHANGED
> + int color_temperature_hw_changed;
> + struct kernfs_node *color_temperature_hw_changed_kn;
> +#endif
> /* Ensures consistent access to the LED Flash Class device */
> struct mutex led_access;
> @@ -574,6 +597,14 @@ void led_classdev_notify_brightness_hw_changed(
> static inline void led_classdev_notify_brightness_hw_changed(
> struct led_classdev *led_cdev, enum led_brightness brightness) { }
> #endif
> +#ifdef CONFIG_LEDS_COLOR_TEMPERATURE_HW_CHANGED
> +void led_classdev_notify_color_temperature_hw_changed(
> + struct led_classdev *led_cdev, unsigned int color_temperature);
> +#else
> +static inline void led_classdev_notify_color_temperature_hw_changed(
> + struct led_classdev *led_cdev, unsigned int color_temperature) { }
> +#endif
> +
> /**
> * struct led_pattern - pattern interval settings
>=20
> What do you think?
> Cheers

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY11aQgAKCRAw5/Bqldv6
8tXcAJoDmyN2p8bm6U+Ybkl8PJg+0Pt2swCfd02FcuiE9WA4G/mG4xi80RKuJ/g=
=a6BQ
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
