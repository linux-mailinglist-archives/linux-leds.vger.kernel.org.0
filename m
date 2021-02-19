Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5106531F6B5
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 10:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBSJrL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 04:47:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42006 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBSJrE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 04:47:04 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8F9D81C0B80; Fri, 19 Feb 2021 10:46:21 +0100 (CET)
Date:   Fri, 19 Feb 2021 10:46:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] leds: trigger: Fix error path to not unlock the
 unlocked mutex
Message-ID: <20210219094621.GA5641@duo.ucw.cz>
References: <20210219082955.5007-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20210219082955.5007-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-02-19 09:29:54, Uwe Kleine-K=F6nig wrote:
> ttyname is allocated before the mutex is taken, so it must not be
> unlocked in the error path.
>=20

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+I7QAKCRAw5/Bqldv6
8lDQAKC6RnFOnSLK4XZFGvrX+5EyTcu6fgCgnQ2bPOWU4CI+59NCUW4TYIdtKpU=
=TZpc
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
