Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E59E3DFC25
	for <lists+linux-leds@lfdr.de>; Wed,  4 Aug 2021 09:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbhHDHgV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Aug 2021 03:36:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60572 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235809AbhHDHgV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Aug 2021 03:36:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E67FB1C0B76; Wed,  4 Aug 2021 09:36:07 +0200 (CEST)
Date:   Wed, 4 Aug 2021 09:36:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: LED subsystem lagging maintenance
Message-ID: <20210804073607.GA8389@amd>
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <20210728103551.GA31304@amd>
 <179c4bce-ce9b-c9a8-4f24-cb4b3397e0f0@redhat.com>
 <20210803215821.GE30387@amd>
 <CAHp75VczUTTN3f=fv5d_kRa+OP=MMhJTSVfSu-t2PURTGkycfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <CAHp75VczUTTN3f=fv5d_kRa+OP=MMhJTSVfSu-t2PURTGkycfw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > This thread does remind me that I was planning on re-sending this
> > > LED patch which seems to have fallen through the cracks:
> > >
> > > https://lore.kernel.org/alsa-devel/20210221115208.105203-1-hdegoede@r=
edhat.com/
> > >
> > > Can you pick this one up please? Or shall I resend it?
> >
> > Thanks, applied.
>=20
> Thank you, Pavel! Sorry for being a bit pushy.

That was reply to Hans' patch. I applied most of yours, too (see the
thread), but some work remains there.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEKQ2cACgkQMOfwapXb+vKgNwCfcCgj79KB/toeRMTgQyDOTQh8
5U0AoK+gs5VbMjjt5P7jF7FiojQy/jNU
=1QLX
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
