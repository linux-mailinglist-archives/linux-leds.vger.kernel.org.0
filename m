Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039483D8BEB
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jul 2021 12:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhG1Kfz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 06:35:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57190 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbhG1Kfy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 06:35:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A50941C0B7C; Wed, 28 Jul 2021 12:35:52 +0200 (CEST)
Date:   Wed, 28 Jul 2021 12:35:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: LED subsystem lagging maintenance
Message-ID: <20210728103551.GA31304@amd>
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I have noticed that in the last couple of cycles the LED subsystem is
> a bit laggish in terms of maintenance (*). I think it's time that
> someone can help Pavel to sort things out.
>=20
> In any case, I wonder if we have any kind of procedure for what to do
> in such cases. Do we need to assume that the subsystem is in a
> (pre-)orphaned state? If so, who is the best to take care of patch
> flow?

To be honest, patches were not applied because they were not that
important to begin with, because of lacking explanation, and because
you pushed a bit too hard.

Yes, I'm quite busy in -rc1 to -rc3 timeframe with stable reviews. No,
LED subsystem is not orphaned.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEBMwcACgkQMOfwapXb+vKyBACdHHzrt4xTc8c09wb+t5kxdxzp
0hMAnjkyngryJ3F3XiI94JVCmstwlrho
=u0Dy
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
