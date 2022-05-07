Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B4851EA4B
	for <lists+linux-leds@lfdr.de>; Sat,  7 May 2022 23:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349444AbiEGVSd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 7 May 2022 17:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiEGVSb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 May 2022 17:18:31 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFCF140F3
        for <linux-leds@vger.kernel.org>; Sat,  7 May 2022 14:14:44 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2C2B11C0BA6; Sat,  7 May 2022 23:14:43 +0200 (CEST)
Date:   Sat, 7 May 2022 23:14:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schwermer <sven@svenschwermer.de>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH v8 0/3 RESEND] Multicolor PWM LED support
Message-ID: <20220507211442.GE11004@duo.ucw.cz>
References: <20220407073225.71605-1-sven@svenschwermer.de>
 <20220504174744.GD8725@duo.ucw.cz>
 <8917a521-6d40-7b84-ac1e-fdbeed60eb58@svenschwermer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Content-Disposition: inline
In-Reply-To: <8917a521-6d40-7b84-ac1e-fdbeed60eb58@svenschwermer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Thank you, applied.
>=20
> Thank you!
>=20
> > Could I get you to submit patch to move this driver into
> > drivers/leds/rgb/ ?
>=20
> Coming up... :)

That was fast. Thank you!
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnbhQgAKCRAw5/Bqldv6
8ibvAKC1LuaFyP0IHeOtQjwvJ0pIm9yjegCeMKhmbdnZ6+eLA0kRDGSFyNFX4N8=
=77R3
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
