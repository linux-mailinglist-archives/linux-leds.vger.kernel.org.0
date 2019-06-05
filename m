Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80AB235A0A
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 12:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfFEKBi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 06:01:38 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47124 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfFEKBi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 06:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=tt332wNsFzoKP2lgvb/2+DEBQV3HPehR64S+Tdrj8MQ=; b=us+MkBycio5fp/tf/heKrNc/R
        drxLNZ4z7t3I80R41YHzXZv+kQWCdOYV+A7AGigvaaWiGgRnuk6+SYncpi9e8Txe3v2v9GhHvDPRE
        nPmXMiTXpz0kPsZH1mEyXrEitmQ4zkJ9N/BtYYblCVZeaB5jN9IayDaw4izvNRSA3cx5s=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYSjd-0008UM-D1; Wed, 05 Jun 2019 10:01:33 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 86D11440046; Wed,  5 Jun 2019 11:01:32 +0100 (BST)
Date:   Wed, 5 Jun 2019 11:01:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable
 flexible
Message-ID: <20190605100132.GL2456@sirena.org.uk>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LkBseQZEL/3d2JPd"
Content-Disposition: inline
In-Reply-To: <20190604174345.14841-2-dmurphy@ti.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--LkBseQZEL/3d2JPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 12:43:40PM -0500, Dan Murphy wrote:
> The use of and enablement of the GPIO can be used across devices.
> Use the enable_reg in the regulator descriptor for the register to
> write.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>=20
> v5 - No changes to the patch changes requested in this patch were done in
> patch 4 of this series - https://lore.kernel.org/patchwork/patch/1077408/

I was expecting this patch to just be completely dropped?  It looks like
the end result is very similar, we're still using enable_reg to get the
register and I don't see new validation added in patch 4.

--LkBseQZEL/3d2JPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz3kvsACgkQJNaLcl1U
h9CL4Af/eIXNOUQrDHol0TbFPD7MMFgStTriNhd5Fn+14zkke4yvtU6mzKz4ZNeh
3kKeUTQRvj9/xVuKjKsFmLteeTCj1hPJ7/oa7M5uo+zFuQWMWnkNulYXSv01yue1
61zxfIJgaHEbVlI31m0pqLAQTb5opriEJ7eWpH6Iw4aYbiWO3spi0lYrQFf0BXLR
PT6L9eDXJXE+MrXc2HrzxOXAKtB91oveq2G8WdqXp9svmP2NimUvTMUHo1HPIpUB
g7t2i9qT2k8+5WXZ/g03DN9IxVgNy29RuAYdyEpMD4vOYmbtJiaxQMknD0TQp7Kf
Gx3UQmwBAtBfKwQOUMK+mTMQn0O8yQ==
=A/Jg
-----END PGP SIGNATURE-----

--LkBseQZEL/3d2JPd--
