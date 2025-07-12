Return-Path: <linux-leds+bounces-5045-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94626B02A9E
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 13:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D18FA7A98B0
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 11:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B68275AEC;
	Sat, 12 Jul 2025 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G4INqhgX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92969275842;
	Sat, 12 Jul 2025 11:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752319439; cv=none; b=hG3k/hyldqS7cgCsADj+a7xN03KhIc/9OqqeBNkcaPlc8PSEDp2RidUIoqm4mgKNkZWRg+lgaaSdOpx3elg+s7cw6rZbi736U03kCSubGfOwC08bE0oirZG9EqBLlveD9CBs0Lb2wWxws9jXR2SNQt8HdM+toXn0E9LAldg9Oh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752319439; c=relaxed/simple;
	bh=0AucxieByy6Sam3tMbn/POJFduOj6YsaeHe/43j8G0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R4DlxaC/o3vpz2aiXKtq1mJzGLjKg9jTFNqUBnMJ02uIV6GNsTcb4comYVPe6QIt0TjC2aZvT8IH371LznVEce6aRScbbUTnEOMH2/8GFMUpytOAEylwCGbLmkZxHbUaZ6jp9NdZE27D9ilvBIvWdQr+MnFNRY3sw9WwVPiW43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G4INqhgX; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1752319408; x=1752924208; i=w_armin@gmx.de;
	bh=70SuMAghUA13PefBQsucc3x/FY7T0D9JdPyGxiL704M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G4INqhgXfJVP04krpMJDO5e3pC0fyVpUa4/cAosniOxYhLFOBFeYj+GDrU0uN/TF
	 uGdOnDFHGVoWydFolXIiNMJq4qfKqde0axZeuLpY1V87OUVDjRBX1FJ+BwVxc/fYd
	 GsJuV1EVoGaTI6pJrrjr+yN4Lr69gPcdVdD/28Ltc7++wKChMx9l2t+bTwdzVQ6XP
	 4I4Ho9Ve8FBio2Llej2wAHkT3Bnjg4nPVYtKopBgQeHSObsQz8l19uYgBDsf2vJWC
	 35DHBgL3FUSv44GCXtD+tsYQdUb630ZHe43SBnFTR0Fy34XZ9BUU19vZhb7kXs2H6
	 uXUsHwhUuoCx/ShZyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Ml6qM-1v4QU73IUu-00jsW0; Sat, 12 Jul 2025 13:23:28 +0200
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
Subject: [PATCH 0/3] platform/x86: Add support for Uniwill laptop features
Date: Sat, 12 Jul 2025 13:23:07 +0200
Message-Id: <20250712112310.19964-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bkmyQyYyTnQXNQQjEclGfRq3xo4r1pTdmXM89pTJhKcodvJiRhz
 C2SmU6zIJUsOz3GU9gB7BZjTr5ivJp1ft1iIhmt2OfUdzyo+lft62xgW4Wi7AazvtIjdXA3
 ULgiW6rD+/3X0rvzbBgcRlC+/bYHEqN8ZMYNTslBKgPlLI6jmUXZ489O0++PZilW9Sphd6v
 dNooVgfocrSz76GvvtnHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XR5y7OfYrwc=;JCALJxLRhuhzitA4PxhTscEF3pX
 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

This patch series adds support for the various features found on
laptops manufactured by Uniwill. Those features are:

 - battery charge limiting
 - RGB lightbar control
 - hwmon support
 - improved hotkey support
 - keyboard-related settings

This patch series is based on the following out-of-tree drivers:

 - https://github.com/pobrn/qc71_laptop
 - https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers

Additionally the OEM software of the Intel Nuc x15 was
reverse-engineered to have a better understanding about the underlying
hardware interface.

The first patch introduces the uniwill-wmi driver used for handling
WMI events on Uniwill devices. Due to a grave design error inside the
underlying WMI firmware interface (the WMI GUID was copied from the
Windows driver samples and is thus not unique) the driver cannot be
autoloaded. Instead drivers using this module will load it as an
module dependency.

The second patch introduces the uniwill-laptop driver that does the
majority of the work. This driver talks to the embedded controller
using yet another WMI interface to control the various features
available on those devices. Sadly this WMI firmware interfaces suffers
from the exact same issue (the WMI GUID is not unique) and thus a DMI
whitelist has to be used for loading the driver.

The last patch finally adds some documentation for configuring and
using both drivers.

Special thanks go to:

 - github user cyear for bring up this topic on the lm-sensors issue
   tracker and being the tester for various prototype versions
 - github user dumingqiao for testing the battery, lightbar and
   keyboard-related features
 - Tuxedo computers for giving advice on how to design the userspace
   interface

Please note that the whole series is based onto the pdx86/fixes branch
as it uses the new power_supply_get_property_direct() function.

Changes since the RFC series:
- spelling fixes
- mention the INOU0000 ACPI device inside thew documentation
- use MILLIDEGREE_PER_DEGREE instead of 1000
- use power_supply_get_property_direct() to prevent deadlock
- add support for KEY_KBDILLUMDOWN and KEY_KBDILLUMUP

Since the changes to the driver source code are fairly small i decided
to keep the Tested-by tags from the RFC series.

Armin Wolf (3):
  platform/x86: Add Uniwill WMI driver
  platform/x86: Add Uniwill laptop driver
  Documentation: laptops: Add documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
 Documentation/admin-guide/laptops/index.rst   |    1 +
 .../admin-guide/laptops/uniwill-laptop.rst    |   68 +
 Documentation/wmi/devices/uniwill-laptop.rst  |  118 ++
 Documentation/wmi/devices/uniwill-wmi.rst     |   52 +
 MAINTAINERS                                   |   17 +
 drivers/platform/x86/Kconfig                  |    2 +
 drivers/platform/x86/Makefile                 |    3 +
 drivers/platform/x86/uniwill/Kconfig          |   49 +
 drivers/platform/x86/uniwill/Makefile         |    8 +
 drivers/platform/x86/uniwill/uniwill-laptop.c | 1481 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |  186 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  122 ++
 13 files changed, 2160 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

=2D-=20
2.39.5


