Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91669100D30
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 21:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfKRUeJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 15:34:09 -0500
Received: from foss.arm.com ([217.140.110.172]:39798 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbfKRUeJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 18 Nov 2019 15:34:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5AE0328;
        Mon, 18 Nov 2019 12:34:08 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253EF3F6C4;
        Mon, 18 Nov 2019 12:34:07 -0800 (PST)
Date:   Mon, 18 Nov 2019 20:34:06 +0000
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
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/4] tps6105x: add optional devicetree support
Message-ID: <20191118203406.GE43585@sirena.org.uk>
References: <20191118165400.21985-1-TheSven73@gmail.com>
 <20191118165400.21985-2-TheSven73@gmail.com>
 <20191118170111.GL9761@sirena.org.uk>
 <CAGngYiW+8m4fBAY5Ya_4YmEmCTQeiiNP6=aH2mUX6d2wY1442w@mail.gmail.com>
 <20191118174550.GA43585@sirena.org.uk>
 <CAGngYiXLx8rkkKPyALYyCHFyst2Ft8bCkP4uqmzXAHHqXhUvkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline
In-Reply-To: <CAGngYiXLx8rkkKPyALYyCHFyst2Ft8bCkP4uqmzXAHHqXhUvkQ@mail.gmail.com>
X-Cookie: Are we live or on tape?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 01:13:24PM -0500, Sven Van Asbroeck wrote:

> This mfd chip can be wired up as one of the following:
> - gpio only
> - gpio + regulator
> - gpio + led
> - gpio + flash

Is the regulator bit of this perhaps a voltage regulator and a current
regulator packaged together mainly for use powering LEDs?  That's a
hardware design I've seen before...

> in this case, there is no elegant way to specify the regulator properties in
> the devicetree. Except by grabbing a reference to a subnode perhaps. And then
> I'd have to somehow make sure that the sub driver's device->of_node points
> at this subnode, which the mfd core doesn't do automatically.

Just point the regulator framework at the MFD's DT node - the children
of the MFD can look at the parent device happily, there's several
existing MFDs do this.

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3TAD0ACgkQJNaLcl1U
h9Bqlgf8Dib7KYvT7366jnJriGkt0NV9PQ/TYCN+prAOuGPFTXGKFfvvoDwmk+Tc
1iVLFjL50q8VMfkPpi2AbDZM0MjA7eir/yIOyg9hxutkWz+ttnnELQEUORVSdGhp
WF+GwkGMYn3kuFysi9uhPs+yX2gLPFia6TcxxiLkR8I/nOIWT36Lc3mEpu401yUN
MP24CU830l7Su2ip1HgyoNuuI5vfJWvnpQKSo0Kz9iBFVgVlpDhNnPGXar9d3PQO
c3LxleG+Y+SPXdmXpPE86ENAuAmVoxHU3W03m+rs4QhouK3EX/hjwVI9mASUZxoW
YrENReY3z5W6007+5oh7wzABjwVxZQ==
=7W1d
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
