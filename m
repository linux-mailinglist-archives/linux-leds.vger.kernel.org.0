Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07E6888FE
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 09:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfHJHNY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 03:13:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55552 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfHJHNY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 03:13:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6B60C80309; Sat, 10 Aug 2019 09:13:09 +0200 (CEST)
Date:   Sat, 10 Aug 2019 09:13:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH 1/2] leds: Add flag to keep trigger always
Message-ID: <20190810071322.GA13760@amd>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-08-09 17:52:46, Guru Das Srinagesh wrote:
> From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
>=20
> Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 ("leds: disable triggers
> on brightness set") removes the trigger on an LED class device when
> brightness is set to 0. However, there are some LED class devices which
> need the trigger not to be removed. In a use case like camera flash,
> camera flash driver passes in a trigger device to LED class driver. If
> the trigger is removed when the brightness is set to 0, this will affect
> the clients using those triggers. Hence add a flag to always keep the
> trigger even when brightness is set to 0.

No.

Yes, it would affect those clients. Don't do it, then. It is
root-only operation.

								Pavel


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1ObpIACgkQMOfwapXb+vIyZACeNsncZlIDhabxznoann5+bOiF
GKkAmwapQY3q+Lq4t5fDxUCHnJWgB8T0
=LSOI
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
