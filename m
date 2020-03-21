Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4CE118E263
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgCUPVz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:21:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52576 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgCUPVz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:21:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 40F1D1C0337; Sat, 21 Mar 2020 16:21:53 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:21:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] leds: leds-pwm: Replace zero-length array with
 flexible-array member
Message-ID: <20200321152152.GC8386@duo.ucw.cz>
References: <20200319215146.GA24054@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
In-Reply-To: <20200319215146.GA24054@embeddedor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>=20
> This issue was found with the help of Coccinelle.

I applied both. I'll be unhappy if they break anything.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnYxEAAKCRAw5/Bqldv6
8iwdAJ9fhHq+m0naK9c/L6eOl12fp1/tXACdGqempYJ/JHn7ME1jPYapzkWKOgo=
=HHSH
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
