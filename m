Return-Path: <linux-leds+bounces-5191-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF61B19563
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 23:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CD0116EE45
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 21:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF321F09A8;
	Sun,  3 Aug 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nR7OsI5T"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953EEEA6;
	Sun,  3 Aug 2025 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254959; cv=none; b=d9DPHRWb+48eFyipRwBOwKV3Z22ehJn08tYVRHnAvY6GrJQFm52bUdzZ9/9RGGYf0rX1PmLb9tTv+Aoil6dOnAegxZWWmZRyIznVT/X2WFmVFfXLpbLuQJUY/VQa4Gph0UNuC3oAK8jKeD+iccmH9+YwPKace4FljJHsn4tYJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254959; c=relaxed/simple;
	bh=92N4+In2rwy2TljVdJE49NdgLx0pnMs7hjymuBDdFT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUM7/ZOgAjHwvSap+xoSXnTaY148dlIMr013x2kgSgHskxQJdvUWolF782GAGHgdHfYbMr3zpMLOqFkhRwaWuVRnQukCB0OWlFmli7xvdtNBwEzzMOohJS9rZAp6cA2yIRwF2+gLAyvFvuk3A5XalYg/EbgUCbzpSg/wkv8KU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nR7OsI5T; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754254954; x=1754859754; i=w_armin@gmx.de;
	bh=mMHb87/YUBw/sihDkqmYChWdU3uxAHhyqzRe8baDfMI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nR7OsI5T843o7FnEVikE04RSyqLFxA+oPaG8rYGlhC12lZT+stLEmetiLRDLDGYX
	 3aJyEXJPY2ZK/O9qzcisJEQn50acGZhW5yxtGpc95YLE3EcxuLldPpfqR+NoromxX
	 na7DBSsoREImr6GLpVSruzx52p+kKs0i8KLupfti33+vPbUtzTVhMMMXb5oUPQsRk
	 cnqQ6NeTE+EybfIunKdvn+rydHD20gQlpt8SCbKl2heYqz/eyeJo4V03NkadcWRTc
	 594fy4GJv1/Fd20mtY2JDLyaV6PtsvhENZzRGsXWoPBO+D0KGskj/8gW47GyQnsr4
	 b7Xd33gIAq+xu8/5yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mnaof-1uGnLL1JMD-00nWHA; Sun, 03 Aug 2025 23:02:34 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	chumuzero@gmail.com,
	corbet@lwn.net,
	cs@tuxedo.de,
	wse@tuxedocomputers.com,
	ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rdunlap@infradead.org,
	alok.a.tiwari@oracle.com,
	linux-leds@vger.kernel.org,
	lee@kernel.org,
	pobrn@protonmail.com
Subject: [PATCH v2 1/3] platform/x86: Add Uniwill WMI driver
Date: Sun,  3 Aug 2025 23:01:55 +0200
Message-Id: <20250803210157.8185-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250803210157.8185-1-W_Armin@gmx.de>
References: <20250803210157.8185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TczQgf4LNWYkiWM3Rcn+hXm6hAWpp/6wBDNA9qDj1KhuoCKzMos
 YKjYY7uQPi9yK7pNUXP69umGI731u5a9Ar8fT6SaVBh8j4837YXnsG+wosmGcpBqRMiq4pd
 NZ2M6wo2fy9intmbzhqxp9MVlyBBHCeKs8jhuyadgVxB6ZleQxp7h+LeRh4+p1CIfGU0XPm
 UXtLpvYLM0hdlinLF3tHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0wEYQkNIClg=;LIHlLxJtoS6gZbZJ9xQO+/VD8Ff
 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

Add a new driver for handling WMI events on Uniwill laptops.
The driver sadly cannot use the WMI GUID for autoloading since Uniwill
just copied it from the Windows driver example.

The driver is reverse-engineered based on the following information:
- https://github.com/pobrn/qc71_laptop
- https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
- various OEM software

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/devices/uniwill-wmi.rst  |  52 ++++++
 MAINTAINERS                                |   8 +
 drivers/platform/x86/Kconfig               |   2 +
 drivers/platform/x86/Makefile              |   3 +
 drivers/platform/x86/uniwill/Kconfig       |  32 ++++
 drivers/platform/x86/uniwill/Makefile      |   7 +
 drivers/platform/x86/uniwill/uniwill-wmi.c | 185 +++++++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h | 122 ++++++++++++++
 8 files changed, 411 insertions(+)
 create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

