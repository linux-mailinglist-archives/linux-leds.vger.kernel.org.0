Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D843DF727
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 23:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhHCV6m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 17:58:42 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40764 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhHCV6l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 17:58:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 131681C0B76; Tue,  3 Aug 2021 23:58:22 +0200 (CEST)
Date:   Tue, 3 Aug 2021 23:58:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: LED subsystem lagging maintenance
Message-ID: <20210803215821.GE30387@amd>
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <20210728103551.GA31304@amd>
 <179c4bce-ce9b-c9a8-4f24-cb4b3397e0f0@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline
In-Reply-To: <179c4bce-ce9b-c9a8-4f24-cb4b3397e0f0@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> I have noticed that in the last couple of cycles the LED subsystem is
> >> a bit laggish in terms of maintenance (*). I think it's time that
> >> someone can help Pavel to sort things out.
> >>
> >> In any case, I wonder if we have any kind of procedure for what to do
> >> in such cases. Do we need to assume that the subsystem is in a
> >> (pre-)orphaned state? If so, who is the best to take care of patch
> >> flow?
> >=20
> > To be honest, patches were not applied because they were not that
> > important to begin with, because of lacking explanation, and because
> > you pushed a bit too hard.
> >=20
> > Yes, I'm quite busy in -rc1 to -rc3 timeframe with stable reviews. No,
> > LED subsystem is not orphaned.
>=20
> It is good to hear that you are still actively maintaining the LED
> subsystem, thank you.
>=20
> This thread does remind me that I was planning on re-sending this
> LED patch which seems to have fallen through the cracks:
>=20
> https://lore.kernel.org/alsa-devel/20210221115208.105203-1-hdegoede@redha=
t.com/
>=20
> Can you pick this one up please? Or shall I resend it?

Thanks, applied.

							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEJu/0ACgkQMOfwapXb+vIm3gCdE4erM298XQat7Iyn4cBC+UZf
h7EAnijY1Moszd5SPtdsjgfFXsfcD5TQ
=0Lbc
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
