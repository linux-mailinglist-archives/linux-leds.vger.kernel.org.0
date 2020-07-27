Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8506822EA6F
	for <lists+linux-leds@lfdr.de>; Mon, 27 Jul 2020 12:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgG0Kw3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Jul 2020 06:52:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44712 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgG0Kw3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jul 2020 06:52:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CAC6E1C0BD4; Mon, 27 Jul 2020 12:52:26 +0200 (CEST)
Date:   Mon, 27 Jul 2020 12:52:26 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: Re: We have multicolor, but should we turn it into RGB?
Message-ID: <20200727105226.GA17807@amd>
References: <20200727084500.GA15237@amd>
 <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Multicolor is a bit too abstract. Yes, we can have
> > Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
> > RGB, and not even RGB-White or RGB-Yellow variants emerged.
> >=20
> > Multicolor is not a good fit for RGB LED. It does not really know
> > about LED color.  In particular, there's no way to make LED "white".
> >=20
> > Userspace is interested in knowing "this LED can produce arbitrary
> > color", which not all multicolor LEDs can.
> >=20
> > 	Proposal: let's add "rgb" to led_colors in
> > 	drivers/leds/led-core.c, add corresponding device tree
> > 	defines, and use that, instead of multicolor for RGB LEDs.
> >=20
> > 	We really need to do that now; "white" stuff can wait.
> >=20
> > RGB LEDs are quite common, and it would be good to be able to turn LED
> > white and to turn it into any arbitrary color. It is essential that
> > userspace is able to set arbitrary colors, and it might be good to
> > have that ability from kernel, too... to allow full-color triggers.
> >=20
> > Best regads,
> > 									Pavel
>=20
> I am not against adding RGB if you want to somehow teach the subsystem
> to mix arbitrary color (either by teaching it color curves or some
> other way). But I think we shouldn't remove multicolor, and here's the
> reason why:

Something like this?

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.y=
aml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index b55e1f1308a4..e820040a09d9 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -25,11 +25,15 @@ patternProperties:
     description: Represents the LEDs that are to be grouped.
     properties:
       color:
-        const: 8  # LED_COLOR_ID_MULTI
+        minimum: 8  # LED_COLOR_ID_MULTI
+	maximum: 9  # LED_COLOR_ID_RGB
         description: |
-          For multicolor LED support this property should be defined as
+          For non-RGB multicolor LEDs this property should be defined as
           LED_COLOR_ID_MULTI which can be found in include/linux/leds/comm=
on.h.
=20
+	  For LEDs that can display arbitrary color (RGB, RGBW, etc), this
+	  property should be defined as LED_COLOR_ID_RGB.
+
     $ref: "common.yaml#"
=20
     required:
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
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-om=
nia.c
index bb23d8e16614..5c360632170a 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -94,15 +94,15 @@ static int omnia_led_register(struct i2c_client *client=
, struct omnia_led *led,
 		dev_warn(dev,
 			 "Node %pOF: must contain 'reg' property with values between 0 and %i\n=
",
 			 np, OMNIA_BOARD_LEDS - 1);
-		return 0;
+		return 0; /* FIXME: should return 0/errrno */
 	}
=20
 	ret =3D of_property_read_u32(np, "color", &color);
-	if (ret || color !=3D LED_COLOR_ID_MULTI) {
+	if (ret || color !=3D LED_COLOR_ID_RGB) {
 		dev_warn(dev,
-			 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_MULT=
I\n",
+			 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_RGB\=
n",
 			 np);
-		return 0;
+		return 0; /* FIXME: should return 0/errrno */
 	}
=20
 	led->subled_info[0].color_index =3D LED_COLOR_ID_RED;
@@ -145,7 +145,7 @@ static int omnia_led_register(struct i2c_client *client=
, struct omnia_led *led,
 		return ret;
 	}
=20
-	return 1;
+	return 1; /* FIXME: should return 0/errrno */
 }
=20
 /*
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


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8eseoACgkQMOfwapXb+vJbxgCggMoy4zxm+aJEDxO546KM/BJQ
K/sAoJw8RR9THUCayImniPRskI0jE4iG
=ifeD
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
