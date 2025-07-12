Return-Path: <linux-leds+bounces-5046-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECBFB02AA0
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 13:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BC024E17F0
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 11:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685C5276036;
	Sat, 12 Jul 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="giJhRCi4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0054F27585D;
	Sat, 12 Jul 2025 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752319445; cv=none; b=Yjfuq5FHLYMijgxumJpLjjK4Gzqbd7fSROR8zlus1G5HyK1q3FDs/qkqpHhMAZmKNlFe5DslQeikCzPxCXyoligMkmg/QoNHX82+rccRcUVD4MN0bg1zr2rb7o0lE1BBpeWtQ/nIxjrPvjdDZiS0lrC6pywAYewj3UJHww7GC5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752319445; c=relaxed/simple;
	bh=gTM4aMv6hJrPmPAHzUP/+2qQUoZgH+/FZgEWAaPEqOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YkN4aWqpJ5cy8xnEpkxqhD/Nbc18uiKGt/g+DiKgVnmcemQ+Z3IMmD5sadppYD9uegQsQON/DXGg0kjvqoJBCumDL7Jy/diwgILsMLgqQpq8VuXiA+r794Hr/QVmJvQllIk7mTTC3VweMfgBJpJ+eOn3J5/C1UldHSu9EI2e7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=giJhRCi4; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1752319419; x=1752924219; i=w_armin@gmx.de;
	bh=XSx+6LzVSbNbIWznWvt7Yu+EJxbTFfYcUJ56Et6KTkk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=giJhRCi43fdbP5sFDVkxlOWX12bgXh6D7O9NT0XItTOa9n/KCwimWqxY+iSOZ9Vt
	 o1M2QvYMsqKIU9MNWoj7P74o75qX7sPCrQvYjqNPnemldlrWVAci4beUSposyqAx/
	 PzWdwSaUlHDgW4Zj3a/a7p9hfrVOZVbM3OkLsEysOCLbjdxzgrOQMLMmX8E/4FcJx
	 u1KTtyQpoGYRmQlYUBIFhfTagRJx7ccmaO83c/0C/CiwbmqEfCySoZk5XZS0WIEob
	 +s4VnkOu5306ENegn94/FoPa2gB5l4jtqoD50+iXgeCiCsI6oa8FGLnLCkowuJ6+Q
	 iNN2SrNbHlq6Qo3Bhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N1Obh-1ulOCZ3KRf-00zjlH; Sat, 12 Jul 2025 13:23:36 +0200
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
Subject: [PATCH 3/3] Documentation: laptops: Add documentation for uniwill laptops
Date: Sat, 12 Jul 2025 13:23:10 +0200
Message-Id: <20250712112310.19964-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712112310.19964-1-W_Armin@gmx.de>
References: <20250712112310.19964-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5pqmTXX29idlzgbf473NXC34zm0Er27AkaiKFOGkJ/pPnoLjIkP
 pK6yvVilWIlUgNZ5VYmitagv1RKQLwsTZ6dvlfNFH4wRTOUQygY5b1y2VbknnslcwmKnGy1
 J2YDgHK0eM/wJpoiIRscXngaNLRcmAyFqXMCuqI7QoDdQ+8RtlRsyfaTizoJ4DoWbRmigi3
 iLREUQwUZHFmuXrFFVc9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KKFk0MVHGE4=;rlBCSsAay9fORttMRypBIgE3aY4
 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
 C1DcdW9Gcdf77HB/v+We1ntaUfGSDh+fNj1

Add documentation for admins regarding Uniwill laptops. This should
help users to setup the uniwill-laptop and uniwill-wmi drivers, which
sadly cannot be loaded automatically.

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/index.rst   |  1 +
 .../admin-guide/laptops/uniwill-laptop.rst    | 68 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 70 insertions(+)
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst

diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/a=
dmin-guide/laptops/index.rst
index db842b629303..6432c251dc95 100644
=2D-- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -17,3 +17,4 @@ Laptop Drivers
    sonypi
    thinkpad-acpi
    toshiba_haps
+   uniwill-laptop
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
new file mode 100644
index 000000000000..29f6ee88063b
=2D-- /dev/null
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Uniwill laptop extra features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+On laptops manufactured by Uniwill (either directly or as ODM), the ``uni=
will-laptop`` and
+``uniwill-wmi`` driver both handle various platform-specific features.
+However due to a design flaw in the underlying firmware interface, both d=
rivers might need
+to be loaded manually on some devices.
+
+.. warning:: Not all devices supporting the firmware interface will neces=
sarily support those
+             drivers, please be careful.
+
+Module Loading
+--------------
+
+The ``uniwill-laptop`` driver relies on a DMI table to automatically load=
 on supported devices.
+When using the ``force`` module parameter, this DMI check will be omitted=
, allowing the driver
+to be loaded on unsupported devices for testing purposes.
+
+The ``uniwill-wmi`` driver always needs to be loaded manually. However th=
e ``uniwill-laptop``
+driver will automatically load it as a dependency.
+
+Hotkeys
+-------
+
+Usually the FN keys work without a special driver. However as soon as the=
 ``uniwill-laptop`` driver
+is loaded, the FN keys need to be handled manually. This is done by the `=
`uniwill-wmi`` driver.
+
+Keyboard settings
+-----------------
+
+The ``uniwill-laptop`` driver allows the user to enable/disable:
+
+ - the FN and super key lock functionality of the integrated keyboard
+ - the touchpad toggle functionality of the integrated touchpad
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
+Hwmon interface
+---------------
+
+The ``uniwill-laptop`` driver supports reading of the CPU and GPU tempera=
ture and supports up to
+two fans. Userspace applications can access sensor readings over the hwmo=
n sysfs interface.
+
+Platform profile
+----------------
+
+Support for changing the platform performance mode is currently not imple=
mented.
+
+Battery Charging Control
+------------------------
+
+The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
+the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
+between 1 and 100 percent are supported.
+
+Additionally the driver signals the presence of battery charging issues t=
hru the standard ``health``
+power supply sysfs attribute.
+
+Lightbar
+--------
+
+The ``uniwill-laptop`` driver exposes the lightbar found on some models a=
s a standard multicolor
+LED class device. The default name of this LED class device is ``uniwill:=
multicolor:status``.
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on =
how to control the various
+animation modes of the lightbar.
diff --git a/MAINTAINERS b/MAINTAINERS
index 3efec7a99262..fe302a610fe6 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25495,6 +25495,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
 F:	drivers/platform/x86/uniwill/uniwill-laptop.c
=20
=2D-=20
2.39.5


