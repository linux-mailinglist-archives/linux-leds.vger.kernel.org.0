Return-Path: <linux-leds+bounces-5332-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76338B3D4F8
	for <lists+linux-leds@lfdr.de>; Sun, 31 Aug 2025 21:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4303B179DBA
	for <lists+linux-leds@lfdr.de>; Sun, 31 Aug 2025 19:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABDE2765D2;
	Sun, 31 Aug 2025 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZCxSST2y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5C2765CF;
	Sun, 31 Aug 2025 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756668500; cv=none; b=ZN20NtAktFVSYreLmgPHV5TBJuYZOX+z+7IMr8ZSkz61sjx3XUz1WaeW0zpZVIGEVXe00uJ2fHcMIfv43k2WxNJpYGsuMJvI06cJq5ohcz5NNxcmczGep8A1MZrhsVgca4XE+b6yt+asOQl/FgLRrMkCUAFR+AWJkZoditzHCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756668500; c=relaxed/simple;
	bh=uQ6ZcrmHwNeTEgRtILsnQM8EPqZFaMQO+ydnsOgingE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=go20wx4TKenh7uHbjT/T2ttkdl7EmfRd09KKsepbiko3oJTC0j/tbXy+TZ95FC/2Am98J9poPhL0oBwTWFPeGA644X1nL4DW2AIRMP4dDJapCJPnxWumLx6kfTTyAnORDO4yxrgtJsWLf/5A82IOIlF1iYo5QaawyambqYMKq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZCxSST2y; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756668474; x=1757273274; i=w_armin@gmx.de;
	bh=mO5oSar6BnyDM3xCBZJHBIweT4ZpbLSusdmIkGHRRgw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZCxSST2yxZ68MZNw04aJTxqNwfyhGUg/LMpyzSD7ckp60i6xZBmF7xwv4NEuFpNc
	 qj0djIOcfzt7ApPK46plAVz4+/lGPgTjLxe5WWieq8aw2Ee2OTCyYwmNDbBL8KE4w
	 KDO3Y1rEgmZJHteYlkXDWUe+wwDrS0CsvTJ9k53SbX70Om/1dBW3kXIpPJCuPCbSD
	 ZBXNRSSDka6fUwzNXr2BQOGWA5sPSnAe6ptv46ynR2HPWs6tebjRFkZLUw1w/+yuj
	 m2UifZMPl2CW3MKmVSOCIdJgjRaIzEvVyL14+wc4/7h5Y+5eoK9BkxyzNAlnKPGv3
	 866oG59MU5vgCcYzeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([176.2.64.54]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1vDV7y1tYx-00YVCZ; Sun, 31
 Aug 2025 21:27:54 +0200
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
Subject: [PATCH v3 2/2] Documentation: laptops: Add documentation for uniwill laptops
Date: Sun, 31 Aug 2025 21:27:08 +0200
Message-Id: <20250831192708.9654-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250831192708.9654-1-W_Armin@gmx.de>
References: <20250831192708.9654-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KTYC5t9+d7d2vbramSrpZRfeQB4rzGcqc1RZqSz7SaSigp1HkUM
 F8JTntPwBwMLqX3bquYdhTozJt6TkeXFqwIePYWt+T9uWy3oD+zPLdFZ2Sf/ypjyRZumAtw
 0wk0O3BImSt33+l2Vs+1MevZNFf23Rxq+J2rZNv6//7qtp398t/sE4ehw1b2ndV8ZXTolbU
 tVaowNdi+/PcKNHmKFQrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DQk0ZAKyBdI=;2BqIBt0TQoEscabOjWbMfS6gls1
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
index 99624393f271..fa365c3679a4 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25908,6 +25908,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
 F:	drivers/platform/x86/uniwill/uniwill-acpi.c
 F:	drivers/platform/x86/uniwill/uniwill-wmi.c
=2D-=20
2.39.5


