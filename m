Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56BD3B219C
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 22:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFWUOA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 16:14:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35212 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUN7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:13:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E6D1F1C0B76; Wed, 23 Jun 2021 22:11:40 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:11:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     kabel@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] leds: turris-omnia: add missing MODULE_DEVICE_TABLE
Message-ID: <20210623201140.GB8540@amd>
References: <1620802158-19377-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <1620802158-19377-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-05-12 14:49:18, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Thanks, applied.
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTlXwACgkQMOfwapXb+vLBogCgojs1SUEjONcT4drQWiXXf/5T
OE8An1eRzBsTd02XV6XGxQNYsZFw43r5
=8G9I
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
