Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B2833AEA
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2019 00:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbfFCWN7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Jun 2019 18:13:59 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47385 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfFCWN7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Jun 2019 18:13:59 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id BF51A802AA; Tue,  4 Jun 2019 00:13:46 +0200 (CEST)
Date:   Tue, 4 Jun 2019 00:13:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Nick Crews <ncrews@chromium.org>, bleung@chromium.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com,
        groeck@google.com, dtor@google.com
Subject: Re: [PATCH v6] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Message-ID: <20190603221356.GA20392@amd>
References: <20190409001642.249197-1-ncrews@chromium.org>
 <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
 <66bafd50-1599-db70-99da-e7f5877281c2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <66bafd50-1599-db70-99da-e7f5877281c2@collabora.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On 9/4/19 11:55, Pavel Machek wrote:
> >> The EC is in charge of controlling the keyboard backlight on
> >> the Wilco platform. We expose a standard LED class device at
> >> /sys/class/leds/chromeos::kbd_backlight. This driver is modeled
> >=20
> > As discussed, please use platform::.
> >=20
>=20
> Last time I looked at this patch there were some work and discussion ongo=
ing
> about led naming in led ML, did the discussion end? I'm not able to find =
if
> there is a final agreement.

Jacek is working on series to clean up naming, yes.

Under new naming system, it should be
"/sys/class/leds/color:kbd_backlight", AFAICT. That is acceptable to
me.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz1m6QACgkQMOfwapXb+vJ5LwCgpek5SXHzggCsQQ2ueC/e0eSG
2R0An3py0o6dk8ItqDWaq+E99cUrXv68
=AtT6
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
