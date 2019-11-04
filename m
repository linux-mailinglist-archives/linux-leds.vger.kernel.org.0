Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C322EDB6C
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfKDJQI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:16:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33906 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbfKDJQI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:16:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2499B1C06CB; Mon,  4 Nov 2019 10:09:32 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:31 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: an30259a: add a check for devm_regmap_init_i2c
Message-ID: <20191104090931.GE12355@duo.ucw.cz>
References: <20191016125403.23359-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline
In-Reply-To: <20191016125403.23359-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-16 20:54:03, Chuhong Yuan wrote:
> an30259a_probe misses a check for devm_regmap_init_i2c and may cause
> problems.
> Add a check and print errors like other leds drivers.
>=20
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Thanks, applied.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/qywAKCRAw5/Bqldv6
8tyGAJ4wfMBKXkzwGdXU7+D4hoK47ixpAACfeJnc9IYTirdXFtkbOW1XSHhfBbs=
=DAiz
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--
