Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C0A53F63F
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jun 2022 08:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiFGGgD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jun 2022 02:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiFGGgC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jun 2022 02:36:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56E887A1D
        for <linux-leds@vger.kernel.org>; Mon,  6 Jun 2022 23:36:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySoq-0004uc-28; Tue, 07 Jun 2022 08:36:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySoq-006wT1-G9; Tue, 07 Jun 2022 08:35:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySoo-00EiLM-J8; Tue, 07 Jun 2022 08:35:58 +0200
Date:   Tue, 7 Jun 2022 08:35:55 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel@pengutronix.de, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lm3601x: Improve error reporting for problems
 during .remove()
Message-ID: <20220607063555.5qen4paj4jmmlpnf@pengutronix.de>
References: <20220513102516.271920-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m463axpjk4rakl7d"
Content-Disposition: inline
In-Reply-To: <20220513102516.271920-1-u.kleine-koenig@pengutronix.de>
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


--m463axpjk4rakl7d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 12:25:16PM +0200, Uwe Kleine-K=F6nig wrote:
> Returning an error value in an i2c remove callback results in a generic
> error message being emitted by the i2c core, but otherwise it doesn't
> make a difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> So instead of triggering the generic i2c error message, emit a more
> helpful message if a problem occurs and return 0 to suppress the generic
> message.
>=20
> This patch is a preparation for making i2c remove callbacks return void.

I want to tackle this (i.e.=20

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..066b541a0d5d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -273,7 +273,7 @@ struct i2c_driver {
=20
 	/* Standard driver model interfaces */
 	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
-	int (*remove)(struct i2c_client *client);
+	void (*remove)(struct i2c_client *client);
=20
 	/* New driver model interface to aid the seamless removal of the
 	 * current probe()'s, more commonly unused than used second parameter.

) directly after the next merge window. That is (depending on Linus's
counting capabilities) after v5.20-rc1. So I ask you to either take this
led patch before (my preferred option), or accept that I send it as part
of a bigger series that eventually contains the above hunk and will
probably be merged via the i2c tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--m463axpjk4rakl7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKe8ckACgkQwfwUeK3K
7AmboAf+L0N8OEBhh6WGnb67rh/m60AncD0ZyebyiESSsx5w4GmFAFm0Mzq8ZH7B
mQTRY2YiTe4u8r6aJcu+od9tFjmzx0aCuMivUW9QKh7qqCBy3GO2/g6l3Ug9X+21
9Gu70OILg8HNJDzfEOBa2vdrrIWHKlvvNaKCLcIyhLowlUa87XaXLQc3i/0D3NHo
vGpIITiMamrfrnfvLaDI+waKo7e6Sf06OkCEPFNYxzsFrKfaJE4xIjb2BlEHodXt
jMYwGtWnvQZR986rYXwGk+wbV09GZq9qDUwgx649EHMqRnQmatEYBFJdV1cmXdOh
pX4QPpyDkwZ+4RJjNiMelfqHFKAkaQ==
=4EpP
-----END PGP SIGNATURE-----

--m463axpjk4rakl7d--
