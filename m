Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A032C3EA4
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 12:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKYLBI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 06:01:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37376 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgKYLBI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 06:01:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 49C191C0B87; Wed, 25 Nov 2020 12:01:06 +0100 (CET)
Date:   Wed, 25 Nov 2020 12:01:05 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
Message-ID: <20201125110105.GH25562@amd>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Content-Disposition: inline
In-Reply-To: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 23:05:15, Christophe JAILLET wrote:
> In case of memory allocation failure, we must release some resources as
> done in all other error handling paths of the function.
>=20
> 'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
> is called when we break out of a 'device_for_each_child_node' loop.
>=20
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED =
driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, applied.

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++OXEACgkQMOfwapXb+vKXnACgkMTa2dISLqXMqzMQj+tAOgUF
mXcAoJTgoFHTSKW3ivAiNiznNo/aX0If
=Fc+b
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
