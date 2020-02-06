Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFC1154F0C
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2020 23:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgBFWpM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Feb 2020 17:45:12 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:59124 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgBFWpM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Feb 2020 17:45:12 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 29FAC1C208D; Thu,  6 Feb 2020 23:45:10 +0100 (CET)
Date:   Thu, 6 Feb 2020 23:45:09 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [GIT PULL] LEDs changes for v5.6-rc1
Message-ID: <20200206224509.GA23636@duo.ucw.cz>
References: <20200202190943.GA4506@duo.ucw.cz>
 <CAHk-=wgsTkPZBCkmtx5o+X3penAzz_DeynChQO906NmqXd9r3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgsTkPZBCkmtx5o+X3penAzz_DeynChQO906NmqXd9r3Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-02-02 11:43:14, Linus Torvalds wrote:
> On Sun, Feb 2, 2020 at 11:09 AM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > LED updates for 5.6-rc1.
> >
> > Some of these changes are bugfixes already merged in v5.5, but I'd
> > have to rebase the for-next branch, and git merge handles that ok, so
> > I did not do that.
>=20
> That's fine.
>=20
> But I'd still have really wanted a short description of what the changes =
are..

Ah, sorry about that.

Besides random driver updates, we now allow referencing LED from the
device tree, which is important for (future) backlight<->LED
interoperation. (Which is in turn important for Librem 5 and Droid 4
phones).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXjyW9QAKCRAw5/Bqldv6
8qBKAJ9Wa+58BMC6kYl+B4I19/7+XcefxwCfRQSz+sZ2/J8vVzyCauh8Pj8dTzQ=
=bm2K
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
