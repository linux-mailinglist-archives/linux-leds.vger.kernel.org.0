Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D42F2DDA58
	for <lists+linux-leds@lfdr.de>; Thu, 17 Dec 2020 21:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgLQUwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Dec 2020 15:52:24 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44140 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQUwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2020 15:52:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C77711C0B7D; Thu, 17 Dec 2020 21:51:39 +0100 (CET)
Date:   Thu, 17 Dec 2020 21:51:39 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org, dmurphy@ti.com
Subject: Re: [PATCH v2] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
Message-ID: <20201217205139.GA27883@duo.ucw.cz>
References: <20201214054205.5263-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <20201214054205.5263-1-dwaipayanray1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Instead of open coding DEVICE_ATTR() defines, use the
> DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
> macros.
>=20
> This required a few functions to be renamed, but the functionality
> itself is unchanged.

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9vE2wAKCRAw5/Bqldv6
8oczAKCz6icf73jdIi6aH6CPpLRzv7IIZgCeP4obrTCBsKSaLRrxZeFZ2+JH/vQ=
=b7N8
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
