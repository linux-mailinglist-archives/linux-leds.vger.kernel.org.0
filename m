Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0DF6AFB9
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 21:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfGPT0C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 15:26:02 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47273 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPT0C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 15:26:02 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0E34B80596; Tue, 16 Jul 2019 21:25:48 +0200 (CEST)
Date:   Tue, 16 Jul 2019 21:25:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH 3/6] leds: apu: drop iosize field from priv data
Message-ID: <20190716192559.GC10400@amd>
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-4-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
In-Reply-To: <1563202653-20994-4-git-send-email-info@metux.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 16:57:30, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
>=20
> As this driver now only supports the APU1 boards, we don't need
> to handle different io sizes anymore.
>=20
> Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0uJMcACgkQMOfwapXb+vJfHQCgkNAMRrJf06130eyYQm1XOutl
rckAoKn7LbLIvqw0GI8xlOIe9bTvdmWp
=XZ96
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
