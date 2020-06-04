Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052AC1EE411
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 14:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgFDMGY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 08:06:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42200 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgFDMGX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 08:06:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7EB4D1C0BD2; Thu,  4 Jun 2020 14:06:21 +0200 (CEST)
Date:   Thu, 4 Jun 2020 14:06:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, matthias.bgg@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200604120621.GA3560@duo.ucw.cz>
References: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> and 3-channel RGB LED support Register/Flash/Breath Mode
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> base-commit: 098c4adf249c198519a4abebe482b1e6b8c50e47

Does this need device tree binding, too?

> +++ b/drivers/leds/leds-mt6360.c
> @@ -0,0 +1,1061 @@
> +// SPDX-License-Identifier: GPL-2.0

Could we get GPL 2.0 or later?

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtjjvQAKCRAw5/Bqldv6
8uu2AJ94mDQBXm5GCB+DGTjiC5seurSDSgCaA35bqtIrtU4tkebxxxG9yKvSs5E=
=/E8n
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
