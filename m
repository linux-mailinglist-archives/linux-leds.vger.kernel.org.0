Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7308421C61F
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2020 22:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgGKU3s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 11 Jul 2020 16:29:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36364 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgGKU3s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 11 Jul 2020 16:29:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6AA9B1C0BD2; Sat, 11 Jul 2020 22:29:45 +0200 (CEST)
Date:   Sat, 11 Jul 2020 22:29:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>, marek.behun@nic.cz
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v29 00/16] Multicolor Framework v29
Message-ID: <20200711202944.GA19108@duo.ucw.cz>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200704124729.GA20088@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <20200704124729.GA20088@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-07-04 14:47:29, Pavel Machek wrote:
> Hi!
>=20
> > This is the multi color LED framework.   This framework presents cluste=
red
> > colored LEDs into an array and allows the user space to adjust the brig=
htness
> > of the cluster using a single file write.  The individual colored LEDs
> > intensities are controlled via a single file that is an array of LEDs
> >=20
> > Change to the LEDs Kconfig to fix dependencies on the LP55XX_COMMON.
> > Added update to the u8500_defconfig
>=20
> Marek, would you be willing to look over this series?
>=20
> Dan, can we please get it in the order
>=20
> 1) fixes first
>=20
> 2) changes needed for multicolor but not depending on dt acks
>=20
> 3) dt changes
>=20
> 4) rest?

Actually, one more request. I believe I won't be able to take at least
some of the ARM: dts stuff... not everything is acked. Please put that
last.

Thank you,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXwohOAAKCRAw5/Bqldv6
8sPyAJ97i6Ntm4lIfSIJO0apJgNpU2HrZwCghh4yCOPhIh9uclm0dxx8ShyVEss=
=GqAJ
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
