Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A7031FE8D
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 19:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhBSSI3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 13:08:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:32828 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhBSSI1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 13:08:27 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB3E41C0B96; Fri, 19 Feb 2021 19:07:21 +0100 (CET)
Date:   Fri, 19 Feb 2021 19:07:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210219180721.GA8596@duo.ucw.cz>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
 <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210219111659.GI19207@duo.ucw.cz>
 <CAHp75VeE5vpfAXeppOkfAmQS=dwexW8SuWj3ovFmeCQ9kuQ5sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <CAHp75VeE5vpfAXeppOkfAmQS=dwexW8SuWj3ovFmeCQ9kuQ5sg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-02-19 16:18:38, Andy Shevchenko wrote:
> On Fri, Feb 19, 2021 at 1:19 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > > > > ? Does not make sense and changelog does not help.
> > > > >
> > > > > This is an unused variable which is in the driver
> > > > > (same as the regulator). Should I provide a patch on its own for =
that
> > > > > or just describe in the changelog?
> > > >
> > > > Lets do separate patch here. DT changes will need Ack from Rob, this
> > > > can go in directly.
> > >
> > > Okay, I will submit a separate patch
> > >
> > > > Can you or Dan submit patch getting the regulator support to work? =
If
> > > > not, I guess we should remove the regulator support after all.
> > >
> > > To be true I am fairly new to the kernel and have no idea
> > > how to test this. So no, I don't want provide a patch (except
> > > for removing), sorry.
> >
> > No problem. It seems Andy submitted series for this.
>=20
> Ah, now I understand what you, Sven, meant.
> I didn't touch regulator code, so it left the same, but making it work
> probably needs just enabling during ->probe().

Yep, sorry, I was confused.

Anyway, I'd rather seen patch fixing the regulator code than removing
it completely.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC/+WQAKCRAw5/Bqldv6
8s47AJ9B29ODs8eeOD4ETDuATohadploFwCeOw0I8KvtEGmmfh18eOvP0/6KqZQ=
=GaJg
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
