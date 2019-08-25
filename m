Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547F19C2AF
	for <lists+linux-leds@lfdr.de>; Sun, 25 Aug 2019 11:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfHYJca (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Aug 2019 05:32:30 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45820 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfHYJc3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Aug 2019 05:32:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id AF5908190C; Sun, 25 Aug 2019 11:32:14 +0200 (CEST)
Date:   Sun, 25 Aug 2019 11:32:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] leds: lm3532: Change the define for the fs
 current register
Message-ID: <20190825093227.GC1644@amd>
References: <20190820195307.27590-1-dmurphy@ti.com>
 <20190820195307.27590-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <20190820195307.27590-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-08-20 14:53:04, Dan Murphy wrote:
> Change the define name of the full scale current registers.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1iVasACgkQMOfwapXb+vIkCQCfd7xQ0UA7DV4GzmkSEUH3B0iv
TQ4AoKry8/8mYuS+HxWPHhpbAQRPrVow
=A9LV
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
