Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE092941E5
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 20:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387948AbgJTSIP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 14:08:15 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38148 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387945AbgJTSIP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 14:08:15 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 77C111C0B7F; Tue, 20 Oct 2020 20:08:13 +0200 (CEST)
Date:   Tue, 20 Oct 2020 20:08:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Message-ID: <20201020180813.GA25906@duo.ucw.cz>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>> Yep. It allows hardware to provide different values if it can only
> >>>> blink at fixed rate.
> >>>=20
> >>> Ok, I understand how hardware might make a different choice, but in t=
his scenario we=E2=80=99re using software to blink, so everything is handle=
d by the kernel.  Also, if the interface is hardware enabled, isn=E2=80=99t=
 the path at line 177 used (which returns before the default is set)?
> >>=20
> >> Why should software blink need to select a default rate since it shoul=
d be able to handle all requests (even 0, 0)?
> >>=20
> >=20
> > How can software blink at "0, 0"?
>=20
> This would mean, don=E2=80=99t blink.  :).

Can't change that now.

> Since we=E2=80=99re using sysfs, we need to update those values in 2 FS w=
rites.  It appears that the sysfs is reordering the writes, so we can=E2=80=
=99t control what value is written when, so it glitches for us.  We change =
off first, then on, but the order of the calls in the kernel is on first (w=
ith off already 0), the kernel changes values to default, then the off is w=
ritten, leaving on with a value of 500 (we set it to 0) and off with the va=
lue we wanted.
>

Aha, okay, so races are bad and patch to fix them would be probably accepte=
d.

> Is there a way to avoid this?  Even if we write the on value twice,
>  it will flash for 500ms at least once=E2=80=A6

There should be. Can you simply write new values to on and off,
without writing zeros there?

If not, can you use 1 instead of zero?

>=20
> I tried setting the trigger to none, but of course this disabled the disp=
lay settings and setting the trigger to timer ends up flashing at the defau=
lt rate, which is also what we don=E2=80=99t want.
>

If there's no reasonable value to change the frequency, we'll need to
fix that.

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX48njQAKCRAw5/Bqldv6
8i94AJ9JbnPKCnYdItnBtsw2cZugca0UPgCfa5s8crsE27GBABzCNmavCDrjQ8g=
=u/u4
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
