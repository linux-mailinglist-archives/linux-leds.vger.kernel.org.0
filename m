Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3285923A3BB
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 14:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHCMCT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 08:02:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35230 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCMBq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 08:01:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8C1E61C0BD4; Mon,  3 Aug 2020 14:01:42 +0200 (CEST)
Date:   Mon, 3 Aug 2020 14:01:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     marek.behun@nic.cz, jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH] Add multicolor to the list.
Message-ID: <20200803120142.llmwjyfh5adsq4yw@duo.ucw.cz>
References: <20200727084500.GA15237@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fcvfhp6fn7ui4ooj"
Content-Disposition: inline
In-Reply-To: <20200727084500.GA15237@amd>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--fcvfhp6fn7ui4ooj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


commit ddfd8931c942a64c1ebdd7b93a4f18c84bd3b97b
Author: Pavel Machek <pavel@ucw.cz>
Date:   Mon Aug 3 13:20:06 2020 +0200

    Multicolor is a bit too abstract. Yes, we can have
    Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
    RGB, and not even RGB-White or RGB-Yellow variants emerged.
   =20
    Multicolor is not a good fit for RGB LED. It does not really know
    about LED color.  In particular, there's no way to make LED "white".
   =20
    Userspace is interested in knowing "this LED can produce arbitrary
    color", which not all multicolor LEDs can.
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 846248a0693d..a6dce01dbd5e 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -35,6 +35,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] =3D {
 	[LED_COLOR_ID_YELLOW] =3D "yellow",
 	[LED_COLOR_ID_IR] =3D "ir",
 	[LED_COLOR_ID_MULTI] =3D "multicolor",
+	[LED_COLOR_ID_RGB] =3D "rgb",
 };
 EXPORT_SYMBOL_GPL(led_colors);
=20
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-c=
ommon.c
index af14e2b2d577..56210f4ad919 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -638,7 +638,7 @@ static int lp55xx_parse_logical_led(struct device_node =
*np,
 	if (ret)
 		return ret;
=20
-	if (led_color =3D=3D LED_COLOR_ID_MULTI)
+	if (led_color =3D=3D LED_COLOR_ID_RGB)
 		return lp55xx_parse_multi_led(np, cfg, child_number);
=20
 	ret =3D  lp55xx_parse_common_child(np, cfg, child_number, &chan_nr);
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/c=
ommon.h
index a463ce6a8794..52b619d44ba2 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -30,8 +30,10 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MULTI	8
-#define LED_COLOR_ID_MAX	9
+#define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
+#define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary co=
lor,
+					   so this would include RGBW and similar */
+#define LED_COLOR_ID_MAX	10
=20
 /* Standard LED functions */
 /* Keyboard LEDs, usually it would be input4::capslock etc. */

--fcvfhp6fn7ui4ooj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXyf8pgAKCRAw5/Bqldv6
8tWQAJ42iFHmLJecI1u0IrgkQTvhdRHUSwCfS5kc9OJQxJxFzoi01nFQDmor2nQ=
=4Cha
-----END PGP SIGNATURE-----

--fcvfhp6fn7ui4ooj--
