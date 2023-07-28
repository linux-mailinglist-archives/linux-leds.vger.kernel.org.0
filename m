Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D935B7669ED
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 12:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235635AbjG1KKu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 06:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235685AbjG1KKt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 06:10:49 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC4635A3
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 03:10:46 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1288A1C0A94; Fri, 28 Jul 2023 12:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1690539045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yOCkq3pm38mhoofUAJwO6StmwfdjEJm59R48AthX3wo=;
        b=G9Ibik82YS6K+/1tBn986dsKE/L6H6lYKkTxnEOZcvk+gxfOgO43y1ef7zKjsXi84i/ceG
        cVz0c0ZiJkYxo5V2ByMj+2c0NYRwxtZ2fJpffwyM4xATGfCQLg7VUBx3BSz2J7CW2i8+uT
        X16S3AnOYze8zcthV17ld6mIsAB/7D4=
Date:   Fri, 28 Jul 2023 12:10:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 1/3] leds: turris-omnia: change max brightness from
 255 to 1
Message-ID: <ZMOUJIN1OY/NuehT@duo.ucw.cz>
References: <20230714085253.13544-1-kabel@kernel.org>
 <20230714085253.13544-2-kabel@kernel.org>
 <20230716091929.GA1182@bug>
 <20230716170112.1f90670a@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dboxx2u1NVcdoLZZ"
Content-Disposition: inline
In-Reply-To: <20230716170112.1f90670a@thinkpad>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Dboxx2u1NVcdoLZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The HW exposes color control for three channels (RGB), each channel with
> range 0-255 (so 16M colors). The driver exposes this via the
> multi_intensity sysfs file. This is communicated to the HW via
> LED_SET_COLOR I2C command.
>=20
> HW also exposes setting the LED ON and OFF, via the LED_SET_STATE
> I2C command.
>=20
> We currently have the following sysfs files via which we set LED state
> and color:
>   brightness
>   multi_intensity
>=20
> Because currently the driver sets max_brightness to 255, the actual
> color that is sent to HW is recalculated via
> led_mc_calc_color_components(). For example with
>=20
>   $ echo 255 255 100 >multi_intensity
>   $ echo 150 >brightness
>=20
> the led_mc_calc_color_components() function recalculates the channel
> intensities with formula
>   brightness * channel_intensity / max_brightness
> and so the (255, 255, 100) tuple is converted to (150, 150, 58) before
> sending to HW.

And this seems ok.

> What I think would make more sense is to make the two sysfs files
>   brightness
>   multi_intensity
> correspond 1-to-1 with I2C commands LED_SET_STATE and LED_SET_COLOR.

We want your driver to be have same API as other drivers, 1-to-1
correspondence with I2c commands is not important.

NAK-ed-by: Pavel

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Dboxx2u1NVcdoLZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZMOUJAAKCRAw5/Bqldv6
8iwwAJ9kAeLW2PfBewtggRUQPSvI5s1BRQCgu3wVzeB1ecUhBQg80/dxd+RqZnw=
=WncP
-----END PGP SIGNATURE-----

--Dboxx2u1NVcdoLZZ--
