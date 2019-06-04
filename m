Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B196341EF
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2019 10:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfFDIfZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jun 2019 04:35:25 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:32787 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfFDIfY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jun 2019 04:35:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D334E802FD; Tue,  4 Jun 2019 10:35:12 +0200 (CEST)
Date:   Tue, 4 Jun 2019 10:35:22 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 30/57] drivers: leds: Use class_find_device_by_name()
 helper
Message-ID: <20190604083522.GA28987@amd>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
 <1559577023-558-31-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <1559577023-558-31-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-06-03 16:49:56, Suzuki K Poulose wrote:
> Use the new class_find_device_by_name() helper.
>=20
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz2LUoACgkQMOfwapXb+vLp9ACcDcme+AbZouXw4a1gi6jwhyRX
ucoAoKE+aKeO7ztisZmtMV5RxLQJH/Nx
=CrDk
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
