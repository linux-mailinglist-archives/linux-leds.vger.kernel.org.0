Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB453B21B5
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 22:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFWUU6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 16:20:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35828 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhFWUU6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:20:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B24E11C0B76; Wed, 23 Jun 2021 22:18:39 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:18:39 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH -next] leds: class: fix W=1 warnings in led-class.c
Message-ID: <20210623201839.GE8540@amd>
References: <20210517044826.3458498-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Content-Disposition: inline
In-Reply-To: <20210517044826.3458498-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Fix the following make W=3D1 kernel build warnings:
>=20
>   drivers/leds/led-class.c:521: warning: Function parameter or member 'de=
v' not described in 'devm_led_classdev_unregister'
>   drivers/leds/led-class.c:521: warning: Excess function parameter 'paren=
t' description in 'devm_led_classdev_unregister'
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

I tried to apply it on current -next, but was fixed already. Best
regards,

								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTlx4ACgkQMOfwapXb+vLTNgCeJpdxLH/XiAuo+AJEHM2XFZ3n
LTMAn24qaW8WYmTVe6kZf3r8iokIUZLj
=o1G3
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
