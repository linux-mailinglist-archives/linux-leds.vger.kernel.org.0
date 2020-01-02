Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC56712EB80
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jan 2020 22:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgABVpv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Jan 2020 16:45:51 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57248 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgABVpu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Jan 2020 16:45:50 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 88A261C25EC; Thu,  2 Jan 2020 22:45:48 +0100 (CET)
Date:   Thu, 2 Jan 2020 22:45:48 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmurphy@ti.com
Subject: leds: lm3642: remove warnings for bad strtol, cleanup gotos
Message-ID: <20200102214547.GA3616@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've applied this to for-next tree. If you see something very wrong,
let me know.

--

    leds: lm3642: remove warnings for bad strtol, cleanup gotos
   =20
    Bad string from userspace is not worth printing warning on; gotos that
    just directly return are not good, plus a comment fix.
   =20
    Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kerne=
l@vger.kernel.org, dmurphy@ti.com
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 480575442ed8..4232906fcb75 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -106,7 +106,7 @@ static int lm3642_control(struct lm3642_chip_data *chip,
 	ret =3D regmap_read(chip->regmap, REG_FLAG, &chip->last_flag);
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to read REG_FLAG Register\n");
-		goto out;
+		return ret;
 	}
=20
 	if (chip->last_flag)
@@ -146,11 +146,11 @@ static int lm3642_control(struct lm3642_chip_data *ch=
ip,
 		break;
=20
 	default:
-		return ret;
+		return -EINVAL;
 	}
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to write REG_I_CTRL Register\n");
-		goto out;
+		return ret;
 	}
=20
 	if (chip->tx_pin)
@@ -159,13 +159,12 @@ static int lm3642_control(struct lm3642_chip_data *ch=
ip,
 	ret =3D regmap_update_bits(chip->regmap, REG_ENABLE,
 				 MODE_BITS_MASK << MODE_BITS_SHIFT,
 				 opmode << MODE_BITS_SHIFT);
-out:
 	return ret;
 }
=20
 /* torch */
=20
-/* torch pin config for lm3642*/
+/* torch pin config for lm3642 */
 static ssize_t lm3642_torch_pin_store(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf, size_t size)
@@ -178,7 +177,7 @@ static ssize_t lm3642_torch_pin_store(struct device *de=
v,
=20
 	ret =3D kstrtouint(buf, 10, &state);
 	if (ret)
-		goto out_strtoint;
+		return ret;
 	if (state !=3D 0)
 		state =3D 0x01 << TORCH_PIN_EN_SHIFT;
=20
@@ -186,16 +185,12 @@ static ssize_t lm3642_torch_pin_store(struct device *=
dev,
 	ret =3D regmap_update_bits(chip->regmap, REG_ENABLE,
 				 TORCH_PIN_EN_MASK << TORCH_PIN_EN_SHIFT,
 				 state);
-	if (ret < 0)
-		goto out;
+	if (ret < 0) {
+		dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
+		return ret;
+	}
=20
 	return size;
-out:
-	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
-	return ret;
-out_strtoint:
-	dev_err(chip->dev, "%s: fail to change str to int\n", __func__);
-	return ret;
 }
=20
 static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
@@ -229,7 +224,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *d=
ev,
=20
 	ret =3D kstrtouint(buf, 10, &state);
 	if (ret)
-		goto out_strtoint;
+		return ret;
 	if (state !=3D 0)
 		state =3D 0x01 << STROBE_PIN_EN_SHIFT;
=20
@@ -237,16 +232,12 @@ static ssize_t lm3642_strobe_pin_store(struct device =
*dev,
 	ret =3D regmap_update_bits(chip->regmap, REG_ENABLE,
 				 STROBE_PIN_EN_MASK << STROBE_PIN_EN_SHIFT,
 				 state);
-	if (ret < 0)
-		goto out;
+	if (ret < 0) {
+		dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
+		return ret;
+	}
=20
 	return size;
-out:
-	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
-	return ret;
-out_strtoint:
-	dev_err(chip->dev, "%s: fail to change str to int\n", __func__);
-	return ret;
 }
=20
 static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4OZIsACgkQMOfwapXb+vJ5yQCeIEdYuR6T299iXmfBG1IzksO+
VgwAoL3CJVlauuqPxDpaPAx3H/+p2q8N
=K6X0
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
