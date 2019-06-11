Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B853C84D
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 12:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405104AbfFKKNL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 06:13:11 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:32859 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727641AbfFKKNK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 06:13:10 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id DE82A80239; Tue, 11 Jun 2019 12:12:58 +0200 (CEST)
Date:   Tue, 11 Jun 2019 12:13:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Use usleep_range() for better precision timings
Message-ID: <20190611101308.GA7526@amd>
References: <20190610173206.8060-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20190610173206.8060-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-06-10 20:32:05, Oleh Kravchenko wrote:
> Documentation/timers/timers-howto.txt recommends to use msleep_range()
> for delays less or equal 20ms. This driver use 10ms delays to talk with
> hardware, so let's follow the rules.
> Also because of buggy firmware better to keep timings much as possible.
>=20
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz/frQACgkQMOfwapXb+vIiuQCgrypYKnEeo74j6uCX4vwtIIGT
zaEAnA3sa2LTM+nAvuSY7t56v0VBfTN4
=E7EV
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
