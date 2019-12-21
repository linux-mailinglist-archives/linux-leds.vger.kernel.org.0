Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 315F8128AD2
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 19:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfLUSgO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 13:36:14 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39482 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUSgO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 13:36:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3B8E01C24DF; Sat, 21 Dec 2019 19:36:12 +0100 (CET)
Date:   Sat, 21 Dec 2019 19:36:11 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 0/3] tty/leds: implement a trigger for ttys
Message-ID: <20191221183611.GB32732@amd>
References: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
 <20191217172232.GC3829986@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <20191217172232.GC3829986@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-12-17 18:22:32, Greg Kroah-Hartman wrote:
> On Tue, Dec 17, 2019 at 05:58:13PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > v3 of this series was sent earlier today starting with Message-Id:
> > 20191217150736.1479-1-u.kleine-koenig@pengutronix.de.
> >=20
> > v4 only changes patch 3 dropping a few printks, fixing the show callback
> > for the dev attribute to match its store function. And I moved
> > ledtrig_tty_restart() into the already existing if (tty) {...} block in
> > dev_store and dropped the same check from the former function.
> >=20
>=20
> All looks good to me, so if the LED developers give their ack, I can
> take it in my tty tree.

Nothing obviously wrong in 1 and 2 of the series. Feel free to take
them.

I fear conflicts if you take 3/ through your tree, so perhaps I can
take it through the LEDs?

But I'll have some comments there.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+ZhsACgkQMOfwapXb+vLQmgCeN4Dl711bxMSjllrFTouPrdDS
JLQAn19dkCkBWTbK/6Zlh26xzy2x8fng
=KokU
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
