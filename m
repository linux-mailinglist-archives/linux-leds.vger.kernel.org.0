Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B045508D50
	for <lists+linux-leds@lfdr.de>; Wed, 20 Apr 2022 18:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240820AbiDTQcG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Apr 2022 12:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243842AbiDTQcF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Apr 2022 12:32:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152223F305
        for <linux-leds@vger.kernel.org>; Wed, 20 Apr 2022 09:29:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nhDCe-0008M5-TE; Wed, 20 Apr 2022 18:29:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nhDCf-004CPQ-Bl; Wed, 20 Apr 2022 18:29:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nhDCd-004WG3-7j; Wed, 20 Apr 2022 18:29:15 +0200
Date:   Wed, 20 Apr 2022 18:29:15 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger/tty: Add knob to blink only for tx or only
 for rx
Message-ID: <20220420162915.2brgxwkrxwqpw5mr@pengutronix.de>
References: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nbjjrrrbe25x5zui"
Content-Disposition: inline
In-Reply-To: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nbjjrrrbe25x5zui
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Feb 24, 2022 at 04:56:55PM +0100, Uwe Kleine-K=F6nig wrote:
> The newly introduced "triggerevent" attribute allows to restrict
> blinking to TX or RX only.

I didn't get any maintainer feedback for this patch since nearly 2
months. I assume the problem is missing maintainer time? Or did this
fell through the cracks?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nbjjrrrbe25x5zui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJgNNgACgkQwfwUeK3K
7An9hwf9Hg+JK0ynVz6YZ1Hy6JYv8p954YX+CTLyz8Kqrpk7CfaAahWZ/xIWWHj9
DiQeQKPvXvryw1M8TH9y5a8iXkjYPMKb8q6A9VTInby96NooT0hc2scTU5zQlDAP
mKes3wr2dB9SoOFToMCbqk7jrGbv0EeT+DflEzMRsLRwBnjzTF3JeoDPoiNgrOpx
Q/DHXfdKKidJ+6g3CR2uPavpyHJF8lUgtLWldScyoSL+MXqXRDVNAaQWvYukjARj
aGaYJDO3hN1uL5SHBCZpvFo1YMRXCMgE2K6vP5g1Or0aoCY/OF/zfOoooXMY7DoI
SzyDks7DumcyF2zl68ALA7A1Gv9IUA==
=qsz3
-----END PGP SIGNATURE-----

--nbjjrrrbe25x5zui--
