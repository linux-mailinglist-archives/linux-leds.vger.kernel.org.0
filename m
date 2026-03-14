Return-Path: <linux-leds+bounces-7348-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFy8FdDotWmD6wAAu9opvQ
	(envelope-from <linux-leds+bounces-7348-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 00:01:36 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C270328F69E
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 00:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81630301BEC5
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 23:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F2923A562;
	Sat, 14 Mar 2026 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cpkdKO2U"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B62772D;
	Sat, 14 Mar 2026 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773529292; cv=none; b=k/8bAmXPCM7Da07KFfQWZFAmzJ+0oZJX2xgptaXWHO7XzUjV89snDrT/NSYgkMhjO3CmPPPqA5K9FcvNzMC6PaMLk7sIUZ14168Opno2szWFaVRKIHrzuGv+I+S62AGGnb6FQmVpwClUgI2Fq0GnnvdS8zPsXoThd9zwHdKe/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773529292; c=relaxed/simple;
	bh=rmjpKO+hu+j1JK0WnSEBxUJKdewO2CV+mF7yqWHDftU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WW/YK8gMNm8Lgzx+08oXVJM/Z1soXNZ1e6QftolMlbwIWC4oQVtQN+upyR+jkYU8hM1p1Z+B1hOuQjTPmt3Nr3Lef/6bzAwY9zyooRuyZIsgG9kFuQPOl2LkliwwSCw9YZ40nESIGzgQcJjrhuHVRjLBDym2AWVZPVwpuVcrkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cpkdKO2U; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773529278; x=1774134078; i=w_armin@gmx.de;
	bh=suvP+1i0TNddX8zchrv2DdEcGcbAvNvEquEooaTBD8A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cpkdKO2UBi2YBxqpcigMefOaNvDQkXfZW9g5QS00eCRsmSRrVUrto9HfshdxbPC6
	 QnPNwnoin9MGXevA7DItrMUXc10v+48eMNIA1dJzsj8RhwUAM/zPIxBow11MDOKgx
	 fNvmqQqcLb/7eJlZhUevIcci2OeGoyX8RwzCuwMpfPqxi+8qe47lxgFZ62zq4eMmo
	 RHJDLzi0mkYaCSjtJvaoCD3TOESlh+NFJmdjovVCKPAdpTxGbzGDIbZhtzwWfIgkW
	 GLdFJIiOlxooQgFrExcxSpk0udJoKO1brr4xdr0MRAztuyfMIOn6mUyaB02MSf0+5
	 CxZe3gkmO0QC3605YA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1vI0Xz2DMj-00iVEX; Sun, 15
 Mar 2026 00:01:18 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com,
	pobrn@protonmail.com
Subject: [RFC PATCH 1/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Sun, 15 Mar 2026 00:01:07 +0100
Message-Id: <20260314230107.65444-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314230107.65444-1-W_Armin@gmx.de>
References: <20260314230107.65444-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9nMIYXVPc1Q1Zxah8+HlR+fxzRXb8sbjzgvZA5XtgLVYI5oDEKq
 5ytCDUZN7SpHR2zVsJuE7x6t2QqR+CAgtPQyHJmDd9leCPpAGjZ3gdFQyt/RROm1Ti2hQty
 CYQiu+6hhnDP5d5VxLopqhmSAdW8Y5NTAS0HjS3ixbGSqnUaWnZwZjXm6CUbpHAV8Dsp/dK
 XNAcw7A3ffINCTqb+mLUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YzKJzoPIaWo=;WnaKJwywq5Jazj+LtQu/YqBVfma
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,tuxedocomputers.com,protonmail.com];
	TAGGED_FROM(0.00)[bounces-7348-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmx.de:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:email,gmx.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email]
X-Rspamd-Queue-Id: C270328F69E
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
to LED_USE_MAX_BRIGHTNESS so that the multicolor LED core can act
accordingly.

Compile-tested only.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-class-led-multicolor    | 16 +++++++--
 Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++++-
 drivers/hid/hid-lg-g15.c                      |  3 ++
 drivers/hid/hid-playstation.c                 |  3 ++
 drivers/leds/flash/leds-mt6360.c              |  8 ++---
 drivers/leds/led-class-multicolor.c           | 36 +++++++++++++++++--
 drivers/leds/leds-blinkm.c                    |  3 ++
 drivers/leds/leds-cros_ec.c                   |  1 +
 drivers/leds/leds-lp50xx.c                    |  1 +
 drivers/leds/leds-lp55xx-common.c             |  7 ++--
 drivers/leds/leds-max77705.c                  |  1 +
 drivers/leds/leds-sun50i-a100.c               |  3 ++
 drivers/leds/leds-turris-omnia.c              |  1 +
 drivers/leds/rgb/leds-group-multicolor.c      |  1 +
 drivers/leds/rgb/leds-ktd202x.c               |  1 +
 drivers/leds/rgb/leds-lp5812.c                |  1 +
 drivers/leds/rgb/leds-mt6370-rgb.c            |  8 ++---
 drivers/leds/rgb/leds-ncp5623.c               |  4 +--
 drivers/leds/rgb/leds-pwm-multicolor.c        |  1 +
 drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
 drivers/platform/x86/silicom-platform.c       | 30 ++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-acpi.c   |  4 +--
 include/linux/led-class-multicolor.h          | 32 ++++++++++++++++-
 23 files changed, 164 insertions(+), 23 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docume=
ntation/ABI/testing/sysfs-class-led-multicolor
index 16fc827b10cb..fbd95c5003e2 100644
=2D-- a/Documentation/ABI/testing/sysfs-class-led-multicolor
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -17,8 +17,20 @@ KernelVersion:	5.9
 Contact:	Dan Murphy <dmurphy@ti.com>
 Description:	read/write
 		This file contains array of integers. Order of components is
-		described by the multi_index array. The maximum intensity should
-		not exceed /sys/class/leds/<led>/max_brightness.
+		described by the multi_index array.
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
+		intensity value for each intensity component. Writing intensity
+		values larger than the maximum value of a given component will
+		result in those values being clamped.
=20
 		For additional details please refer to
 		Documentation/leds/leds-class-multicolor.rst.
diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/=
leds/leds-class-multicolor.rst
index c6b47b4093c4..8f42f10078ad 100644
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
+    -r--r--r--    1 root     root          4096 OCt 19 16:16 multi_max_in=
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
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 1a88bc44ada4..227f50b21c06 100644
=2D-- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -975,14 +975,17 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data =
*g15, int index)
 		case LED_COLOR_ID_RED:
 			subled_info[i].color_index =3D LED_COLOR_ID_RED;
 			subled_info[i].intensity =3D gled->red;
