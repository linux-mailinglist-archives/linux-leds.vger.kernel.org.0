Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1C71BA006
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 11:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgD0Jh1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 05:37:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58528 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbgD0Jh1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 05:37:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 23E971C0244; Mon, 27 Apr 2020 11:37:26 +0200 (CEST)
Date:   Mon, 27 Apr 2020 11:37:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v4] leds: ariel: Add driver for status LEDs on Dell Wyse
 3020
Message-ID: <20200427093725.GB20954@duo.ucw.cz>
References: <20200424220240.106055-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <20200424220240.106055-1-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-04-25 00:02:40, Lubomir Rintel wrote:
> This adds support for controlling the LEDs attached to the Embedded
> Controller on a Dell Wyse 3020 "Ariel" board.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks, applied.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqan1QAKCRAw5/Bqldv6
8hE2AJ9Wzkb6ej0KNyPfOpI1b3uHUl2E0wCfatrpKCjXosmLSqEnFKUY4ZXwEAg=
=4D97
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
