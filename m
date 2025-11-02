Return-Path: <linux-leds+bounces-5961-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D96C293CA
	for <lists+linux-leds@lfdr.de>; Sun, 02 Nov 2025 18:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42E3C347772
	for <lists+linux-leds@lfdr.de>; Sun,  2 Nov 2025 17:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36552DECDE;
	Sun,  2 Nov 2025 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="E5Pa1MW5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FB52AE99;
	Sun,  2 Nov 2025 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104613; cv=none; b=TmgawK9ftDhe8zNkJjnzQp1XsD46N1aiGpx1p187BFSwl5WpYHojyukSr+fZIcrEC/RZTIexdq5V9bK5/e2B/Ls+bECuJu+EviXL+pCSQA5RkYaAHsETAVejiPa6PoMlWwbji0wd0vBOKOzOaNOCEg0NCkMzUaFuL7gKvgyv+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104613; c=relaxed/simple;
	bh=i5Cu4/nujKtYCIszvfoAUZ5QQTd6KdlcgyaSi+OQT40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHBzM/d+9ew++sjeK9KIJkr1MF+B3XQgXU+JdqyGWP/nzTCPtW8xdtcBcezwb81ElOffYgtP/te6BRQKjtpeNW85pmdPPirb+7QK28uqyI1TPt0xd+JcuOFcXewJL2HBvgVKqGo08PAhbypOlIUTss6Tg6waXBih/xFx30IRAyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=E5Pa1MW5; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1762104603; x=1762709403; i=w_armin@gmx.de;
	bh=UeQ5YWnU6hBr3+KXcyqzqvuDoeygQfCupSTIl8EygWA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=E5Pa1MW57mQ1NF3PRXs90QqBCjtjfaPzDt91QHqpve43k9EWqcVb+Eg5pIOAPAcn
	 A5rDwtK+mHZxnoDry9cHsJJtPg5nfGdtPirYYd4+4KhpMrma9sX7RC/Nu/1+PWOcd
	 ArAicG1K3fW+miqwasgU7m4+D7trpS6ZcirNhOfE2NQ8F0F+45brn7yfDGq3SGlKZ
	 n/DTggS9ZEQxuVHb5DUmYKlasBu/EjqqIiLyb+3jWYCAJoSG1wyMNh/9XpPOYWpQU
	 0XxVwBXgFkgJD2XJjEt681fbUr8Os4xrsVge1hY/HmDT1FoCfkn27OaGDT3Xa/sle
	 MMDsnueAOEU8MhypxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N4QwW-1wDWMG3T6M-015D21; Sun, 02 Nov 2025 18:30:03 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
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
	pobrn@protonmail.com,
	nathan@kernel.org
Subject: [PATCH v6 1/2] platform/x86: Add Uniwill laptop driver
Date: Sun,  2 Nov 2025 18:29:41 +0100
Message-Id: <20251102172942.17879-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251102172942.17879-1-W_Armin@gmx.de>
References: <20251102172942.17879-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PVEKKmwhXA5JOtUJrf5+5uC+CfRfBvPNLHXOYFi9wAC/Pi34VHK
 PZ6KXMOVkaRMDrracmYfeSIjjarYJjb5LGtEcGju4yID9MHmlPrW6UM2bBqg+L1aUZbNvSF
 zUCR57BstFumP9fz+I7tYfgzFvZyxEQGumAvAXLbFNQTKirZ66j0uVQbN9JknPpsN7S/rpQ
 +GQBaNTFMNlzagR7Z1Hmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GdyecCnL4gI=;vRkY5nLwALqrWfnrh9sIpIyjPHy
 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

Add a new driver for Uniwill laptops. The driver uses a ACPI
interface to talk with the embedded controller, but relies on a
ACPI WMI interface for receiving event notifications.

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
Tested-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
 Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
 MAINTAINERS                                   |   10 +
 drivers/platform/x86/Kconfig                  |    2 +
 drivers/platform/x86/Makefile                 |    3 +
 drivers/platform/x86/uniwill/Kconfig          |   38 +
 drivers/platform/x86/uniwill/Makefile         |    8 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 1550 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
 10 files changed, 2081 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
