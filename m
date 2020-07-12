Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F09721C7EF
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 09:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgGLHxq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 03:53:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48700 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLHxq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 03:53:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CCF011C0BD2; Sun, 12 Jul 2020 09:53:43 +0200 (CEST)
Date:   Sun, 12 Jul 2020 09:53:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Matt Spinler <mspinler@linux.vnet.ibm.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] leds: pca955x: Include the right GPIO header
Message-ID: <20200712075343.GC8295@amd>
References: <20200626224735.384181-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline
In-Reply-To: <20200626224735.384181-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-06-27 00:47:35, Linus Walleij wrote:
> This driver provides a GPIO chip, so include <linux/gpio/driver.h>
> and not the legacy <linux/gpio.h> header.

Thanks, applied to for-next.
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KwYcACgkQMOfwapXb+vJGeQCgruUtUXwea3vHCvc7N8KksuKs
r30AnioTM8WX68nol5aOLOmk+ke6eJ0K
=464V
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
