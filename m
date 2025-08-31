Return-Path: <linux-leds+bounces-5331-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B376B3D4F5
	for <lists+linux-leds@lfdr.de>; Sun, 31 Aug 2025 21:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958C9189B222
	for <lists+linux-leds@lfdr.de>; Sun, 31 Aug 2025 19:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE85D27605C;
	Sun, 31 Aug 2025 19:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dUQ+nqDY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D5276048;
	Sun, 31 Aug 2025 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756668488; cv=none; b=XJ2SursntD3jzc11rFWjazHHPv4stbpvs0SKtvIwQr4s2T9d6OxAFN4sYjrspPbv6EXS4TpmUiIlhjSNSFRymBXj38CYM0KxQ0e5ImtLLejyw2VdKheebYGucXnO42ecBJslDMgyKFzOGKa1w+A/xAP2lmjKihZqborZPuGEv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756668488; c=relaxed/simple;
	bh=z2/EPGLVRN0Yu3GoCFaNERbHocx1Ri1QetEOi4a6JlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MwtrWd3tzjpCSxgrUIbYOtjPQ6KcGJ/4o7rC3gB8Jofb8K1QtzvpSi3JDY60H+I1uMHBcwBUwOm9PwbP+NU2cYf18luwZSdSzg12d+8LFQIa2Gevyx+QDj6M8Ojqc89NdpAUNRDdZLkdhaUj7u7Xe2xJP/Ip83J3uxRwpfFF3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dUQ+nqDY; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756668459; x=1757273259; i=w_armin@gmx.de;
	bh=GP8VjxlrGo+6zgop8V/fPMVe8ALbebDXDN/rNHWd+Qs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dUQ+nqDYMrWA1jjUJif3n1/3cHTbGSIVVNDrd3+5UslCFcNAnizGo03M6KnI75aB
	 7Wb40SH88/8M0raVg2O9cpoBzt8fcgXDHyScIFSMBt77OYbpr1XdRq2e2cnsXg+Is
	 9G6Q7ZHerC7LfqORk3qQSIcFCWKxXr8ma2RSFeFCPwd/VkceqJG5fea1/EqttNch7
	 N9/1sulPuWN0agA48L04qJJy9mH7Q+5xdUoXxcMDmcO6LjADkzUeywgHvO92AhGHh
	 87ZjHDcX3B2F3/TTbMRnry/YuQ8+ys14EXUPhNpD8PT1SjwMZuewzXCP0qRHRRhau
	 gEGmRRendKqaWFbPWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([176.2.64.54]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1ul50A3qd2-0079PV; Sun, 31
 Aug 2025 21:27:39 +0200
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
Subject: [PATCH v3 0/2] Add support for Uniwill laptop features
Date: Sun, 31 Aug 2025 21:27:06 +0200
Message-Id: <20250831192708.9654-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jc/NQB/G4euqRv6YNKEf14XAbiGF4rvsPNw0QC9DMmQNgusMqkP
 VkyNL8UMNMLIVKWcqRkDfr4qitchddRqW3zv7yFj5s9B9tawHbK9sl7j/k2uN3y6QJ5utSg
 ffMhm2jOKMigKqwVAtZBSfksStw39fQp6JBQm2xS+AZkrU2eKu+ZDOj9yDtEdJKLTEVlBwI
 mnrEhAF7UEegbklhp7DPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gz7uKXoWjVs=;SE3TGwOcBUhYGJc6W6/PUE3qYfB
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

The first patch introduces the uniwill-laptop driver that consists of
two parts: a WMI part responsible for receiving platform events and
a ACPI part that does the majority of the work by talking to the
underlying embedded controller using the INOU0000 ACPI device.
The whole driver uses a DMI whitelist for identifying supported
notebook models as both the ACPI device ID and the WMI device GUID
are shared with a wide range of notebook models that might use a
different embedded controller register layout.

The second patch additionally adds some documentation for configuring
and using said driver.

Special thanks go to:

 - github user cyear for bring up this topic on the lm-sensors issue
   tracker and being the tester for various prototype versions
 - github user dumingqiao for testing the battery, lightbar and
   keyboard-related features
 - Tuxedo computers for giving advice on how to design the userspace
   interface

NOTE: During testing it turned out that the touchpad_toggle sysfs
attribute does not work. The reason for this is unknown, as the driver
emulates the behaviour of the OEM application just fine. I suspect
that this feature only controls some obscure key combination we dont
know about, so i decided to send out this series regardless.

Changed since v2:
- Use the INOU0000 ACPI device for talking to the EC as it is much
  faster than the WMI interface used before. Additionally the OEM
  application also uses this ACPI inteface through a special driver.
- Merge the uniwill-wmi driver into the uniwill-laptop driver as
  the WMI driver should only load when matching the DMI whitelist.
- Various small fixes

Changes since v1:
- spelling fixes
- add missing error handling when reading PWM duty cycle
- fix error when setting the super key lock sysfs attribute

Changes since the RFC series:
- spelling fixes
- mention the INOU0000 ACPI device inside thew documentation
- use MILLIDEGREE_PER_DEGREE instead of 1000
- use power_supply_get_property_direct() to prevent deadlock
- add support for KEY_KBDILLUMDOWN and KEY_KBDILLUMUP

Armin Wolf (2):
  platform/x86: Add Uniwill laptop driver
  Documentation: laptops: Add documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
 Documentation/admin-guide/laptops/index.rst   |    1 +
 .../admin-guide/laptops/uniwill-laptop.rst    |   60 +
 Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
 MAINTAINERS                                   |   11 +
 drivers/platform/x86/Kconfig                  |    2 +
 drivers/platform/x86/Makefile                 |    3 +
 drivers/platform/x86/uniwill/Kconfig          |   38 +
 drivers/platform/x86/uniwill/Makefile         |    8 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 1537 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
 12 files changed, 2130 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

=2D-=20
2.39.5


