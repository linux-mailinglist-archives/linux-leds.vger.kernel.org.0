Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E933F29422A
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 20:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390650AbgJTSdD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 14:33:03 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41176 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390647AbgJTSdD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 14:33:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A369D1C0B7F; Tue, 20 Oct 2020 20:33:00 +0200 (CEST)
Date:   Tue, 20 Oct 2020 20:33:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Message-ID: <20201020183300.GB25906@duo.ucw.cz>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-10-20 18:28:33, Bollinger, Seth wrote:
>=20
> >=20
> >> Is there a way to avoid this?  Even if we write the on value twice,
> >> it will flash for 500ms at least once=E2=80=A6
> >=20
> > There should be. Can you simply write new values to on and off,
> > without writing zeros there?
>=20
> In this case we=E2=80=99re switching from on:86400, off:0 -> on:0, off:86=
400.  We write off first, then on using fwrite() to a file.  From the trace=
, it looks like on is always stored first.  So, the first store is on:0, of=
f:0 for a brief period (enough to trigger the default), and then off is sto=
red.  We=E2=80=99re already trying to not have them not both be zero at the=
 same time.  I tried putting fflush() between them, but that didn=E2=80=99t=
 help.  I suppose we could try to sleep some period of time, but this seems=
 bad as well.  Maybe write and read to verify the value is correctly stored?
>

I don't understand. Why would you use blink with on:86400, off:0?

> > If there's no reasonable value to change the frequency, we'll need to
> > fix that.
>=20
> I think if we could control the delays with trigger set to none, then we =
could set the delays and enable the timer trigger for a no glitch operation=
=2E  I suppose if there was a timer-off trigger, that would work as well, b=
ut seems kind of silly.
>

You may want to look at ledtrig-transient and ledtrig-oneshot...?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX48tXAAKCRAw5/Bqldv6
8sWfAKC4cVb//ahKl6pRGR8YEcQVqaWOrgCgjUQOqH5ydhO3/7puyB7hCX949Rk=
=+2ZR
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
