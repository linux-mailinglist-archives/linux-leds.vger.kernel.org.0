Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0375A21CB35
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 21:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbgGLTzr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 15:55:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51058 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgGLTzq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 15:55:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8E9471C0BDD; Sun, 12 Jul 2020 21:55:44 +0200 (CEST)
Date:   Sun, 12 Jul 2020 21:55:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        robh@kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v29 00/16] Multicolor Framework v29
Message-ID: <20200712195544.GC20592@amd>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200704124729.GA20088@amd>
 <20200712191315.5dab10a6@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <20200712191315.5dab10a6@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > This is the multi color LED framework.   This framework presents clus=
tered
> > > colored LEDs into an array and allows the user space to adjust the br=
ightness
> > > of the cluster using a single file write.  The individual colored LEDs
> > > intensities are controlled via a single file that is an array of LEDs
> > >=20
> > > Change to the LEDs Kconfig to fix dependencies on the LP55XX_COMMON.
> > > Added update to the u8500_defconfig =20
> >=20
> > Marek, would you be willing to look over this series?
>=20
> Overall this series looks good to me. I wanted to apply version 29 of
> the patches, but I didn't receive all patches in v29 (some are
> missing), so I had to search for previous versions of selected patches.
>=20
> I have seen some typos in documentation, but that can be solved
> afterwards.
>=20
> One thing I don't like much is that in the sysfs multi_index and
> multi_intensity files there is a trailing space after the last color.
> This is not true for example for the trigger file. It is trivial to fix
> this, so again maybe a will send a follow-up patch after this series is
> accepted.

Yes, I noticed that one, too, and expect it to be fixed before the
merge.

I believe you'll get next version of the patches... If not that one
will likely appear in -next, so will be available using git.

Thank you for the review,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8LasAACgkQMOfwapXb+vIB3wCgunzoVWqliii9lNc24fOaIt3+
2PkAn10TYib5AulKavO98SWIeoUXvOtM
=LdeN
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
