Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345124195FC
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 16:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbhI0OL3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 10:11:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51794 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbhI0OL3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 10:11:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 250351C0B7A; Mon, 27 Sep 2021 16:09:49 +0200 (CEST)
Date:   Mon, 27 Sep 2021 16:09:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] led-class-flash: fix -Wrestrict warning
Message-ID: <20210927140948.GA5809@duo.ucw.cz>
References: <20210927131557.1587062-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20210927131557.1587062-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> gcc-11 warns when building with W=3D1:
>=20
> drivers/leds/led-class-flash.c: In function 'flash_fault_show':
> drivers/leds/led-class-flash.c:210:16: error: 'sprintf' argument 3 overla=
ps destination object 'buf' [-Werror=3Drestrict]
>   210 |         return sprintf(buf, "%s\n", buf);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/leds/led-class-flash.c:187:54: note: destination object reference=
d by 'restrict'-qualified argument 1 was declared here
>   187 |                 struct device_attribute *attr, char *buf)
>       |                                                ~~~~~~^~~
>=20
> There is no need for the sprintf() here when a strcat() does
> the same thing without invoking undefined behavior.

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVHQrAAKCRAw5/Bqldv6
8nbMAJ9p8yuZLjq/xysDh5/axd2reUccOACeOboBID9EufGo7mr90khPRTxRpf4=
=Ie2P
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
