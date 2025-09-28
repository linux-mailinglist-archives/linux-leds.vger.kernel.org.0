Return-Path: <linux-leds+bounces-5610-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AEBA659F
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 03:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574F0189B883
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 01:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA30244693;
	Sun, 28 Sep 2025 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WEBYNZ9o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAC24418F;
	Sun, 28 Sep 2025 01:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759023435; cv=none; b=JtpA7e3ZKWtUL/luTBJ3F1TEJXKXfvcIYYOztP9Plple2ErbEpzPrufi6pQFJQfzOogXH3O2qMuImEjAaOZDW0K4lxicoDSIAx1rLoTY4GQLUeg8nKBPx/f6Am3Qak04S1bwOalWz6NOPRaFmz1U2onhSQ2dxR/Xjk9Nd64GmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759023435; c=relaxed/simple;
	bh=KRnlCspYDguXzWhh2C9e1CajT/5bG/oSUsqMFedflew=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A5Eh6gEGR3sJhaKlp6tVXfdcOj9byaVl05oy1uGcdhlDTIP4EpgBgzzXUo4f8Fhr9o6Rhy2cGBHyu+yf6orpfZANI2O+x7BW9i7JUMsdJivEKVfUHTCziQaHvABJ02BAkZ00BqgZ9+bn4qbpWwdeaGUSabmJj3Q6O/k5XBJhbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WEBYNZ9o; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759023415; x=1759628215; i=w_armin@gmx.de;
	bh=dACQdQJOmHxMPIzcnEO/z8uEP74o/NjiTRxLyjbm2Co=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WEBYNZ9o+zSLeq3Qzxz/9oA9KQDURnNdGw0OXyh8FgGLsPCGaRWkQs7Z9sEfs4tS
	 fsQyCGUlSzhY/WMqyEnBRKfl8HMeyf+KJGVX4BseUQmCtHMj6cBwZ533nUMUe1AEh
	 BnXcLQwfKjPfkAswKhnmWy3WeNk/tYDX047/U14v8XfFxcDLIpB+4i9RXDSu/CXWy
	 cxD/EFwA4fHO+7Lla87oyMOTvuRLtsUw5+ZaPkMqZSvdH3zSvnUOg6fEM1IRnibxb
	 LFMmT3PeHjrBAAEs5FfNR/ZdmFaXRLOW4jvWUXARhmczZAhqIge66mUbevBAjwIUa
	 1lzh1LQ2SYxokqmjuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1utizx2ZKR-00U4sJ; Sun, 28
 Sep 2025 03:36:54 +0200
Message-ID: <7ac5615c-c2dc-4aa3-b527-aadfb701bfda@gmx.de>
Date: Sun, 28 Sep 2025 03:36:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for Uniwill laptop features
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, chumuzero@gmail.com,
 corbet@lwn.net, cs@tuxedo.de, wse@tuxedocomputers.com,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250928013253.10869-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20250928013253.10869-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xqEGvrJybzXo6T18wNuCWMsZe/7LwrH1qpawJ+AOzzSOUgvTL+Z
 PwPNkMklwAmcgboEVA0kDTTE19bmOxxaUJD2YfYVWgdjI/U9aJtQGcxv+hFAh9SPRFEIgf4
 8/Ng15U8xy0BNGdfFWutMM7/Y85vp2fCllEvdaLoCU+6+OTl82SVSW4JgTRcGe8vnzSaflP
 lhW+b41JC0ccdSNWWh/kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QAA1Pdo1V2A=;jVSWl2DezgyNBX1qS87QlRJuW8g
 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
 iRfMRcURamDU2A==

Am 28.09.25 um 03:32 schrieb Armin Wolf:

> This patch series adds support for the various features found on
> laptops manufactured by Uniwill. Those features are:
>
>   - battery charge limiting
>   - RGB lightbar control
>   - hwmon support
>   - improved hotkey support
>   - keyboard-related settings
>
> This patch series is based on the following out-of-tree drivers:
>
>   - https://github.com/pobrn/qc71_laptop
>   - https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
>
> Additionally the OEM software of the Intel Nuc x15 was
> reverse-engineered to have a better understanding about the underlying
> hardware interface.
>
> The first patch introduces the uniwill-laptop driver that consists of
> two parts: a WMI part responsible for receiving platform events and
> a ACPI part that does the majority of the work by talking to the
> underlying embedded controller using the INOU0000 ACPI device.
> The whole driver uses a DMI whitelist for identifying supported
> notebook models as both the ACPI device ID and the WMI device GUID
> are shared with a wide range of notebook models that might use a
> different embedded controller register layout.
>
> The second patch additionally adds some documentation for configuring
> and using said driver.
>
> Special thanks go to:
>
>   - github user cyear for bring up this topic on the lm-sensors issue
>     tracker and being the tester for various prototype versions
>   - github user dumingqiao for testing the battery, lightbar and
>     keyboard-related features
>   - Tuxedo computers for giving advice on how to design the userspace
>     interface
>
> NOTE: During testing it turned out that the touchpad_toggle sysfs
> attribute does not work. The reason for this is unknown, as the driver
> emulates the behaviour of the OEM application just fine. I suspect
> that this feature only controls some obscure key combination we dont
> know about, so i decided to send out this series regardless.

When testing those patches on your device, could you (Werner) also check
if the keyboard-related sysfs attributes accept "0" and "1" and also contain
"0" and "1" depending on the state of the associated functions?

Thanks,
Armin Wolf

> Changes since v3:
> - Add support for UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED event
> - rename sysfs files to prepare for future changes
> - use kstrtobool() for handling sysfs input
> - add proper led locking
>
> Changed since v2:
> - Use the INOU0000 ACPI device for talking to the EC as it is much
>    faster than the WMI interface used before. Additionally the OEM
>    application also uses this ACPI inteface through a special driver.
> - Merge the uniwill-wmi driver into the uniwill-laptop driver as
>    the WMI driver should only load when matching the DMI whitelist.
> - Various small fixes
>
> Changes since v1:
> - spelling fixes
> - add missing error handling when reading PWM duty cycle
> - fix error when setting the super key lock sysfs attribute
>
> Changes since the RFC series:
> - spelling fixes
> - mention the INOU0000 ACPI device inside thew documentation
> - use MILLIDEGREE_PER_DEGREE instead of 1000
> - use power_supply_get_property_direct() to prevent deadlock
> - add support for KEY_KBDILLUMDOWN and KEY_KBDILLUMUP
>
> Armin Wolf (2):
>    platform/x86: Add Uniwill laptop driver
>    Documentation: laptops: Add documentation for uniwill laptops
>
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>   Documentation/admin-guide/laptops/index.rst   |    1 +
>   .../admin-guide/laptops/uniwill-laptop.rst    |   60 +
>   Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
>   MAINTAINERS                                   |   11 +
>   drivers/platform/x86/Kconfig                  |    2 +
>   drivers/platform/x86/Makefile                 |    3 +
>   drivers/platform/x86/uniwill/Kconfig          |   38 +
>   drivers/platform/x86/uniwill/Makefile         |    8 +
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 1547 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
>   drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
>   12 files changed, 2140 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>   create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 drivers/platform/x86/uniwill/Kconfig
>   create mode 100644 drivers/platform/x86/uniwill/Makefile
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>

