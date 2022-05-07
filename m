Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C62651EA57
	for <lists+linux-leds@lfdr.de>; Sat,  7 May 2022 23:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387457AbiEGVY5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 7 May 2022 17:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235745AbiEGVY5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 May 2022 17:24:57 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3386B1A3B3
        for <linux-leds@vger.kernel.org>; Sat,  7 May 2022 14:21:09 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 03F101C0BA6; Sat,  7 May 2022 23:21:08 +0200 (CEST)
Date:   Sat, 7 May 2022 23:21:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: lp50xx: Remove duplicated error reporting in
 .remove()
Message-ID: <20220507212107.GH11004@duo.ucw.cz>
References: <20220505070727.68768-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ISKrrfpKsPiF35CV"
Content-Disposition: inline
In-Reply-To: <20220505070727.68768-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ISKrrfpKsPiF35CV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2022-05-05 09:07:27, Uwe Kleine-K=F6nig wrote:
> Returning an error value from an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> As stk3310_set_state() already emits an error message on failure and the
> additional error message by the i2c core doesn't add any useful
> information, don't pass the error value up the stack. Instead continue
> to clean up and return 0.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thank you, applied.

Best regards,
								Pavel
							=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ISKrrfpKsPiF35CV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnbiwwAKCRAw5/Bqldv6
8sUKAJ4myXTbMKCNOCcY1LreoObSNb2jAwCfezPJoMDlyk/VxnvSf2/C6jIZBlk=
=KCRw
-----END PGP SIGNATURE-----

--ISKrrfpKsPiF35CV--
