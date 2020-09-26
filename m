Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9248279C44
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 21:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIZTyr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 15:54:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43956 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgIZTyr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 15:54:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB60F1C0B7A; Sat, 26 Sep 2020 21:54:44 +0200 (CEST)
Date:   Sat, 26 Sep 2020 21:54:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH leds] leds: tca6507: fix potential zero passed to ERR_PTR
Message-ID: <20200926195444.GB31836@duo.ucw.cz>
References: <20200926194302.22003-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <20200926194302.22003-1-kabel@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Fix potential ERR_PTR(0).

Thanks, applied, and reorganized patches so that fix goes near the bad
commit.

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2+chAAKCRAw5/Bqldv6
8nCJAJ4ka5TsSfYOiNSREVP1Bc+u0txCFwCgrtRb4QEnILXHly8phdLo9tFjI+g=
=Pi2R
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
