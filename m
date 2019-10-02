Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80364C90F1
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 20:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbfJBSgG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 14:36:06 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46218 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBSgG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 14:36:06 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 065DE802F8; Wed,  2 Oct 2019 20:35:49 +0200 (CEST)
Date:   Wed, 2 Oct 2019 20:36:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: core: Fix LED_COLOR_MAX_ID
Message-ID: <20191002183603.GC13492@amd>
References: <20191002163400.25317-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <20191002163400.25317-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-02 11:34:00, Dan Murphy wrote:
> The LED_COLOR_MAX_ID is incorrect.  THe MAX_ID should
> be the last COLOR_ID in the list.  If an array was allocate
> with MAX_ID the allocation would be correct but the meaning
> is wrong.
>=20
> So for array allocation the code should use LED_NUM_COLOR_IDS
> which will allocate MAX_ID + 1.  Whent the code needs to validate
> that the color ID is not out of bounds then the code should use
> LED_COLOR_MAX_ID.

Renaming original define might have been okay. Having two defines is
not. I'd say we can keep it as is...

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2U7hMACgkQMOfwapXb+vLg9gCfSYkHQ75mBGPT+tXueTHGSIe2
AcAAni03FrjTD/pKFhHrZ2jDj3EjGfW7
=fV0A
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
