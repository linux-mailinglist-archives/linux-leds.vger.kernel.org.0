Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DA2476EF8
	for <lists+linux-leds@lfdr.de>; Thu, 16 Dec 2021 11:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbhLPKhJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Dec 2021 05:37:09 -0500
Received: from static.55.155.9.5.clients.your-server.de ([5.9.155.55]:58970
        "EHLO vm3.sequanux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236128AbhLPKhJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Dec 2021 05:37:09 -0500
X-Greylist: delayed 414 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Dec 2021 05:37:08 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm3.sequanux.org (Postfix) with ESMTP id DB4E410821E;
        Thu, 16 Dec 2021 11:29:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm3.sequanux.org ([127.0.0.1])
        by localhost (vm3.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id W43ToO0m87Dy; Thu, 16 Dec 2021 11:29:32 +0100 (CET)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm3.sequanux.org (Postfix) with ESMTPSA id 8E4C01085A0;
        Thu, 16 Dec 2021 11:28:49 +0100 (CET)
Date:   Thu, 16 Dec 2021 11:28:39 +0100
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, kabel@kernel.org,
        linux-leds@vger.kernel.org, j.anaszewski@samsung.com
Subject: Re: [bug report] leds: ns2: Remove work queue
Message-ID: <YbsU19+t3ks00pQC@kw.sim.vm.gnt>
References: <20211210135249.GA16777@kili>
 <20211215203955.GG28336@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IIM4QdhfEjI5Cj4h"
Content-Disposition: inline
In-Reply-To: <20211215203955.GG28336@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IIM4QdhfEjI5Cj4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 15, 2021 at 09:39:55PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > Hello LED devs,
> >=20
> > The patch c29e650b3af2: "leds: ns2: Remove work queue" from Nov 20,
> > 2015, leads to the following Smatch static checker warning:
> >=20
> > 	drivers/leds/leds-ns2.c:96 ns2_led_set_mode()
> > 	warn: sleeping in atomic context
>=20
> Yup, this looks wrong.

It's been a very long time since I watched this pilot or even the LED
subsystem.

The "can_sleep" code seems to me quite the same as for the led_gpio
driver. If can_sleep is set (because for example the GPIO controller
uses I2C), then the brightness_set_blocking function should be used and
then ns2_led_set() can't be called in atomic context. And also the
gpiod_set_value_cansleep variants are used.

Where is it wrong ?

>=20
> Plus, the code is quite crazy.

Well, there has been many changes since the version I wrote.

>=20
> Not sure what the write_lock in that function is supposed to protect
> against. Perhaps it can be just removed?

At the time it was possible for brightness_set() to be called in user
context (through the sysfs interface) or in interrupt/timer context
(from a trigger). And because the LED is controlled through two GPIOs,
then ns2_led_set_mode() needs to be protected against reentrancy. That's
why the write_{lock_irqsave,unlock_irqrestore} functions have been used
here.

I have no idea about what is the context situation now.

>=20
> Hmm. led_set_mode uses custom interface for hardware accelerated
> LED. Ideally there's more fixing to be done there :-(.

At the time, nothing else was available and the LED API was crazy.

Simon

--IIM4QdhfEjI5Cj4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAmG7FNIACgkQzyg/RDPm
szrGZRAAjv9aWYzztQna95MOJ0THz6U/OC4l/iC6F6lRkl/xxGR9PFVy+Rjo4uMn
lh6O8OzECYoZpZEJ1xQaS1M+VHJbpZr4CEhMLS+0W5pWTsndmAjmIxB0iidyfkT0
18ohHzeqXvatJchz/lfy91RpVPo1KQ7XmnbCurgKG1+cDIIwlT0ndjwAOiLI4JMA
kLXRu3fOGbmYe8sOQdPkT0npsDRaNYRAJ5hkg+gLddL1byaQxBHQK6nNNFNEI74/
1/7C+HzkHVYNEbySNG7eIrqwNaCXiIzuEj2Wp5znrYQewkh3flDNVjD3KItHyKRq
RK4CKW0P8TGIjYEv6yIwvd6fxl5JbNE8dwCZBm9LD4tox3SJO0wOXZ2QI8D3x49t
BQQzW9wgNV0wZLWzihU6R0Z3i3fnpbKne2GbLSOD9k9J4fo6bULNrRlKc7VCKuXt
WNrVmBQqYvAfOYzsxzEsliXxI1z9w/5KbiupsHs2aubkkTgARhtSE7GCeaPcK38R
Sp83y6/I1n2Xw/gzxie/HFsCAiMCw9qwADFw5Z12A6PzX2r5OiyPzXGajZcQAkz9
c2z9QZIibZGIZBUlxY+hqRZp6pkWPJs6OBDPzuF47tdjeq+Xy4oCbJkPdkc1WttY
U97nWS6+sHCnL+nUOC8LAA11OXQxGqoyo3s1mxaZVLm9+kyMrp4=
=AY6Z
-----END PGP SIGNATURE-----

--IIM4QdhfEjI5Cj4h--
