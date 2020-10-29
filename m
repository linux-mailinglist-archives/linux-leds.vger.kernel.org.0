Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F55E29F39A
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 18:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgJ2Rtz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 13:49:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33236 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgJ2Rty (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 13:49:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0EAF91C0B7A; Thu, 29 Oct 2020 18:49:53 +0100 (CET)
Date:   Thu, 29 Oct 2020 18:49:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     linus.walleij@linaro.org, j.anaszewski@samsung.com,
        simon.guinot@sequanux.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] leds: various: add missing put_device() call in
 netxbig_leds_get_of_pdata()
Message-ID: <20201029174952.GB26053@duo.ucw.cz>
References: <20201029092305.900767-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20201029092305.900767-1-yukuai3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> if of_find_device_by_node() succeed, netxbig_leds_get_of_pdata() doesn't
> have a corresponding put_device(). Thus add jump target to fix the
> exception handling for this function implementation.
>=20
> Fixes: 2976b1798909 ("leds: netxbig: add device tree binding")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Thanks, applied.

But it seems to me similar handling is needed in "success" paths, no?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5sAwAAKCRAw5/Bqldv6
8nRfAJ9uiMVB0gb+8m/CP8bgrqR3cf4hLQCfadajXrLWwINndft04WA/RXfZ9ak=
=uoXS
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
