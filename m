Return-Path: <linux-leds+bounces-7674-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PW/NkwV2GmFXQgAu9opvQ
	(envelope-from <linux-leds+bounces-7674-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 23:08:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E63CFC9F
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 23:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70E3C300E38E
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 21:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F4636E494;
	Thu,  9 Apr 2026 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rYO/YZQS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1A342CBA;
	Thu,  9 Apr 2026 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768800; cv=none; b=KEwseOS1DXMsQVAZoXilmjZXZ5l2KrgdTAyQi/Od5PRM6iexHSfOri6AZBmcRr0pHLGofYdrMzy8kHVBLCDdJ7olqghE1hbRVT5RY+SnmoDjJowsyGztHu4/OUa+p7CRUxucb6CNHLxXzXuCTVRs1xz11/2LcQvyvgM5bL4vNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768800; c=relaxed/simple;
	bh=p0APuj+L/eXQMcmgBR6Z0oXsN8B4rgyhz7EZUhJWaTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jvzbr2uYGfowQD134OzUOhRZJc76HoInOuAHXkoouGxdMmI6WxPybhZJGaV1f7MWPoYkVP/VywrB0g+lXu4yX49zI5kAP07l3Lpk+NOHW7H0SWjdRpjk0u0kg3d/m4rmTMSR2ZZr25lOuKnqkV6UigOuFM1XgxsNI0LiOOoVP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rYO/YZQS; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775768795; x=1776373595; i=w_armin@gmx.de;
	bh=gKl3AR6YxI6bhGoX79wW1vMsEGL6LMSdoV39q/BYsxU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rYO/YZQScAFnt2wBreEIMBFTX79ay7t+0UDOScG1jADAWsPoZ5Gw5xD8aE2xr93w
	 d0F4ZQtn3utcTFh82V+d1MB+I+1OQgZXk2Toa8fHp/3AJEbcC/yEXTOThzuZfu1c5
	 Cl8qOvOmBFf5liBf8BsoACLb6J2knQTYeQZhTJRoXaeLWdVygXBLBvwwb4VSaEjrT
	 WOUo/Rize5JGJEG8if+fHzLL0ToNrfjTTMkuwkBORs5eW4mJisDnMJLcsKbFWzzgE
	 xUAQI+V6p471PNbPv3KuFZTrY7OuJlcBVGyi6q+SZxkjI93ajvgmFQapLyIENn+DH
	 gIN7E/MLAmlT2Kl0Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1vqv7d3a7j-00HiM5; Thu, 09
 Apr 2026 23:06:34 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jacek.anaszewski@gmail.com,
	pobrn@protonmail.com,
	m.tretter@pengutronix.de,
	wse@tuxedocomputers.com
Subject: [PATCH v3 1/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Thu,  9 Apr 2026 23:06:29 +0200
Message-Id: <20260409210629.9934-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260409210629.9934-1-W_Armin@gmx.de>
References: <20260409210629.9934-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YdfDlT9D99dSKQSXUXd3ssqQEdOUcHayrNUlQncHQzH/GfxmNDp
 arak+bXdMdq89uW9I9z9Qdb5EhOL0KzGwQKE5vOkKPuOytE9pEoBaE52owu19EZvkZ2tPMY
 L/I+z2CE/CH1Ogopzk7XSzyQsl3o2oyq0uCeb6xCfUp4m4fn1skptsu80oa7zAh9HY4dvbU
 xCJATmyJz7EBzOkkAkzNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b/2ZwMngsKc=;DPZwSPlygLfBsLkRF/G0vQo0Eyr
 +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
 nNYkEfiqDYpNJ9A==
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,gmail.com,protonmail.com,pengutronix.de,tuxedocomputers.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-7674-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:email,gmx.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxedocomputers.com:email,ti.com:email]
X-Rspamd-Queue-Id: 4A9E63CFC9F
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

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
index db9f34c6736e..45469388bb1a 100644
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
+ * do no support global brightness control in hardware, so they use
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


