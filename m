Return-Path: <linux-leds+bounces-5194-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E5B1956E
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 23:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 715DB16F547
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 21:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CEE20487E;
	Sun,  3 Aug 2025 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kyGX9M1J"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4621F2371;
	Sun,  3 Aug 2025 21:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254996; cv=none; b=SxTveCExo7TAuTAO/69vtxi+jZDTSi9g0Wl6yAk8ofvFR7AaSFsRzuvF2qDIrzj/shZwWhsqPocXkbR5MmHZO31HRwvEIv5vq5WdGCXS67bBAI0WvnqoA2DuJIKsnHnKbvxgrwg407kQYfsZZXiUrg7yJCJ4foG8i0D3VijuxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254996; c=relaxed/simple;
	bh=Iit90TV26ZI2KbrMsI8F78CVX/oLLXO1gv4L/bAT94U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lq2+TkFzpypHEW5vlSl+xK4moBhj0kyPh7tc7aLLmjcwa6Ke3UbgRKUIfWYxEEh+unRATBDkyOLaEG45bnZQ53fegr3lRDPnGuKVpM0fuSho873pXXevPkUCNLsEguY/hwxYgubaxXXSsalYnuneJo7jrN0/nKWzi6ZuGcqmVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kyGX9M1J; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754254958; x=1754859758; i=w_armin@gmx.de;
	bh=uYlcmq4dI474m1MWLID1FR7mGvjdStTLuJK4+F9uXmo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kyGX9M1JfXcWo3XbRLqactj1+6Zqu1iRsEhiib9OaD+ClTRaI0FFtxXW2cUPEK4D
	 CPIp3l7J1dYnoUh/BGD2Jmii4aNZaoTOQ9avw7Dml6kVJgZsy+scq6aoLIc0JKTsH
	 vAyfqBIKSOQTakBxcTxxelcAjTJfbmxqSkr0UMXIQnEQep/6Gz6xNHEBPUUCeqR0i
	 z0U1/s4N/n6o+oURxVn4rgvt9g2XrZhva/lLNqn7IHLr3ILzPyz/3YCDHjEA1tmDM
	 LDEl1YL10zlrWQj2POm2q5apPIgRxGwgo1RbFkqDp7kJg+QtYsl/72pOlO0sY3d6N
	 hS4FcBH0PWi0V/0raw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mo6qp-1uJYV41c8x-00jmCe; Sun, 03 Aug 2025 23:02:37 +0200
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
Subject: [PATCH v2 2/3] platform/x86: Add Uniwill laptop driver
Date: Sun,  3 Aug 2025 23:01:56 +0200
Message-Id: <20250803210157.8185-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:jw2uJlOXKFrBUkMBit+uFcByOCmJo8edKyCLntN+oUE6SociDv1
 WksGnEdtv/Nx6rNLWJRjVJAhSb1VDO6Nen2gLgtppxF5JRyMH5R2hlV/LK9M21v97vXg0Nj
 0k7gKHRhJjDDkJjVtAIa5iLPNy0Vc5F0D5kO4THgSBWKZSEsBearA45aRZ+n4HriP9d+/GY
 MlM8E+L6we9IIoFin9+vA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BWo3GGlTXCE=;ieZPSA7clC005FHS4OZXxpF7roD
 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

Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
interface to talk with the embedded controller, but relies on a
DMI whitelist for autoloading since Uniwill just copied the WMI
GUID from the Windows driver example.

The driver is reverse-engineered based on the following information:
- OEM software from intel
- https://github.com/pobrn/qc71_laptop
- https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
- https://github.com/tuxedocomputers/tuxedo-control-center

The underlying EC supports various features, including hwmon sensors,
battery charge limiting, a RGB lightbar and keyboard-related controls.

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
 Documentation/wmi/devices/uniwill-laptop.rst  |  118 ++
 MAINTAINERS                                   |    8 +
 drivers/platform/x86/uniwill/Kconfig          |   17 +
 drivers/platform/x86/uniwill/Makefile         |    1 +
 drivers/platform/x86/uniwill/uniwill-laptop.c | 1484 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
 7 files changed, 1683 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
new file mode 100644
index 000000000000..7a540a7b9f24
=2D-- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -0,0 +1,53 @@
+What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/fn_l=
ock
+Date:		June 2025
+KernelVersion:	6.17
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Allows userspace applications to enable/disable the FN lock feature
+		of the integrated keyboard by writing "enable"/"disable" into this file=
.
+
+		Reading this file returns the current enable status of the FN lock func=
tionality.
+
+What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/supe=
r_key_lock
+Date:		June 2025
+KernelVersion:	6.17
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+                Allows userspace applications to enable/disable the super=
 key functionality
