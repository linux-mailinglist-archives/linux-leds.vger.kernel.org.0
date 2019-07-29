Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7EAB78A9B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 13:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387674AbfG2LcY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 07:32:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55982 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387483AbfG2LcY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 07:32:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 924FC802A6; Mon, 29 Jul 2019 13:32:10 +0200 (CEST)
Date:   Mon, 29 Jul 2019 13:32:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: netxbig: Add of_node_put() in
 netxbig_leds_get_of_pdata()
Message-ID: <20190729113222.GC396@amd>
References: <20190729065356.26793-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline
In-Reply-To: <20190729065356.26793-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-29 12:23:56, Nishka Dasgupta wrote:
> The variable gpio_ext_np in the function netxbig_leds_get_of_pdata takes
> the value returned by of_parse_phandle; hence, it must be put in order
> to prevent a memory leak. Add an of_node_put for gpio_ext_np before a
> return statement, and move a pre-existing of_node_put statement to right
> after the last usage of this variable.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

Note that I don't want to see this in stable: leak is tiny and is only
in unlikely error paths.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0+2UYACgkQMOfwapXb+vLAHQCfSV0iQNTvonEO7r/OxUTCsqPz
HaEAni30I7eHDtmgfPFFNbnkqNsXfbfP
=ajTD
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
