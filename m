Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCB53B2269
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 23:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWV1O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 17:27:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41102 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhFWV1O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 17:27:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8C6041C0B76; Wed, 23 Jun 2021 23:24:55 +0200 (CEST)
Date:   Wed, 23 Jun 2021 23:24:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-leds@vger.kernel.org,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>
Subject: Re: [PATCH] leds: lgm: Fix up includes
Message-ID: <20210623212455.GK8540@amd>
References: <20210613231647.511805-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwbb4r/vLufKlfJs"
Content-Disposition: inline
In-Reply-To: <20210613231647.511805-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rwbb4r/vLufKlfJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-06-14 01:16:47, Linus Walleij wrote:
> This driver is including the legacy GPIO header <linux/gpio.h>
> but the only thing it is using from that header is the wrong
> define for GPIOF_DIR_OUT.
>=20
> Fix it up by using GPIO_LINE_DIRECTION_OUT and including the
> correct consumer and driver headers.
>=20
> Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, applied.
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--rwbb4r/vLufKlfJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTpqcACgkQMOfwapXb+vI7hQCeLaZIOGYrcLqIgTpSbZhojpxN
wqcAoMJAGWsY2XpDDsv6O4iPEkgyVrBt
=lSvV
-----END PGP SIGNATURE-----

--rwbb4r/vLufKlfJs--