+			subled_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 			break;
 		case LED_COLOR_ID_GREEN:
 			subled_info[i].color_index =3D LED_COLOR_ID_GREEN;
 			subled_info[i].intensity =3D gled->green;
+			subled_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 			break;
 		case LED_COLOR_ID_BLUE:
 			subled_info[i].color_index =3D LED_COLOR_ID_BLUE;
 			subled_info[i].intensity =3D gled->blue;
+			subled_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 			break;
 		}
 		subled_info[i].channel =3D i;
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 3c0db8f93c82..a6de4dd49750 100644
=2D-- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -874,8 +874,11 @@ static int ps_lightbar_register(struct ps_device *ps_=
dev, struct led_classdev_mc
 		return -ENOMEM;
=20
 	mc_led_info[0].color_index =3D LED_COLOR_ID_RED;
+	mc_led_info[0].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 	mc_led_info[1].color_index =3D LED_COLOR_ID_GREEN;
+	mc_led_info[1].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 	mc_led_info[2].color_index =3D LED_COLOR_ID_BLUE;
+	mc_led_info[2].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
=20
 	lightbar_mc_dev->subled_info =3D mc_led_info;
 	lightbar_mc_dev->num_colors =3D 3;
diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt=
6360.c
index 462a902f54e0..f0331cbec6aa 100644
=2D-- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -100,7 +100,7 @@ static int mt6360_mc_brightness_set(struct led_classde=
v *lcdev,
 	struct led_classdev_mc *mccdev =3D lcdev_to_mccdev(lcdev);
 	struct mt6360_led *led =3D container_of(mccdev, struct mt6360_led, mc);
 	struct mt6360_priv *priv =3D led->priv;
-	u32 real_bright, enable_mask =3D 0, enable =3D 0;
+	u32 enable_mask =3D 0, enable =3D 0;
 	int i, ret;
=20
 	mutex_lock(&priv->lock);
@@ -110,14 +110,13 @@ static int mt6360_mc_brightness_set(struct led_class=
dev *lcdev,
 	for (i =3D 0; i < mccdev->num_colors; i++) {
 		struct mc_subled *subled =3D mccdev->subled_info + i;
=20
-		real_bright =3D min(lcdev->max_brightness, subled->brightness);
 		ret =3D regmap_update_bits(priv->regmap, MT6360_REG_ISNK(i),
-					 MT6360_ISNK_MASK, real_bright);
+					 MT6360_ISNK_MASK, subled->brightness);
 		if (ret)
 			goto out;
=20
 		enable_mask |=3D MT6360_ISNK_ENMASK(subled->channel);
-		if (real_bright)
+		if (subled->brightness)
 			enable |=3D MT6360_ISNK_ENMASK(subled->channel);
 	}
=20
@@ -660,6 +659,7 @@ static int mt6360_init_isnk_properties(struct mt6360_l=
ed *led,
 			priv->leds_active |=3D BIT(reg);
 			sub_led[num_color].color_index =3D color;
 			sub_led[num_color].channel =3D reg;
+			sub_led[num_color].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 			num_color++;
 		}
=20
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 6b671f3f9c61..72323e825331 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -27,6 +28,30 @@ int led_mc_calc_color_components(struct led_classdev_mc=
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
+		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
+		if (max_intensity =3D=3D LED_USE_MAX_BRIGHTNESS)
+			max_intensity =3D led_cdev->max_brightness;
+
+		len +=3D sprintf(buf + len, "%u", max_intensity);
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
@@ -35,6 +60,7 @@ static ssize_t multi_intensity_store(struct device *dev,
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
 	int nrchars, offset =3D 0;
 	unsigned int intensity_value[LED_COLOR_ID_MAX];
+	unsigned int max_intensity;
 	int i;
 	ssize_t ret;
=20
@@ -56,8 +82,13 @@ static ssize_t multi_intensity_store(struct device *dev=
,
 		goto err_out;
 	}
=20
-	for (i =3D 0; i < mcled_cdev->num_colors; i++)
-		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
+	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
+		if (max_intensity =3D=3D LED_USE_MAX_BRIGHTNESS)
+			max_intensity =3D led_cdev->max_brightness;
+
+		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_in=
tensity);
+	}
=20
 	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
 		led_set_brightness(led_cdev, led_cdev->brightness);
@@ -111,6 +142,7 @@ static ssize_t multi_index_show(struct device *dev,
 static DEVICE_ATTR_RO(multi_index);
=20
 static struct attribute *led_multicolor_attrs[] =3D {
+	&dev_attr_multi_max_intensity.attr,
 	&dev_attr_multi_intensity.attr,
 	&dev_attr_multi_index.attr,
 	NULL,
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 577497b9d426..7d1140767c76 100644
=2D-- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -694,8 +694,11 @@ static int register_multicolor(struct i2c_client *cli=
ent, struct blinkm_data *da
 		return -ENOMEM;
=20
 	mc_led_info[RED].color_index =3D LED_COLOR_ID_RED;
+	mc_led_info[RED].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 	mc_led_info[GREEN].color_index =3D LED_COLOR_ID_GREEN;
+	mc_led_info[GREEN].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 	mc_led_info[BLUE].color_index =3D LED_COLOR_ID_BLUE;
+	mc_led_info[BLUE].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
=20
 	mc_led->cdev.mcled_cdev.subled_info =3D mc_led_info;
 	mc_led->cdev.mcled_cdev.num_colors =3D NUM_LEDS;
diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2..b891471812ff 100644
=2D-- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -202,6 +202,7 @@ static int cros_ec_led_probe_one(struct device *dev, s=
truct cros_ec_device *cros
 			continue;
=20
 		subleds[subled].color_index =3D cros_ec_led_to_linux_id[i];
+		subleds[subled].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		if (subled =3D=3D 0)
 			subleds[subled].intensity =3D 100;
 		subled++;
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
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-=
common.c
index ea131177de96..f637e74e8780 100644
=2D-- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -495,10 +495,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		led_cdev->brightness_set_blocking =3D lp55xx_set_mc_brightness;
 		led->mc_cdev.num_colors =3D pdata->led_config[chan].num_colors;
 		for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
-			mc_led_info[i].color_index =3D
-				pdata->led_config[chan].color_id[i];
-			mc_led_info[i].channel =3D
-					pdata->led_config[chan].output_num[i];
+			mc_led_info[i].color_index =3D pdata->led_config[chan].color_id[i];
+			mc_led_info[i].channel =3D pdata->led_config[chan].output_num[i];
+			mc_led_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		}
=20
 		led->mc_cdev.subled_info =3D mc_led_info;
diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
index 1e2054c1bf80..bd2c078b42f3 100644
=2D-- a/drivers/leds/leds-max77705.c
+++ b/drivers/leds/leds-max77705.c
@@ -149,6 +149,7 @@ static int max77705_parse_subled(struct device *dev, s=
truct fwnode_handle *np,
 				     "failed to parse \"color\" of %pOF\n", np);
=20
 	info->color_index =3D color;
+	info->max_intensity =3D LED_USE_MAX_BRIGHTNESS;
=20
 	return 0;
 }
diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a1=
00.c
index 2c9bd360ab81..6e77cbcb8b54 100644
=2D-- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -504,10 +504,13 @@ static int sun50i_a100_ledc_probe(struct platform_de=
vice *pdev)
 		fwnode_property_read_u32(child, "reg", &led->addr);
=20
 		led->subled_info[0].color_index =3D LED_COLOR_ID_RED;
+		led->subled_info[0].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		led->subled_info[0].channel =3D 0;
 		led->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
+		led->subled_info[1].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		led->subled_info[1].channel =3D 1;
 		led->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
+		led->subled_info[2].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		led->subled_info[2].channel =3D 2;
=20
 		led->mc_cdev.num_colors =3D ARRAY_SIZE(led->subled_info);
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-o=
mnia.c
index 25ee5c1eb820..fc41891fe971 100644
=2D-- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -233,6 +233,7 @@ static int omnia_led_register(struct i2c_client *clien=
t, struct omnia_led *led,
 	/* Initial color is white */
 	for (int i =3D 0; i < OMNIA_LED_NUM_CHANNELS; ++i) {
 		led->subled_info[i].intensity =3D 255;
+		led->subled_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		led->subled_info[i].brightness =3D 255;
 		led->subled_info[i].channel =3D i;
 	}
diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/l=
eds-group-multicolor.c
index 548c7dd63ba1..c472ccbd506e 100644
=2D-- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -111,6 +111,7 @@ static int leds_gmc_probe(struct platform_device *pdev=
)
=20
 		/* Configure the LED intensity to its maximum */
 		subled[i].intensity =3D max_brightness;
+		subled[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 	}
=20
 	/* Initialise the multicolor's LED class device */
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd20=
2x.c
index e4f0f25a5e45..4b054175b3b5 100644
=2D-- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -423,6 +423,7 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip,=
 struct fwnode_handle *fwn
 		info[i].color_index =3D mono_color;
 		info[i].channel =3D reg;
 		info[i].intensity =3D KTD202X_MAX_BRIGHTNESS;
+		info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		i++;
 	}
=20
diff --git a/drivers/leds/rgb/leds-lp5812.c b/drivers/leds/rgb/leds-lp5812=
.c
index ce6d703641e8..61fa8df493fb 100644
=2D-- a/drivers/leds/rgb/leds-lp5812.c
+++ b/drivers/leds/rgb/leds-lp5812.c
@@ -353,6 +353,7 @@ static int lp5812_init_led(struct lp5812_led *led, str=
uct lp5812_chip *chip, int
 		for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
 			mc_led_info[i].color_index =3D chip->led_config[chan].color_id[i];
 			mc_led_info[i].channel =3D chip->led_config[chan].led_id[i];
+			mc_led_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		}
=20
 		led->mc_cdev.subled_info =3D mc_led_info;
diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt=
6370-rgb.c
index c5927d0eb830..ea11ca9d3326 100644
=2D-- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -437,10 +437,7 @@ static int mt6370_mc_brightness_set(struct led_classd=
ev *lcdev, enum led_brightn
 	disable =3D enable;
=20
 	for (i =3D 0; i < mccdev->num_colors; i++) {
-		u32 brightness;
-
 		subled =3D mccdev->subled_info + i;
-		brightness =3D min(subled->brightness, lcdev->max_brightness);
 		disable &=3D ~MT6370_CHEN_BIT(subled->channel);
=20
 		if (level =3D=3D 0) {
@@ -453,14 +450,14 @@ static int mt6370_mc_brightness_set(struct led_class=
dev *lcdev, enum led_brightn
 			continue;
 		}
=20
-		if (brightness =3D=3D 0) {
+		if (subled->brightness =3D=3D 0) {
 			enable &=3D ~MT6370_CHEN_BIT(subled->channel);
 			continue;
 		}
=20
 		enable |=3D MT6370_CHEN_BIT(subled->channel);
=20
-		ret =3D mt6370_set_led_brightness(priv, subled->channel, brightness);
+		ret =3D mt6370_set_led_brightness(priv, subled->channel, subled->bright=
ness);
 		if (ret)
 			goto out_unlock;
 	}
@@ -742,6 +739,7 @@ static int mt6370_assign_multicolor_info(struct device=
 *dev, struct mt6370_led *
 		sub_led[num_color].color_index =3D color;
 		sub_led[num_color].channel =3D reg;
 		sub_led[num_color].intensity =3D 0;
+		sub_led[num_color].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		num_color++;
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
diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/led=
s-pwm-multicolor.c
index e0d7d3c9215c..578e67dcc881 100644
=2D-- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -95,6 +95,7 @@ static int iterate_subleds(struct device *dev, struct pw=
m_mc_led *priv,
 		}
=20
 		subled[priv->mc_cdev.num_colors].color_index =3D color;
+		subled[priv->mc_cdev.num_colors].max_intensity =3D LED_USE_MAX_BRIGHTNE=
SS;
 		priv->mc_cdev.num_colors++;
 	}
=20
diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom=
-lpg.c
index f6061c47f863..390dcbe1cd18 100644
=2D-- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1411,6 +1411,7 @@ static int lpg_add_led(struct lpg *lpg, struct devic=
e_node *np)
=20
 			info[i].color_index =3D led->channels[i]->color;
 			info[i].intensity =3D 0;
+			info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 			i++;
 		}
=20
diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x8=
6/silicom-platform.c
index 266f7bc5e416..5ed115b7dc01 100644
=2D-- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -283,18 +283,21 @@ static struct mc_subled plat_0222_wan_mc_subled_info=
[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_WHITE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 7),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_YELLOW,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 6),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 5),
 	},
 };
@@ -304,18 +307,21 @@ static struct mc_subled plat_0222_sys_mc_subled_info=
[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_WHITE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 4),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_AMBER,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 3),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 2),
 	},
 };
