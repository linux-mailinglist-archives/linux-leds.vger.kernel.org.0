Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0570D31F7D8
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 12:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhBSLDa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 06:03:30 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48152 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhBSLD2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:03:28 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EB3821C0B8A; Fri, 19 Feb 2021 12:02:27 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:02:27 +0100
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
Message-ID: <20210219110227.GG19207@duo.ucw.cz>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-3-nfraprado@protonmail.com>
 <a26a1d40-1c7c-b97c-2970-58a2fda8f1cf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8S1fMsFYqgBC+BN/"
Content-Disposition: inline
In-Reply-To: <a26a1d40-1c7c-b97c-2970-58a2fda8f1cf@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8S1fMsFYqgBC+BN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/spmi.h>
> > +#include <linux/of_device.h>
> > +#include <linux/device.h>
> > +#include <linux/types.h>
> > +#include <linux/string.h>
> > +#include <linux/mutex.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/led-class-flash.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/delay.h>
> > +#include <linux/regmap.h>
> > +#include <dt-bindings/leds/leds-qcom-spmi-flash.h>
>=20
> Please sort includes alphabetically.

No need to do that.

> > +#define FLASH_SAFETY_TIMER		0x40
>=20
> Namespacing prefix is needed for macros, e.g. QCOM_FLASH*.

No need for that in .c files.

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--8S1fMsFYqgBC+BN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+awwAKCRAw5/Bqldv6
8s5wAKCy/ZmJf8+DzVgfyQqYABgdGse2/wCgtC5cNGGLiA0qrqO5gJ/hLjKqyCY=
=cQCL
-----END PGP SIGNATURE-----

--8S1fMsFYqgBC+BN/--