+                of the integrated keyboard by writing "enable"/"disable" =
into this file.
+
+		Reading this file returns the current enable status of the super key fu=
nctionality.
+
+What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/touc=
hpad_toggle
+Date:		June 2025
+KernelVersion:	6.17
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Allows userspace applications to enable/disable the touchpad toggle fun=
ctionality
+		of the integrated touchpad by writing "enable"/"disable" into this file=
.
+
+		Reading this file returns the current enable status of the touchpad tog=
gle
+		functionality.
+
+What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rain=
bow_animation
+Date:		June 2025
+KernelVersion:	6.17
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Forces the integrated lightbar to display a rainbow animation when the =
machine
+		is not suspended. Writing "enable"/"disable" into this file enables/dis=
ables
+		this functionality.
+
+		Reading this file returns the current status of the rainbow animation f=
unctionality.
+
+What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/brea=
thing_in_suspend
+Date:		June 2025
+KernelVersion:	6.17
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Causes the integrated lightbar to display a breathing animation when th=
e machine
+		has been suspended and is running on AC power. Writing "enable"/"disabl=
e" into
+		this file enables/disables this functionality.
+
+		Reading this file returns the current status of the breathing animation
+		functionality.
diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/=
wmi/devices/uniwill-laptop.rst
new file mode 100644
index 000000000000..b785763a5e32
=2D-- /dev/null
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -0,0 +1,118 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Uniwill WMI Notebook driver (uniwill-laptop)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Many notebooks manufactured by Uniwill (either directly or as ODM) provid=
e a WMI-based
+EC interface for controlling various platform settings like sensors and f=
an control.
+This interface is used by the ``uniwill-laptop`` driver to map those feat=
ures onto standard
+kernel interfaces.
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
+   Description("Class used to operate methods on a ULong"),
+   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
+  class AcpiTest_MULong {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(1), Implemented, read, write, Description("Return the co=
ntents of a ULong")]
+    void GetULong([out, Description("Ulong Data")] uint32 Data);
+
+    [WmiMethodId(2), Implemented, read, write, Description("Set the conte=
nts of a ULong")]
+    void SetULong([in, Description("Ulong Data")] uint32 Data);
+
+    [WmiMethodId(3), Implemented, read, write,
+     Description("Generate an event containing ULong data")]
+    void FireULong([in, Description("WMI requires a parameter")] uint32 H=
ack);
+
+    [WmiMethodId(4), Implemented, read, write, Description("Get and Set t=
he contents of a ULong")]
+    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
+                     [out, Description("Ulong Data")] uint32 Return);
+
+    [WmiMethodId(5), Implemented, read, write,
+     Description("Get and Set the contents of a ULong for Dollby button")=
]
+    void GetButton([in, Description("Ulong Data")] uint64 Data,
+                   [out, Description("Ulong Data")] uint32 Return);
+  };
+
+Most of the WMI-related code was copied from the Windows driver samples, =
which unfortunately means
+that the WMI-GUID is not unique. This makes the WMI-GUID unusable for aut=
oloading.
+
+WMI method GetULong()
+---------------------
+
+This WMI method was copied from the Windows driver samples and has no fun=
ction.
+
+WMI method SetULong()
+---------------------
+
+This WMI method was copied from the Windows driver samples and has no fun=
ction.
+
+WMI method FireULong()
+----------------------
+
+This WMI method allows to inject a WMI event with a 32-bit payload. Its p=
rimary purpose seems
+to be debugging.
+
+WMI method GetSetULong()
+------------------------
+
+This WMI method is used to communicate with the EC. The ``Data`` argument=
 hold the following
+information (starting with the least significant byte):
+
+1. 16-bit address
+2. 16-bit data (set to ``0x0000`` when reading)
+3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing)
+4. 16-bit reserved (set to ``0x0000``)
+
+The first 8 bits of the ``Return`` value contain the data returned by the=
 EC when reading.
+The special value ``0xFEFEFEFE`` is used to indicate a communication fail=
ure with the EC.
+
+WMI method GetButton()
+----------------------
+
+This WMI method is not implemented on all machines and has an unknown pur=
pose.
+
+Relation with the ``INOU0000`` ACPI device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+It seems that many of the embedded controller registers can also be acces=
sed by using the ``ECRR``
+and ``ECRW`` ACPI control methods under the ``INOU0000`` ACPI device. Thi=
s sidesteps the overhead
+of the WMI interface but does not work for the registers in the range bet=
ween ``0x1800`` and
+``0x18FF``. More research is needed to determine whether this interface i=
mposes additional
+restrictions.
+
+Reverse-Engineering the Uniwill WMI interface
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. warning:: Randomly poking the EC can potentially cause damage to the m=
achine and other unwanted
+             side effects, please be careful.
+
+The EC behind the ``GetSetULong`` method is used by the OEM software supp=
lied by the manufacturer.
+Reverse-engineering of this software is difficult since it uses an obfusc=
ator, however some parts
+are not obfuscated. In this case `dnSpy <https://github.com/dnSpy/dnSpy>`=
_ could also be helpful.
+
+The EC can be accessed under Windows using powershell (requires admin pri=
vileges):
+
+::
+
+  > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_MULo=
ng | Select-Object -First 1
+  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Arguments=
 @{Data =3D <input>}
+
+Special thanks go to github user `pobrn` which developed the
+`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which thi=
s driver is partly based.
+The same is true for Tuxedo Computers, which developed the
+`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packages/=
tuxedo-drivers>`_ package
+which also served as a foundation for this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index c6222f9d0984..d1901990a7a3 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25499,6 +25499,14 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-renesas.c
=20
+UNIWILL LAPTOP DRIVER
+M:	Armin Wolf <W_Armin@gmx.de>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/wmi/devices/uniwill-laptop.rst
+F:	drivers/platform/x86/uniwill/uniwill-laptop.c
+
 UNIWILL WMI DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/u=
niwill/Kconfig
index 7571b30edb11..46d9af52b3f2 100644
=2D-- a/drivers/platform/x86/uniwill/Kconfig
+++ b/drivers/platform/x86/uniwill/Kconfig
@@ -16,6 +16,23 @@ menuconfig X86_PLATFORM_DRIVERS_UNIWILL
=20
 if X86_PLATFORM_DRIVERS_UNIWILL
=20
+config UNIWILL_LAPTOP
+	tristate "Uniwill Laptop Extras"
+	default m
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on UNIWILL_WMI
+	depends on HWMON
+	depends on LEDS_CLASS_MULTICOLOR
+	depends on DMI
+	select REGMAP
+	help
+	  This driver adds support for various extra features found on Uniwill l=
aptops,
+	  like the lightbar and hwmon sensors. It also supports many OEM laptops
+	  originally manufactured by Uniwill.
+
+	  If you have such a laptop, say Y or M here.
+
 config UNIWILL_WMI
 	tristate "Uniwill WMI Event Driver"
 	default m
diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/=
uniwill/Makefile
index a5a300be63f3..b55169a49e1e 100644
=2D-- a/drivers/platform/x86/uniwill/Makefile
+++ b/drivers/platform/x86/uniwill/Makefile
@@ -4,4 +4,5 @@
 # Uniwill X86 Platform Specific Drivers
 #
=20
+obj-$(CONFIG_UNIWILL_LAPTOP)	+=3D uniwill-laptop.o
 obj-$(CONFIG_UNIWILL_WMI)	+=3D uniwill-wmi.o
diff --git a/drivers/platform/x86/uniwill/uniwill-laptop.c b/drivers/platf=
orm/x86/uniwill/uniwill-laptop.c
new file mode 100644
index 000000000000..0ac5a51b792b
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-laptop.c
@@ -0,0 +1,1484 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux driver for Uniwill notebooks.
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
+#define pr_format(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/fixp-arith.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/kstrtox.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/pm.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+#include <linux/string_choices.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/wmi.h>
+
+#include <acpi/battery.h>
+
+#include "uniwill-wmi.h"
+
+#define EC_ADDR_BAT_POWER_UNIT_1	0x0400
+
+#define EC_ADDR_BAT_POWER_UNIT_2	0x0401
+
+#define EC_ADDR_BAT_DESIGN_CAPACITY_1	0x0402
+
+#define EC_ADDR_BAT_DESIGN_CAPACITY_2	0x0403
+
+#define EC_ADDR_BAT_FULL_CAPACITY_1	0x0404
+
+#define EC_ADDR_BAT_FULL_CAPACITY_2	0x0405
+
+#define EC_ADDR_BAT_DESIGN_VOLTAGE_1	0x0408
+
+#define EC_ADDR_BAT_DESIGN_VOLTAGE_2	0x0409
+
+#define EC_ADDR_BAT_STATUS_1		0x0432
+#define BAT_DISCHARGING			BIT(0)
+
+#define EC_ADDR_BAT_STATUS_2		0x0433
+
+#define EC_ADDR_BAT_CURRENT_1		0x0434
+
+#define EC_ADDR_BAT_CURRENT_2		0x0435
+
+#define EC_ADDR_BAT_REMAIN_CAPACITY_1	0x0436
+
+#define EC_ADDR_BAT_REMAIN_CAPACITY_2	0x0437
+
+#define EC_ADDR_BAT_VOLTAGE_1		0x0438
+
+#define EC_ADDR_BAT_VOLTAGE_2		0x0439
+
+#define EC_ADDR_CPU_TEMP		0x043E
+
+#define EC_ADDR_GPU_TEMP		0x044F
+
+#define EC_ADDR_MAIN_FAN_RPM_1		0x0464
+
+#define EC_ADDR_MAIN_FAN_RPM_2		0x0465
+
+#define EC_ADDR_SECOND_FAN_RPM_1	0x046C
+
+#define EC_ADDR_SECOND_FAN_RPM_2	0x046D
+
+#define EC_ADDR_DEVICE_STATUS		0x047B
+#define WIFI_STATUS_ON			BIT(7)
+/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
+
+#define EC_ADDR_BAT_ALERT		0x0494
+
+#define EC_ADDR_BAT_CYCLE_COUNT_1	0x04A6
+
+#define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
+
+#define EC_ADDR_PROJECT_ID		0x0740
+
+#define EC_ADDR_AP_OEM			0x0741
+#define	ENABLE_MANUAL_CTRL		BIT(0)
+#define ITE_KBD_EFFECT_REACTIVE		BIT(3)
+#define FAN_ABNORMAL			BIT(5)
+
+#define EC_ADDR_SUPPORT_5		0x0742
+#define FAN_TURBO_SUPPORTED		BIT(4)
+#define FAN_SUPPORT			BIT(5)
+
+#define EC_ADDR_CTGP_DB_CTRL		0x0743
+#define CTGP_DB_GENERAL_ENABLE		BIT(0)
+#define CTGP_DB_DB_ENABLE		BIT(1)
+#define CTGP_DB_CTGP_ENABLE		BIT(2)
+
+#define EC_ADDR_CTGP_OFFSET		0x0744
+
+#define EC_ADDR_TPP_OFFSET		0x0745
+
+#define EC_ADDR_MAX_TGP			0x0746
+
+#define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
+#define LIGHTBAR_APP_EXISTS		BIT(0)
+#define LIGHTBAR_POWER_SAVE		BIT(1)
+#define LIGHTBAR_S0_OFF			BIT(2)
+#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
+#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
+
+#define EC_ADDR_LIGHTBAR_AC_RED		0x0749
+
+#define EC_ADDR_LIGHTBAR_AC_GREEN	0x074A
+
+#define EC_ADDR_LIGHTBAR_AC_BLUE	0x074B
+
+#define EC_ADDR_BIOS_OEM		0x074E
+#define FN_LOCK_STATUS			BIT(4)
+
+#define EC_ADDR_MANUAL_FAN_CTRL		0x0751
+#define FAN_LEVEL_MASK			GENMASK(2, 0)
+#define FAN_MODE_TURBO			BIT(4)
+#define FAN_MODE_HIGH			BIT(5)
+#define FAN_MODE_BOOST			BIT(6)
+#define FAN_MODE_USER			BIT(7)
+
+#define EC_ADDR_PWM_1			0x075B
+
+#define EC_ADDR_PWM_2			0x075C
+
+/* Unreliable */
+#define EC_ADDR_SUPPORT_1		0x0765
+#define AIRPLANE_MODE			BIT(0)
+#define GPS_SWITCH			BIT(1)
+#define OVERCLOCK			BIT(2)
+#define MACRO_KEY			BIT(3)
+#define SHORTCUT_KEY			BIT(4)
+#define SUPER_KEY_LOCK			BIT(5)
+#define LIGHTBAR			BIT(6)
+#define FAN_BOOST			BIT(7)
+
+#define EC_ADDR_SUPPORT_2		0x0766
+#define SILENT_MODE			BIT(0)
+#define USB_CHARGING			BIT(1)
+#define RGB_KEYBOARD			BIT(2)
+#define CHINA_MODE			BIT(5)
+#define MY_BATTERY			BIT(6)
+
+#define EC_ADDR_TRIGGER			0x0767
+#define TRIGGER_SUPER_KEY_LOCK		BIT(0)
+#define TRIGGER_LIGHTBAR		BIT(1)
+#define TRIGGER_FAN_BOOST		BIT(2)
+#define TRIGGER_SILENT_MODE		BIT(3)
+#define TRIGGER_USB_CHARGING		BIT(4)
+#define RGB_APPLY_COLOR			BIT(5)
+#define RGB_LOGO_EFFECT			BIT(6)
+#define RGB_RAINBOW_EFFECT		BIT(7)
+
+#define EC_ADDR_SWITCH_STATUS		0x0768
+#define SUPER_KEY_LOCK_STATUS		BIT(0)
+#define LIGHTBAR_STATUS			BIT(1)
+#define FAN_BOOST_STATUS		BIT(2)
+#define MACRO_KEY_STATUS		BIT(3)
+#define MY_BAT_POWER_BAT_STATUS		BIT(4)
+
+#define EC_ADDR_RGB_RED			0x0769
+
+#define EC_ADDR_RGB_GREEN		0x076A
+
+#define EC_ADDR_RGB_BLUE		0x076B
+
+#define EC_ADDR_ROMID_START		0x0770
+#define ROMID_LENGTH			14
+
+#define EC_ADDR_ROMID_EXTRA_1		0x077E
+
+#define EC_ADDR_ROMID_EXTRA_2		0x077F
+
+#define EC_ADDR_BIOS_OEM_2		0x0782
+#define FAN_V2_NEW			BIT(0)
+#define FAN_QKEY			BIT(1)
+#define FAN_TABLE_OFFICE_MODE		BIT(2)
+#define FAN_V3				BIT(3)
+#define DEFAULT_MODE			BIT(4)
+
+#define EC_ADDR_PL1_SETTING		0x0783
+
+#define EC_ADDR_PL2_SETTING		0x0784
+
+#define EC_ADDR_PL4_SETTING		0x0785
+
+#define EC_ADDR_FAN_DEFAULT		0x0786
+#define FAN_CURVE_LENGTH		5
+
+#define EC_ADDR_KBD_STATUS		0x078C
+#define KBD_WHITE_ONLY			BIT(0)	// ~single color
+#define KBD_SINGLE_COLOR_OFF		BIT(1)
+#define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
+#define KBD_APPLY			BIT(4)
+#define KBD_BRIGHTNESS			GENMASK(7, 5)
+
+#define EC_ADDR_FAN_CTRL		0x078E
+#define FAN3P5				BIT(1)
+#define CHARGING_PROFILE		BIT(3)
+#define UNIVERSAL_FAN_CTRL		BIT(6)
+
+#define EC_ADDR_BIOS_OEM_3		0x07A3
+#define FAN_REDUCED_DURY_CYCLE		BIT(5)
+#define FAN_ALWAYS_ON			BIT(6)
+
+#define EC_ADDR_BIOS_BYTE		0x07A4
+#define FN_LOCK_SWITCH			BIT(3)
+
+#define EC_ADDR_OEM_3			0x07A5
+#define POWER_LED_MASK			GENMASK(1, 0)
+#define POWER_LED_LEFT			0x00
+#define POWER_LED_BOTH			0x01
+#define POWER_LED_NONE			0x02
+#define FAN_QUIET			BIT(2)
+#define OVERBOOST			BIT(4)
+#define HIGH_POWER			BIT(7)
+
+#define EC_ADDR_OEM_4			0x07A6
+#define OVERBOOST_DYN_TEMP_OFF		BIT(1)
+#define TOUCHPAD_TOGGLE_OFF		BIT(6)
+
+#define EC_ADDR_CHARGE_CTRL		0x07B9
+#define CHARGE_CTRL_MASK		GENMASK(6, 0)
+#define CHARGE_CTRL_REACHED		BIT(7)
+
+#define EC_ADDR_UNIVERSAL_FAN_CTRL	0x07C5
+#define SPLIT_TABLES			BIT(7)
+
+#define EC_ADDR_AP_OEM_6		0x07C6
+#define ENABLE_UNIVERSAL_FAN_CTRL	BIT(2)
+#define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
+#define BATTERY_ERM_STATUS_REACHED	BIT(4)
+
+#define EC_ADDR_CHARGE_PRIO		0x07CC
+#define CHARGING_PERFORMANCE		BIT(7)
+
+/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
+#define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
+
+#define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
+
+#define EC_ADDR_LIGHTBAR_BAT_GREEN	0x07E4
+
+#define EC_ADDR_LIGHTBAR_BAT_BLUE	0x07E5
+
+#define EC_ADDR_CPU_TEMP_END_TABLE	0x0F00
+
+#define EC_ADDR_CPU_TEMP_START_TABLE	0x0F10
+
+#define EC_ADDR_CPU_FAN_SPEED_TABLE	0x0F20
+
+#define EC_ADDR_GPU_TEMP_END_TABLE	0x0F30
+
+#define EC_ADDR_GPU_TEMP_START_TABLE	0x0F40
+
+#define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
+
+/*
+ * Those two registers technically allow for manual fan control,
+ * but are unstable on some models and are likely not meant to
+ * be used by applications.
+ */
+#define EC_ADDR_PWM_1_WRITEABLE		0x1804
+
+#define EC_ADDR_PWM_2_WRITEABLE		0x1809
+
+#define DRIVER_NAME	"uniwill"
+#define UNIWILL_GUID	"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
+
+#define PWM_MAX			200
+#define FAN_TABLE_LENGTH	16
+
+#define LED_CHANNELS		3
+#define LED_MAX_BRIGHTNESS	200
+
+#define UNIWILL_FEATURE_FN_LOCK		BIT(0)
+#define UNIWILL_FEATURE_SUPER_KEY_LOCK	BIT(1)
+#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE BIT(2)
+#define UNIWILL_FEATURE_LIGHTBAR	BIT(3)
+#define UNIWILL_FEATURE_BATTERY		BIT(4)
+#define UNIWILL_FEATURE_HWMON		BIT(5)
+
+enum uniwill_method {
+	UNIWILL_GET_ULONG	=3D 0x01,
+	UNIWILL_SET_ULONG	=3D 0x02,
+	UNIWILL_FIRE_ULONG	=3D 0x03,
+	UNIWILL_GET_SET_ULONG	=3D 0x04,
+	UNIWILL_GET_BUTTON	=3D 0x05,
+};
+
+struct uniwill_method_buffer {
+	__le16 address;
+	__le16 data;
+	__le16 operation;
+	__le16 reserved;
+} __packed;
+
+struct uniwill_data {
+	struct wmi_device *wdev;
+	struct regmap *regmap;
+	struct acpi_battery_hook hook;
+	unsigned int last_charge_ctrl;
+	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
+	unsigned int last_switch_status;
+	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
+	struct list_head batteries;
+	struct led_classdev_mc led_mc_cdev;
+	struct mc_subled led_mc_subled_info[LED_CHANNELS];
+	struct notifier_block nb;
+};
+
+struct uniwill_battery_entry {
+	struct list_head head;
+	struct power_supply *battery;
+};
+
+static bool force;
+module_param_unsafe(force, bool, 0);
+MODULE_PARM_DESC(force, "Force loading without checking for supported dev=
ices\n");
+
+/* Feature bitmask since the associated registers are not reliable */
+static uintptr_t supported_features;
+
+/*
+ * "disable" is placed on index 0 so that the return value of sysfs_match=
_string()
+ * directly translates into a boolean value.
+ */
+static const char * const uniwill_enable_disable_strings[] =3D {
+	[0] =3D "disable",
+	[1] =3D "enable",
+};
+
+static const char * const uniwill_temp_labels[] =3D {
+	"CPU",
+	"GPU",
+};
+
+static const char * const uniwill_fan_labels[] =3D {
+	"Main",
+	"Secondary",
+};
+
+static int uniwill_get_set_ulong(struct wmi_device *wdev, struct uniwill_=
method_buffer *input,
+				 u32 *output)
+{
+	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer in =3D {
+		.length =3D sizeof(*input),
+		.pointer =3D input,
+	};
+	union acpi_object *obj;
+	acpi_status status;
+	int ret =3D 0;
+
+	status =3D wmidev_evaluate_method(wdev, 0x0, UNIWILL_GET_SET_ULONG, &in,=
 &out);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj =3D out.pointer;
+	if (!obj)
+		return -ENODATA;
+
+	if (obj->type !=3D ACPI_TYPE_BUFFER) {
+		ret =3D -ENOMSG;
+		goto free_obj;
+	}
+
+	if (obj->buffer.length < sizeof(*output)) {
+		ret =3D -EPROTO;
+		goto free_obj;
+	}
+
+	*output =3D get_unaligned_le32(obj->buffer.pointer);
+
+free_obj:
+	kfree(obj);
+
+	return ret;
+}
+
+static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned=
 int val)
+{
+	struct uniwill_method_buffer input =3D {
+		.address =3D cpu_to_le16(reg),
+		.data =3D cpu_to_le16(val & U8_MAX),
+		.operation =3D 0x0000,
+	};
+	struct uniwill_data *data =3D context;
+	u32 output;
+	int ret;
+
+	ret =3D uniwill_get_set_ulong(data->wdev, &input, &output);
+	if (ret < 0)
+		return ret;
+
+	if (output =3D=3D 0xFEFEFEFE)
+		return -ENXIO;
+
+	return 0;
+}
+
+static int uniwill_ec_reg_read(void *context, unsigned int reg, unsigned =
int *val)
+{
+	struct uniwill_method_buffer input =3D {
+		.address =3D cpu_to_le16(reg),
+		.data =3D 0x0000,
+		.operation =3D cpu_to_le16(0x0100),
+	};
+	struct uniwill_data *data =3D context;
+	u32 output;
+	int ret;
+
+	ret =3D uniwill_get_set_ulong(data->wdev, &input, &output);
+	if (ret < 0)
+		return ret;
+
+	if (output =3D=3D 0xFEFEFEFE)
+		return -ENXIO;
+
+	*val =3D (u8)output;
+
+	return 0;
+}
+
+static const struct regmap_bus uniwill_ec_bus =3D {
+	.reg_write =3D uniwill_ec_reg_write,
+	.reg_read =3D uniwill_ec_reg_read,
+	.reg_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
+	.val_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
+};
+
+static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case EC_ADDR_AP_OEM:
+	case EC_ADDR_LIGHTBAR_AC_CTRL:
+	case EC_ADDR_LIGHTBAR_AC_RED:
+	case EC_ADDR_LIGHTBAR_AC_GREEN:
+	case EC_ADDR_LIGHTBAR_AC_BLUE:
+	case EC_ADDR_BIOS_OEM:
+	case EC_ADDR_TRIGGER:
+	case EC_ADDR_OEM_4:
+	case EC_ADDR_CHARGE_CTRL:
+	case EC_ADDR_LIGHTBAR_BAT_CTRL:
+	case EC_ADDR_LIGHTBAR_BAT_RED:
+	case EC_ADDR_LIGHTBAR_BAT_GREEN:
+	case EC_ADDR_LIGHTBAR_BAT_BLUE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case EC_ADDR_CPU_TEMP:
+	case EC_ADDR_GPU_TEMP:
+	case EC_ADDR_MAIN_FAN_RPM_1:
+	case EC_ADDR_MAIN_FAN_RPM_2:
+	case EC_ADDR_SECOND_FAN_RPM_1:
+	case EC_ADDR_SECOND_FAN_RPM_2:
+	case EC_ADDR_BAT_ALERT:
+	case EC_ADDR_PROJECT_ID:
+	case EC_ADDR_AP_OEM:
+	case EC_ADDR_LIGHTBAR_AC_CTRL:
+	case EC_ADDR_LIGHTBAR_AC_RED:
+	case EC_ADDR_LIGHTBAR_AC_GREEN:
+	case EC_ADDR_LIGHTBAR_AC_BLUE:
+	case EC_ADDR_BIOS_OEM:
+	case EC_ADDR_PWM_1:
+	case EC_ADDR_PWM_2:
+	case EC_ADDR_TRIGGER:
+	case EC_ADDR_SWITCH_STATUS:
+	case EC_ADDR_OEM_4:
+	case EC_ADDR_CHARGE_CTRL:
+	case EC_ADDR_LIGHTBAR_BAT_CTRL:
+	case EC_ADDR_LIGHTBAR_BAT_RED:
+	case EC_ADDR_LIGHTBAR_BAT_GREEN:
+	case EC_ADDR_LIGHTBAR_BAT_BLUE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case EC_ADDR_CPU_TEMP:
+	case EC_ADDR_GPU_TEMP:
+	case EC_ADDR_MAIN_FAN_RPM_1:
+	case EC_ADDR_MAIN_FAN_RPM_2:
+	case EC_ADDR_SECOND_FAN_RPM_1:
+	case EC_ADDR_SECOND_FAN_RPM_2:
+	case EC_ADDR_BAT_ALERT:
+	case EC_ADDR_PWM_1:
+	case EC_ADDR_PWM_2:
+	case EC_ADDR_TRIGGER:
+	case EC_ADDR_SWITCH_STATUS:
+	case EC_ADDR_CHARGE_CTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config uniwill_ec_config =3D {
+	.reg_bits =3D 16,
+	.val_bits =3D 8,
+	.writeable_reg =3D uniwill_writeable_reg,
+	.readable_reg =3D uniwill_readable_reg,
+	.volatile_reg =3D uniwill_volatile_reg,
+	.can_sleep =3D true,
+	.max_register =3D 0xFFFF,
+	.cache_type =3D REGCACHE_MAPLE,
+	.use_single_read =3D true,
+	.use_single_write =3D true,
+};
+
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute =
*attr, const char *buf,
+			     size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		value =3D FN_LOCK_STATUS;
+	else
+		value =3D 0;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATU=
S, value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", str_enable_disable(value & FN_LOCK_STATUS=
));
+}
+
+static DEVICE_ATTR_RW(fn_lock);
+
+static ssize_t super_key_lock_store(struct device *dev, struct device_att=
ribute *attr,
+				    const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int state, ret;
+
+	state =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
+	if (state < 0)
+		return state;
+
+	guard(mutex)(&data->super_key_lock);
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We can only toggle the super key lock, so we return early if the sett=
ing
+	 * is already in the correct state.
+	 */
+	if (state =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
+		return count;
+
+	ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_K=
EY_LOCK,
+				TRIGGER_SUPER_KEY_LOCK);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t super_key_lock_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & SUPER_KEY_LO=
CK_STATUS)));
+}
+
+static DEVICE_ATTR_RW(super_key_lock);
+
+static ssize_t touchpad_toggle_store(struct device *dev, struct device_at=
tribute *attr,
+				     const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		value =3D 0;
+	else
+		value =3D TOUCHPAD_TOGGLE_OFF;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_=
OFF, value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t touchpad_toggle_show(struct device *dev, struct device_att=
ribute *attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & TOUCHPAD_TOG=
GLE_OFF)));
+}
+
+static DEVICE_ATTR_RW(touchpad_toggle);
+
+static ssize_t rainbow_animation_store(struct device *dev, struct device_=
attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		value =3D LIGHTBAR_WELCOME;
+	else
+		value =3D 0;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHT=
BAR_WELCOME, value);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGH=
TBAR_WELCOME, value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t rainbow_animation_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", str_enable_disable(value & LIGHTBAR_WELCO=
ME));
+}
+
+static DEVICE_ATTR_RW(rainbow_animation);
+
+static ssize_t breathing_in_suspend_store(struct device *dev, struct devi=
ce_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		value =3D 0;
+	else
+		value =3D LIGHTBAR_S3_OFF;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHT=
BAR_S3_OFF, value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t breathing_in_suspend_show(struct device *dev, struct devic=
e_attribute *attr,
+					 char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & LIGHTBAR_S3_=
OFF)));
+}
+
+static DEVICE_ATTR_RW(breathing_in_suspend);
+
+static struct attribute *uniwill_attrs[] =3D {
+	/* Keyboard-related */
+	&dev_attr_fn_lock.attr,
+	&dev_attr_super_key_lock.attr,
+	&dev_attr_touchpad_toggle.attr,
+	/* Lightbar-related */
+	&dev_attr_rainbow_animation.attr,
+	&dev_attr_breathing_in_suspend.attr,
+	NULL
+};
+
+static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attri=
bute *attr, int n)
+{
+	if (attr =3D=3D &dev_attr_fn_lock.attr) {
+		if (supported_features & UNIWILL_FEATURE_FN_LOCK)
+			return attr->mode;
+	}
+
+	if (attr =3D=3D &dev_attr_super_key_lock.attr) {
+		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK)
+			return attr->mode;
+	}
+
+	if (attr =3D=3D &dev_attr_touchpad_toggle.attr) {
+		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
+			return attr->mode;
+	}
+
+	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
+	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
+		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
+			return attr->mode;
+	}
+
+	return 0;
+}
+
+static const struct attribute_group uniwill_group =3D {
+	.is_visible =3D uniwill_attr_is_visible,
+	.attrs =3D uniwill_attrs,
+};
+
+static const struct attribute_group *uniwill_groups[] =3D {
+	&uniwill_group,
+	NULL
+};
+
+static int uniwill_read(struct device *dev, enum hwmon_sensor_types type,=
 u32 attr, int channel,
+			long *val)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	__be16 rpm;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (channel) {
+		case 0:
+			ret =3D regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
+			break;
+		case 1:
+			ret =3D regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		if (ret < 0)
+			return ret;
+
+		*val =3D value * MILLIDEGREE_PER_DEGREE;
+		return 0;
+	case hwmon_fan:
+		switch (channel) {
+		case 0:
+			ret =3D regmap_bulk_read(data->regmap, EC_ADDR_MAIN_FAN_RPM_1, &rpm,
+					       sizeof(rpm));
+			break;
+		case 1:
+			ret =3D regmap_bulk_read(data->regmap, EC_ADDR_SECOND_FAN_RPM_1, &rpm,
+					       sizeof(rpm));
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		if (ret < 0)
+			return ret;
+
+		*val =3D be16_to_cpu(rpm);
+		return 0;
+	case hwmon_pwm:
+		switch (channel) {
+		case 0:
+			ret =3D regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
+			break;
+		case 1:
+			ret =3D regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		if (ret < 0)
+			return ret;
+
+		*val =3D fixp_linear_interpolate(0, 0, PWM_MAX, U8_MAX, value);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int uniwill_read_string(struct device *dev, enum hwmon_sensor_type=
s type, u32 attr,
+			       int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		*str =3D uniwill_temp_labels[channel];
+		return 0;
+	case hwmon_fan:
+		*str =3D uniwill_fan_labels[channel];
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops uniwill_ops =3D {
+	.visible =3D 0444,
+	.read =3D uniwill_read,
+	.read_string =3D uniwill_read_string,
+};
+
+static const struct hwmon_channel_info * const uniwill_info[] =3D {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info uniwill_chip_info =3D {
+	.ops =3D &uniwill_ops,
+	.info =3D uniwill_info,
+};
+
+static int uniwill_hwmon_init(struct uniwill_data *data)
+{
+	struct device *hdev;
+
+	if (!(supported_features & UNIWILL_FEATURE_HWMON))
+		return 0;
+
+	hdev =3D devm_hwmon_device_register_with_info(&data->wdev->dev, "uniwill=
", data,
+						    &uniwill_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hdev);
+}
+
+static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] =
=3D {
+	EC_ADDR_LIGHTBAR_BAT_RED,
+	EC_ADDR_LIGHTBAR_BAT_GREEN,
+	EC_ADDR_LIGHTBAR_BAT_BLUE,
+};
+
+static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] =3D=
 {
+	EC_ADDR_LIGHTBAR_AC_RED,
+	EC_ADDR_LIGHTBAR_AC_GREEN,
+	EC_ADDR_LIGHTBAR_AC_BLUE,
+};
+
+static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum=
 led_brightness brightness)
+{
+	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
+	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwill_d=
ata, led_mc_cdev);
+	unsigned int value;
+	int ret;
+
+	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
+	if (ret < 0)
+		return ret;
+
+	for (int i =3D 0; i < LED_CHANNELS; i++) {
+		/* Prevent the brightness values from overflowing */
+		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightnes=
s);
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
+		if (ret < 0)
+			return ret;
+
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], v=
alue);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (brightness)
+		value =3D 0;
+	else
+		value =3D LIGHTBAR_S0_OFF;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHT=
BAR_S0_OFF, value);
+	if (ret < 0)
+		return ret;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHT=
BAR_S0_OFF, value);
+}
+
+#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S=
3_OFF | LIGHTBAR_WELCOME)
+
+static int uniwill_led_init(struct uniwill_data *data)
+{
+	struct led_init_data init_data =3D {
+		.devicename =3D DRIVER_NAME,
+		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
+		.devname_mandatory =3D true,
+	};
+	unsigned int color_indices[3] =3D {
+		LED_COLOR_ID_RED,
+		LED_COLOR_ID_GREEN,
+		LED_COLOR_ID_BLUE,
+	};
+	unsigned int value;
+	int ret;
+
+	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
+		return 0;
+
+	/*
+	 * The EC has separate lightbar settings for AC and battery mode,
+	 * so we have to ensure that both settings are the same.
+	 */
+	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
+	if (ret < 0)
+		return ret;
+
+	value |=3D LIGHTBAR_APP_EXISTS;
+	ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The breathing animation during suspend is not supported when
+	 * running on battery power.
+	 */
+	value |=3D LIGHTBAR_S3_OFF;
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGH=
TBAR_MASK, value);
+	if (ret < 0)
+		return ret;
+
+	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
+	data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
+	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
+	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brigh=
tness_set;
+
+	if (value & LIGHTBAR_S0_OFF)
+		data->led_mc_cdev.led_cdev.brightness =3D 0;
+	else
+		data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
+
+	for (int i =3D 0; i < LED_CHANNELS; i++) {
+		data->led_mc_subled_info[i].color_index =3D color_indices[i];
+
+		ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i], &va=
lue);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * Make sure that the initial intensity value is not greater than
+		 * the maximum brightness.
+		 */
+		value =3D min(LED_MAX_BRIGHTNESS, value);
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
+		if (ret < 0)
+			return ret;
+
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], v=
alue);
+		if (ret < 0)
+			return ret;
+
+		data->led_mc_subled_info[i].intensity =3D value;
+		data->led_mc_subled_info[i].channel =3D i;
+	}
+
+	data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
+	data->led_mc_cdev.num_colors =3D LED_CHANNELS;
+
+	return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, &data=
->led_mc_cdev,
+							 &init_data);
+}
+
+static int uniwill_get_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
+				void *drvdata, enum power_supply_property psp,
+				union power_supply_propval *val)
+{
+	struct uniwill_data *data =3D drvdata;
+	union power_supply_propval prop;
+	unsigned int regval;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_HEALTH:
+		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT=
, &prop);
+		if (ret < 0)
+			return ret;
+
+		if (!prop.intval) {
+			val->intval =3D POWER_SUPPLY_HEALTH_NO_BATTERY;
+			return 0;
+		}
+
+		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_STATUS,=
 &prop);
+		if (ret < 0)
+			return ret;
+
+		if (prop.intval =3D=3D POWER_SUPPLY_STATUS_UNKNOWN) {
+			val->intval =3D POWER_SUPPLY_HEALTH_UNKNOWN;
+			return 0;
+		}
+
+		ret =3D regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
+		if (ret < 0)
+			return ret;
+
+		if (regval) {
+			/* Charging issue */
+			val->intval =3D POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
+			return 0;
+		}
+
+		val->intval =3D POWER_SUPPLY_HEALTH_GOOD;
+		return 0;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
+		if (ret < 0)
+			return ret;
+
+		val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int uniwill_set_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
+				void *drvdata, enum power_supply_property psp,
+				const union power_supply_propval *val)
+{
+	struct uniwill_data *data =3D drvdata;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		if (val->intval < 1 || val->intval > 100)
+			return -EINVAL;
+
+		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTR=
L_MASK,
+					  val->intval);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int uniwill_property_is_writeable(struct power_supply *psy,
+					 const struct power_supply_ext *ext, void *drvdata,
+					 enum power_supply_property psp)
+{
+	if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+		return true;
+
+	return false;
+}
+
+static const enum power_supply_property uniwill_properties[] =3D {
+	POWER_SUPPLY_PROP_HEALTH,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+};
+
+static const struct power_supply_ext uniwill_extension =3D {
+	.name =3D DRIVER_NAME,
+	.properties =3D uniwill_properties,
+	.num_properties =3D ARRAY_SIZE(uniwill_properties),
+	.get_property =3D uniwill_get_property,
+	.set_property =3D uniwill_set_property,
+	.property_is_writeable =3D uniwill_property_is_writeable,
+};
+
+static int uniwill_add_battery(struct power_supply *battery, struct acpi_=
battery_hook *hook)
+{
+	struct uniwill_data *data =3D container_of(hook, struct uniwill_data, ho=
ok);
+	struct uniwill_battery_entry *entry;
+	int ret;
+
+	entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	ret =3D power_supply_register_extension(battery, &uniwill_extension, &da=
ta->wdev->dev, data);
+	if (ret < 0) {
+		kfree(entry);
+		return ret;
+	}
+
+	scoped_guard(mutex, &data->battery_lock) {
+		entry->battery =3D battery;
+		list_add(&entry->head, &data->batteries);
+	}
+
+	return 0;
+}
+
+static int uniwill_remove_battery(struct power_supply *battery, struct ac=
pi_battery_hook *hook)
+{
+	struct uniwill_data *data =3D container_of(hook, struct uniwill_data, ho=
ok);
+	struct uniwill_battery_entry *entry, *tmp;
+
+	scoped_guard(mutex, &data->battery_lock) {
+		list_for_each_entry_safe(entry, tmp, &data->batteries, head) {
+			if (entry->battery =3D=3D battery) {
+				list_del(&entry->head);
+				kfree(entry);
+				break;
+			}
+		}
+	}
+
+	power_supply_unregister_extension(battery, &uniwill_extension);
+
+	return 0;
+}
+
+static int uniwill_battery_init(struct uniwill_data *data)
+{
+	int ret;
+
+	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+		return 0;
+
+	ret =3D devm_mutex_init(&data->wdev->dev, &data->battery_lock);
+	if (ret < 0)
+		return ret;
+
+	INIT_LIST_HEAD(&data->batteries);
+	data->hook.name =3D "Uniwill Battery Extension";
+	data->hook.add_battery =3D uniwill_add_battery;
+	data->hook.remove_battery =3D uniwill_remove_battery;
+
+	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
+}
+
+static int uniwill_notifier_call(struct notifier_block *nb, unsigned long=
 action, void *dummy)
+{
+	struct uniwill_data *data =3D container_of(nb, struct uniwill_data, nb);
+	struct uniwill_battery_entry *entry;
+
+	switch (action) {
+	case UNIWILL_OSD_BATTERY_ALERT:
+		scoped_guard(mutex, &data->battery_lock) {
+			list_for_each_entry(entry, &data->batteries, head) {
+				power_supply_changed(entry->battery);
+			}
+		}
+
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int uniwill_notifier_init(struct uniwill_data *data)
+{
+	data->nb.notifier_call =3D uniwill_notifier_call;
+
+	return devm_uniwill_wmi_register_notifier(&data->wdev->dev, &data->nb);
+}
+
+static void uniwill_disable_manual_control(void *context)
+{
+	struct uniwill_data *data =3D context;
+
+	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
+}
+
+static int uniwill_ec_init(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
+
+	ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL=
);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_manual=
_control, data);
+}
+
+static int uniwill_probe(struct wmi_device *wdev, const void *context)
+{
+	struct uniwill_data *data;
+	struct regmap *regmap;
+	int ret;
+
+	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->wdev =3D wdev;
+	dev_set_drvdata(&wdev->dev, data);
+
+	regmap =3D devm_regmap_init(&wdev->dev, &uniwill_ec_bus, data, &uniwill_=
ec_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data->regmap =3D regmap;
+	ret =3D devm_mutex_init(&wdev->dev, &data->super_key_lock);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_ec_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_battery_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_led_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_hwmon_init(data);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_notifier_init(data);
+}
+
+static void uniwill_shutdown(struct wmi_device *wdev)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(&wdev->dev);
+
+	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
+}
+
+static int uniwill_suspend_keyboard(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
+		return 0;
+
+	/*
+	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restor=
e it
+	 * ourselves.
+	 */
+	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_swit=
ch_status);
+}
+
+static int uniwill_suspend_battery(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+		return 0;
+
+	/*
+	 * Save the current charge limit in order to restore it during resume.
+	 * We cannot use the regmap code for that since this register needs to
+	 * be declared as volatile due to CHARGE_CTRL_REACHED.
+	 */
+	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge=
_ctrl);
+}
+
+static int uniwill_suspend(struct device *dev)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	int ret;
+
+	ret =3D uniwill_suspend_keyboard(data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_suspend_battery(data);
+	if (ret < 0)
+		return ret;
+
+	regcache_cache_only(data->regmap, true);
+	regcache_mark_dirty(data->regmap);
+
+	return 0;
+}
+
+static int uniwill_resume_keyboard(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
+		return 0;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
+	if (ret < 0)
+		return ret;
+
+	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value & S=
UPER_KEY_LOCK_STATUS))
+		return 0;
+
+	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KE=
Y_LOCK,
+				 TRIGGER_SUPER_KEY_LOCK);
+}
+
+static int uniwill_resume_battery(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+		return 0;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL=
_MASK,
+				  data->last_charge_ctrl);
+}
+
+static int uniwill_resume(struct device *dev)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(data->regmap, false);
+
+	ret =3D regcache_sync(data->regmap);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_resume_keyboard(data);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_resume_battery(data);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_=
resume);
+
+/*
+ * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
+ * from the Windows driver example, and others probably did the same.
+ *
+ * Because of this we cannot use this WMI GUID for autoloading.
+ */
+static const struct wmi_device_id uniwill_id_table[] =3D {
+	{ UNIWILL_GUID, NULL },
+	{ }
+};
+
+static struct wmi_driver uniwill_driver =3D {
+	.driver =3D {
+		.name =3D DRIVER_NAME,
+		.dev_groups =3D uniwill_groups,
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+		.pm =3D pm_sleep_ptr(&uniwill_pm_ops),
+	},
+	.id_table =3D uniwill_id_table,
+	.probe =3D uniwill_probe,
+	.shutdown =3D uniwill_shutdown,
+	.no_singleton =3D true,
+};
+
+static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
+	{
+		.ident =3D "Intel NUC x15",
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
+		},
+		.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK |
+					UNIWILL_FEATURE_SUPER_KEY_LOCK |
+					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+					UNIWILL_FEATURE_BATTERY |
+					UNIWILL_FEATURE_HWMON),
+	},
+	{
+		.ident =3D "Intel NUC x15",
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
+		},
+		.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK |
+					UNIWILL_FEATURE_SUPER_KEY_LOCK |
+					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+					UNIWILL_FEATURE_LIGHTBAR |
+					UNIWILL_FEATURE_BATTERY |
+					UNIWILL_FEATURE_HWMON),
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
+
+static int __init uniwill_init(void)
+{
+	const struct dmi_system_id *id;
+
+	id =3D dmi_first_match(uniwill_dmi_table);
+	if (!id) {
+		if (!force)
+			return -ENODEV;
+
+		/* Assume that the device supports all features */
+		supported_features =3D UINTPTR_MAX;
+		pr_warn("Loading on a potentially unsupported device\n");
+	} else {
+		supported_features =3D (uintptr_t)id->driver_data;
+	}
+
+	return wmi_driver_register(&uniwill_driver);
+}
+module_init(uniwill_init);
+
+static void __exit uniwill_exit(void)
+{
+	wmi_driver_unregister(&uniwill_driver);
+}
+module_exit(uniwill_exit);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("Uniwill notebook driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("UNIWILL");
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
index 9e032627159f..8cec0674755c 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.c
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -161,7 +161,8 @@ static int uniwill_wmi_probe(struct wmi_device *wdev, =
const void *context)
  * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
  * from the Windows driver example, and others probably did the same.
  *
- * Because of this we cannot use this WMI GUID for autoloading.
+ * Because of this we cannot use this WMI GUID for autoloading. The uniwi=
ll-laptop
+ * driver will instead load this module as a dependency.
  */
 static const struct wmi_device_id uniwill_wmi_id_table[] =3D {
 	{ UNIWILL_EVENT_GUID, NULL },
=2D-=20
2.39.5


