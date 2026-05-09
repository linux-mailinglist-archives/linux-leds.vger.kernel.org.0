Return-Path: <linux-leds+bounces-8062-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM4DMUir/2k49AAAu9opvQ
	(envelope-from <linux-leds+bounces-8062-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 09 May 2026 23:46:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD534501943
	for <lists+linux-leds@lfdr.de>; Sat, 09 May 2026 23:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C33BC3002F49
	for <lists+linux-leds@lfdr.de>; Sat,  9 May 2026 21:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0123BD648;
	Sat,  9 May 2026 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G7KaFKed"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DCA34CFDE;
	Sat,  9 May 2026 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363199; cv=none; b=KSfiJ2Ka6av2jL+5jeBoBDvohIKU6AZ/dOrQVaU6lII06xOezoUpRLQ4k7QjOkuKBQY/TfXRQyQdtbtPbVBrYzuT17GeUzX/otI7EEbSHiDAv6Fl2/QMAlQLCtjYxZ2ltWlzSrBMcYn9qlZpuXCYu0M3czZ0VOoah4eN59K2Grs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363199; c=relaxed/simple;
	bh=RtUE+ZbezVzikk4J4swt/vLlkVhmDtLvwsB6KCAAfeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBG40XsmR2kSP8sDzN/qtgcR8IVo3dg0iqB3R9yVXq/AET76iGhl+SkHrTiA61xHs4Ei+pUSVlVkDtfyk3wM45QR9g3fVNVFb1BDEmLVQgaNOK3uiNpbCpH/G7MSr6pv0DFRt2qmVddaNKHlI8RFy29/Jd5ogxzxF3C203gz15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G7KaFKed; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778363171; x=1778967971; i=w_armin@gmx.de;
	bh=Mz/RMbDCOHF0see5nbkSkLNxJAwVCBandkmvotfx66Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G7KaFKed4zHROioDptS8zygMGBhX+isu3BcDrGxqm42X8D972uf4hFMutD4mKIdC
	 SPOH0x0ALt5LTATnMTDZ6jExCWZ4GOOFINHrEO2jIfdx+DD/BNe4MY6MIk7GXx7dh
	 NiCuklyuK/xFOtci2VP3Pbdb/FFBZq3BMpBO5BHS6t6Em5hvERBq91nNd+aGHv91y
	 1u3rbTIxIWqkpyNiJROnBQj9JUubxU/J9oShPUm/M61gQ/mOOZ89RAieqwS5N9fJW
	 ZsLb6NJMdVAeEX14mQczBtugvK3uOSk/y0ptKyMQWZm+eVBj2yE5Ch85Jb8YsHYNY
	 LIMG5gBW3LcriwBopw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1wIWeE3GKC-00DtiS; Sat, 09
 May 2026 23:46:10 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	wse@tuxedocomputers.com,
	jacek.anaszewski@gmail.com,
	pobrn@protonmail.com,
	m.tretter@pengutronix.de
Subject: [PATCH v4 1/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Sat,  9 May 2026 23:46:03 +0200
Message-Id: <20260509214603.262368-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260509214603.262368-1-W_Armin@gmx.de>
References: <20260509214603.262368-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:naDEBQE7+7tScMvaxR6gZmj4obCx7U9GDhCcOoads2wzI2Ox9vC
 AjmFMiv50LUNjyD8C76A2FT35ujSi1l66PIGBJknQt+gf9JVDlBTzRMCBvAyxHgNKy3QaLn
 15wpeAvTMCaHmizKDEAuL5uioJxfa9RPre/a2i6OHCw9CHo9FJjpRG7yiwD9hcTQV7iXwkk
 DnumoHj9jFqTuOFb91xMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jrPEcxE8pnk=;Gn1AknNDqsZ2RQ7fZfy9COlKss1
 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
 zWx+vQ==
X-Rspamd-Queue-Id: BD534501943
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8062-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxedocomputers.com:email,gmx.de:email,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Action: no action

Some multicolor LEDs support global brightness control in hardware,
meaning that the maximum intensity of the color components is not
connected to the maximum global brightness. Such LEDs cannot be
described properly by the current multicolor LED class interface,
because it assumes that the maximum intensity of each color component
is described by the maximum global brightness of the LED.

Fix this by introducing a new sysfs attribute called
"multi_max_intensity" holding the maximum intensity values for the
color components of a multicolor LED class device. Drivers can use
the new max_intensity field inside struct mc_subled to tell the
multicolor LED class code about those values. Intensity values written
by userspace applications will be limited to this maximum value.

Drivers for multicolor LEDs that do not support global brightness
control in hardware might still want to use the maximum global LED
brightness supplied via devicetree as the maximum intensity of each
individual color component. Such drivers should set max_intensity
to 0 so that the multicolor LED core can act accordingly.

The lp50xx and ncp5623 LED drivers already use hardware-based control
for the global LED brightness. Modify those drivers to correctly
initalize .max_intensity to avoid being limited to the maximum global
brightness supplied via devicetree.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Reviewed-by: Lee Jones <lee@kernel.org>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
 Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
 drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
 drivers/leds/leds-lp50xx.c                    |  1 +
 drivers/leds/rgb/leds-ncp5623.c               |  4 +-
 include/linux/led-class-multicolor.h          | 30 +++++++++++-
 6 files changed, 113 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docume=
ntation/ABI/testing/sysfs-class-led-multicolor
index 16fc827b10cb..197da3e775b4 100644
=2D-- a/Documentation/ABI/testing/sysfs-class-led-multicolor
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -16,9 +16,22 @@ Date:		March 2020
 KernelVersion:	5.9
 Contact:	Dan Murphy <dmurphy@ti.com>
 Description:	read/write
-		This file contains array of integers. Order of components is
-		described by the multi_index array. The maximum intensity should
-		not exceed /sys/class/leds/<led>/max_brightness.
+		This file contains an array of integers. The order of components
+		is described by the multi_index array. The maximum intensity value
+		supported by each color component is described by the multi_max_intensi=
ty
+		file. Writing intensity values larger than the maximum value of a
+		given color component will result in those values being clamped.
+
+		For additional details please refer to
+		Documentation/leds/leds-class-multicolor.rst.
+
+What:		/sys/class/leds/<led>/multi_max_intensity
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:	read
+		This file contains an array of integers describing the maximum
+		intensity value for each intensity component.
=20
 		For additional details please refer to
 		Documentation/leds/leds-class-multicolor.rst.
diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/=
leds/leds-class-multicolor.rst
index c6b47b4093c4..68340644f80b 100644
=2D-- a/Documentation/leds/leds-class-multicolor.rst
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -25,10 +25,14 @@ color name to indexed value.
 The ``multi_index`` file is an array that contains the string list of the=
 colors as
 they are defined in each ``multi_*`` array file.
=20
-The ``multi_intensity`` is an array that can be read or written to for th=
e
+The ``multi_intensity`` file is an array that can be read or written to f=
or the
 individual color intensities.  All elements within this array must be wri=
tten in
 order for the color LED intensities to be updated.
=20
+The ``multi_max_intensity`` file is an array that contains the maximum in=
tensity
+value supported by each color intensity. Intensity values above this will=
 be
+automatically clamped into the supported range.
+
 Directory Layout Example
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 .. code-block:: console
@@ -38,6 +42,7 @@ Directory Layout Example
     -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightne=
ss
     -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
     -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intens=
ity
+    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_max_in=
tensity
=20
 ..
=20
@@ -104,3 +109,17 @@ the color LED group.
     128
=20
 ..
+
+Writing intensity values larger than the maximum specified in ``multi_max=
_intensity``
+will result in those values being clamped into the supported range.
+
+.. code-block:: console
+
+   # cat /sys/class/leds/multicolor:status/multi_max_intensity
+   255 255 255
+
+   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intensity
+   # cat /sys/class/leds/multicolor:status/multi_intensity
+   255 255 255
+
+..
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 6b671f3f9c61..59d46f8a90d5 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -7,10 +7,29 @@
 #include <linux/init.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
=20
+static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
+{
+	unsigned int max_intensity;
+
+	/*
+	 * The maximum global brightness value might still be changed by
+	 * led_classdev_register_ext() using devicetree properties. This
+	 * prevents us from changing subled_info[X].max_intensity when
+	 * registering a multicolor LED class device, so we have to do
+	 * this during runtime.
+	 */
+	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
+	if (max_intensity)
+		return max_intensity;
+
+	return mcled_cdev->led_cdev.max_brightness;
+}
+
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness)
 {
@@ -27,6 +46,26 @@ int led_mc_calc_color_components(struct led_classdev_mc=
 *mcled_cdev,
 }
 EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
=20
+static ssize_t multi_max_intensity_show(struct device *dev,
+					struct device_attribute *intensity_attr, char *buf)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
+	unsigned int max_intensity;
+	int len =3D 0;
+
+	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
+		if (i < mcled_cdev->num_colors - 1)
+			len +=3D sprintf(buf + len, " ");
+	}
+
+	buf[len++] =3D '\n';
+	return len;
+}
+static DEVICE_ATTR_RO(multi_max_intensity);
+
 static ssize_t multi_intensity_store(struct device *dev,
 				struct device_attribute *intensity_attr,
 				const char *buf, size_t size)
