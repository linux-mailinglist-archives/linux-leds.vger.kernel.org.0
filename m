Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3E3100AB2
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 18:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfKRRpy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 12:45:54 -0500
Received: from foss.arm.com ([217.140.110.172]:37786 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbfKRRpy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 18 Nov 2019 12:45:54 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0DD61FB;
        Mon, 18 Nov 2019 09:45:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41CE73F703;
        Mon, 18 Nov 2019 09:45:53 -0800 (PST)
Date:   Mon, 18 Nov 2019 17:45:50 +0000
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
Message-ID: <20191118174550.GA43585@sirena.org.uk>
References: <20191118165400.21985-1-TheSven73@gmail.com>
 <20191118165400.21985-2-TheSven73@gmail.com>
 <20191118170111.GL9761@sirena.org.uk>
 <CAGngYiW+8m4fBAY5Ya_4YmEmCTQeiiNP6=aH2mUX6d2wY1442w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <CAGngYiW+8m4fBAY5Ya_4YmEmCTQeiiNP6=aH2mUX6d2wY1442w@mail.gmail.com>
X-Cookie: Are we live or on tape?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 12:17:50PM -0500, Sven Van Asbroeck wrote:
> On Mon, Nov 18, 2019 at 12:01 PM Mark Brown <broonie@kernel.org> wrote:

> > We shouldn't need a compatible here, the MFD should just instantiate any
> > children it has.

> If the child node doesn't have a compatible, how would the driver be
> able to work
> out the operational mode? The chip can only be in a single operational mode
> at a time. So the child node has 'led' or 'regulator' compatible.

> Or is there a more elegant method I've overlooked?

So this is one device that has two separate modes?  This sounds like you
need a property specifying how the device is wired up, or possibly just
different compatibles at the root of the device though that's not quite
idiomatic.  Splitting this up with different devices is a bit of a Linux
specific implementation detail.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3S2M4ACgkQJNaLcl1U
h9ByRwf/VC4ZC3Kltc9gqSB2/giau7AxR0MHzi1gENgbr3VxEfOvL5DhGt/j6koE
igDgKqsCtFSpZCCjYHinsCW9s8ue4r3ZIN9Kk6jpZUR1h+ddomrpkywGnGhKpUlB
ZLJM23qgScm72XM5i17kzut4vBhSHKPlcOAQr00ZLPuQVj1keflO3hNIq7Suk3fP
yAn+romZT4vbfHgPbylFOjm6syNioCOIUjVhl7YCjFfYVO8GOE6aQoGPUsLHGxbZ
UYu0F+XjqG1ZArQhaGdMz8/6t4S/MVCCwayEcQ23SHIdWn2LYghmGpMuXOauKAtK
J+sV/ijwbpJxaKN3MyZwVaRUEYIUnQ==
=dQrA
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
