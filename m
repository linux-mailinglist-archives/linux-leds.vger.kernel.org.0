Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B690450638
	for <lists+linux-leds@lfdr.de>; Mon, 15 Nov 2021 15:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhKOOGl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Nov 2021 09:06:41 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41028 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbhKOOGl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Nov 2021 09:06:41 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D1CA51C0B76; Mon, 15 Nov 2021 15:03:44 +0100 (CET)
Date:   Mon, 15 Nov 2021 15:03:43 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, matthias.bgg@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v15 2/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20211115140343.GA13493@duo.ucw.cz>
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
 <20210716081731.80118-3-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20210716081731.80118-3-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-07-16 16:17:31, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYZJovwAKCRAw5/Bqldv6
8iQwAKCbn6E5ocaFepIatVEpoz3cam0C1gCfXTnqIfam5+VMmDOuw0IDBie3jKE=
=4B7h
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