diff --git a/Documentation/wmi/devices/uniwill-wmi.rst b/Documentation/wmi=
/devices/uniwill-wmi.rst
new file mode 100644
index 000000000000..8de86c910bb9
=2D-- /dev/null
+++ b/Documentation/wmi/devices/uniwill-wmi.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Uniwill WMI event driver (uniwill-wmi)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Many notebooks manufactured by Uniwill (either directly or as ODM) provid=
e a WMI-based
+event interface for various platform events like hotkeys. This interface =
is used by the
+``uniwill-wmi`` driver to react to hotkey presses.
+
+WMI interface description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The WMI interface description can be decoded from the embedded binary MOF=
 (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
+   Description("Class containing event generated ULong data"),
+   guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
+  class AcpiTest_EventULong : WmiEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, write, Description("ULong Data")] uint32 ULong;
+  };
+
+Most of the WMI-related code was copied from the Windows driver samples, =
which unfortunately means
+that the WMI-GUID is not unique. This makes the WMI-GUID unusable for aut=
oloading.
+
+WMI event data
+--------------
+
+The WMI event data contains a single 32-bit value which is used to indica=
te various platform events.
+Many non-hotkey events are not directly consumed by the driver itself, bu=
t are instead handled by
+the ``uniwill-laptop`` driver.
+
+Reverse-Engineering the Uniwill WMI event interface
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The driver logs debug messages when receiving a WMI event. Thus enabling =
debug messages will be
+useful for finding unknown event codes.
+
+Special thanks go to github user `pobrn` which developed the
+`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which thi=
s driver is partly based.
+The same is true for Tuxedo Computers, which developed the
+`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packages/=
tuxedo-drivers>`_ package
+which also served as a foundation for this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index d61b004005fd..c6222f9d0984 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25499,6 +25499,14 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-renesas.c
=20
+UNIWILL WMI DRIVER
+M:	Armin Wolf <W_Armin@gmx.de>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/wmi/devices/uniwill-wmi.rst
+F:	drivers/platform/x86/uniwill/uniwill-wmi.c
+F:	drivers/platform/x86/uniwill/uniwill-wmi.h
+
 UNSORTED BLOCK IMAGES (UBI)
 M:	Richard Weinberger <richard@nod.at>
 R:	Zhihao Cheng <chengzhihao1@huawei.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 6d238e120dce..a4c2ea69970d 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -74,6 +74,8 @@ config HUAWEI_WMI
 	  To compile this driver as a module, choose M here: the module
 	  will be called huawei-wmi.
=20
+source "drivers/platform/x86/uniwill/Kconfig"
+
 config UV_SYSFS
 	tristate "Sysfs structure for UV systems"
 	depends on X86_UV
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index a0c5848513e3..a6271588e05a 100644
=2D-- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -109,6 +109,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+=3D toshiba-wmi.o
 # before toshiba_acpi initializes
 obj-$(CONFIG_ACPI_TOSHIBA)	+=3D toshiba_acpi.o
=20
+# Uniwill
+obj-y				+=3D uniwill/
+
 # Inspur
 obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+=3D inspur_platform_profile.o
=20
diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/u=
niwill/Kconfig
new file mode 100644
index 000000000000..7571b30edb11
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/Kconfig
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Uniwill X86 Platform Specific Drivers
+#
+
+menuconfig X86_PLATFORM_DRIVERS_UNIWILL
+	bool "Uniwill X86 Platform Specific Device Drivers"
+	depends on X86_PLATFORM_DEVICES
+	help
+	  Say Y here to see options for device drivers for various
+	  Uniwill x86 platforms, including many OEM laptops originally
+	  manufactured by Uniwill.
+	  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled=
.
+
+if X86_PLATFORM_DRIVERS_UNIWILL
+
+config UNIWILL_WMI
+	tristate "Uniwill WMI Event Driver"
+	default m
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  This driver adds support for various hotkey events on Uniwill laptops,
+	  like rfkill and other special buttons. It also supports many OEM lapto=
ps
+	  originally manufactured by Uniwill.
+
+	  If you have such a laptop, say Y or M here.
+
+endif
diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/=
uniwill/Makefile
new file mode 100644
index 000000000000..a5a300be63f3
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for linux/drivers/platform/x86/uniwill
+# Uniwill X86 Platform Specific Drivers
+#
+
+obj-$(CONFIG_UNIWILL_WMI)	+=3D uniwill-wmi.o
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
new file mode 100644
index 000000000000..9e032627159f
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux hotkey driver for Uniwill notebooks.
+ *
+ * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg an=
d Werner Sembach
+ * for supporting the development of this driver either through prior wor=
k or
+ * by answering questions regarding the underlying WMI interface.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "uniwill-wmi.h"
+
+#define DRIVER_NAME		"uniwill-wmi"
+#define UNIWILL_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
+
+struct uniwill_wmi_data {
+	struct mutex input_lock;	/* Protects input sequence during notify */
+	struct input_dev *input_device;
+};
+
+static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
+
+static const struct key_entry uniwill_wmi_keymap[] =3D {
+	/* Reported via keyboard controller */
+	{ KE_IGNORE,	UNIWILL_OSD_CAPSLOCK,			{ KEY_CAPSLOCK }},
+	{ KE_IGNORE,	UNIWILL_OSD_NUMLOCK,			{ KEY_NUMLOCK }},
+
+	/* Reported when the user locks/unlocks the super key */
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,	{ KEY_UNKNOWN }},
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,	{ KEY_UNKNOWN }},
+
+	/* Reported in manual mode when toggling the airplane mode status */
+	{ KE_KEY,	UNIWILL_OSD_RFKILL,			{ KEY_RFKILL }},
+
+	/* Reported when user wants to cycle the platform profile */
+	{ KE_IGNORE,	UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,	{ KEY_UNKNOWN }},
+
+	/* Reported when the user wants to adjust the brightness of the keyboard=
 */
+	{ KE_KEY,	UNIWILL_OSD_KBDILLUMDOWN,		{ KEY_KBDILLUMDOWN }},
+	{ KE_KEY,	UNIWILL_OSD_KBDILLUMUP,			{ KEY_KBDILLUMUP }},
+
+	/* Reported when the user wants to toggle the microphone mute status */
+	{ KE_KEY,	UNIWILL_OSD_MIC_MUTE,			{ KEY_MICMUTE }},
+
+	/* Reported when the user locks/unlocks the Fn key */
+	{ KE_IGNORE,	UNIWILL_OSD_FN_LOCK,			{ KEY_FN_ESC }},
+
+	/* Reported when the user wants to toggle the brightness of the keyboard=
 */
+	{ KE_KEY,	UNIWILL_OSD_KBDILLUMTOGGLE,		{ KEY_KBDILLUMTOGGLE }},
+
+	/* FIXME: find out the exact meaning of those events */
+	{ KE_IGNORE,	UNIWILL_OSD_BAT_CHARGE_FULL_24_H,	{ KEY_UNKNOWN }},
+	{ KE_IGNORE,	UNIWILL_OSD_BAT_ERM_UPDATE,		{ KEY_UNKNOWN }},
+
+	/* Reported when the user wants to toggle the benchmark mode status */
+	{ KE_IGNORE,	UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,	{ KEY_UNKNOWN }},
+
+	{ KE_END }
+};
+
+int uniwill_wmi_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(uniwill_wmi_register_notifier, "UNIWILL");
+
+int uniwill_wmi_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(uniwill_wmi_unregister_notifier, "UNIWILL");
+
+static void devm_uniwill_wmi_unregister_notifier(void *data)
+{
+	struct notifier_block *nb =3D data;
+
+	uniwill_wmi_unregister_notifier(nb);
+}
+
+int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifie=
r_block *nb)
+{
+	int ret;
+
+	ret =3D uniwill_wmi_register_notifier(nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_notifie=
r, nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_uniwill_wmi_register_notifier, "UNIWILL");
+
+static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
+{
+	struct uniwill_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
+	u32 value;
+	int ret;
+
+	if (obj->type !=3D ACPI_TYPE_INTEGER)
+		return;
+
+	value =3D obj->integer.value;
+
+	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
+
+	ret =3D blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NUL=
L);
+	if (ret =3D=3D NOTIFY_BAD)
+		return;
+
+	mutex_lock(&data->input_lock);
+	sparse_keymap_report_event(data->input_device, value, 1, true);
+	mutex_unlock(&data->input_lock);
+}
+
+static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context=
)
+{
+	struct uniwill_wmi_data *data;
+	int ret;
+
+	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret =3D devm_mutex_init(&wdev->dev, &data->input_lock);
+	if (ret < 0)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, data);
+
+	data->input_device =3D devm_input_allocate_device(&wdev->dev);
+	if (!data->input_device)
+		return -ENOMEM;
+
+	ret =3D sparse_keymap_setup(data->input_device, uniwill_wmi_keymap, NULL=
);
+	if (ret < 0)
+		return ret;
+
+	data->input_device->name =3D "Uniwill WMI hotkeys";
+	data->input_device->phys =3D "wmi/input0";
+	data->input_device->id.bustype =3D BUS_HOST;
+
+	return input_register_device(data->input_device);
+}
+
+/*
+ * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
+ * from the Windows driver example, and others probably did the same.
+ *
+ * Because of this we cannot use this WMI GUID for autoloading.
+ */
+static const struct wmi_device_id uniwill_wmi_id_table[] =3D {
+	{ UNIWILL_EVENT_GUID, NULL },
+	{ }
+};
+
+static struct wmi_driver uniwill_wmi_driver =3D {
+	.driver =3D {
+		.name =3D DRIVER_NAME,
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table =3D uniwill_wmi_id_table,
+	.probe =3D uniwill_wmi_probe,
+	.notify =3D uniwill_wmi_notify,
+	.no_singleton =3D true,
+};
+module_wmi_driver(uniwill_wmi_driver);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("Uniwill notebook hotkey driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform=
/x86/uniwill/uniwill-wmi.h
new file mode 100644
index 000000000000..f6dd610d49eb
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Linux hotkey driver for Uniwill notebooks.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#ifndef UNIWILL_WMI_H
+#define UNIWILL_WMI_H
+
+#define UNIWILL_OSD_CAPSLOCK			0x01
+#define UNIWILL_OSD_NUMLOCK			0x02
+#define UNIWILL_OSD_SCROLLLOCK			0x03
+
+#define UNIWILL_OSD_TOUCHPAD_ON			0x04
+#define UNIWILL_OSD_TOUCHPAD_OFF		0x05
+
+#define UNIWILL_OSD_SILENT_MODE_ON		0x06
+#define UNIWILL_OSD_SILENT_MODE_OFF		0x07
+
+#define UNIWILL_OSD_WLAN_ON			0x08
+#define UNIWILL_OSD_WLAN_OFF			0x09
+
+#define UNIWILL_OSD_WIMAX_ON			0x0A
+#define UNIWILL_OSD_WIMAX_OFF			0x0B
+
+#define UNIWILL_OSD_BLUETOOTH_ON		0x0C
+#define UNIWILL_OSD_BLUETOOTH_OFF		0x0D
+
+#define UNIWILL_OSD_RF_ON			0x0E
+#define UNIWILL_OSD_RF_OFF			0x0F
+
+#define UNIWILL_OSD_3G_ON			0x10
+#define UNIWILL_OSD_3G_OFF			0x11
+
+#define UNIWILL_OSD_WEBCAM_ON			0x12
+#define UNIWILL_OSD_WEBCAM_OFF			0x13
+
+#define UNIWILL_OSD_BRIGHTNESSUP		0x14
+#define UNIWILL_OSD_BRIGHTNESSDOWN		0x15
+
+#define UNIWILL_OSD_RADIOON			0x1A
+#define UNIWILL_OSD_RADIOOFF			0x1B
+
+#define UNIWILL_OSD_POWERSAVE_ON		0x31
+#define UNIWILL_OSD_POWERSAVE_OFF		0x32
+
+#define UNIWILL_OSD_MENU			0x34
+
+#define UNIWILL_OSD_MUTE			0x35
+#define UNIWILL_OSD_VOLUMEDOWN			0x36
+#define UNIWILL_OSD_VOLUMEUP			0x37
+
+#define UNIWILL_OSD_MENU_2			0x38
+
+#define UNIWILL_OSD_LIGHTBAR_ON			0x39
+#define UNIWILL_OSD_LIGHTBAR_OFF		0x3A
+
+#define UNIWILL_OSD_KB_LED_LEVEL0		0x3B
+#define UNIWILL_OSD_KB_LED_LEVEL1		0x3C
+#define UNIWILL_OSD_KB_LED_LEVEL2		0x3D
+#define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
+#define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
+
+#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
+#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
+
+#define UNIWILL_OSD_MENU_JP			0x42
+
+#define UNIWILL_OSD_CAMERA_ON			0x90
+#define UNIWILL_OSD_CAMERA_OFF			0x91
+
+#define UNIWILL_OSD_RFKILL			0xA4
+
+#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
+
+#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
+
+#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED	0xA7
+
+#define UNIWILL_OSD_LCD_SW			0xA9
+
+#define UNIWILL_OSD_FAN_OVERTEMP		0xAA
+
+#define UNIWILL_OSD_DC_ADAPTER_CHANGED		0xAB
+
+#define UNIWILL_OSD_BAT_HP_OFF			0xAC
+
+#define UNIWILL_OSD_FAN_DOWN_TEMP		0xAD
+
+#define UNIWILL_OSD_BATTERY_ALERT		0xAE
+
+#define UNIWILL_OSD_TIMAP_HAIERLB_SW		0xAF
+
+#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE	0xB0
+
+#define UNIWILL_OSD_KBDILLUMDOWN		0xB1
+#define UNIWILL_OSD_KBDILLUMUP			0xB2
+
+#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE	0xB3
+#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE	0xB4
+
+#define UNIWILL_OSD_MIC_MUTE			0xB7
+
+#define UNIWILL_OSD_FN_LOCK			0xB8
+#define UNIWILL_OSD_KBDILLUMTOGGLE		0xB9
+
+#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H	0xBE
+
+#define UNIWILL_OSD_BAT_ERM_UPDATE		0xBF
+
+#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
+
+#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
+
+struct notifier_block;
+
+int uniwill_wmi_register_notifier(struct notifier_block *nb);
+int uniwill_wmi_unregister_notifier(struct notifier_block *nb);
+int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifie=
r_block *nb);
+
+#endif /* UNIWILL_WMI_H */
=2D-=20
2.39.5


