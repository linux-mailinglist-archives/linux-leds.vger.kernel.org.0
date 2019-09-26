Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB2C1BF27E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 14:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfIZMHg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 08:07:36 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50680 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfIZMHg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 08:07:36 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 4C9CA805C0; Thu, 26 Sep 2019 14:07:20 +0200 (CEST)
Date:   Thu, 26 Sep 2019 14:07:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
Subject: Re: [PATCH] leds: mlxreg: Fix possible buffer overflow
Message-ID: <20190926120734.GC9310@amd>
References: <20190921220230.6850-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline
In-Reply-To: <20190921220230.6850-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-09-22 01:02:30, Oleh Kravchenko wrote:
> Error was detected by PVS-Studio:
> V512 A call of the 'sprintf' function will lead to overflow of
> the buffer 'led_data->led_cdev_name'.
>=20
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2MqgYACgkQMOfwapXb+vLgvwCfc51Sv7LDCcGjPf1nIq6X+HEb
tCwAn0xzJNVx663ceEkezPOuUZWFGq1o
=NRzX
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
