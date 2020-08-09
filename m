Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AF724004D
	for <lists+linux-leds@lfdr.de>; Mon, 10 Aug 2020 00:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgHIWdG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Aug 2020 18:33:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55022 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIWdG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Aug 2020 18:33:06 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2D58E1C0BD7; Mon, 10 Aug 2020 00:33:03 +0200 (CEST)
Date:   Mon, 10 Aug 2020 00:33:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     trix@redhat.com
Cc:     sean.wang@mediatek.com, dmurphy@ti.com, matthias.bgg@gmail.com,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: mt6323: move period calculation
Message-ID: <20200809223302.qdsv2ghuju5jrhvw@duo.ucw.cz>
References: <20200809163221.32413-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6pmfl3utzqfdvq76"
Content-Disposition: inline
In-Reply-To: <20200809163221.32413-1-trix@redhat.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6pmfl3utzqfdvq76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Setting the delay_on/off means period needs to be recalculated
> anyway.  So move the period statements after this check.
>=20
> Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")

Makes sense, thanks, applied.

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6pmfl3utzqfdvq76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzB5ngAKCRAw5/Bqldv6
8uf3AKC8otj4qmrAy7nXmwkFnaclBh7UEQCgl72i78Bq13jVd6zxnZFWIzOE6vc=
=/+iR
-----END PGP SIGNATURE-----

--6pmfl3utzqfdvq76--
