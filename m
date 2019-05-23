Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97DC327D84
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 15:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbfEWNDW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 09:03:22 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52968 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729698AbfEWNDW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 09:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5cZRKgxQvNkz3iJLe3vn3TDHYQVxlYUX8jd+t+YZvVg=; b=avPj+r3sHYQzdd+uP3fSpLXk4
        fr78e9eo3SrMXInj6xGmZxcHYoNy3c0g4mJCsV1vA9jjeaeXW/kVftqm+j86ceP2REDch3bQhhJ84
        3KFb4fKbAol/VlJ501pTHiAVOxxzc5g2Brq2AUKFZjjVwa9VwZLEGwZtAVcO7HRD8aLzA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTnNL-00009h-Jx; Thu, 23 May 2019 13:03:15 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 962B21126D24; Thu, 23 May 2019 14:03:11 +0100 (BST)
Date:   Thu, 23 May 2019 14:03:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Message-ID: <20190523130311.GA17245@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-2-dmurphy@ti.com>
X-Cookie: I brake for chezlogs!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:
> The use of and enablement of the GPIO can be used across devices.
> Use the enable_reg in the regulator descriptor for the register to
> write.

> @@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_dev=
ice *pdev)
> =20
>  	if (gpiod) {
>  		cfg.ena_gpiod =3D gpiod;
> -
> -		ret =3D regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
> +		ret =3D regmap_update_bits(regmap,
> +					 lm363x_regulator_desc[id].enable_reg,
>  					 LM3632_EXT_EN_MASK,
>  					 LM3632_EXT_EN_MASK);
>  		if (ret) {

Is it guaranteed that the bitmask for enabling the use of the GPIO is
going to be the same for all regulators?  The bitmasks for the regulator
enable look to be different, and it also looks like this setting might
affect multiple regulators since it seems there are multiple enable bits
in the same register.  If this affects multiple regulators then how's
that working at the minute?

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmmgwACgkQJNaLcl1U
h9AW+wf/W9R9Ah4Ahge5WpgUG5KcZlhb1Pg8RHBA9nrw5Wo/xEXiczOYi+we0nb2
AyLzhBfpufQOzZM3Ua+zUoMjjTs2yFvaTb25zSN5EHHJ2QzpWjveSKVRfnl7rpxQ
VyvXzwc9q1dPC7zDHS/jjixCw/pM1we2U7/xMhNspPNY7+RIf4Q9K4HBjyXl8bY0
Hzt1mUMXUAcFThQu8Jd1J7CF/rdXBqhtHKjDMnlvG6w2q6WqQufQHJ3TZR43yFAc
0raknJuO5029WwxMxA1jJbuE1e/k2Vm1K3pKWq/XK1PeyA2sekcenFnZdieJgbvd
RJTQ7GG0xr6edBiR0q8GdwduhSUN9A==
=vcQI
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
