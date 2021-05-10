Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE8E3780B5
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhEJKAR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 06:00:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42416 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhEJKAQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 May 2021 06:00:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 96F571C0B79; Mon, 10 May 2021 11:59:11 +0200 (CEST)
Date:   Mon, 10 May 2021 11:59:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH -next] leds: tlc591xx: fix return value check in
 tlc591xx_probe()
Message-ID: <20210510095910.GB14728@amd>
References: <20210406131159.2136509-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <20210406131159.2136509-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2021-04-06 21:11:59, Yang Yingliang wrote:
> After device_get_match_data(), tlc591xx is not checked, add
> check for it and also check np after dev_of_node.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCZA+4ACgkQMOfwapXb+vIBjACfTRZbxh2HT03wyA0AGMBBw+fY
sb0AoLJ51XiGDM7QxX9ReUoJrZzUkEQG
=yf7T
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
