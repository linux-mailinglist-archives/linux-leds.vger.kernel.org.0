Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66FFD332F29
	for <lists+linux-leds@lfdr.de>; Tue,  9 Mar 2021 20:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCITjV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Mar 2021 14:39:21 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44878 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhCITjO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Mar 2021 14:39:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 075191C0B78; Tue,  9 Mar 2021 20:39:11 +0100 (CET)
Date:   Tue, 9 Mar 2021 20:39:10 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Arnd Bergmann <arnd@kernel.org>, rafael.j.wysocki@intel.com
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Intel, please maintain your drivers was Re: [PATCH] leds: lgm:
 fix gpiolib dependency
Message-ID: <20210309193910.GA7507@amd>
References: <20210308153052.2353885-1-arnd@kernel.org>
 <20210309180851.GA4669@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20210309180851.GA4669@duo.ucw.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > Without gpiolib, the driver fails to build:
> >=20
> >     drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has incomple=
te type 'struct gpio_chip'
> >             struct gpio_chip chip;
> >                              ^
>=20
> Thanks, applied.
>=20
> I'd like people from Intel to contact me. There's more to fix there,
> and AFAICT original author went away.

The following message to <mallikarjunax.reddy@linux.intel.com> was
undeliverable.
The reason for the problem:
5.1.0 - Unknown address error 550-'5.1.1
<mallikarjunax.reddy@linux.intel.com>: Recipient
+address rejected: User unknown in virtual mailbox table'

commit c3987cd2bca34ddfec69027acedb2fae5ffcf7a0
Author: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>

Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel=
=2Ecom>

If someone knows how to contact the author, that would be welcome.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBHzt4ACgkQMOfwapXb+vJzJQCgv5DXUDnEH655ZoLMM+JB13ZI
m8wAniCIUHGqyYClQdTv6nfi70gCOOnv
=FTk/
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
