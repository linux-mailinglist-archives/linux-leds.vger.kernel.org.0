Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A9C320B0
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2019 22:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfFAUhv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 1 Jun 2019 16:37:51 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40790 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAUhv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 1 Jun 2019 16:37:51 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0CF40803AC; Sat,  1 Jun 2019 22:37:37 +0200 (CEST)
Date:   Sat, 1 Jun 2019 22:37:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: core: Support blocking HW blink operations
Message-ID: <20190601203747.GA13060@amd>
References: <20181127150106.20213-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20181127150106.20213-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-11-27 16:01:06, Linus Walleij wrote:
> I ran into this when working on a keyboard driver for
> the Razer family: the .blink_set() callback for setting
> hardware blinking on a LED only exist in a non-blocking
> (fastpath) variant, such as when blinking can be enabled
> by simply writing a memory-mapped register and protected
> by spinlocks.
>=20
> On USB keyboards with blinkable LEDs controlled with USB
> out-of-band commands this will of course not work: these
> calls need to come from process context.
>=20
> To support this: add a new .blink_set_blocking() callback
> in the same vein as .brightness_set_blocking() and add
> a flag and some code to the delayed work so that this
> will be able to fire the .blink_set_blocking() call.
>=20
> ALl of this will be handled transparently from the
> led_blink_set() call so all current users can keep
> using that.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Fun. I just realized thinkpad x60 needs something similar...

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzy4hsACgkQMOfwapXb+vLhzACfRM3YCI8kU2pXr6MTPfsbs1Bw
H/UAniOC+mYx9L31wIALtRAMQXorZFoV
=+V3U
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
