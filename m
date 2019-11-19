Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A551D102B8D
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 19:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfKSSO3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 13:14:29 -0500
Received: from foss.arm.com ([217.140.110.172]:56498 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbfKSSO3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 19 Nov 2019 13:14:29 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B2BD1FB;
        Tue, 19 Nov 2019 10:14:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFDFA3F703;
        Tue, 19 Nov 2019 10:14:27 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:14:26 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/4] regulator: tps6105x: add optional devicetree
 support
Message-ID: <20191119181426.GE3634@sirena.org.uk>
References: <20191119154611.29625-1-TheSven73@gmail.com>
 <20191119154611.29625-3-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Content-Disposition: inline
In-Reply-To: <20191119154611.29625-3-TheSven73@gmail.com>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 19, 2019 at 10:46:09AM -0500, Sven Van Asbroeck wrote:
> Tell the regulator framework to retrieve regulator init
> data from the 'regulator' subnode, or from the parent mfd
> device's platform data.

This and the binding look good.  I think there's no interdependency with
the other patches and I can just apply them?

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3UMQEACgkQJNaLcl1U
h9Apugf/UYWHwasok+ymaJanhsZFyGXd/oMmnbzICBVxLOLXRiVnTDjcj3JZIza8
NWxt7fORjI2E6ViFwGrQzcbA4xEM/s0zYagxKFDEVc1UQ9xj5DoPh9BPwjd1t8cS
ARymt9obh2EWLJjC1S1pZiPR1mrsK8ARUjPZI0RUY6JGFnMBHWIQ+dLC53UYtoQw
tFx1MJkOI4o5oFjgdhlyvj1sCTIpP9td1u66GFZp2C0kqXqtoquQ7croQMT5Awd0
i+d8eBN4/huo8uOFYBAndXJzfdhelc0vqU8Fly8+fj6DBWrA2bWygm1DrymN5RHC
XMOm9lEQKq0rgRXNzxAfPHLKzE0SLw==
=q6i4
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--
