Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AD891117
	for <lists+linux-leds@lfdr.de>; Sat, 17 Aug 2019 17:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfHQPCs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Aug 2019 11:02:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39801 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbfHQPCs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Aug 2019 11:02:48 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5F73C811A4; Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Date:   Sat, 17 Aug 2019 17:02:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
Message-ID: <20190817150246.GB18381@amd>
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>> All pattern is predefined, you can't change them at all.
> >>>> I just tried to describe real things what happened in LED board.
> >>>> It's ticks every 800 milliseconds for Pipe LEDs.
> >>>
> >>> It makes me wonder how you figured out the values? If you have
> >>> a documentation for this controller, could you share how the pattern
> >>> settings are documented?
> >>
> >> I saw the code of firmware.
> >> Not sure if I can find any documentation for it right now.
> >=20
> > Have you tried to alter the values? Or check what happens when
> > the duplication is removed?
>=20
> What do you mean alter? It doesn't make any sense.
> Board is accepts only brightness level from '0' to '5'.
> I'm really confused :-)

For the record, what you did seems ok to me.

> >> Ok, I will reduce it.
> >=20
> > Please hold on for a while. I will have some more remarks to the driver,
> > just collecting missing info for now to gain more complete view on this
> > device.
>=20
> Here is the full story:
>=20
> EL15203000 LEDs board (aka RED LEDs board, because it has only RED LEDs).
> It's provide access to 3 LEDs:
>=20
> - First LED (Screen) is a light tube around big 21" screen
>   It's have 3 brightness levels:
>   * OFF
>   * ON
>   * Breathing mode (8 seconds full cycle)
> - Second LED (Vending area) is highlight coffee cap
>   * OFF
>   * ON

Again, this is ok.

> - Third LED (Pipe) is actually virtual, because consists from 5 LEDs
>   * OFF for all 5 LEDs
>   * ON for all 5 LEDs
>   * Cascade
>   * Inverses cascade
>   * Bounce
>   * Inverses bounce

But having one virtual LED that is really five LEDs scares me a tiny
bit. But I guess its ok for your case...

Best regards,
									Pavel




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1YFxYACgkQMOfwapXb+vJojgCgjqeQrTqIQD6NzrPAmlXw91Ib
NDUAn1vnGXxmcF9AFVYZa/CEdp1JtEfg
=QGKQ
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
