Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA75ED5618
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbfJMMJo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 08:09:44 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41899 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbfJMMJn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 08:09:43 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 8D87D8023D; Sun, 13 Oct 2019 14:09:26 +0200 (CEST)
Date:   Sun, 13 Oct 2019 14:09:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, daniel.thompson@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmurphy@ti.com, tomi.valkeinen@ti.com
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current
 regulator to the LED core
Message-ID: <20191013120937.GK5653@amd>
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GmiNL4+5WUWrod5m"
Content-Disposition: inline
In-Reply-To: <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GmiNL4+5WUWrod5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I must say I'm not a big fan of this change.
> It adds a bunch of code to the LED core and gives small
> functionality in a reward. It may also influence maximum
> software blinking rate, so I'd rather avoid calling
> regulator_enable/disable when timer trigger is set.
>=20
> It will of course require more code.
>=20
> Since AFAIR Pavel was original proponent of this change then
> I'd like to see his opinion before we move on to discussing
> possible improvements to this patch.

Was I?

Okay, this series looks quite confusing to me. First, 1/3 looks
"interesting" (would have to analyze it way more).

Second, 3/3... So we have a LED driver _and_ a regulator? So yes, the
chip driving a LED is usually ... voltage/current regulator. What is
second regulator doing there? Is that a common setup?

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GmiNL4+5WUWrod5m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFAEACgkQMOfwapXb+vKu9wCeJksxytOCCw3k5NtpexzOa2m5
ZuEAoIjNO4i229fKh/gNR+ud8Lqcsdpx
=QhL3
-----END PGP SIGNATURE-----

--GmiNL4+5WUWrod5m--