new file mode 100644
index 000000000000..eaeb659793d2
=2D-- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -0,0 +1,53 @@
+What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
+Date:		November 2025
+KernelVersion:	6.19
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Allows userspace applications to enable/disable the FN lock feature
+		of the integrated keyboard by writing "1"/"0" into this file.
+
+		Reading this file returns the current enable status of the FN lock func=
tionality.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
+Date:		November 2025
+KernelVersion:	6.19
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+                Allows userspace applications to enable/disable the super=
 key functionality
+                of the integrated keyboard by writing "1"/"0" into this f=
ile.
+
+		Reading this file returns the current enable status of the super key fu=
nctionality.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
+Date:		November 2025
+KernelVersion:	6.19
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Allows userspace applications to enable/disable the touchpad toggle fun=
ctionality
+		of the integrated touchpad by writing "1"/"0" into this file.
+
+		Reading this file returns the current enable status of the touchpad tog=
gle
+		functionality.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
+Date:		November 2025
+KernelVersion:	6.19
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Forces the integrated lightbar to display a rainbow animation when the =
machine
+		is not suspended. Writing "1"/"0" into this file enables/disables this
+		functionality.
+
+		Reading this file returns the current status of the rainbow animation f=
unctionality.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
+Date:		November 2025
+KernelVersion:	6.19
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Causes the integrated lightbar to display a breathing animation when th=
e machine
+		has been suspended and is running on AC power. Writing "1"/"0" into thi=
s file
+		enables/disables this functionality.
+
+		Reading this file returns the current status of the breathing animation
+		functionality.
diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/=
wmi/devices/uniwill-laptop.rst
new file mode 100644
index 000000000000..e246bf293450
=2D-- /dev/null
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -0,0 +1,198 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Uniwill Notebook driver (uniwill-laptop)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Many notebooks manufactured by Uniwill (either directly or as ODM) provid=
e a EC interface
+for controlling various platform settings like sensors and fan control. T=
his interface is
+used by the ``uniwill-laptop`` driver to map those features onto standard=
 kernel interfaces.
+
+EC WMI interface description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+The EC WMI interface description can be decoded from the embedded binary =
MOF (bmof)
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
 holds the following
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
+Reverse-Engineering the EC WMI interface
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
+WMI event interface description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+The WMI interface description can also be decoded from the embedded binar=
y MOF (bmof)
+data:
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
+Most of the WMI-related code was again copied from the Windows driver sam=
ples, causing this WMI
+interface to suffer from the same restrictions as the EC WMI interface de=
scribed above.
+
+WMI event data
+--------------
+
+The WMI event data contains a single 32-bit value which is used to indica=
te various platform events.
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
+EC ACPI interface description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+The ``INOU0000`` ACPI device is a virtual device used to access various h=
ardware registers
+available on notebooks manufactured by Uniwill. Reading and writing those=
 registers happens
+by calling ACPI control methods. The ``uniwill-laptop`` driver uses this =
device to communicate
+with the EC because the ACPI control methods are faster than the WMI meth=
ods described above.
+
+ACPI control methods used for reading registers take a single ACPI intege=
r containing the address
+of the register to read and return a ACPI integer containing the data ins=
ide said register. ACPI
+control methods used for writing registers however take two ACPI integers=
, with the additional
+ACPI integer containing the data to be written into the register. Such AC=
PI control methods return
+nothing.
+
+System memory
+-------------
+
+System memory can be accessed with a granularity of either a single byte =
(``MMRB`` for reading and
+``MMWB`` for writing) or four bytes (``MMRD`` for reading and ``MMWD`` fo=
r writing). Those ACPI
+control methods are unused because they provide no benefit when compared =
to the native memory
+access functions provided by the kernel.
+
+EC RAM
+------
+
+The internal RAM of the EC can be accessed with a granularity of a single=
 byte using the ``ECRR``
