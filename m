Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723933BAA3A
	for <lists+linux-leds@lfdr.de>; Sat,  3 Jul 2021 22:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhGCUWA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Jul 2021 16:22:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34096 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhGCUV7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Jul 2021 16:21:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D82131C0B79; Sat,  3 Jul 2021 22:19:24 +0200 (CEST)
Date:   Sat, 3 Jul 2021 22:19:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     David Rivshin <drivshin@awxrd.com>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: is31fl32xx: Fix missing error code in
 is31fl32xx_parse_dt()
Message-ID: <20210703201924.GB6707@amd>
References: <1622545743-21240-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <20210603171010.37fbf545.drivshin@awxrd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <20210603171010.37fbf545.drivshin@awxrd.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-06-03 17:10:10, David Rivshin wrote:
> On Tue,  1 Jun 2021 19:09:03 +0800
> Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:
>=20
> > The error code is missing in this code scenario, add the error code
> > '-EINVAL' to the return value 'ret'.
> >=20
> > Eliminate the follow smatch warning:
> >=20
> > drivers/leds/leds-is31fl32xx.c:388 is31fl32xx_parse_dt() warn: missing
> > error code 'ret'.
> >=20
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>=20
> Good catch!
>=20
> Acked-by: David Rivshin <drivshin@allworx.com>
>=20
> You might also want to add a:
>=20
> Fixes: 9d7cffaf99f5 ("leds: Add driver for the ISSI IS31FL32xx family of =
LED controllers")
>

Thanks, applied. I added the fixes tag, too, but I'm not sure if this
is suitable for stable.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDgxksACgkQMOfwapXb+vLjjgCfRhl0qrU1u1h5MdLvoCpAGELO
sMoAoLYCtxj5EZaa5uNSk+QY2FSEcDz0
=6JYb
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
