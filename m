Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FED26E47AC
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 14:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjDQM3G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 08:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjDQM3F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 08:29:05 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F17910E4
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 05:28:55 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4A6E11C0AB3; Mon, 17 Apr 2023 14:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1681734533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kzbramfxCpHXyy8XYkUSHXABg/3RmZFK4egZ21qgwRk=;
        b=BRZVyHL1jynvBf/MrdvDZdY2ruRAMcKfjnhORH76GUiawJ96q/MSpfTbNMRhCUBDKgnuXz
        8dw9EnMMdkSAk9LbDK5gVUHxZbxMXbT9CZQRHdvJV821VFs/e82seDw7LBoeJ+mOxnM/B6
        gPC1VC97RzbEaw8PZl0ZWeGjxthZS/8=
Date:   Mon, 17 Apr 2023 14:28:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
Message-ID: <ZD07hLV1gs+gw26s@duo.ucw.cz>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="QadF/vCVPG5uFgpZ"
Content-Disposition: inline
In-Reply-To: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--QadF/vCVPG5uFgpZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> After commit ba8a86e4dadb ("leds: trigger/tty: Use
> led_set_brightness_sync() from workqueue") this is the second try to
> pick the right function to set the LED brightness from a trigger.
>=20
> led_set_brightness_sync() has the problem that it doesn't work for LEDs
> without a .brightness_set_blocking() callback. This is (among others)
> the case for LEDs connected to non-sleeping GPIOs.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I don't think this is right.

_nosleep calls _nopm, which assmues it can't sleep, and schedules
another workqueue to set the LED.

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--QadF/vCVPG5uFgpZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZD07hAAKCRAw5/Bqldv6
8gqdAJoDNx8mJSmI5JK//0RgIcmX9H9HGQCfY2h9xbhdcFB0fj2P93oGoZPSS0M=
=xByx
-----END PGP SIGNATURE-----

--QadF/vCVPG5uFgpZ--
