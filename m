Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCE42C3FC0
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgKYMSZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:18:25 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42790 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgKYMSY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 07:18:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0918E1C0B7D; Wed, 25 Nov 2020 13:18:22 +0100 (CET)
Date:   Wed, 25 Nov 2020 13:18:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Yu Kuai <yukuai3@huawei.com>, linus.walleij@linaro.org,
        j.anaszewski@samsung.com, simon.guinot@sequanux.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] leds: various: add missing put_device() call in
 netxbig_leds_get_of_pdata()
Message-ID: <20201125121821.GE29328@amd>
References: <20201029092305.900767-1-yukuai3@huawei.com>
 <20201029174952.GB26053@duo.ucw.cz>
 <20201029192555.36834608@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline
In-Reply-To: <20201029192555.36834608@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-10-29 19:25:55, Marek Behun wrote:
> On Thu, 29 Oct 2020 18:49:52 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> >=20
> > Thanks, applied.
> >=20
> > But it seems to me similar handling is needed in "success" paths, no?
>=20
> Pavel, the subject of this commit is wrong.
> It should begin with
>   leds: netxbig:
> instead of
>   leds: various:
> since the patch does not touch various drivers, only one: netxbig.

Ok, thanks, fixed.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++S40ACgkQMOfwapXb+vKUkQCgjw/yynoYzEGuTziszPDTjh80
vYQAoIjdPNOR2if9nSPpHtcLApqnPAQ5
=vBUq
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
