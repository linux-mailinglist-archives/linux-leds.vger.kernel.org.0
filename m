Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CEEBF299
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 14:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfIZMMP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 08:12:15 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51530 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZMMP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 08:12:15 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 56D738069F; Thu, 26 Sep 2019 14:11:59 +0200 (CEST)
Date:   Thu, 26 Sep 2019 14:12:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, tomi.valkeinen@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: tlc591xx: use
 devm_led_classdev_register_ext()
Message-ID: <20190926121213.GD9310@amd>
References: <20190918152556.9925-1-jjhiblot@ti.com>
 <20190918152556.9925-3-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline
In-Reply-To: <20190918152556.9925-3-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-09-18 17:25:56, Jean-Jacques Hiblot wrote:
> Use devm_led_classdev_register_ext() to pass the fwnode to the LED core.
> The fwnode can then be used by the firmware core to create meaningful
> names.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2Mqx0ACgkQMOfwapXb+vKKUwCgv+t+1j2lanpDTQy+tRGyly41
VDEAnAvi2IR51jBB/3T6kJbA8+aUJIVr
=33dy
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
