Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B39512AB81
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 11:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfLZKHk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 05:07:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39832 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfLZKHj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 05:07:39 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 249F01C210C; Thu, 26 Dec 2019 11:07:38 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:07:37 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] leds: lm3692x: Allow to configure over voltage
 protection
Message-ID: <20191226100737.GB4033@amd>
References: <cover.1577271823.git.agx@sigxcpu.org>
 <5ee465d90bb71dc63e9fb2b794fd898eb6726fc4.1577271823.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <5ee465d90bb71dc63e9fb2b794fd898eb6726fc4.1577271823.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-25 12:07:15, Guido G=FCnther wrote:
> Overvoltage protection is currently using the default of 29V.  Make it
> configurable via DT.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

Acked-by: Pavel	 Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4EhmkACgkQMOfwapXb+vKxCwCfREcCeqcV+RqRwFKAO+semCJd
W2wAnjr1jJ8mQp1VCHVTW9/6hty3OwDx
=Wol4
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
