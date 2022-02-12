Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9355A4B34DB
	for <lists+linux-leds@lfdr.de>; Sat, 12 Feb 2022 13:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiBLMDN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Feb 2022 07:03:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiBLMDN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Feb 2022 07:03:13 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C402613A
        for <linux-leds@vger.kernel.org>; Sat, 12 Feb 2022 04:03:09 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A45771C0B7A; Sat, 12 Feb 2022 13:03:08 +0100 (CET)
Date:   Sat, 12 Feb 2022 13:03:08 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: lm3692x: Return 0 from remove callback
Message-ID: <20220212120308.GI20866@duo.ucw.cz>
References: <20220206220812.21471-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Content-Disposition: inline
In-Reply-To: <20220206220812.21471-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The only difference between returning zero or a non-zero value is that
> for the non-zero case the i2c will print a generic error message
> ("remove failed (-ESOMETHING), will be ignored").
>=20
> In this case however the driver itself already emitted a more helpful
> error message, so the additional error message isn't helpful at all.
>=20
> The long-term goal is to make the i2c remove callback return void, making
> all implementations return 0 is preparatory work for this change.

Thanks, applied.
									Pavel
								=09
--=20
http://www.livejournal.com/~pavelmachek

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYgeh/AAKCRAw5/Bqldv6
8ogWAJ9pvoa3Soqgme4164lYh6/w46vN2QCgoq4yl/QN2mvaadqaFdlkpjT7qa8=
=Np7j
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--
