Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9795D1A0849
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2020 09:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgDGH24 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Apr 2020 03:28:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35970 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgDGH24 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Apr 2020 03:28:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D92AE1C4A5A; Tue,  7 Apr 2020 09:28:54 +0200 (CEST)
Date:   Tue, 7 Apr 2020 09:28:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Cleanups in "next" tree
Message-ID: <20200407072854.GA18673@amd.ucw.cz>
References: <20200322115906.GA10623@duo.ucw.cz>
 <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com>
 <20200402225745.GA9830@amd>
 <a4802e70-106b-3476-536f-1d8798ce156f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <a4802e70-106b-3476-536f-1d8798ce156f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I'm sorry I failed to meet your high expectations... But I don't
> > believe I done anything completely outside of usual kernel procedures.
>=20
> I believe code review is quite usual kernel procedure.

I don't disagree with that.

> > Could you list the patches and objections you have?
>=20
> I already expressed my concerns regarding Turris Omnia patch.

Ok.

> My comments regarding remaining patches:
>=20
> - "Make label "white:power" to be consistent with"
>=20
> I disagree here. "system" was OK.

It was too vague... I know the hardware and it is a LED above power
button used as a power indicator.

> - "Warn about old defines that probably should not be used."
>=20
> Obsolete is only LED_FULL, so the comment is in wrong line

No, all of them are bad. Maybe LED_OFF could be used going forward,
but... it is simply easier to write 0. The type is not really an en
enumeration, it is brightness, with variable maximum value.

> - "Group LED functions according to functionality, and add some"
>=20
> You're adding here some random comments referencing obsolete
> naming. I think that it is enough to say what is current standard.

Ok, I'll drop that part. But I really want to get that documented
_somewhere_, because obsolete naming is currently in use, and we won't
be able to change it :-(.

> Also, I had a patch [0] describing standard LED functions in my LED
> naming patch set, but it was not merged. It could be worth getting
> back to it at this occasion.

I'll take a look.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXowrtgAKCRAw5/Bqldv6
8md3AKCKwybQr0rzOq4IrTL2O9mJJg5z5wCfXHzpvm3WD1l2mHn7cCGwPXmJ4wM=
=2BEK
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
