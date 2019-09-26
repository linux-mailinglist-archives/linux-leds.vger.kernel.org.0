Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A34CCBF2A0
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 14:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfIZMNW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 08:13:22 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51539 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZMNW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 08:13:22 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D0AAD8069F; Thu, 26 Sep 2019 14:13:05 +0200 (CEST)
Date:   Thu, 26 Sep 2019 14:13:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, tomi.valkeinen@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] leds: tlc591xx: simplify driver by using the
 managed led API
Message-ID: <20190926121319.GE9310@amd>
References: <20190918152556.9925-1-jjhiblot@ti.com>
 <20190918152556.9925-2-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline
In-Reply-To: <20190918152556.9925-2-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-09-18 17:25:55, Jean-Jacques Hiblot wrote:
> Use the managed API of the LED class (devm_led_classdev_register()
> instead of led_classdev_register()).
> This allows us to remove the code used to track-and-destroy the LED devic=
es
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2Mq18ACgkQMOfwapXb+vKS9wCdG/pKEh6CoAubneruryXUJoXM
LVMAn0SR+EjGGfj+wTZcrQ8cjmk2WInM
=X1M3
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
