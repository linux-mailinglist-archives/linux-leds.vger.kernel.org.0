Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05746C66CF
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjCWLim (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCWLil (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:38:41 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9BF30197
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:38:29 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4E38E1C0E52; Thu, 23 Mar 2023 12:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679571508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jQSNGyq5bxHHsR3iJ5XIA36EyYOi4u+yds7qA/hOrrw=;
        b=OlrlTlQPGzMCyqN8rrjaXmpObRpZJp9S5O2gKML5MebNLrO27eaEl3oAySLNNOOwq4b71H
        BvvfE+esQWn7MT90oqrl72pDo0C6jfdF5vUg0Gx8FMqbMhJN2Xm5/E/L/D84e9lj3l/Q/g
        ct477TN//3x9Q4ufPHmb03aqrfz52r0=
Date:   Thu, 23 Mar 2023 12:38:27 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schwermer <sven@svenschwermer.de>
Cc:     linux-leds@vger.kernel.org,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        jacek.anaszewski@gmail.com, schuchmann@schleissheimer.de
Subject: Re: [PATCH RESEND v2] led: multicolor: Fix intensity setting while
 SW blinking
Message-ID: <ZBw6Mwa0cWAddj3P@duo.ucw.cz>
References: <20220627133110.271455-1-sven@svenschwermer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tm8dstKnmfS5ABgp"
Content-Disposition: inline
In-Reply-To: <20220627133110.271455-1-sven@svenschwermer.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tm8dstKnmfS5ABgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2022-06-27 15:31:10, Sven Schwermer wrote:
> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>=20
> When writing to the multi_intensity file, don't unconditionally call
> led_set_brightness. By only doing this if blinking is inactive we
> prevent blinking from stopping if the blinking is in its off phase while
> the file is written.
>=20
> Instead, if blinking is active, the changed intensity values are applied
> upon the next blink. This is consistent with changing the brightness on
> monochrome LEDs with active blinking.
>=20
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Schwermer
<sven.schwermer@disruptive-technologies.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

BR,
									Pavel
								=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--tm8dstKnmfS5ABgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw6MwAKCRAw5/Bqldv6
8uZ9AKC8alWNGXAy+uA8aS8CLetTHkMA6ACfUHS8RbCjR52LIBTyNcydkhJMmCM=
=YG7Q
-----END PGP SIGNATURE-----

--tm8dstKnmfS5ABgp--
