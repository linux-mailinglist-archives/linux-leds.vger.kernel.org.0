Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6221F07C6
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2020 17:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgFFP5u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jun 2020 11:57:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59946 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgFFP5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jun 2020 11:57:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CEC8E1C0BD2; Sat,  6 Jun 2020 17:57:48 +0200 (CEST)
Date:   Sat, 6 Jun 2020 17:57:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v26 00/15] Multicolor Framework v26
Message-ID: <20200606155747.GB21130@amd>
References: <20200604120504.32425-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20200604120504.32425-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This is the multi color LED framework.   This framework presents clustered
> colored LEDs into an array and allows the user space to adjust the bright=
ness
> of the cluster using a single file write.  The individual colored LEDs
> intensities are controlled via a single file that is an array of LEDs

Can you re-order the patches so that stuff that can be applied now
goes first? Bugfixes, cleanups, devm conversion, yaml conversions that
are already acked...

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7bvPsACgkQMOfwapXb+vLOrACcCSUe6LZcOIRRpomkz3j6dg2q
GQoAoK7Rzu3sqXciSFGerVImGcQa6BAE
=hJHD
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
