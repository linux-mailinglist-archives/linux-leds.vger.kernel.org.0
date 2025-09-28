Return-Path: <linux-leds+bounces-5609-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDECBA658A
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 03:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E82C17C0CA
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 01:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6CA2459D9;
	Sun, 28 Sep 2025 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KBie6zbV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A324469E;
	Sun, 28 Sep 2025 01:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759023214; cv=none; b=URQv8HY3I7HpHEeLWwyJik5y9HonwG+bKDbJ7EWNFY2UXUzrOPzvY89vKlpgMWNJC8yWwYhSk9qXboUcgWcoJRSlgeZ9UU4z0ahuTbzGgV57cSl8INjydqfn3WfHtEX1gcDBck1C2LuTJ3rSL25+VBL0Fr/HeqUJlAhLWn6VqyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759023214; c=relaxed/simple;
	bh=GvBWZFAvOicXLR2DAZxB+PTxg1LPIYuNilHsONg1S1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bj72N13fsTrqvJXYwPRNcljCCVvQKxIAIWYbA4vU2DnwAeI4FMBU4QDq0Nl9vazYJPoZskRNZb3EOI8/4HeKUEVh/8VxroDVyvv3BpC67nReuCcNzgYJ83TBKpI4KLlpPPM+y4CifYvuQuYWw5tREKN0LqnzlmBXcXEvLkI5irY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KBie6zbV; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759023184; x=1759627984; i=w_armin@gmx.de;
	bh=/a4UcX317X7c+QXgym05/ShDh/HWShcIa9s2eybVwCc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KBie6zbV/8bFlF/XUFQprep9FDWqi8tbBeCupU/Dr0h1W8OwRNdqJDvyunP2q6IT
	 J4IZtZEw/m3LoIN3ydy/sWfZKXRYQXBCWRPJ3jvdtJjzlyD7/5bkgxUNnpevYWu62
	 +JJIgT+VlP9Kg1ZOqRdNs+VWqlia8R9jUKkrEELtfXUVA0Syn+CGQ32Cb1dhDxa/Z
	 SF38giUPw638W9WmKYdVYuf9ZT3iCydvbT7rajNkkeci15XIPy6WQ4FhSJ52Z6OuW
	 4fGYqrUTMTqa/2oiTxdn55N7t65NoaKqSQnsJitjh+xyDXFmRChG5BoMYmUyvapUd
	 vFL6A8QvTRGMaTHKww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MjS9I-1uaXc20seY-00pWNV; Sun, 28 Sep 2025 03:33:04 +0200
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
Subject: [PATCH v4 0/2] Add support for Uniwill laptop features
Date: Sun, 28 Sep 2025 03:32:51 +0200
Message-Id: <20250928013253.10869-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f1JIfSzeyo6DU1oXqFB0cNhitwLxgQeHHdeY9qoXrZ34nxIxvpg
 2S7noZT8hYNtWYnbm3alVAGp7I8bom20u86QGVIY1SbOLXmia5uJXFR1KVG3cFOD9DbDNzc
 1cjNOvuVuiFrYgv7HtYlQPtBVQiCuXxIiRhYzOiHS619BCc9XJSBkBPzqBzr4kaX7mHOUFT
 wNtVMql0qJmCldIqLPEnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bX1RJanil0Y=;rSCjc6GWZVzVORSfenAbhUP4lo5
 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
 SjxSDJgF75UpnOdLEEzQvHw==

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

Changes since v3:
- Add support for UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED event
- rename sysfs files to prepare for future changes
- use kstrtobool() for handling sysfs input
- add proper led locking

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
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 1547 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
 12 files changed, 2140 insertions(+)
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


