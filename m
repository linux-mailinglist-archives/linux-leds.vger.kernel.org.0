Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCC2A28D1
	for <lists+linux-leds@lfdr.de>; Thu, 29 Aug 2019 23:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfH2VX1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Aug 2019 17:23:27 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40269 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2VX1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Aug 2019 17:23:27 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E2AC481422; Thu, 29 Aug 2019 23:23:11 +0200 (CEST)
Date:   Thu, 29 Aug 2019 23:23:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3532: Fix optional led-max-microamp prop error
 handling
Message-ID: <20190829212324.GC32254@amd>
References: <20190829191836.9648-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <20190829191836.9648-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-08-29 14:18:36, Dan Murphy wrote:
> Fix the error handling for the led-max-microamp property.
> Need to check if the property is present and then if it is
> retrieve the setting and its max boundary
>=20
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1oQkwACgkQMOfwapXb+vLjrQCfU213nusI6pOTGjgrS3SjS3gx
5uEAn2+jAROVHG8JwJKB/Ir0VerBKXK3
=nBQI
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
