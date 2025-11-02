Return-Path: <linux-leds+bounces-5960-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC9C293C1
	for <lists+linux-leds@lfdr.de>; Sun, 02 Nov 2025 18:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B4B13475C3
	for <lists+linux-leds@lfdr.de>; Sun,  2 Nov 2025 17:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECF92DC322;
	Sun,  2 Nov 2025 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="q00FUats"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5DEC8F0;
	Sun,  2 Nov 2025 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104610; cv=none; b=fdwoDt1N2RIaD2dVADqOV7+UgKOTcSOfUhVHkHosxY+TPBv3wTDXX1DDRb3sy6pT2jTFL4f7W6w4A8+tkOqFJ5WV4zYRCR7NlyttsG6W0eKKtiAJICZqGj72I1MddwqPNTKcZfji7NTFSzvYttEm8rKE6nL5x7iNFKB2B73j+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104610; c=relaxed/simple;
	bh=wky1UB4kZ+Qp6ucJ9GtpA1ZA5GqoOkG/bbePLTzoFBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m6N1QcJlSfuZwbWFYfv48FYUDnnL/SsCSbSy/diMJHwUxIiy4MoLuxljsIF3iSW3XyroRmavGiftdwpL2d+kPKmCQuszwe5LLqljdiiN96Qq4rJFijINcnmH36rB53wdlkeJonAKBXYj/3vZuzfqvtxC8+eNniJK3znRrcQLQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=q00FUats; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1762104599; x=1762709399; i=w_armin@gmx.de;
	bh=inaKnnqBnyBFadJyv6p3Y7h+/5wFg9sZ3auMjkCUL9o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q00FUatsSpnLmkukxcm5s0FjFz1oLFKCfQZAAG/9PNJCPpBuMqeoTsflFqVxyWEG
	 RWer2Br+uxDv5SICDgYK+f4dveGM43iw4IhZN8O70202VfWSVEHqjexfM/CalYGdZ
	 p/qHlwPA7pRoy6zpEQo5GnQ+ReMxxyiKh85sUXHKDaFa+vaJp0Bgu82QVWS2YBxnt
	 a2HewaKX6Lywd9KhmYV6TYQisZW4KnOpo8yHNVG8et8NG3emQHCU1THcso7vpLJWK
	 mTWrf+J916rxI0X7CepUtuybcx661FnpYM+7azGZRp+Ad+pGUCMwXLcJH4L58dfIu
	 Ls/gbOOQrwCiVjeudg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MNKhs-1vdJz23heM-00W4gC; Sun, 02 Nov 2025 18:29:59 +0100
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
Subject: [PATCH v6 0/2] Add support for Uniwill laptop features
Date: Sun,  2 Nov 2025 18:29:40 +0100
Message-Id: <20251102172942.17879-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:idnDD9JqjqVjC00OXcqrrxOewlz4X0XLNgJ6OYbGAhGlWQ9yKK4
 nz2MZ/bvlFYI4IRXwXpXD4yA0f4gjtzT9gb9SLQk0pf9J9zvDL5uqt391erA3xnqhsGudvb
 /uez18O3jmi2TGXPvW1fqHUc5VbyKwsbPv4/jflwQr4ATERn839WAKhMbdFNTdpVBaAaoWM
 Iymvecx1jnUTEC+qt7s7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pq7jYqQp8yQ=;EntnEiyyYPshDN6VbQuya9i8cIQ
 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
 fECyJEDGL07ILe/f6qaELZPKa07S8fVRDRE=

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

Changes since v5:
- add missing include of linux/array_size.h
- fix dates in sysfs interface documentation

Changes since v4:
- add Tested-by tag
- fix usage of guard() inside switch statement

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
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 1550 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
 12 files changed, 2143 insertions(+)
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


