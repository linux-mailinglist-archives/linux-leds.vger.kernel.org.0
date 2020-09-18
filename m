Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B921B26FEE6
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 15:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgIRNmF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 09:42:05 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:35245 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgIRNmE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 09:42:04 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 47EEC108655;
        Fri, 18 Sep 2020 15:42:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZtjIOlpkfY8T; Fri, 18 Sep 2020 15:42:01 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 5AFA01085D5;
        Fri, 18 Sep 2020 15:42:01 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:42:01 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek Behun <kabel@blackhole.sk>
Cc:     Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-leds@vger.kernel.org
Subject: Re: question about Network Space v2 LED driver
Message-ID: <20200918134201.GF29951@kw.sim.vm.gnt>
References: <20200918005258.44c0bfc6@blackhole.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline
In-Reply-To: <20200918005258.44c0bfc6@blackhole.sk>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 12:52:58AM +0200, Marek Behun wrote:
> Hi,

Hi Marek,

>=20
> the leds-ns2 kernel driver has allows 3 modes for a LED:
>   OFF, ON and blinking on SATA activity
>=20
> This third mode is activated via another sysfs file in the LED device
> sysfs directory: /sys/class/leds/<LED>/sata.
>=20
> Since we now support LED private HW triggers, it would be better if
> this was rewritten to use this new API.

It sounds like a great idea.

>=20
> The question is how many people use this mode and may complain if we
> change this sysfs ABI?

Not a lot IMHO. This LED devices are found in some LaCie/Seagate NAS.
Most of them, such as the Seagate NAS 4-Bay (Marvell Armada 370 SoC)
are supported by the Debian distribution. For the users I have been in
contact with, I am pretty confident they should be able to deal with
this changes. They already dealt with worse.

Another user is the Seagate NAS distribution. And this user will be
happy to switch to the new ABI.

>=20
> Another question is whether the LED supports another HW blinking mode,
> or just SATA? How is this wired on the board?

Three different LED modes are available: off, on and SATA activity
blinking. The LED modes are controlled through two GPIOs (command and
slow): each combination of values for the command/slow GPIOs corresponds
to a LED mode.

For an example, have a look at the leds-ns2 DT node in the
armada-370-seagate-nas-4bay.dts file.

The only hardware blinking mechanism for this LED device is SATA.
Basically the SATA blinking signal is built from the SATA pin activity
of the HDD. This signal is a little bit reworked by some electronic
components in order to produce a blinking rate OK for the human eye.

Hope this helps.

Simon

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9kuSgACgkQzyg/RDPm
szpkBg/+LH4am7kk+g/Gp82Jvw/Mcz//mofRhr3hJiRLEZAfsmQXeQKmSAYqmpig
ao2IHrVb+CKK6QNij4XJM8kx4Qwg+SeV16s9sGJp0aWgerb4HmxCBuGCNjwDXAxK
Islo1WkvxhUcsox+O0YV2SF1daVEj0OkbxP27gnlUImoC4YwoSstV/lZ2EDlDn+w
CRLD22lYyRWsRsVb3uJWCRlu5BAsEtiARPIhZL6HI/sVxVWZHk8usnLsgY1okKLw
/5HlxwTTKY3S2url0QLjxqYJgMJxk6dkGD4e/qWuZNMlKw1gHTpniL9RKkb02eSi
2zadOOvY0XnaJDqocBtVvmham3VUqR4hVYQTvy25HvBKc24wmuOlyv6toKLzB4pA
MYT3blowOOpuP074UNJq9lPdMkWgwHpWet4ukd74Km3rF7y8V9yrypAeDYCyG2oz
mDPbwruk9FxLnWA7QGqPm6n5k+XX7/57fzdTzSIrSEd9mRGwTDZ8i+rBEmRj0h5A
rZV0M0wmeAQMavTADUxFxAH/1Y5Crtj7QsRD/PmpqlRhoPPphNICWS03qg0oI7BL
O6c3cfy6516r2TFK8RiFgyVkIZ2YmqvH7h/FU6m+V3wLClpXt4eR2lBMf98ApYWN
1v58SiJb1AoQV3eOhELkG76fW/ff5bRxHzeW4MWMU4UN/VJe/Qc=
=ve2l
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
