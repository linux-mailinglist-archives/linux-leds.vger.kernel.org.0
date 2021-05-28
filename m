Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA8B3947FB
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhE1Ufr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:35:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55400 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhE1Ufq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:35:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A0DEC1C0B76; Fri, 28 May 2021 22:34:10 +0200 (CEST)
Date:   Fri, 28 May 2021 22:34:10 +0200
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
Message-ID: <20210528203410.GA26380@duo.ucw.cz>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
 <20210528100254.GC2209@amd>
 <YLDOfWuis5MvdxfJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <YLDOfWuis5MvdxfJ@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > First two patches are taking care of -ENOTSUPP error code too  prev=
ent its
> > > > appearance in the user space.
> > >=20
> > > Pavel, any comments on this bug fix series?
> >=20
> > I took these:
>=20
> Thanks!
>=20
> What branch/tree should I rebase the rest on?

git@gitolite.kernel.org:pub/scm/linux/kernel/git/pavel/linux-leds.git
for-next would do the trick.

As would linux-next, I guess. This area should not be changing.

> > For the "remove depends on OF"... I'd preffer not to take those. We
> > don't need to ask the user for configurations that never happen.
>=20
> What do you mean by this? ACPI is quite a good configuration to make use
> of it on the corresponding platforms. By default any discrete LED driver
> (in hardware term here) IC should be considered independent from the type
> of the platform description. Do you agree? If so, it means that

The drivers are independend, I guess. But I'm also very sure you will
not find some of the chips in a ACPI based machine. el15203000 is such
example.

I don't want people configuring for normal PCs to be asked if they
want el15203000 support.

If you know particular chip is present in ACPI-based machine, I'm okay
with removing the dependency.

(Maybe some of these chould depend on ARM || COMPILE_TEST instead?)

> > dropping
> OF dependency is a right thing to do to allow users of those ICs to be ha=
ppy
> even on ACPI based platforms.
>=20
> Note, entire IIO subsystem is a good example of this activity. All the se=
nsors
> can be used now in ACPI environment without explicit requirement to have =
an
> ACPI ID, although it's highly recommended to acquire for the real products
> (not DIY ones).

Well. I'm not sure that is good step forward. It will result in
useless questions being asked.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYLFTwgAKCRAw5/Bqldv6
8qb/AJwK0UBop9hyWUWbFSYgRbrmkir5UACfdJMsSYMYKj0U/lXMkVXNgjiDraU=
=6L+m
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
