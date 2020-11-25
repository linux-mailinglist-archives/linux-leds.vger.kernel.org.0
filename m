Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507752C48B8
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 20:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbgKYTsa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 14:48:30 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:38154 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729007AbgKYTs3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 14:48:29 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0FA611C0B81; Wed, 25 Nov 2020 20:48:26 +0100 (CET)
Date:   Wed, 25 Nov 2020 20:48:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: lp50xx: add missing fwnode_handle_put in error
 handling case
Message-ID: <20201125194825.GC9791@amd>
References: <20201119070841.712-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline
In-Reply-To: <20201119070841.712-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Fix to set ret and goto child_out for fwnode_handle_put(child)
> in the error handling case rather than simply return, as done
> elsewhere in this function.
>=20
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED =
driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Thanks, applied.

Best regards,
							Pavel
						=09
--=20
http://www.livejournal.com/~pavelmachek

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++tQkACgkQMOfwapXb+vJG0wCaAlLJdIuFosHFwt3YMwltlylb
wFcAoLER+4Rr7BWnyCik1CE2QBeu/YA+
=/Cv4
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
