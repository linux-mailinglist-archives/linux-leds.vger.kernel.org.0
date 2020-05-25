Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4321E177F
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2020 23:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgEYV6r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 May 2020 17:58:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60742 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgEYV6r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 25 May 2020 17:58:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2E79C1C02CC; Mon, 25 May 2020 23:58:46 +0200 (CEST)
Date:   Mon, 25 May 2020 23:58:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v25 00/16] Multicolor Framework v25
Message-ID: <20200525215845.GC1245@amd>
References: <20200504211344.13221-1-dmurphy@ti.com>
 <eccbd882-b4f2-abc8-dddb-6c242d8ef0c0@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <eccbd882-b4f2-abc8-dddb-6c242d8ef0c0@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >This is the multi color LED framework.   This framework presents cluster=
ed
> >colored LEDs into an array and allows the user space to adjust the brigh=
tness
> >of the cluster using a single file write.  The individual colored LEDs
> >intensities are controlled via a single file that is an array of LEDs
>=20
> Please let me know if there are any issues with pulling this series in now

I believe we still need ACKs from Rob at the very least...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7MP5UACgkQMOfwapXb+vJ38ACgqlqumdRFKPszArgF8AudNUUs
TIIAoLtoUAlQoy4LTdmoBv6darnInI0E
=XEtp
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