@@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *dev,
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
 	int nrchars, offset =3D 0;
 	unsigned int intensity_value[LED_COLOR_ID_MAX];
+	unsigned int max_intensity;
 	int i;
 	ssize_t ret;
=20
@@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device *dev=
,
 		goto err_out;
 	}
=20
-	for (i =3D 0; i < mcled_cdev->num_colors; i++)
-		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
+	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_in=
tensity);
+	}
=20
 	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
 		led_set_brightness(led_cdev, led_cdev->brightness);
@@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev,
 static DEVICE_ATTR_RO(multi_index);
=20
 static struct attribute *led_multicolor_attrs[] =3D {
+	&dev_attr_multi_max_intensity.attr,
 	&dev_attr_multi_intensity.attr,
 	&dev_attr_multi_index.attr,
 	NULL,
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index e2a9c8592953..69c3550f1a31 100644
=2D-- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			}
=20
 			mc_led_info[multi_index].color_index =3D color_id;
+			mc_led_info[multi_index].max_intensity =3D 255;
 			num_colors++;
 		}
=20
diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp56=
23.c
index 85d6be6fff2b..f2528f06507d 100644
=2D-- a/drivers/leds/rgb/leds-ncp5623.c
+++ b/drivers/leds/rgb/leds-ncp5623.c
@@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev *c=
dev,
 	for (int i =3D 0; i < mc_cdev->num_colors; i++) {
 		ret =3D ncp5623_write(ncp->client,
 				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
-				    min(mc_cdev->subled_info[i].intensity,
-					NCP5623_MAX_BRIGHTNESS));
+				    mc_cdev->subled_info[i].intensity);
 		if (ret)
 			return ret;
 	}
