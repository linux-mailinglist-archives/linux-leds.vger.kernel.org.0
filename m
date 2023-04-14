Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C6A6E2392
	for <lists+linux-leds@lfdr.de>; Fri, 14 Apr 2023 14:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjDNMpH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Apr 2023 08:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjDNMpC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Apr 2023 08:45:02 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF55A5E6
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 05:45:00 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4D9DF1C0AB2; Fri, 14 Apr 2023 14:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1681476299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LOIOMHMyH0B34ds5oU7rqYjL09D/QYM+w12KtzzDmnk=;
        b=pKYopzXlkUnijUXhUcy0PViJGYFFMaVZ3ETduOpsPHS5C0e1qlAntHRab2f+EgmepY+e/J
        paR0duq14pCyinYv17P/F21XhQ6jY/19Io5DtKjgTIyxfSisozs476wDvg93xbSfy+AjPh
        0A1oneJrKEHqA6n05XhsDOyV2Cjf60A=
Date:   Fri, 14 Apr 2023 14:44:58 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
Message-ID: <ZDlKyq0tLAbFGS8P@duo.ucw.cz>
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="l3O1bRIH5xFrvatS"
Content-Disposition: inline
In-Reply-To: <20230413151808.20900-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--l3O1bRIH5xFrvatS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2023-04-13 17:18:04, Hans de Goede wrote:
> From: Yauhen Kharuzhy <jekhor@gmail.com>
>=20
> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
> PMIC. Charger and general-purpose leds are supported. Hardware blinking
> is implemented, breathing is not.

leds->LEDs.

> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
> new file mode 100644
> index 000000000000..06447804d050
> --- /dev/null
> +++ b/drivers/leds/leds-cht-wcove.c
> @@ -0,0 +1,368 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
> + *
> + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> + * Copyright 2023 Hans de Goede <hansg@kernel.org>
> + *
> + * Based on Lenovo Yoga Book Android kernel sources
> + */

"sources." Should copyrights from Android be copied here?

> +static const char * const cht_wc_leds_names[CHT_WC_LED_COUNT] =3D {
> +	"cht-wc::" LED_FUNCTION_CHARGING,
> +	"cht-wc::" LED_FUNCTION_INDICATOR,
> +};

No need for "cht-wc". Mention color. At least charging LED is
going to be common - document in Documentation/leds/well-known-leds.txt.=20

> +static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
> +				      enum led_brightness value)
> +{
> +	struct cht_wc_led *led =3D container_of(cdev, struct cht_wc_led, cdev);
> +	int ret;
> +
> +	mutex_lock(&led->mutex);
> +
> +	if (!value) {
> +		ret =3D regmap_update_bits(led->regmap, led->regs->ctrl,
> +					 led->regs->on_off_mask, led->regs->off_val);
> +		if (ret)
> +			dev_err(cdev->dev, "Failed to turn off: %d\n", ret);
> +
> +		/* Disable HW blinking */
> +		ret =3D regmap_update_bits(led->regmap, led->regs->fsm,
> +					 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_ON);
> +		if (ret < 0)
> +			dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);

This overwrites previous error. Not sure if it is big deal.

> +static int cht_wc_leds_blink_set(struct led_classdev *cdev,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{
> +	struct cht_wc_led *led =3D container_of(cdev, struct cht_wc_led, cdev);
> +	unsigned int ctrl;
> +	int ret;
> +
> +	mutex_lock(&led->mutex);
> +
> +	if (!*delay_on && !*delay_off)
> +		*delay_on =3D *delay_off =3D 1000;

That's really slow blink; I'd do something faster by default.

> +	/*
> +	 * LED1 might be in hw-controlled mode when this driver gets loaded; and
> +	 * since the PMIC is always powered by the battery any changes made are
> +	 * permanent. Save LED1 regs to restore them on remove() or shutdown().
> +	 */

Fun :-).

Thank you.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--l3O1bRIH5xFrvatS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDlKygAKCRAw5/Bqldv6
8maxAJ9k7bXWtJFt1H0ZdkwapHu/4ucIUQCeLyg1aQqIq+j0Sgj+PFbnfSzuvaI=
=rtJ/
-----END PGP SIGNATURE-----

--l3O1bRIH5xFrvatS--
