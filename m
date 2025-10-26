Return-Path: <linux-leds+bounces-5884-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECBC0B6C5
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 00:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 725BB18A0241
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 23:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B448D2FFDF2;
	Sun, 26 Oct 2025 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QZpxA7Y2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9226F28B;
	Sun, 26 Oct 2025 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520126; cv=none; b=OkrOGrTOTXUhqWjut7jUttGwX0PA+8kgOEF/U0Eo0Kj2kvztVzpJ0R1/by4Gy+pcFdnzFtU0ZrFAj0U9BmdqwYq1eLgNMWsHyEzc0hFCZqwmZvEpnYnuS4dr1/zfO9jWeJl4JMYU5hAdUzOWE7I78Kir2bst5bValWZNqHVaQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520126; c=relaxed/simple;
	bh=f/C4u5UA9qRZFwCUgLqt/0+lD/cFHCgOd+DAuAIX04k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hskyPPCwv7e4oSU6v9tMoeRgOot6GFpOin8UpmJb7vDxiMsB54kB/pYBrSfOXthDSDzrtvw84htdFcJZtqFN/kr75F+ELs8/3M1rZimS+7S+AnDxMkcYOADon0y/RvwJShQZ8eg7TtyDMW37NpG33smzBikcvnukehzY8UdgH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QZpxA7Y2; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1761520107; x=1762124907; i=w_armin@gmx.de;
	bh=VCA9uixoFwXY0NAqm4O6suWp7gf1AFZmvAK6AmLL1dM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QZpxA7Y26Cuj5wVkKI5NgtYVeCP8/dYC37NF8iZSQRDIRbXy8elwdYr1jK28FG0i
	 Vt87FCNcIeNuRzSKm3x+8zBQLp5NN0ZrFnTbIIYK9xP0jahh84pMHl12vxs3axEYf
	 4l20YjzMwTHrPuJtxl4qBqvaEGl1v5BOyz9YGT2cGAgReaLIqa4arHs//QEVimQhU
	 kDrFCYg8AUmn9aj6d+Ar3xx72CIrAGng/UwbOo/wJVLHMOhPNfKrlkAX/QgfFs9PN
	 HSJuH4FfQCqI8WTMlmm4VGIWm3/0jsEgyWsCE409++Giy1keNhcn/AlAS1RG9T/k8
	 3ezNiEqzt+OdTtloZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1uZiIc1xmD-00euXe; Mon, 27
 Oct 2025 00:08:27 +0100
Message-ID: <7e078590-28b2-4dc5-bccb-5593f2ce494d@gmx.de>
Date: Mon, 27 Oct 2025 00:08:21 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add support for Uniwill laptop features
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, chumuzero@gmail.com,
 corbet@lwn.net, cs@tuxedo.de, wse@tuxedocomputers.com,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com, nathan@kernel.org
References: <20251005192049.18515-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20251005192049.18515-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fDOdZeMhNC3EGjjwQxKhTXUJ3f4sowX8jtaMLK61uSKkYiDnnS9
 aSlv4DPV+fmLpn6aFQx1aFVO8dN/FA9zXPaeOXxyeJOPgPIL66hm45DPX5PUz8cLb4v2UQS
 WrVV1cQN/tHYNOGDhlauin30sHSx++gPQfSLcI+3U/y2SooiNxnLIVUOYoata753MIrk776
 5R2CzXR7HcT37fOjCx5Xg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Is9khLGRt58=;ktr7H4KwVugS+sIGRqyUAjYHh0G
 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
 9Ht+eNFpMwt5ZsWsXWbOzJGqVh9fulnj9Is=

Am 05.10.25 um 21:20 schrieb Armin Wolf:

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

Any updates on this?

Thanks,
Armin Wolf

>
> Changes since v4:
> - add Tested-by tag
> - fix usage of guard() inside switch statement
>
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
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 1549 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
>   drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
>   12 files changed, 2142 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>   create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 drivers/platform/x86/uniwill/Kconfig
>   create mode 100644 drivers/platform/x86/uniwill/Makefile
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>

