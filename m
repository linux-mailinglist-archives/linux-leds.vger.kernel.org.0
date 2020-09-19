Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66144270C40
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 11:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgISJoe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 05:44:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43342 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISJoe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 05:44:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A54C41C0B85; Sat, 19 Sep 2020 11:44:31 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:44:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v5 2/3] leds: pwm: Allow automatic labels for DT based
 devices
Message-ID: <20200919094431.GD12294@duo.ucw.cz>
References: <20200919053145.7564-1-post@lespocky.de>
 <20200919053145.7564-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline
In-Reply-To: <20200919053145.7564-3-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-09-19 07:31:44, Alexander Dahl wrote:
> If LEDs are configured through device tree and the property 'label' is
> omitted, the label is supposed to be generated from the properties
> 'function' and 'color' if present.  While this works fine for e.g. the
> 'leds-gpio' driver, it did not for 'leds-pwm'.
>=20
> The reason is, you get this label naming magic only if you add a LED
> device through 'devm_led_classdev_register_ext()' and pass a pointer to
> the current device tree node.
>=20
> For the following node from dts the LED appeared as 'led-5' in sysfs
> before and as 'red:debug' after this change.

Thanks, applied.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XS/wAKCRAw5/Bqldv6
8ob7AJ9r8q2IyOv76Bdhrp1yp2IBmXH+qQCfe4DTLqYtC1J0A0xjwpUn4gu3Lyw=
=0r//
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
