Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E221B8965
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDYUiw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:38:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57536 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUiv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:38:51 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 444FE1C0239; Sat, 25 Apr 2020 22:38:50 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:38:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 13/17] leds: lp5523: Update the lp5523 code to add
 multicolor brightness function
Message-ID: <20200425203849.GE23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-14-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-14-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-23 10:55:20, Dan Murphy wrote:
> Add the multicolor brightness call back to support the multicolor
> framework.  This call back allows setting  brightness on grouped channels

Double space after "setting".

> in a single function.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6kn9kACgkQMOfwapXb+vIFFgCfbX6fdOrcn43NeKeje05IrEEQ
MnwAnAurN5dPapX4LFHukoWfG6rcgj9l
=PUO9
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
