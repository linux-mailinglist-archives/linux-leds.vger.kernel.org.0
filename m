Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF657A662
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2019 13:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbfG3LCQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Jul 2019 07:02:16 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59552 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfG3LCP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jul 2019 07:02:15 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2F7D1802B5; Tue, 30 Jul 2019 13:02:01 +0200 (CEST)
Date:   Tue, 30 Jul 2019 13:02:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v4 1/4] leds: Add of_led_get() and led_put()
Message-ID: <20190730110212.GA21815@amd>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-2-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20190717141514.21171-2-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-17 16:15:11, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> This patch adds basic support for a kernel driver to get a LED device.
> This will be used by the led-backlight driver.
>=20
> Only OF version is implemented for now, and the behavior is similar to
> PWM's of_pwm_get() and pwm_put().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1AI7QACgkQMOfwapXb+vJsRwCglnluzpArltYwDkrYu3S0hfhd
JoAAnRuijBB2KPUT8ekHNFYou2NxkDOY
=GGAz
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
