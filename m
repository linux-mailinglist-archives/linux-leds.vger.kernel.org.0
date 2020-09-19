Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A271E270C3D
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 11:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgISJoW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 05:44:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43286 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISJoW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 05:44:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 374151C0B85; Sat, 19 Sep 2020 11:44:19 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:44:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: Re: [PATCH v5 1/3] leds: pwm: Remove platform_data support
Message-ID: <20200919094418.GC12294@duo.ucw.cz>
References: <20200919053145.7564-1-post@lespocky.de>
 <20200919053145.7564-2-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
In-Reply-To: <20200919053145.7564-2-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
> interface is not usable from outside and there seems to be no in tree
> user anymore.  All in-tree users of the leds-pwm driver seem to use DT
> currently.  Getting rid of the old platform interface will allow the
> leds-pwm driver to switch over from 'devm_led_classdev_register()' to
> 'devm_led_classdev_register_ext()' later.

> @@ -61,6 +56,7 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>  	return pwm_apply_state(led_dat->pwm, &led_dat->pwmstate);
>  }
> =20
> +__attribute__((nonnull))
>  static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  		       struct led_pwm *led, struct fwnode_handle *fwnode)
>  {

This normally goes elsewhere -- right? I'd expect:


  static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
  		       struct led_pwm *led, struct fwnode_handle *fwnode)
	  __attribute__((nonnull))

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XS8gAKCRAw5/Bqldv6
8iapAKCTRc30eD7P0wc+NOhcH593+trd/QCfZ+5um+mTGHwp65tN1p4Xgs0rsDA=
=2m5L
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
