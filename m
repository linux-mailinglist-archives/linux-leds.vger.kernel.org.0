Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C69131F6F5
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 11:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBSKB2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 05:01:28 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43204 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhBSKB1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 05:01:27 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B06451C0B80; Fri, 19 Feb 2021 11:00:29 +0100 (CET)
Date:   Fri, 19 Feb 2021 11:00:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger/tty: Use led_set_brightness_sync()
 from workqueue
Message-ID: <20210219100029.GC5641@duo.ucw.cz>
References: <20210219082955.5007-1-u.kleine-koenig@pengutronix.de>
 <20210219082955.5007-2-u.kleine-koenig@pengutronix.de>
 <20210219094632.GB5641@duo.ucw.cz>
 <20210219095254.ky33qlb3cvy5btpe@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
In-Reply-To: <20210219095254.ky33qlb3cvy5btpe@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-02-19 10:52:54, Uwe Kleine-K=F6nig wrote:
> On Fri, Feb 19, 2021 at 10:46:32AM +0100, Pavel Machek wrote:
> > On Fri 2021-02-19 09:29:55, Uwe Kleine-K=F6nig wrote:
> > > led_set_brightness() involves scheduling a workqueue. As here the led=
's
> > > brightness setting is done in context of the trigger's workqueue this=
 is
> > > unjustified overhead and it's more sensible to use
> > > led_set_brightness_sync().
> >=20
> > Acked-by: Pavel Machek <pavel@ucw.cz>
>=20
> Who is expected to pick these two up? I assume Greg as the commit that
> is fixed here is only in his try for now?

I can't reasonably pick them up.

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+MPQAKCRAw5/Bqldv6
8gRLAKCa8DMLaKGp2yjonNem7kMjaMlAKQCeMLfl8G5ys4LZjukwpNNNcGoxk5I=
=A+E4
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