@@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
 			goto release_led_node;
=20
 		subled_info[ncp->mc_dev.num_colors].channel =3D reg;
+		subled_info[ncp->mc_dev.num_colors].max_intensity =3D NCP5623_MAX_BRIGH=
TNESS;
 		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index;
 	}
=20
diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-clas=
s-multicolor.h
index db9f34c6736e..8a05836cae25 100644
=2D-- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -9,10 +9,31 @@
 #include <linux/leds.h>
 #include <dt-bindings/leds/common.h>
=20
+/**
+ * struct mc_subled - Color component description.
+ * @color_index: Color ID.
+ * @brightness: Scaled intensity.
+ * @intensity: Current intensity.
+ * @max_intensity: Maximum supported intensity value.
+ * @channel: Channel index.
+ *
+ * Describes a color component of a multicolor LED. Many multicolor LEDs
+ * do not support global brightness control in hardware, so they use
+ * the brightness field in connection with led_mc_calc_color_components()
+ * to perform the intensity scaling in software.
+ * Such drivers should set max_intensity to 0 to signal the multicolor LE=
D core
+ * that the maximum global brightness of the LED class device should be u=
sed for
+ * limiting incoming intensity values.
+ *
+ * Multicolor LEDs that do support global brightness control in hardware
+ * should instead set max_intensity to the maximum intensity value suppor=
ted
+ * by the hardware for a given color component.
+ */
 struct mc_subled {
 	unsigned int color_index;
 	unsigned int brightness;
 	unsigned int intensity;
+	unsigned int max_intensity;
 	unsigned int channel;
 };
=20
@@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct device =
*parent,
  */
 void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cde=
v);
=20
-/* Calculate brightness for the monochrome LED cluster */
+/**
+ * led_mc_calc_color_components() - Calculates component brightness value=
s of a LED cluster.
+ * @mcled_cdev - Multicolor LED class device of the LED cluster.
+ * @brightness - Global brightness of the LED cluster.
+ *
+ * Calculates the brightness values for each color component of a monochr=
ome LED cluster,
+ * see Documentation/leds/leds-class-multicolor.rst for details.
+ */
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness);
=20
=2D-=20
2.39.5