@@ -325,24 +331,28 @@ static struct mc_subled plat_0222_stat1_mc_subled_in=
fo[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 1),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_GREEN,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0c, 0),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_BLUE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 7),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_YELLOW,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 6),
 	},
 };
@@ -352,24 +362,28 @@ static struct mc_subled plat_0222_stat2_mc_subled_in=
fo[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 5),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_GREEN,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 4),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_BLUE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 3),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_YELLOW,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 2),
 	},
 };
@@ -379,24 +393,28 @@ static struct mc_subled plat_0222_stat3_mc_subled_in=
fo[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 1),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_GREEN,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0d, 0),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_BLUE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0e, 1),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_YELLOW,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x0e, 0),
 	},
 };
@@ -497,24 +515,28 @@ static struct mc_subled cordoba_fp_left_mc_subled_in=
fo[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 6),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_GREEN,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 5),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_BLUE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x09, 7),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_AMBER,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x09, 4),
 	},
 };
@@ -524,24 +546,28 @@ static struct mc_subled cordoba_fp_center_mc_subled_=
info[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 7),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_GREEN,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 4),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_BLUE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 3),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_AMBER,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x09, 6),
 	},
 };
@@ -551,24 +577,28 @@ static struct mc_subled cordoba_fp_right_mc_subled_i=
nfo[] __initdata =3D {
 		.color_index =3D LED_COLOR_ID_RED,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 2),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_GREEN,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 1),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_BLUE,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x08, 0),
 	},
 	{
 		.color_index =3D LED_COLOR_ID_AMBER,
 		.brightness =3D 1,
 		.intensity =3D 0,
+		.max_intensity =3D LED_USE_MAX_BRIGHTNESS,
 		.channel =3D OFFSET_BIT_TO_CHANNEL(0x09, 5),
 	},
 };
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index fee93537aa43..9468a93f7a59 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1082,8 +1082,7 @@ static int uniwill_led_brightness_set(struct led_cla=
ssdev *led_cdev, enum led_br
 	guard(mutex)(&data->led_lock);
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
-		/* Prevent the brightness values from overflowing */
-		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightnes=
s);
+		value =3D data->led_mc_subled_info[i].brightness;
 		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
 		if (ret < 0)
 			return ret;
