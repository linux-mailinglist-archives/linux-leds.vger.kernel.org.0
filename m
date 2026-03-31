Return-Path: <linux-leds+bounces-7613-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLf3KJEdzGnHPgYAu9opvQ
	(envelope-from <linux-leds+bounces-7613-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 21:16:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561D37073F
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 21:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBEB8301468D
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E563A5E83;
	Tue, 31 Mar 2026 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sHxWtcLc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61CB390223;
	Tue, 31 Mar 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984587; cv=none; b=S0h9ncQeamLtb7AkAsjZijHg8DKneSQKgkksdFQvX9W7DA2uMJTM/FFVhL+MNwwWZaQ6A9Ckl4nYFGd5Q6ycj3A0M3nP8oVvFZK38h+S7wxvEvHS3HqqqaF+HyG9TPa+8QX/1/EvhRKHFmJOraNq7zunirK3n8PW1bxi9L4O9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984587; c=relaxed/simple;
	bh=ZfEvLnv/6H+Qq0yUnKNZRdfCowwGLZTCwsWmEaCv0OY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YuY/qy2XbGVPj2vcQSzPPs1ZLKY3GOAVkplrdZ9skSByS0bEFMhv1JKJL7t9lrNIkd4tLSCrssN3P7VGwKt++6grWZTf/6FBx6qzTe1yP5/wURat51KoVgHqIQ/2EYE3PrNSZ6Ei4p/eHnk2p+by/I4e8bYKFu/hW/UV6iTu82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sHxWtcLc; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774984582; x=1775589382; i=w_armin@gmx.de;
	bh=HbJqrWDOd39PoFduwxTkT/bZlz1kNN7KylqpvpSoyYk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sHxWtcLc2bsJKKqMqSoudMjJitxKCAbm9UMu6lH1qU5wQV4zD/lqN334RwdRxXnN
	 odKGa4E2VO0kr9Q1Vn1qcetBJTtwgR4awO+iQ/iLiQls8beDQh2+XUyDSQ1wwh6Gf
	 tJT9anln9CnmwgLkIU4bbf3+9SjCpm1QUM1jqqYT0FRa8EA5UsZDAYb8ZdX6R0rHg
	 6D1PS0EtORYejI8J1SQMTOcHf6UicTKBBoU5mPaWQ1t/3pp94kCKtV39CmW5bq1a4
	 hVrlPKZG53Z4Ij74Boy50C4rffoHcbUGYq2YTVnRHs1J/ZWF8dSEm0R+iuHQCXzGT
	 Lms/bHJfv2ffBvu0ig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbBk-1vGVii1jGw-00uRWZ; Tue, 31
 Mar 2026 21:16:22 +0200
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
Subject: [PATCH v2 1/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Tue, 31 Mar 2026 21:16:19 +0200
Message-Id: <20260331191619.3729-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331191619.3729-1-W_Armin@gmx.de>
References: <20260331191619.3729-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EMq/QfjZhLVnrGcvmakXMVAqRQB+y0xn27zkuhSV6tNQpozsWfx
 82zvb1UkFOxK6Prm3YGLt3apr2JUSQZXaczl7ZqQoa5RabQ81h9J2ejKAwXHg6YsB/ms4qA
 FxsPSCYZLgVuQ0ig0J0AUnOfWfnk8FGD/z3nzRN07F7mhd+JJt3TEayjKaVKm5kyK1Xso8F
 qG/uwrS4w9IL3MLzO8nbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0KKvniwoUCc=;ZPDy/60ChojkFn0GAp0sBppMlln
 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
 M4BfS2ePTUB/ub40YvWob3JQ==
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-7613-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:dkim,gmx.de:email,gmx.de:mid]
X-Rspamd-Queue-Id: 4561D37073F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 6b671f3f9c61..8d763b1ae76f 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -7,10 +7,28 @@
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
+	/* The maximum global brightness value might still be changed by
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
@@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classdev_mc=
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
+	int i;
+
+	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
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
+	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
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
index db9f34c6736e..6f89d92566b2 100644
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
+ * do no support gobal brightness control in hardware, so they use
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


