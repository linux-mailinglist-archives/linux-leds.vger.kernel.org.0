Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC8751EA3C
	for <lists+linux-leds@lfdr.de>; Sat,  7 May 2022 23:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiEGVNv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 7 May 2022 17:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376407AbiEGVNt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 May 2022 17:13:49 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446F3205CD
        for <linux-leds@vger.kernel.org>; Sat,  7 May 2022 14:10:01 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CD69D1C0BA6; Sat,  7 May 2022 23:09:58 +0200 (CEST)
Date:   Sat, 7 May 2022 23:09:58 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schwermer <sven@svenschwermer.de>
Cc:     linux-leds@vger.kernel.org,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Subject: Re: [PATCH v1] leds: Move pwm-multicolor driver into rgb directory
Message-ID: <20220507210958.GA11004@duo.ucw.cz>
References: <20220504174744.GD8725@duo.ucw.cz>
 <20220504184946.1203959-1-sven@svenschwermer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20220504184946.1203959-1-sven@svenschwermer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>=20
> The drivers/leds/rgb subdirectory is relatively fresh, so we move this
> new PWM multi-color driver into it.
>=20
> Signed-off-by: Sven Schwermer
> <sven.schwermer@disruptive-technologies.com>

Thank you, applied.
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnbgJgAKCRAw5/Bqldv6
8pH1AJ9kNPIBKQrv37k3YNf6grSuH7sEXACbBa0L27Rl8/QgD1wQOXlDBwlZoPY=
=cHOV
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
