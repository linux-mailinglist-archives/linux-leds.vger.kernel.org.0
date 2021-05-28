Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F72E394092
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235793AbhE1KEf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:04:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33086 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhE1KEe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:04:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D454E1C0B76; Fri, 28 May 2021 12:02:54 +0200 (CEST)
Date:   Fri, 28 May 2021 12:02:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/28] leds: cleanups and fwnode refcounting bug fixes
Message-ID: <20210528100254.GC2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-17 10:30:08, Andy Shevchenko wrote:
> On Mon, May 10, 2021 at 12:50:17PM +0300, Andy Shevchenko wrote:
> > When analyzing the current state of affairs with fwnode reference count=
ing
> > I found that a lot of core doesn't take it right. Here is a bunch of
> > corresponding fixes against LED drivers.
> >=20
> > The series includes some cleanups and a few other fixes grouped by a dr=
iver.
> >=20
> > First two patches are taking care of -ENOTSUPP error code too  prevent =
its
> > appearance in the user space.
>=20
> Pavel, any comments on this bug fix series?

I took these:

95138e01275e1af3f1fc2780fe1d9c6138b29c7a leds: pwm: Make error
handling more robust
d33e98a1f3ee76f38668304f9ffce49af07da77a leds: lt3593: Make use of
device properties
f1e1d532da7e6ef355528a22fb97d9a8fbf76c4e leds: lp50xx: Put fwnode in
error case during ->probe()
807553f8bf4afa673750e52905e0f9488179112f leds: lm3697: Don't spam logs
when probe is deferred
f55db1c7fadc2a29c9fa4ff3aec98dbb111f2206 leds: lm3692x: Put fwnode in
any case during ->probe()
e2e8e4e8187509a77cb6328d876d9c09c07c2e82 leds: lm36274: Correct
headers (of*.h -> mod_devicetable.h)
3c5f655c44bb65cb7e3c219d08c130ce5fa45d7f leds: lm36274: Put fwnode in
error case during ->probe()
2f39f68cec0a19c0371c1e7cb149159810e87f64 leds: lm3532: Make error
handling more robust
99be74f61cb0292b518f5e6d7e5c6611555c2ec7 leds: lm3532: select regmap
I2C API
f3e2b3825ffb034b001fbe283d7a32a56e41aca7 leds: lgm-sso: Drop duplicate
NULL check for GPIO operations
2cbbe9c50d13b6417e0baf8e8475ed73d4d12c2d leds: lgm-sso: Remove
unneeded of_match_ptr()
fba8a6f2263bc54683cf3fd75df4dbd5d041c195 leds: lgm-sso: Fix clock
handling
a43a4e588e72bafc81924d61bf1167cd6810ecbb leds: el15203000: Introduce
to_el15203000_led() helper
0ac40af86077982a5346dbc9655172d2775d6b08 leds: class: The -ENOTSUPP
should never be seen by user space

For the "remove depends on OF"... I'd preffer not to take those. We
don't need to ask the user for configurations that never happen.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwv84ACgkQMOfwapXb+vIN1gCfci7gA7RV1iIhbTujwmU8cIKp
8yIAnjVPXzCJtaO5ZMMvH8r/I+kKQAny
=WEAS
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
