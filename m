Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93C41700AE
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgBZOCo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:02:44 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41342 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBZOCo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:02:44 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CD3EA1C204C; Wed, 26 Feb 2020 15:02:41 +0100 (CET)
Date:   Wed, 26 Feb 2020 15:02:41 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 0/4] leds: trigger: implement a tty trigger
Message-ID: <20200226140241.GI4080@duo.ucw.cz>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200219104012.GA2814125@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline
In-Reply-To: <20200219104012.GA2814125@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-02-19 11:40:12, Greg Kroah-Hartman wrote:
> On Thu, Feb 13, 2020 at 10:15:56AM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Hello,
> >=20
> > This is v6 of my quest to introduce ledtriggers for UARTs. The previous
> > series is available at
> >=20
> > 	http://lore.kernel.org/r/20191219093947.15502-1-u.kleine-koenig@pengut=
ronix.de
> >=20
> > The changes compared to that are that parsing of the dev parameter is
> > more strict and that I set brightness directly from the kworker instead
> > of using led_blink_set_oneshot which makes use of another kworker. (Both
> > requested by Pavel Machek.)
> >=20
> > For the former I introduced a new helper kstrtodev_t() in the spirit of
> > kstrtoul() to implement the stricter parsing (instead of the lax one
> > using plain sscanf() in v5).
>=20
> Looks good to me, Pavel, any objection to me merging this through the
> tty tree?

I see ton of comments on this one, seems like there will be one more
version?

And I fear merge conflicts if you modify drivers/leds/Makefile...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ6gQAKCRAw5/Bqldv6
8n1kAJ0eHl7DmssrmBA95ietDxnHxPLc3gCgnoJOhR7lBDQxmSrvzu5d+xnLKVA=
=yHGr
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
