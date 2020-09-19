Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44FE270CE3
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 12:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISKTP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 06:19:15 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46424 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKTP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 06:19:15 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 90EAC1C0B85; Sat, 19 Sep 2020 12:19:12 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:19:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH leds v2 50/50] leds: parse linux,default-trigger DT
 property in LED core
Message-ID: <20200919101912.GC16109@duo.ucw.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-51-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-51-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Do parsing of `linux,default-trigger` DT property to LED core. Currently
> it is done in many different drivers and the code is repeated.
>=20
> This patch removes the parsing from 21 drivers:
>   an30259a, aw2013, bcm6328, bcm6358, cr0014114, el15203000, gpio,
>   is31fl319x, is31fl32xx, lm3532, lm36274, lm3692x, lm3697, lp8860,
>   lt3593, max77650, mt6323, ns2, pm8058, tlc591xx and turris-omnia.
>=20
> There are still 11 drivers that parse this property on their own because
> they do not pass the led_init_data structure to the registering
> function. I will try to refactor those in the future.

I applied selected patches from the series... but it is not clear what
this depends on so I'll avoid it for now.

(Oh and thanks for the great work, BTW!)

Please take a look at my -next tree.... and feel free to send me
patches that still make sense.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XbIAAKCRAw5/Bqldv6
8jrGAJ0bhqHsWXb9ayqPNNerYPO8zlv43ACgo3c6/6kXESX1/qHvz2muwT+sqpA=
=yTby
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
