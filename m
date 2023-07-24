Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C465775ECA7
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jul 2023 09:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjGXHkk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jul 2023 03:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbjGXHkj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jul 2023 03:40:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759311A5
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 00:40:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qNqBD-0008WS-Tv; Mon, 24 Jul 2023 09:40:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qNqBC-001hjK-Up; Mon, 24 Jul 2023 09:40:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qNqBC-007LlR-4u; Mon, 24 Jul 2023 09:40:30 +0200
Date:   Mon, 24 Jul 2023 09:40:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Tobias Schaffner <tobias.schaffner@siemens.com>,
        kernel@pengutronix.de, Hans de Goede <hdegoede@redhat.com>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: simatic-ipc-leds-gpio: Convert to platform remove
 callback returning void
Message-ID: <20230724074029.qb4gdgj6whesay6w@pengutronix.de>
References: <20230724054743.310750-1-u.kleine-koenig@pengutronix.de>
 <20230724081106.7015e975@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tscueb26zbvs7fom"
Content-Disposition: inline
In-Reply-To: <20230724081106.7015e975@md1za8fc.ad001.siemens.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tscueb26zbvs7fom
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 24, 2023 at 08:11:06AM +0200, Henning Schild wrote:
> Am Mon, 24 Jul 2023 07:47:43 +0200
> schrieb Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>:
>=20
> > The .remove() callback for a platform driver returns an int which
> > makes many driver authors wrongly assume it's possible to do error
> > handling by returning an error code. However the value returned is
> > (mostly) ignored and this typically results in resource leaks. To
> > improve here there is a quest to make the remove callback return
> > void. In the first step of this quest all drivers are converted to
> > .remove_new() which already returns void.
> >=20
> > Make simatic_ipc_leds_gpio_remove() return void instead of returning
> > zero unconditionally. After that the two remove callbacks were trivial
> > to convert to return void, too.
>=20
> Thanks for taking care of that. There are currently two+ patch qs in
> flight that would conflict with that, or rather need that done as well.

Thanks for letting me know. As my patch is part of a bigger effort I
will come back to it eventually. I won't resend now, I will wait at
least until the two series you mentioned landed in next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tscueb26zbvs7fom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS+Ku0ACgkQj4D7WH0S
/k5oQgf/YKG3c1UTtfLl+lpwZMEcnXG1ghukgYxyLPILCsYc6/7DdGE1GgnbmYdh
T2QzeohUYbSkAhuECJVHIbXoq4V4Aq0OvUzA97e7Bl2jy8B6EvHPwh9++ivyhfdR
epSgcASw/5OBnAEdPDb0DyNDzhfoI2OaMvYBmuiA6QuS5qq6U1XAcSswiNjjg6lB
AiGs04FDXPtZxJ2YUnAUMuNzy3bWSc6XPHBbZJjBJFqgGlYeQIngUv9HnooI7Aca
+mmx/Iy79ohdNoai5RzUHcJs+4KpPuu5+XdLY79hPIxoScT+5meZ9j0DJp8+ycu1
pn8PpiP2kv3wR23KKbJ6eEbFFCWArQ==
=PqtF
-----END PGP SIGNATURE-----

--tscueb26zbvs7fom--
