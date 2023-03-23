Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979F96C664D
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjCWLPf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjCWLPd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:15:33 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB53F2CC6C;
        Thu, 23 Mar 2023 04:15:15 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 99AF11C0E45; Thu, 23 Mar 2023 12:15:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679570114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XtQ3b7kcQtHY+DqkR8VLrq07M2GcafeFRH23gv5X7UA=;
        b=CGeqoQgSJTirNND1VMtoM55volTSReRW8kfT+8RB5MinJKiL2/SxP3QVrGhWeY9KZnZO7O
        DTdQW3AH1eynNngZnbGOHCy2Ydb8IH2j8F3Y7JqA7X+bj40S17fQDEY9k+JRekL3VabTOF
        TBMW2vIgQqQ06DQ/RTIcDxjjVYvShP4=
Date:   Thu, 23 Mar 2023 12:15:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Kate Hsuan <hpa@redhat.com>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Message-ID: <ZBw0wiFztPs/LP6r@duo.ucw.cz>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="inktvM+i4ZKnwn8y"
Content-Disposition: inline
In-Reply-To: <20230321153718.1355511-4-hpa@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--inktvM+i4ZKnwn8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
> tps68470 provides four levels of power status for LEDB. If the
> properties called "ti,ledb-current" can be found, the current will be
> set according to the property values. These two LEDs can be controlled
> through the LED class of sysfs (tps68470-leda and tps68470-ledb).

If the LED can have four different currents, should it have 4
brightness levels?

> +++ b/drivers/leds/Kconfig
> @@ -827,6 +827,18 @@ config LEDS_TPS6105X
>  	  It is a single boost converter primarily for white LEDs and
>  	  audio amplifiers.
> =20
> +config LEDS_TPS68470
> +	tristate "LED support for TI TPS68470"
> +	depends on LEDS_CLASS
> +	depends on INTEL_SKL_INT3472
> +	help
> +	  This driver supports TPS68470 PMIC with LED chip.
> +	  It provides two LED controllers, with the ability to drive 2
> +	  indicator LEDs and 2 flash LEDs.
> +
> +	  To compile this driver as a module, choose M and it will be
> +	  called leds-tps68470

=2E at end of line.

> +static const char *tps68470_led_names[] =3D {
> +	[TPS68470_ILED_A] =3D "tps68470-iled_a",
> +	[TPS68470_ILED_B] =3D "tps68470-iled_b",

No. See Documentation/leds/well-known-leds.txt . We want the LEDs to
be named after their function.

> +static int tps68470_ledb_current_init(struct platform_device *pdev,
> +				      struct tps68470_device *tps68470)
> +{
> +	int ret =3D 0;
> +	unsigned int curr;
> +
> +	/* configure LEDB current if the properties can be got */

english?

> +	if (!device_property_read_u32(&pdev->dev, "ti,ledb-current", &curr)) {
> +		if (curr > CTRLB_16MA) {

We'll need device tree binding documentation, right?

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--inktvM+i4ZKnwn8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw0wgAKCRAw5/Bqldv6
8r/YAJ0XqXrqLy4mnJ8TH+K91yFtjagwtQCbB6oct/IR01jR4oynq0cVw+nhyjQ=
=xlKW
-----END PGP SIGNATURE-----

--inktvM+i4ZKnwn8y--
