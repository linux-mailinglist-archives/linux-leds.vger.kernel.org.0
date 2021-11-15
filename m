Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEA445064C
	for <lists+linux-leds@lfdr.de>; Mon, 15 Nov 2021 15:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbhKOOLs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Nov 2021 09:11:48 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41386 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbhKOOLq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Nov 2021 09:11:46 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EAF691C0B7F; Mon, 15 Nov 2021 15:08:49 +0100 (CET)
Date:   Mon, 15 Nov 2021 15:08:48 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Yihao Han <hanyihao@vivo.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@vivo.com
Subject: Re: [PATCH] leds: tca6507: use swap() to make code cleaner
Message-ID: <20211115140848.GA14175@duo.ucw.cz>
References: <20211115032428.4379-1-hanyihao@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <20211115032428.4379-1-hanyihao@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-11-14 19:24:28, Yihao Han wrote:
> Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> opencoding it.
>=20
> Signed-off-by: Yihao Han <hanyihao@vivo.com>

Thanks, applied.
								Pavel
							=09

--=20
http://www.livejournal.com/~pavelmachek

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYZJp8AAKCRAw5/Bqldv6
8pIyAJ9G+aR7VzBCkArxlokpPXYjm3vFVgCeJzh1Pjd+0ZFC/hbfO7dYja0uqTo=
=bnRK
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
