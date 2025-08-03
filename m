Return-Path: <linux-leds+bounces-5192-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B497AB19566
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 23:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6ED1890567
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 21:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBA81F582A;
	Sun,  3 Aug 2025 21:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ao3fKCgA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8C1EDA2B;
	Sun,  3 Aug 2025 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254976; cv=none; b=MSni08Fb/Z1QW/+t+CoblU6izuwqSMySO5xIJBYADFZwab9/s7OgvW5jwNu54Cew6p51Nfe8oV2SLkaML6OW7sNLKfgSrmqm5GhDEmgK8KWmbQLy5yLplgBT8AnQY77ufyZyZFsE8Oqi54jhHqdqCeZ8shq573znNVT2GMUP1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254976; c=relaxed/simple;
	bh=kWNagj9m1fzCCcXXm2QVXQ130x7VIZJJ17eCzntRPMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lTK0Dr1/WKmm3UXLVdjng0WWzXFq9Fb0Pez37j3aY7YawebiC8pXy79/Zio0k+8ecyfTMQPwp+xd98UlQnZYgFHFanhjDZeShYsQ8wY0ECd9x+ezUdi31RSDa2lSKn1yZgV2x18hOyvE8yKeDTPM7xwmwzL+kwVVIGJaB5KbOGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ao3fKCgA; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754254952; x=1754859752; i=w_armin@gmx.de;
	bh=NHqfw4M5v9apnOizGK5arF+TB9/gXYF6CnCKXiUJ2VI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ao3fKCgAxzgKVXwuMd4NHcFdLEpGl2OzFCbFXsFkxMTqaeaSEOc7qFurZBuU6sOS
	 qFzozvPoyV1JUSNB1X81eVIlw0uJl/RUqawDSDvGMD8iNiJegOwe6h/5a4B6aYu49
	 JZb5/kudSKs6GnuOn2vr0CoVxCM4ltN59mVHh+oJNuz9UxL3bo3yAvsLDheYy+REb
	 GD6YXWbN4KHlCXvrsqLkaZDybZe3a6xh5F0Jt3F0IQl/DH0zntgER6o5GeWE7qemS
	 JszfkVOC+gVP2F8GB0ewbZfPGB1nIyB6ZtO5fFG9kcbDaQinU1dpz3dRYsXthXPlQ
	 xBK2+zUKY2VSH37/Mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M5wLT-1uk3Z62jYx-001shw; Sun, 03 Aug 2025 23:02:31 +0200
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
Subject: [PATCH v2 0/3] Add support for Uniwill laptop features
Date: Sun,  3 Aug 2025 23:01:54 +0200
Message-Id: <20250803210157.8185-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lE0n0FJRumwLUXn/Dk/4y1BASAFKt0FNTQ1qPrhMZ1bspTT7ja2
 u2oXKlJORfJpBryVWtqlrbD8y2vyGba0UkChJcN0i9oGqYM097jCqy8/up4q03po26JcbxM
 B4RPkarEb1oMeLzu8shcGytS5/BFcIAyQ0oy1aiaqfCO9bGLfWd3YQznjgVzUCc5xpiTCXi
 J2ChWjTw/AJ1DGd6E348g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zLVw7o/9iY0=;GZJ1IFvS4GExKl+CX4yccmXpXWJ
 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
 FyqrObyQbyQ==

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

NOTE: During testing it turned out that the touchpad_toggle sysfs
attribute does not work. The reason for this is unknown, as the driver
emulates the behaviour of the OEM application just fine. I suspect
that this feature only controls some obscure key combination we dont
know about, so i decided to send out this series regardless.

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
 drivers/platform/x86/uniwill/uniwill-laptop.c | 1484 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |  186 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  122 ++
 13 files changed, 2163 insertions(+)
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