+(read) and ``ECRW`` (write) ACPI control methods, with the maximum regist=
er address being ``0xFFF``.
+The OEM software waits 6 ms after calling one of those ACPI control metho=
ds, likely to avoid
+overwhelming the EC when being connected over LPC.
+
+PCI config space
+----------------
+
+The PCI config space can be accessed with a granularity of four bytes usi=
ng the ``PCRD`` (read) and
+``PCWD`` (write) ACPI control methods. The exact address format is unknow=
n, and poking random PCI
+devices might confuse the PCI subsystem. Because of this those ACPI contr=
ol methods are not used.
+
+IO ports
+--------
+
+IO ports can be accessed with a granularity of four bytes using the ``IOR=
D`` (read) and ``IOWD``
+(write) ACPI control methods. Those ACPI control methods are unused becau=
se they provide no benefit
+when compared to the native IO port access functions provided by the kern=
el.
+
+CMOS RAM
+--------
+
+The CMOS RAM can be accessed with a granularity of a single byte using th=
e ``RCMS`` (read) and
+``WCMS`` ACPI control methods. Using those ACPI methods might interfere w=
ith the native CMOS RAM
+access functions provided by the kernel due to the usage of indexed IO, s=
o they are unused.
+
+Indexed IO
+----------
+
+Indexed IO with IO ports with a granularity of a single byte can be perfo=
rmed using the ``RIOP``
+(read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are =
unused because they
+provide no benifit when compared to the native IO port access functions p=
rovided by the kernel.
+
+Special thanks go to github user `pobrn` which developed the
+`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which thi=
s driver is partly based.
+The same is true for Tuxedo Computers, which developed the
+`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packages/=
tuxedo-drivers>`_ package
+which also served as a foundation for this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..8fce9b5e9fd7 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26376,6 +26376,16 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-renesas.c
=20
+UNIWILL LAPTOP DRIVER
+M:	Armin Wolf <W_Armin@gmx.de>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/wmi/devices/uniwill-laptop.rst
+F:	drivers/platform/x86/uniwill/uniwill-acpi.c
+F:	drivers/platform/x86/uniwill/uniwill-wmi.c
+F:	drivers/platform/x86/uniwill/uniwill-wmi.h
+
 UNSORTED BLOCK IMAGES (UBI)
 M:	Richard Weinberger <richard@nod.at>
 R:	Zhihao Cheng <chengzhihao1@huawei.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 46e62feeda3c..1e9b84f1098f 100644
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
index c7db2a88c11a..d722e244a4a7 100644
=2D-- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -110,6 +110,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+=3D toshiba-wmi.o
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
index 000000000000..d07cc8440188
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/Kconfig
@@ -0,0 +1,38 @@
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
+config UNIWILL_LAPTOP
+	tristate "Uniwill Laptop Extras"
+	default m
+	depends on ACPI
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on HWMON
+	depends on INPUT
+	depends on LEDS_CLASS_MULTICOLOR
+	depends on DMI
+	select REGMAP
+	select INPUT_SPARSEKMAP
+	help
+	  This driver adds support for various extra features found on Uniwill l=
aptops,
+	  like the lightbar, hwmon sensors and hotkeys. It also supports many OE=
M laptops
+	  originally manufactured by Uniwill.
+
+	  If you have such a laptop, say Y or M here.
+
+endif
diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/=
uniwill/Makefile
new file mode 100644
index 000000000000..05cd1747a240
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for linux/drivers/platform/x86/uniwill
+# Uniwill X86 Platform Specific Drivers
+#
+
+obj-$(CONFIG_UNIWILL_LAPTOP)	+=3D uniwill-laptop.o
+uniwill-laptop-y		:=3D uniwill-acpi.o uniwill-wmi.o
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
new file mode 100644
index 000000000000..014960d16211
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -0,0 +1,1550 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux driver for Uniwill notebooks.
+ *
+ * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg an=
d Werner Sembach
+ * for supporting the development of this driver either through prior wor=
k or
+ * by answering questions regarding the underlying ACPI and WMI interface=
s.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/fixp-arith.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
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
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/units.h>
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
+ * be used by applications as they are only accessible when using
+ * the WMI interface.
+ */
+#define EC_ADDR_PWM_1_WRITEABLE		0x1804
+
+#define EC_ADDR_PWM_2_WRITEABLE		0x1809
+
+#define DRIVER_NAME	"uniwill"
+
+/*
+ * The OEM software always sleeps up to 6 ms after reading/writing EC
+ * registers, so we emulate this behaviour for maximum compatibility.
+ */
+#define UNIWILL_EC_DELAY_US	6000
+
+#define PWM_MAX			200
+#define FAN_TABLE_LENGTH	16
+
+#define LED_CHANNELS		3
+#define LED_MAX_BRIGHTNESS	200
+
+#define UNIWILL_FEATURE_FN_LOCK_TOGGLE		BIT(0)
+#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE	BIT(1)
+#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
+#define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
+#define UNIWILL_FEATURE_BATTERY			BIT(4)
+#define UNIWILL_FEATURE_HWMON			BIT(5)
+
+struct uniwill_data {
+	struct device *dev;
+	acpi_handle handle;
+	struct regmap *regmap;
+	struct acpi_battery_hook hook;
+	unsigned int last_charge_ctrl;
+	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
+	unsigned int last_switch_status;
+	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
+	struct list_head batteries;
+	struct mutex led_lock;		/* Protects writes to the lightbar registers */
+	struct led_classdev_mc led_mc_cdev;
+	struct mc_subled led_mc_subled_info[LED_CHANNELS];
+	struct mutex input_lock;	/* Protects input sequence during notify */
+	struct input_dev *input_device;
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
+static unsigned int supported_features;
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
+static const struct key_entry uniwill_keymap[] =3D {
+	/* Reported via keyboard controller */
+	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }=
},
+	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }}=
,
+
+	/* Reported when the user locks/unlocks the super key */
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }}=
,
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }}=
,
+	/* Optional, might not be reported by all devices */
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
+
+	/* Reported in manual mode when toggling the airplane mode status */
+	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
+
+	/* Reported when user wants to cycle the platform profile */
+	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }}=
,
+
+	/* Reported when the user wants to adjust the brightness of the keyboard=
 */
+	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLUMDO=
WN }},
+	{ KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { KEY_KBDILLUMUP=
 }},
+
+	/* Reported when the user wants to toggle the microphone mute status */
+	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }}=
,
+
+	/* Reported when the user locks/unlocks the Fn key */
+	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
+
+	/* Reported when the user wants to toggle the brightness of the keyboard=
 */
+	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTO=
GGLE }},
+
+	/* FIXME: find out the exact meaning of those events */
+	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }}=
,
+	{ KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE,             { KEY_UNKNOWN }}=
,
+
+	/* Reported when the user wants to toggle the benchmark mode status */
+	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }}=
,
+
+	{ KE_END }
+};
+
+static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned=
 int val)
+{
+	union acpi_object params[2] =3D {
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D reg,
+			},
+		},
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D val,
+			},
+		},
+	};
+	struct uniwill_data *data =3D context;
+	struct acpi_object_list input =3D {
+		.count =3D ARRAY_SIZE(params),
+		.pointer =3D params,
+	};
+	acpi_status status;
+
+	status =3D acpi_evaluate_object(data->handle, "ECRW", &input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
+
+	return 0;
+}
+
+static int uniwill_ec_reg_read(void *context, unsigned int reg, unsigned =
int *val)
+{
+	union acpi_object params[1] =3D {
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D reg,
+			},
+		},
+	};
+	struct uniwill_data *data =3D context;
+	struct acpi_object_list input =3D {
+		.count =3D ARRAY_SIZE(params),
+		.pointer =3D params,
+	};
+	unsigned long long output;
+	acpi_status status;
+
+	status =3D acpi_evaluate_integer(data->handle, "ECRR", &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (output > U8_MAX)
+		return -ENXIO;
+
+	usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
+
+	*val =3D output;
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
+	.max_register =3D 0xFFF,
+	.cache_type =3D REGCACHE_MAPLE,
+	.use_single_read =3D true,
+	.use_single_write =3D true,
+};
+
+static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct dev=
ice_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	if (enable)
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
+static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct devi=
ce_attribute *attr,
+					  char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
+}
+
+static DEVICE_ATTR_RW(fn_lock_toggle_enable);
+
+static ssize_t super_key_toggle_enable_store(struct device *dev, struct d=
evice_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
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
+	if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
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
+static ssize_t super_key_toggle_enable_show(struct device *dev, struct de=
vice_attribute *attr,
+					    char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
+}
+
+static DEVICE_ATTR_RW(super_key_toggle_enable);
+
+static ssize_t touchpad_toggle_enable_store(struct device *dev, struct de=
vice_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	if (enable)
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
+static ssize_t touchpad_toggle_enable_show(struct device *dev, struct dev=
ice_attribute *attr,
+					   char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
+}
+
+static DEVICE_ATTR_RW(touchpad_toggle_enable);
+
+static ssize_t rainbow_animation_store(struct device *dev, struct device_=
attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int value;
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	if (enable)
+		value =3D LIGHTBAR_WELCOME;
+	else
+		value =3D 0;
+
+	guard(mutex)(&data->led_lock);
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
+	return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
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
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	if (enable)
+		value =3D 0;
+	else
+		value =3D LIGHTBAR_S3_OFF;
+
+	/* We only access a single register here, so we do not need to use data-=
>led_lock */
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
+	return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
+}
+
+static DEVICE_ATTR_RW(breathing_in_suspend);
+
+static struct attribute *uniwill_attrs[] =3D {
+	/* Keyboard-related */
+	&dev_attr_fn_lock_toggle_enable.attr,
+	&dev_attr_super_key_toggle_enable.attr,
+	&dev_attr_touchpad_toggle_enable.attr,
+	/* Lightbar-related */
+	&dev_attr_rainbow_animation.attr,
+	&dev_attr_breathing_in_suspend.attr,
+	NULL
+};
+
+static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attri=
bute *attr, int n)
+{
+	if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
+		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
+			return attr->mode;
+	}
+
+	if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
+		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
+			return attr->mode;
+	}
+
+	if (attr =3D=3D &dev_attr_touchpad_toggle_enable.attr) {
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
+	hdev =3D devm_hwmon_device_register_with_info(data->dev, "uniwill", data=
,
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
+	guard(mutex)(&data->led_lock);
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
+	ret =3D devm_mutex_init(data->dev, &data->led_lock);
+	if (ret < 0)
+		return ret;
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
+	return devm_led_classdev_multicolor_register_ext(data->dev, &data->led_m=
c_cdev,
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
+	ret =3D power_supply_register_extension(battery, &uniwill_extension, dat=
a->dev, data);
+	if (ret < 0) {
+		kfree(entry);
+		return ret;
+	}
+
+	guard(mutex)(&data->battery_lock);
+
+	entry->battery =3D battery;
+	list_add(&entry->head, &data->batteries);
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
+	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
+	if (ret < 0)
+		return ret;
+
+	INIT_LIST_HEAD(&data->batteries);
+	data->hook.name =3D "Uniwill Battery Extension";
+	data->hook.add_battery =3D uniwill_add_battery;
+	data->hook.remove_battery =3D uniwill_remove_battery;
+
+	return devm_battery_hook_register(data->dev, &data->hook);
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
+		mutex_lock(&data->battery_lock);
+		list_for_each_entry(entry, &data->batteries, head) {
+			power_supply_changed(entry->battery);
+		}
+		mutex_unlock(&data->battery_lock);
+
+		return NOTIFY_OK;
+	default:
+		mutex_lock(&data->input_lock);
+		sparse_keymap_report_event(data->input_device, action, 1, true);
+		mutex_unlock(&data->input_lock);
+
+		return NOTIFY_OK;
+	}
+}
+
+static int uniwill_input_init(struct uniwill_data *data)
+{
+	int ret;
+
+	ret =3D devm_mutex_init(data->dev, &data->input_lock);
+	if (ret < 0)
+		return ret;
+
+	data->input_device =3D devm_input_allocate_device(data->dev);
+	if (!data->input_device)
+		return -ENOMEM;
+
+	ret =3D sparse_keymap_setup(data->input_device, uniwill_keymap, NULL);
+	if (ret < 0)
+		return ret;
+
+	data->input_device->name =3D "Uniwill WMI hotkeys";
+	data->input_device->phys =3D "wmi/input0";
+	data->input_device->id.bustype =3D BUS_HOST;
+	ret =3D input_register_device(data->input_device);
+	if (ret < 0)
+		return ret;
+
+	data->nb.notifier_call =3D uniwill_notifier_call;
+
+	return devm_uniwill_wmi_register_notifier(data->dev, &data->nb);
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
+	dev_dbg(data->dev, "Project ID: %u\n", value);
+
+	ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL=
);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_contro=
l, data);
+}
+
+static int uniwill_probe(struct platform_device *pdev)
+{
+	struct uniwill_data *data;
+	struct regmap *regmap;
+	acpi_handle handle;
+	int ret;
+
+	handle =3D ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev =3D &pdev->dev;
+	data->handle =3D handle;
+	platform_set_drvdata(pdev, data);
+
+	regmap =3D devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwill_=
ec_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data->regmap =3D regmap;
+	ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
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
+	return uniwill_input_init(data);
+}
+
+static void uniwill_shutdown(struct platform_device *pdev)
+{
+	struct uniwill_data *data =3D platform_get_drvdata(pdev);
+
+	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
+}
+
+static int uniwill_suspend_keyboard(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
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
+	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
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
+ * We only use the DMI table for auoloading because the ACPI device itsel=
f
+ * does not guarantee that the underlying EC implementation is supported.
+ */
+static const struct acpi_device_id uniwill_id_table[] =3D {
+	{ "INOU0000" },
+	{ },
+};
+
+static struct platform_driver uniwill_driver =3D {
+	.driver =3D {
+		.name =3D DRIVER_NAME,
+		.dev_groups =3D uniwill_groups,
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+		.acpi_match_table =3D uniwill_id_table,
+		.pm =3D pm_sleep_ptr(&uniwill_pm_ops),
+	},
+	.probe =3D uniwill_probe,
+	.shutdown =3D uniwill_shutdown,
+};
+
+static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
+	{
+		.ident =3D "Intel NUC x15",
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
+		},
+		.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
+					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
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
+		.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
+					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
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
+	int ret;
+
+	id =3D dmi_first_match(uniwill_dmi_table);
+	if (!id) {
+		if (!force)
+			return -ENODEV;
+
+		/* Assume that the device supports all features */
+		supported_features =3D UINT_MAX;
+		pr_warn("Loading on a potentially unsupported device\n");
+	} else {
+		supported_features =3D (uintptr_t)id->driver_data;
+	}
+
+	ret =3D platform_driver_register(&uniwill_driver);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_wmi_register_driver();
+	if (ret < 0) {
+		platform_driver_unregister(&uniwill_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(uniwill_init);
+
+static void __exit uniwill_exit(void)
+{
+	uniwill_wmi_unregister_driver();
+	platform_driver_unregister(&uniwill_driver);
+}
+module_exit(uniwill_exit);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("Uniwill notebook driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
new file mode 100644
index 000000000000..31d9c39f14ab
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -0,0 +1,92 @@
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
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/notifier.h>
+#include <linux/printk.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "uniwill-wmi.h"
+
+#define DRIVER_NAME		"uniwill-wmi"
+#define UNIWILL_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
+
+static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
+
+static void devm_uniwill_wmi_unregister_notifier(void *data)
+{
+	struct notifier_block *nb =3D data;
+
+	blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
+}
+
+int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifie=
r_block *nb)
+{
+	int ret;
+
+	ret =3D blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_notifie=
r, nb);
+}
+
+static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
+{
+	u32 value;
+
+	if (obj->type !=3D ACPI_TYPE_INTEGER)
+		return;
+
+	value =3D obj->integer.value;
+
+	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
+
+	blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
+}
+
+/*
+ * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
+ * from the Windows driver example, and others probably did the same.
+ *
+ * Because of this we cannot use this WMI GUID for autoloading. Instead t=
he
+ * associated driver will be registered manually after matching a DMI tab=
le.
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
+	.notify =3D uniwill_wmi_notify,
+	.no_singleton =3D true,
+};
+
+int __init uniwill_wmi_register_driver(void)
+{
+	return wmi_driver_register(&uniwill_wmi_driver);
+}
+
+void __exit uniwill_wmi_unregister_driver(void)
+{
+	wmi_driver_unregister(&uniwill_wmi_driver);
+}
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform=
/x86/uniwill/uniwill-wmi.h
new file mode 100644
index 000000000000..2bf69f2d8038
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -0,0 +1,127 @@
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
+#include <linux/init.h>
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
+struct device;
+struct notifier_block;
+
+int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifie=
r_block *nb);
+
+int __init uniwill_wmi_register_driver(void);
+
+void __exit uniwill_wmi_unregister_driver(void);
+
+#endif /* UNIWILL_WMI_H */
=2D-=20
2.39.5


