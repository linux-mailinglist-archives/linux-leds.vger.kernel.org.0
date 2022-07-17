Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475CF577602
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 13:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiGQLlo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 07:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGQLln (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 07:41:43 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0B713CC8;
        Sun, 17 Jul 2022 04:41:42 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7F4621C000A; Sun, 17 Jul 2022 13:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1658058101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yMUmIi/T/ykw9sfaQtfa8CyMRZEaUmVuBr4MkhwRk6A=;
        b=SeJOExpYHBddO9UdJYInsIfmKyWPxxVeh0Hu1KaS2MpC1Shk345cdtMsu5wMfnyyfFO2s6
        cB7xj+FBfwRar9N/oC4CrifRFoBUVLSOdErrsZyRPrp8H9JbC/vol1xMl22j/DVtagu/z9
        QrijSjIEbriRS4tlwjBJ3Wqv+Be0rmg=
Date:   Sun, 17 Jul 2022 13:41:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/2] leds: bcm63138: add support for BCM63138
 controller
Message-ID: <20220717114141.GH14285@duo.ucw.cz>
References: <20211227145905.2905-1-zajec5@gmail.com>
 <20211227145905.2905-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline
In-Reply-To: <20211227145905.2905-2-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> It's a new controller first introduced in BCM63138 SoC. Later it was
> also used in BCM4908, some BCM68xx and some BCM63xxx SoCs.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
> index 59ba81e40e85..c680af01b5a9 100644
> --- a/drivers/leds/blink/Kconfig
> +++ b/drivers/leds/blink/Kconfig
> @@ -1,3 +1,15 @@
> +config LEDS_BCM63138
> +	tristate "LED Support for Broadcom BCM63138 SoC"
> +	depends on LEDS_CLASS
> +	depends on ARCH_BCM4908 || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	depends on OF
> +	default ARCH_BCM4908
> +	help
> +	  This option enables support for LED controller that is part of
> +	  BCM63138 SoC. The same hardware block is known to be also used
> +	  in BCM4908, BCM6848, BCM6858, BCM63148, BCM63381 and BCM68360.

=2E..the module will be called..?

> +#define BCM63138_MAX_LEDS				32
> +#define BCM63138_MAX_BRIGHTNESS				9
> +
> +#define BCM63138_LED_BITS				4				/* how many bits control a single LED =
*/
> +#define BCM63138_LED_MASK				((1 << BCM63138_LED_BITS) - 1)	/* 0xf */
> +#define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */
> +

80 columns would not hurt.

> +static void bcm63138_leds_set_flash_rate(struct bcm63138_leds *leds,
> +					 struct bcm63138_led *led,
> +					 u8 value)
> +{
> +	int reg_offset =3D (led->pin >> fls((BCM63138_LEDS_PER_REG - 1))) * 4;

The fls() dance is "interesting".

> +static void bcm63138_leds_enable_led(struct bcm63138_leds *leds,
> +				     struct bcm63138_led *led,
> +				     enum led_brightness value)
> +{
> +	u32 bit =3D BIT(led->pin);
> +
> +	bcm63138_leds_update_bits(leds, BCM63138_SW_DATA, bit,
> +				  value =3D=3D LED_OFF ? 0 : bit);
> +}

I'd do "! value". We'll want to deprecate LED_OFF. (And you do that below).

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtP1dQAKCRAw5/Bqldv6
8vy2AKCJg+NikpNMon17csmqw2LTM2+i+wCfYJZnnFq2qQXFw6dR6+HbahSYSes=
=//5s
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--
