Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11316277B0
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 10:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbfEWIJc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 04:09:32 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51978 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfEWIJc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 04:09:32 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 107328034E; Thu, 23 May 2019 10:09:19 +0200 (CEST)
Date:   Thu, 23 May 2019 10:09:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 3/6] mfd: ti-lmu: Add LM36274 support to the
 ti-lmu
Message-ID: <20190523080929.GA20460@amd>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-05-22 14:27:30, Dan Murphy wrote:
> Add the LM36274 register support to the ti-lmu MFD driver.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzmVTkACgkQMOfwapXb+vIPiwCgxBabqBiVB71I9eCrnTSN22OK
TJEAn3nWXooQ4EP/zXDMQmIL9SW/XT4u
=2s8F
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
