Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2F3EDB68
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfKDJQH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:16:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33888 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfKDJQH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:16:07 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A99BA1C06C8; Mon,  4 Nov 2019 10:09:19 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:19 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Dan Murphy <dmurphy@ti.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue
Message-ID: <20191104090919.GC12355@duo.ucw.cz>
References: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-10-13 12:53:23, Stefan Wahren wrote:
> bcm2835-rpi.dtsi defines the behavior of the ACT LED, which is available
> on all Raspberry Pi boards. But there is no driver for this particual
> GPIO on CM3 in mainline yet, so this node was left incomplete without
> the actual GPIO definition. Since commit 025bf37725f1 ("gpio: Fix return
> value mismatch of function gpiod_get_from_of_node()") this causing probe
> issues of the leds-gpio driver for users of the CM3 dtsi file.
>=20
>   leds-gpio: probe of leds failed with error -2
>=20
> Until we have the necessary GPIO driver hide the ACT node for CM3
> to avoid this.
>=20
> Reported-by: Fredrik Yhlen <fredrik.yhlen@endian.se>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Fixes: a54fe8a6cf66 ("ARM: dts: add Raspberry Pi Compute Module 3 and IO =
board")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/qvwAKCRAw5/Bqldv6
8s9rAJ4yTRIe97T+lFBPRHVvathcg6ZLogCeIdAfUfoLu27bqE38/MrvOEGnIYU=
=w3/X
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
