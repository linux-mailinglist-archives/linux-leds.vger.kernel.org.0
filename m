Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4931B391C03
	for <lists+linux-leds@lfdr.de>; Wed, 26 May 2021 17:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234852AbhEZPcO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 May 2021 11:32:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37188 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235193AbhEZPcO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 May 2021 11:32:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9CED31C0B80; Wed, 26 May 2021 17:30:41 +0200 (CEST)
Date:   Wed, 26 May 2021 17:30:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>, hdegoede@redhat.com,
        andy.shevchenko@gmail.com, mchehab+huawei@kernel.org,
        mauro.chehab@huawei.com, linux-leds@vger.kernel.org
Subject: LEDs with hardware-accelerated patterns, suspend indication
Message-ID: <20210526153040.GA4537@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

We have hardware trigger for arbitrary patterns... but then we have
common hardware that can do few simple patterns but not arbitrary
ones.

Proposal:

Have a new hardware trigger "lpattern" that will allow selection of
patterns hardware can commonly provide. I guess that is "off", "on",
"blinking", "breathing". Maybe with variations like "slow" and "fast".

It should provide software fallbacks, so we have reference how the
patterns should look like and behave.

It is quite common to provide LED with charging activity.

Proposal:

Have a trigger called "charging" which would provide three
subdirectories "charged", "charging" and "discharging" with interface
similar to the new "lpattern" trigger.

It is very common to have combined LED for power and suspend.

Proposal:

Have a trigger called "sysstate" with three subdirectories "off", "on"
and "suspended", with interfaces similar to the "lpattern" trigger.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCuaaAACgkQMOfwapXb+vLWtgCgtVomMW9Jf5Jnuue4ih7YiM2m
VpcAoLWMWP3YU1O/3kkkrjduM7IQbfxu
=ruhN
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
