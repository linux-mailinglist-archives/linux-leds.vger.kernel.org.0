Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6938627EFDD
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 19:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgI3RBs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 13:01:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56012 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3RBr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:01:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7C1B81C0B76; Wed, 30 Sep 2020 19:01:46 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:01:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH leds + devicetree 11/13] leds: tca6507: fail on reg value
 conflict
Message-ID: <20200930170146.GD27760@duo.ucw.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-12-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline
In-Reply-To: <20200919221548.29984-12-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>  		if (fwnode_property_match_string(child, "compatible",
>  						 "gpio") >=3D 0) {
>  			gpio_bitmap |=3D BIT(reg);
>  			continue;
> +		} else {
> +			led_bitmap |=3D BIT(reg);
>  		}
> =20

You have "continue" above, so you don't really need the else branch.

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S5+gAKCRAw5/Bqldv6
8nU0AKCXfhXYby59Fj6vr1pGf+nP5fEoIgCgtDYoujLBF8tqb41tsqVK9uzlfi0=
=zp76
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
