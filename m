Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACDA2DDAA5
	for <lists+linux-leds@lfdr.de>; Thu, 17 Dec 2020 22:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgLQVOD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Dec 2020 16:14:03 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46018 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgLQVOD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2020 16:14:03 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 647A21C0B7D; Thu, 17 Dec 2020 22:13:20 +0100 (CET)
Date:   Thu, 17 Dec 2020 22:13:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3533: Switch to using the new API kobj_to_dev()
Message-ID: <20201217211320.GC28574@duo.ucw.cz>
References: <1606699168-49894-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline
In-Reply-To: <1606699168-49894-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-11-30 09:19:28, Tian Tao wrote:
> fixed the following coccicheck:
> drivers/leds/leds-lm3533.c:611:60-61: WARNING opportunity for kobj_to_dev=
().
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Thanks, applied.
									Pavel


--=20
http://www.livejournal.com/~pavelmachek

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9vJ8AAKCRAw5/Bqldv6
8l3cAJ0ewF5zwnc6+SRno7L5YJKqITs/8QCfTFLOmvph6YadrkTgtwOUrHHaGL4=
=OTT5
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
