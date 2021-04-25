Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64B536A928
	for <lists+linux-leds@lfdr.de>; Sun, 25 Apr 2021 22:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhDYUUM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 16:20:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47210 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYUUL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 16:20:11 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CD4311C0B76; Sun, 25 Apr 2021 22:19:29 +0200 (CEST)
Date:   Sun, 25 Apr 2021 22:19:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@protonmail.com>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 2/4] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20210425201928.GA10996@amd>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-3-nfraprado@protonmail.com>
 <a26a1d40-1c7c-b97c-2970-58a2fda8f1cf@gmail.com>
 <20210219110227.GG19207@duo.ucw.cz>
 <7bb757c7-55af-66a4-aa12-fe646a19fcf6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <7bb757c7-55af-66a4-aa12-fe646a19fcf6@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>+#include <linux/kernel.h>
> >>>+#include <linux/module.h>
> >>>+#include <linux/spmi.h>
> >>>+#include <linux/of_device.h>
> >>>+#include <linux/device.h>
> >>>+#include <linux/types.h>
> >>>+#include <linux/string.h>
> >>>+#include <linux/mutex.h>
> >>>+#include <linux/sysfs.h>
> >>>+#include <linux/led-class-flash.h>
> >>>+#include <linux/regulator/consumer.h>
> >>>+#include <linux/delay.h>
> >>>+#include <linux/regmap.h>
> >>>+#include <dt-bindings/leds/leds-qcom-spmi-flash.h>
> >>
> >>Please sort includes alphabetically.
> >
> >No need to do that.
>=20
> Keeping the includes sorted eliminates the risk of introducing duplicates
> and allows for faster lookup.
>=20
> What gain is in having them unsorted?

It is not there is gain in them unsorted; it is that keeping sorted
order is not worth the effort.

> >>>+#define FLASH_SAFETY_TIMER		0x40
> >>
> >>Namespacing prefix is needed for macros, e.g. QCOM_FLASH*.
> >
> >No need for that in .c files.
>=20
> In general it eliminates the risk of name clash with other subsystems
> headers.
>=20
> And actually the prefix here should be QCOM_LED_FLASH to avoid ambiguity
> with flash memory. If you dropped the vendor prefix then you'd get
> possible name clash with led-class-flash.h namespace prefix.

I believe the cost (longer macro names) outweights the benefits here.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCFztAACgkQMOfwapXb+vKsAQCgwoITptPZoLauNTG8eGPnXx4k
axkAnAlN7nrSYyNTLk7gonKmd2sqzFrb
=QgY3
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
