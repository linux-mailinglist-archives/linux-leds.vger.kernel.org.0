Return-Path: <linux-leds+bounces-5044-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10182B02A97
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 13:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5515F4A6F74
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 11:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8212275864;
	Sat, 12 Jul 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G13Ue76D"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4027585D;
	Sat, 12 Jul 2025 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752319436; cv=none; b=MO5CvLLallwg8Xynt4fMiTsOrCAFwGSfVIUqUwCq+SR+gis6U4ghvUkIS+dpUsiC9MNfib6mnUEwVlVNtOmnxzNoXCiskkAZvVPwUpIWbPuP0CmxsC3UwptOrGxh3dZgS/40AmFB2a8C861eTxs95OvtFuahVjR3opsnCPSCtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752319436; c=relaxed/simple;
	bh=H7MmkYzTY9A75Z8n4KYCE4QBd+q/VGejpgGJtTUUnhc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQuuCqpBLTxVVUpzwmV9oJ1BkrvV6vn0EkJA/yJcfySAtAHFHrV57AwejWGiR9FJz/g6dB7Mgjncw7BHJoyS3Ow+czbToirXvjkckZD8JpAbI3GWxpJzbM/WGYB988VXJayphn3xKoc3WNqX4j64PG41NIw4ku3u1TB+nBHzmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G13Ue76D; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1752319412; x=1752924212; i=w_armin@gmx.de;
	bh=MtmYz03uy7tTpkaH0HAdObXnsYy5CPmZ83lSU10NRrI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G13Ue76Dm3psl2M85r/lk/zLYt96xtsz1KgLIKlf3K2xtRxmdliy06hc/oyR0bCD
	 xRO1JS1IbEX8BiDhfwtmHZS37rcdhN8Oh01v9APTikMS19jkYha4jkP3JuznCdf2C
	 wMWht5WsZoOWKoiO4ikGs7Xt9utJ1lmZQHE4qHABH8W5s+rXj7zKLaiGRrDkt1feR
	 7be9T6SVB6XjTpLl65byP6Aw9tZiOiYfnto1G/vhPpCJAEjM1+ATt5J2lAFRVwyUI
	 0xN7fW2p3k6ZWDYOxnLQa/2DQBlew6iAc69NY3O9KZyesCwIdOIOx3pUx0Q2uGevY
	 j1RSBmLm6NtwSMaGuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M3DJv-1ue8AJ097t-00238l; Sat, 12 Jul 2025 13:23:30 +0200
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
Subject: [PATCH 1/3] platform/x86: Add Uniwill WMI driver
Date: Sat, 12 Jul 2025 13:23:08 +0200
Message-Id: <20250712112310.19964-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712112310.19964-1-W_Armin@gmx.de>
References: <20250712112310.19964-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BsFTzSVQ/fn36Ax1Eq6dAKDgW5qVfg94v9xA8ScNXXrVo5e9fo8
 BI6ITwr07dHaltQqc6ywQPoPp+vO2aAYL56TpeG8BF1z3wTuT0k+JGPD4hk8bvphzkc+bJv
 gvWqKwQnwRu6vurevxeasqJ4sldOsK8fgLRHCtDqNTK7atih6jJgHr0i3UswXSrSGV6GRc2
 452arKz8+w6uUy2iAYbKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:frjYrxVwh9Q=;qfiZfnxTpJFbkaDc6RA/z31zaWx
 hqcCNCTH3NYrlC4TOXbOOVukgI+LWB+fZU1ruk/2l+vPnf6H4Yq+kTcWuvb8wD9YACTQZi3Cc
 blB3PvB/JBvP+4snQQ/q4O37N84TkGx1NE0KS/bSutH8CKTfnZt7rpiG4scu9w7BACQ90pXyK
 r3++Sl66Mvy4WxO+a+ApL64aeWVb/snGgJyRIRmBRVMdMr730v4FUerhk3r0e5KUsip/nJJ6W
 ha8i19H8r1EpHRDyETsRViI++sfV2rfFUbYWaPU+j8SFO/Rl+98qQ6M1+R+CSsUu7Ke+BdwvI
 2WJwYwSeX8jJ2i9H5AUIjCw7Vbdm02LCtAA4OzQH495uz5M5PpQ0JMYmOC0+hDx46BISnZGep
 S7pSD+Y52UlyNDZxoEE5FDRj3gSz7jS596vVqbGZZBlR8ZABW0osYA4IQNz2yrHLRS4jIvN6+
 nWsmJDBqXHUtY6DTGuvHNXjUxSvx6vi25Q/c3uuwABLuHRz07kUaMCk5Fzg/neIOXvS2pdVkl
 J5IikshqQq9xj8Vjq4GiDKvFVg8kY3zjs8rb89kCJ+e+F5GjbSGULGz54VygvbdyVgMWKng1K
 rLU8BCSVEUd4G6lOqpZOskqIb3r645vm/w6n5BpLnePTpGRi96SY+jiC/qapdE7o3aUPFMYui
 vL4ZGiTKdA+KkNHzCn5eDh3BLbQjGvatSY7kOYHxoawLJJLwDkWaG4hIHhcleBddulJK9Pa1i
 HsSLnxRBLi06ayuX9QwmzGO3g/KFsIwVXAoj0ujVf0NV4VJd7dST9D/fNI6A0w3mhq+5JNjgn
 qgnCWP9pKb466bYtMKLueCoOV1jPzjoD+5o2DU6yAoYl97p9zQfwTrWEuPrgS+H7sC9P20FgH
 Vb2++HHdz4nJieV+jvnCtioio5yiEm4wZgCVtFTxDjgfWMx4YO+nOrvbDmy8Ep6MWFVe4EPL8
 NitclMraoEUK5lFRpOv8YGp8zaK3M5RBfufIz6KNicsu/BCr++4oZmfOo4OLQp68frIfb9UXB
 RP7slf+4s+1vcTo55mD/PVujOGi+EVJylxzIdMedZeGh8fi9ENXn8J/rkfD9Fsrq+crEHsIrM
 GtVzya41dd8Dl1CYURZ4XuU2n80eWtNZdJ3tsEojjHlW0ZwgPOJ2YcjYzF7pi3wE6g9yAuqRs
 D/SydyEz9SPsAsQZ3AOsJ/u/MQTFCl/2g4CoAtrZOTZFS+TU0PdrBWfJ1ANi3D8Uup93lrk0t
 hfk50Iru6W33bk/ltCO3d7go2uoWG3BnWQ/2o05dwTOJHtMFz6tAsTI4V+HrsNBmj0k6O/qE9
 oLSamRsFSWod0qGQgC4KHdQC/2pG0GT0P2kFGCZDWozng0hldH7PuukHaJGdtX4T86szaVPL6
 bUmBADzX0JzS//YajDfr4nrpyeG23kDGZTNvBvjAD7mW94hG8CNdy27lDSMzrKyOOjExOkIRR
 bPloQbnxrRYT8Lzql3bHrK2UEvaaS1uNtoP8GNwieShLPnbi4Fv2bq96zkuCZxTYSkCrK0sqz
 lDCpFMs6iBqAlviL0OCeFA2dduQElSaSgmI4s++yhUK/TSIW9+tmdHiwQ1+TfmPfhUEcT799t
 8zfHy2toCAgSD6gYQZarUDFbkHkwTqhzjl/c/XIL8BHUq/BadHKXUlsTVO3o3FM1IYO/ZK70j
 +0WsrxImpzx+dF+jGe9cId1Abt5Uy+UoJhlN1VMUGP3FlWd7EG3IHVPTwhSYJ28EV0a4QW3Er
 Rz0+z1+z4j8kvahpSKAZ5zcmk4dDGTd46gMydi2a1sYQ6+8W46jaMWmu8VrKGz5R9zCzwkBJl
 4EjgS+Y7qsgsLL2KQhtoMHuAZDAXp9j2pdYPnBP6vRdMOwnQ2CJ4mOj699JPminqldN3p2p86
 yC6WvkTGuLINilBXCeze992YYm/VytGnHG+uc/kACc8qbhG+ERwTAmqfeo4jdSSY3AsPc8p8F
 295xGjorVMpMFM5j5pF/re7omnChpL0ITjnsIqOLbfFLsrl92Od155miFTtF7UCZDN/dS0hf3
 FqZohHFwXbboGrdJg2nM8syDJfpEv6EHKhs4Xo5in4yhSJ/cAitO+UuU82eizBog70g0NawIw
 KhFPN8Hsjpkj/EkVYJNLJJu5JFwQl0qgRKmEt2EPruOYV04uBoTGT2HGpButs+16PARvkxpga
 F/lwK7aoQcquXBPjAQ1b/H6pp4fMgNyjJlU2IwgAirjOgmh2ju7NxMBM/QwaQntEVGWxb6Zw4
 EYouri0Wc5huzeywj0+p7XPnm2qwoIqDBxiu7QFfrHZoP/5fk8RiZEqlpGSRg7jnITQ1kw+K+
 GrVRCsZohH2q5hpyGVo2nngNAMxVaZX3xgr748AO1F9dCJIa9RHutlQgxafEu6a0aBigLRbXd
 xjspJB9rd1KfFXCE1hUb+8KOTVJf1ARtrlKKb39juyiTYhxn/eXzGVM53LVaxgSO1pwXbTmyk
 kcKwk4VUsGDd8exH7URuYKDwrtMdAh98jYaYkoKUtCm6UL2b8bxm5UxcCGwnloGWeWovpGu9b
 m9wCt2gYYunODOgHuLl43xLldXGzBCQ1kCYE1HWINLGrQ3wQMdo5XygmEeV6hGjbWBrzFQ9Dy
 qYsH080F8uULDhxZyg/asCpwJi/mdng3q6fu+vcv1ICJ5MmgR7423dggC7FtHOBPm3JYhdpb3
 dDq6uG0hSzluxmP+Si3/gfeQu+KhPw2suuZkTrNp2X8adWMwhdqPx3tTVuhgs/FsF3EoBMJa1
 bavY0BljYSJl8DWc6GwncB6RzSb3FBIi8xvKoN1GGhfrYBUuobuWgMLzOLIbtQWp4lK3yt5Mh
 oXeiHYscxDjrnJqBHRqG8lG8kpW9h43Xxivn/es2eLH7UjXTXN3Ij0nVBIJtoHnoexMP22BBs
 p5mpX5kqQtsfDeP9f69JM6dTeWPJMi14NBG/Eju3+QzysYHJVFfFu0FLtF6ZxyB49E3h4ZPqM
 0s4eaxBLE/W00IXEV3uOKDYXNcu7acyls0FDFeugZ+FLmPUjWXRJKY3UqWd4GrN3h+ols4BBM
 KLnwSWG+w4IMOY8162TI3WmtY/4Fgzx9kv8Qz44GAo/bHxp/4jTyqjc9B6qS0vO9BBbcWP6bt
 2IBrwOc0GxxVCKmxNJNl4ZY+JfIch9Xh3HGgs1oRf/BKn4krmhr6m+RbVM/E/yDO561ju9t9k
 4wec5Qo7W+U9bGJmOlNVOT5Val3PA2/lIVQOg3tqSHS+szkyFd/3bEJNaosp/cFkgxsalsEFK
 0Y8SAvtjFM3tpCO/ADuiIbvnbMCa058bIopB3xbXMPiLkECP0vrgPUWh7NQeGXVepooP9Cdqk
 58rRuzI/eU6XT3PxIhUt/edzRUuiTUbo5ZPgb2ItbLx4ytd59qeEXT9O2VxIAhRwEJwUzP0gg
 Rj4nn3WZta01mECfUC9lBSNxx8/ldsaL/Db4z3w+cmT3ue+OEQ4x0ppQxwfTiSHNCq+XhDkQD
 bEWPlroRPQFGyTnukCblXBaimO6VXUhiBdP2qtAkYiJrNPF8BuyTpUQFvL46Vu/mJB4imdG3n
 5rv2C8D1wi48q0TgY98bPK8kdavxrjMPkGBvx2DMmUUE8DTia2NglFgO5V3NuUt35mPwO6DW2
 wvwmo0IobvuMNw=

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
index e8f3dc93a569..6c5879bd2ba2 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25490,6 +25490,14 @@ L:	linux-scsi@vger.kernel.org
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
index e5cbd58a99f3..59ce7247dae6 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -65,6 +65,8 @@ config HUAWEI_WMI
 	  To compile this driver as a module, choose M here: the module
 	  will be called huawei-wmi.
=20
+source "drivers/platform/x86/uniwill/Kconfig"
+
 config UV_SYSFS
 	tristate "Sysfs structure for UV systems"
 	depends on X86_UV
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index abbc2644ff6d..d0aac46bebf9 100644
=2D-- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -112,6 +112,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+=3D toshiba-wmi.o
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
index 000000000000..f38e4bbcd8b6
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


