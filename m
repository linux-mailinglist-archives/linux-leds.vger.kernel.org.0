Return-Path: <linux-leds+bounces-5962-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF2C293D3
	for <lists+linux-leds@lfdr.de>; Sun, 02 Nov 2025 18:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165573A95EF
	for <lists+linux-leds@lfdr.de>; Sun,  2 Nov 2025 17:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339312DE707;
	Sun,  2 Nov 2025 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="anhYSlBH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82742DCF50;
	Sun,  2 Nov 2025 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104625; cv=none; b=kr/vpwPwaa6VU+ZpQ7NVw/C6WaZuFfHVY+iyag6OjmWtJXOkAQj7AoOKLwOR/Y3dnmmHQl/LxAVhTA/u/zIi3mJOWU0Cwpi0bePrCc1BbUCQHS59QZZHJRsxaBDe9PvcpSO6Clyx8vLio5S+7CrkLoNVgD/oEil+No1mfLyaT4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104625; c=relaxed/simple;
	bh=UKsLv9Ihng39ekNWTWrRDX3IJVbwZWgP2sI5grbM+jM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CAiONEhHAI6welapvgiGIrFL81rAh8UrcQiAzQmB9yTj5AAnbA2B4QxLFloOIhv6s7q9PbwbXnBqXj7ZWFQgxW6hPb1LXOr8bGC0FULVKz9DsingBiy6iNXQbtjFuYdttg3J2q+1UFbOUeCocYYt/Egpc/LYDfqZQ9JYyYicRZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=anhYSlBH; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1762104605; x=1762709405; i=w_armin@gmx.de;
	bh=pAdXqaDaC/XFvvVI9KF6b6DmiNSQ1Qn2G5fgPVjAQA8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=anhYSlBHr7ZQFJRFABTcIRBa82HfTQ57LkfRXuf4i/0rxpdw6YCTpdamsTCeM9BU
	 xJ4axZqmR63iGv7GpXN0j5fFL5mL51gkf8l75T7uCtiYX0q3LDECY4qIsrmTGWABz
	 K7Vo4etF8fDjOCQTkKK0ZP0iQn8SUVfZrXFpyMZuVJUallF1+JrYvsIDCvHS9AW6h
	 K0cM7WkUqo5sXHl2JJdGPPFJ2d9S6ufJniJCOkVbBklY2Pnzly4Wl4obZxba/RrkO
	 KUTpVRXH63+79mzc1C6GC4j8wMZIzSykjxUxmFRWtsh6KyTL8KcFoiM07iux2BaJw
	 1MQcstYs9a2r7X8ubQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MYNJg-1vjwlT2Agk-00PS26; Sun, 02 Nov 2025 18:30:05 +0100
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
Subject: [PATCH v6 2/2] Documentation: laptops: Add documentation for uniwill laptops
Date: Sun,  2 Nov 2025 18:29:42 +0100
Message-Id: <20251102172942.17879-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251102172942.17879-1-W_Armin@gmx.de>
References: <20251102172942.17879-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fk1gmPcsIr8vR7wxOki+DDW7ai7hjMWL6OKDcKz7vOa8bhgkFUF
 o/Qoxmkfvum9RsrqITCbpsiW/0pEX8Xh+312hsqw+i07WCNDDf/0c5EU+LcIrDuV0x5Ebxo
 /e6mtnaqoRlvXs8PY+hzEbGPB5DrYFS4yv7Pudvl/jC0FyHSaVQ2AIZqD0Q7KgIDwTAPrht
 9DVWtrtnzExOEGdKdGShw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uDFEACoMF5U=;r1S3NLXkRsnggBA6B+AAqFUzOK7
 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

Add documentation for admins regarding Uniwill laptops. This should
help them to setup the uniwill-laptop driver, which sadly cannot be
loaded automatically.

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/index.rst   |  1 +
 .../admin-guide/laptops/uniwill-laptop.rst    | 60 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 62 insertions(+)
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
index 000000000000..a16baf15516b
=2D-- /dev/null
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Uniwill laptop extra features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+On laptops manufactured by Uniwill (either directly or as ODM), the ``uni=
will-laptop`` driver
+handles various platform-specific features.
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
+Hotkeys
+-------
+
+Usually the FN keys work without a special driver. However as soon as the=
 ``uniwill-laptop`` driver
+is loaded, the FN keys need to be handled manually. This is done automati=
cally by the driver itself.
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
hrough the standard
+``health`` power supply sysfs attribute.
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
index 8fce9b5e9fd7..290e5118d761 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26381,6 +26381,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
 F:	drivers/platform/x86/uniwill/uniwill-acpi.c
 F:	drivers/platform/x86/uniwill/uniwill-wmi.c
=2D-=20
2.39.5


