Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432141327A1
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2020 14:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgAGNbW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 08:31:22 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42560 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgAGNbW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 08:31:22 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6BF541C2453; Tue,  7 Jan 2020 14:31:20 +0100 (CET)
Date:   Tue, 7 Jan 2020 14:31:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Exponential LED brightness Re: [PATCH v4 0/6] leds: lm3692x: Allow
 to set ovp and brigthness mode
Message-ID: <20200107133119.GA3825@duo.ucw.cz>
References: <cover.1578324703.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <cover.1578324703.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Overvoltage protection and brightness mode are currently hardcoded
> as 29V and disabled in the driver. Make these configurable via DT.
>=20
> This v4 moves the exponential brightness mode to the back of the series
> as per Pavel's request:
>=20
>   https://lore.kernel.org/linux-next/20200106103233.GA32426@amd/T/#m93270=
a9bf10b88e060f4e4cf5701c527476de985
>=20
> The end result is identical and i've tested everything still works when
> dropping the last to patches and checked compiltion via

Thank you. Applied 1-4 (with some reformatting of changelog, and
led->LED).

Exponential mode:

We should decide if LEDs should be linear or not. Most LEDs are linear
now, and we may want to make it part of the API. Additional advantage
is that linear is "well defined". It is actually quite important for
RGB LEDs, because you get wrong colors otherwise.

(Non-linear can have advantages, too... like needing less bits.)

So, my suggestion is to document LEDs as linear, and leave
exponential->linear conversion to someone else.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXhSIJwAKCRAw5/Bqldv6
8kXHAKCDMGictHhWZrJFOSojuaRWyxJLOACfRJQtxCfV7IWm9vpd/MURAzCwc78=
=93c/
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
