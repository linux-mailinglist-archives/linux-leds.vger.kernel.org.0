Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D5023A3BE
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 14:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHCMCc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 08:02:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35260 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgHCMC0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 08:02:26 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DD1991C0BD4; Mon,  3 Aug 2020 14:02:22 +0200 (CEST)
Date:   Mon, 3 Aug 2020 14:02:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     marek.behun@nic.cz, jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH] leds: disallow /sys/class/leds/*:multi:* for now
Message-ID: <20200803120222.3x3irmbmomebkfqw@duo.ucw.cz>
References: <20200727084500.GA15237@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bl7o75taoqzkg7qc"
Content-Disposition: inline
In-Reply-To: <20200727084500.GA15237@amd>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bl7o75taoqzkg7qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


commit 77dce3a22e8941552a15046d4113df9ce132fb3d
Author: Pavel Machek <pavel@ucw.cz>
Date:   Mon Aug 3 14:00:06 2020 +0200

    leds: disallow /sys/class/leds/*:multi:* for now
   =20
    All the LEDs in the queue are RGB, so they should not use multi for
    their color.
   =20
    Make sure we don't add such LED by mistake (and make it part of ABI).
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index a6dce01dbd5e..c4e780bdb385 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -425,6 +425,10 @@ int led_compose_name(struct device *dev, struct led_in=
it_data *init_data,
 	struct fwnode_handle *fwnode =3D init_data->fwnode;
 	const char *devicename =3D init_data->devicename;
=20
+	/* We want to label LEDs that can produce full range of colors
+	 * as RGB, not multicolor */
+	BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
+
 	if (!led_classdev_name)
 		return -EINVAL;
=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bl7o75taoqzkg7qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXyf8zgAKCRAw5/Bqldv6
8p5PAJsHmm/qUgpdiYfPA3/Uot4AHNByRACfcZwZDPii34It2T+It5eM8n3hIiM=
=+19C
-----END PGP SIGNATURE-----

--bl7o75taoqzkg7qc--
