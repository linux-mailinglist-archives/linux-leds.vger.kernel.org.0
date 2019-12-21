Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C819128B04
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 20:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfLUTR0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 14:17:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42254 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfLUTR0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:17:26 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5A8781C24DF; Sat, 21 Dec 2019 20:17:24 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:17:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lm3692x: Allow to set ovp and brigthness mode
Message-ID: <20191221191723.GG32732@amd>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
 <3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline
In-Reply-To: <3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-12-17 06:53:45, Dan Murphy wrote:
> Guido
>=20
> On 12/16/19 6:28 AM, Guido G=FCnther wrote:
> >Overvoltage protection and brightness mode are currently hardcoded
> >as disabled in the driver. Make these configurable via DT.
>=20
> Can we split these up to two separate patch series?

No need to split it up to separate _patch series_. I actually believe
single patch is okay here.

Thanks,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+b8MACgkQMOfwapXb+vL2KQCgkALrx8ukx7p6Kr1xtTJQoi/O
0UYAn05M+vPJel1Zt76WsWIb6IX4Ty7p
=mxls
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
