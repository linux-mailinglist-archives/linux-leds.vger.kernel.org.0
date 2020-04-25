Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8221B8969
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDYUjR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:39:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57712 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUjR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:39:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 070FA1C0239; Sat, 25 Apr 2020 22:39:16 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:39:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 14/17] leds: lp5521: Add multicolor framework
 multicolor brightness support
Message-ID: <20200425203915.GF23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-15-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="A9z/3b/E4MkkD+7G"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-15-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--A9z/3b/E4MkkD+7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-23 10:55:21, Dan Murphy wrote:
> Add the multicolor brightness call back to support the multicolor
> framework. This function allows setting the brightness across
> grouped LED channels in a single call.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

ACK.
							Pavel
						=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--A9z/3b/E4MkkD+7G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6kn/MACgkQMOfwapXb+vIGEQCeOX2NbcxwgHcaJ2DBQd7POGqv
JPYAn0vypIuT7a4AynUVCrau+cfK8ucQ
=BkJ+
-----END PGP SIGNATURE-----

--A9z/3b/E4MkkD+7G--
