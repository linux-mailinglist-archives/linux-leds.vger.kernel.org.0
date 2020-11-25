Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0F82C48BC
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 20:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgKYTu2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 14:50:28 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:38274 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbgKYTu2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 14:50:28 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 937791C0B7A; Wed, 25 Nov 2020 20:50:25 +0100 (CET)
Date:   Wed, 25 Nov 2020 20:50:24 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: lp50xx: add missing fwnode_handle_put in error
 handling case
Message-ID: <20201125195024.GD9791@amd>
References: <20201119070841.712-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline
In-Reply-To: <20201119070841.712-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-11-19 15:08:41, Qinglang Miao wrote:
> Fix to set ret and goto child_out for fwnode_handle_put(child)
> in the error handling case rather than simply return, as done
> elsewhere in this function.
>=20
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED =
driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Sorry, spoke too fast. We already had equivalent patch in by

    Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the
    RGB LED driver")
        Signed-off-by: Christophe JAILLET
    <christophe.jaillet@wanadoo.fr>

Let me push that out in few minutes.. so you can double-check.

Sorry for confusion,

								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++tYAACgkQMOfwapXb+vLd2ACbBWbO0idpuWB6UwZ2t6VBJjqE
yl8AoJmjVq45nB0tbbqMtP8K3Xjwihbc
=Ht2Z
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
