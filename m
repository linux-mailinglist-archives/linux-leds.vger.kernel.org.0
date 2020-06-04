Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7391EE55D
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgFDNbt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:31:49 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53182 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728450AbgFDNbt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:31:49 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 23FDF1C0BD2; Thu,  4 Jun 2020 15:31:47 +0200 (CEST)
Date:   Thu, 4 Jun 2020 15:31:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] leds: fix broken devres usage
Message-ID: <20200604133146.GF7222@duo.ucw.cz>
References: <20200601133950.12420-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline
In-Reply-To: <20200601133950.12420-1-johan@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Several MFD child drivers register their class devices directly under
> the parent device (about half of the MFD LED drivers do so).
>=20
> This means you cannot blindly do devres conversions so that
> deregistration ends up being tied to the parent device, something which
> leads to use-after-free on driver unbind when the class device is
> released while still being registered (and, for example, oopses on later
> parent MFD driver unbind or LED class callbacks, or resource leaks and
> name clashes on child driver reload).
>=20
> Included is also a clean up removing some pointless casts when
> registering class devices.
>=20
> All but the lm3533 one have only been compile tested.

It would be nicer to have devres framework work with these... but I
guess this should go in...

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj3wgAKCRAw5/Bqldv6
8rQ+AJ9W0ifmWPd2rC8Kvd4qcrSBc98RtgCgq7EaCZrJo89IWCdQJfr9GFN4oa4=
=sIV7
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