@@ -1182,6 +1181,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 			return ret;
=20
 		data->led_mc_subled_info[i].intensity =3D value;
+		data->led_mc_subled_info[i].max_intensity =3D LED_USE_MAX_BRIGHTNESS;
 		data->led_mc_subled_info[i].channel =3D i;
 	}
=20
diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-clas=
s-multicolor.h
index db9f34c6736e..67ac0ac0fd54 100644
=2D-- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -9,10 +9,33 @@
 #include <linux/leds.h>
 #include <dt-bindings/leds/common.h>
=20
+#define LED_USE_MAX_BRIGHTNESS 0
+
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
+ * Such drivers should set max_intensity to LED_USE_MAX_BRIGHTNESS
+ * to signal the multicolor LED core that the maximum global brightness o=
f the
+ * LED class device should be used for limiting incoming intensity values=
.
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
@@ -53,7 +76,14 @@ int led_classdev_multicolor_register_ext(struct device =
*parent,
  */
 void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cde=
v);
=20
-/* Calculate brightness for the monochrome LED cluster */
+/**
+ * led_mc_calc_color_components() - Calculate brightness for the monochro=
me LED cluster.
+ * @mcled_cdev - Multicolor LED class device of the LED cluster.
+ * @led_brightness - Global brightness of the LED cluster.
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


