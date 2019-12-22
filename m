Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46EAA128F4A
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2019 19:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfLVS10 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Dec 2019 13:27:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54096 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLVS10 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Dec 2019 13:27:26 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BAF981C2453; Sun, 22 Dec 2019 19:27:24 +0100 (CET)
Date:   Sun, 22 Dec 2019 19:27:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v17 09/19] ARM: dts: n900: Add reg property to the LP5523
 channel node
Message-ID: <20191222182723.GB23369@amd>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-10-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20191114133023.32185-10-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-11-14 07:30:13, Dan Murphy wrote:
> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> CC: Tony Lindgren <tony@atomide.com>
> CC: "Beno=EEt Cousson" <bcousson@baylibre.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3/tYsACgkQMOfwapXb+vIpwACeOuQbNStwKlBpTl21vS6RL/pK
V2sAn1XutE0H99U45/+USO/bbmeupgr3
=KwJk
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
