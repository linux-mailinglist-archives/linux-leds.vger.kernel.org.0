Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9B82DDA68
	for <lists+linux-leds@lfdr.de>; Thu, 17 Dec 2020 21:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgLQU4V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Dec 2020 15:56:21 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44440 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728966AbgLQU4V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2020 15:56:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 68CF11C0B7D; Thu, 17 Dec 2020 21:55:38 +0100 (CET)
Date:   Thu, 17 Dec 2020 21:55:38 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] leds: leds-ariel: convert comma to semicolon
Message-ID: <20201217205538.GA28574@duo.ucw.cz>
References: <20201214134545.4884-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20201214134545.4884-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-12-14 21:45:45, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9vFygAKCRAw5/Bqldv6
8u/UAKCGvesjjqLvx1DwF8TnnD3NBBNQ3ACgoSWE7ABfS1jw6ltZYS4aoZ681nY=
=Dxke
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
