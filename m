Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A889293B7E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 14:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405914AbgJTMZ5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 08:25:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46730 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405851AbgJTMZ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 08:25:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B8D341C0B87; Tue, 20 Oct 2020 14:25:54 +0200 (CEST)
Date:   Tue, 20 Oct 2020 14:25:54 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 2/3] tty: new helper function tty_get_icount()
Message-ID: <20201020122554.GC19856@duo.ucw.cz>
References: <20201018204022.910815-1-u.kleine-koenig@pengutronix.de>
 <20201018204022.910815-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <20201018204022.910815-3-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-10-18 22:40:21, Uwe Kleine-K=F6nig wrote:
> For a given struct tty_struct this yields the corresponding statistics
> about sent and received characters (and some more) which is needed to
> implement an LED trigger for tty devices.
>=20
> The new function is then used to simplify tty_tiocgicount().
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX47XUgAKCRAw5/Bqldv6
8gBuAJ9dfrB+0yfyOPGsKHOGTEP7FPWQ1QCdHwOmZorGnrKXY05K5xmHFtmO/s8=
=Wr3P
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
