Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 025599FD85
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 10:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfH1Ixm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 04:53:42 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52922 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfH1Ixm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 04:53:42 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 40846825C1; Wed, 28 Aug 2019 10:53:26 +0200 (CEST)
Date:   Wed, 28 Aug 2019 10:53:39 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: [FYI] lm3532: right registration to work with LED-backlight
Message-ID: <20190828085339.GB2923@amd>
References: <20190827215205.59677-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20190827215205.59677-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Eventually, these will be needed.

Best regards,
								Pavel

commit 38d956977a7d6cbdc811676f9b4033da7487e045
Author: Pavel <pavel@ucw.cz>
Date:   Wed Aug 7 12:43:52 2019 +0200

    d4: lm3532 needs to use right register function for backlight to work.

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 365a22a5..f98e657 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -629,7 +629,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
=20
 		lm3532_init_registers(led);
=20
-		ret =3D devm_led_classdev_register(priv->dev, &led->led_dev);
+		ret =3D devm_of_led_classdev_register(priv->dev, to_of_node(child), &led=
->led_dev);
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);


diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/o=
map4-droid4-xt894.dts
index 4454449..64abe87 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -185,6 +185,14 @@
 		pwm-names =3D "enable", "direction";
 		direction-duty-cycle-ns =3D <10000000>;
 	};
+
+	backlight: backlight {
+	         compatible =3D "led-backlight";
+
+		 leds =3D <&backlight_led>;
+		 brightness-levels =3D <0 4 8 16 32 64 128 255>;
+		 default-brightness-level =3D <6>;
+	};
 };
=20
 &dss {
@@ -208,6 +216,8 @@
 		vddi-supply =3D <&lcd_regulator>;
 		reset-gpios =3D <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
=20
+		backlight =3D <&backlight>;
+
 		width-mm =3D <50>;
 		height-mm =3D <89>;
=20
@@ -389,12 +427,11 @@
 		ramp-up-us =3D <1024>;
 		ramp-down-us =3D <8193>;
=20
-		led@0 {
+		backlight_led: led@0 {
 			reg =3D <0>;
 			led-sources =3D <2>;
 			ti,led-mode =3D <0>;
 			label =3D ":backlight";
-			linux,default-trigger =3D "backlight";
 		};
=20
 		led@1 {

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1mQRMACgkQMOfwapXb+vK0hACgtFoq2r7pDwvtVDCnYsULvPVW
SPwAoIFNH+S+vjvcv++0lWkyUU92tEma
=aEUJ
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
