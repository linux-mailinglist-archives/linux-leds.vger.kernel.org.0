Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E7D3940B3
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbhE1KNC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:13:02 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34500 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhE1KM6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:12:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B55CF1C0B87; Fri, 28 May 2021 12:11:22 +0200 (CEST)
Date:   Fri, 28 May 2021 12:11:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 09/28] leds: lgm-sso: Don't spam logs when probe is
 deferred
Message-ID: <20210528101122.GI2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-10-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-10-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-10 12:50:26, Andy Shevchenko wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> When requesting GPIO line the probe can be deferred.
> In such case don't spam logs with an error message.
> This can be achieved by switching to dev_err_probe().
>=20
> Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
> Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

=46rom: does not match signed-off here.
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwwckACgkQMOfwapXb+vLOrACgvmVCBVY/iSYna31yR0mrfuYr
UwUAnjmJBRfBSc6Rtb2RlmeJ/mC/uiEC
=RgGT
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--
