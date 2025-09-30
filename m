Return-Path: <linux-leds+bounces-5629-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E9BAD178
	for <lists+linux-leds@lfdr.de>; Tue, 30 Sep 2025 15:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181F516F4C9
	for <lists+linux-leds@lfdr.de>; Tue, 30 Sep 2025 13:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5813E2F7454;
	Tue, 30 Sep 2025 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="FVIbpxg/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD45219A89;
	Tue, 30 Sep 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759239857; cv=none; b=DsCd7XihNEDwmC2Xpq4FlOFFuGoN0SN9YW6cLYTfT73doFPohs7csh/WYdBR69dVSNIxJA1gXLRj8YJXmVhBoMtYs+25tK+EXwojSzfnQdYsM7U827xodVeW5LEnpCzqIrRwtI6SvGXp4fuuJcZDL5oIPWouzFBSGLoPpcTO1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759239857; c=relaxed/simple;
	bh=HIiiYDsOMmd4PQwWUmUdbUSYKj9d0T0LpCNJcIc19Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaHNmA0EKrsfwPl3UFbmmgdaczaAHjMSHghdzBsHM8UW1pMmNnNHrAaERJPpbhelrOmQZ5Jsu6GM47tlWA7Y3rv0BaE4CamgLJkQWQM4bGrok/jhVHTlOdHvysTbkFTYeHBKY/uE2ZifOteupNv38iThjwKgnR0coWEoh9qe1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=FVIbpxg/; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e592bc.dip0.t-ipconnect.de [217.229.146.188])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id BA3C22FC0089;
	Tue, 30 Sep 2025 15:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1759239841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3wiN2C1aWS7JqbdL1Xejm7MPMQuxXhT8bt8i1ir+/8=;
	b=FVIbpxg/djgnTe0soSKwyIOA8A4lR55LaEKPMdAJ1P3ePGRm9zRyrBvU4jhUrFZTw/Blg5
	wESnB6eAaLGbBAVJgcQPHr0svHJsIGyU+ie0pWhaYe4JCBBddUM9wXt4N209UxOpYbThpB
	PRaS08nibxcWqgz2Jn7vboVsBFaSL6Q=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c988b10c-edaa-498a-81ad-e310e10f4099@tuxedocomputers.com>
Date: Tue, 30 Sep 2025 15:43:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250928013253.10869-1-W_Armin@gmx.de>
 <20250928013253.10869-2-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250928013253.10869-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 28.09.25 um 03:32 schrieb Armin Wolf:
> Add a new driver for Uniwill laptops. The driver uses a ACPI
> interface to talk with the embedded controller, but relies on a
> ACPI WMI interface for receiving event notifications.
>
> The driver is reverse-engineered based on the following information:
> - OEM software from intel
> - https://github.com/pobrn/qc71_laptop
> - https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
> - https://github.com/tuxedocomputers/tuxedo-control-center
>
> The underlying EC supports various features, including hwmon sensors,
> battery charge limiting, a RGB lightbar and keyboard-related controls.
>
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

HWMON and Input part successfully tested on TUXEDO Stellaris 16 Gen5 Intel and 
TUXEDO Stellaris 16 Gen5 AMD.

Input part successfully tested on TUXEDO InfinityBook 15 Gen9 Intel.

This ofc also implies that the "backend" is working.

The other parts don't apply for the TUXEDO devices in their current form and 
could therefore not be tested by me.

Tested-by: Werner Sembach <wse@tuxedocomputers.com>

Best regards,

Werner

> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>   Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
>   MAINTAINERS                                   |   10 +
>   drivers/platform/x86/Kconfig                  |    2 +
>   drivers/platform/x86/Makefile                 |    3 +
>   drivers/platform/x86/uniwill/Kconfig          |   38 +
>   drivers/platform/x86/uniwill/Makefile         |    8 +
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 1547 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
>   drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
>   10 files changed, 2078 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 drivers/platform/x86/uniwill/Kconfig
>   create mode 100644 drivers/platform/x86/uniwill/Makefile
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..b17a32216962
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -0,0 +1,53 @@
> +What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
> +Date:		August 2025
> +KernelVersion:	6.18
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the FN lock feature
> +		of the integrated keyboard by writing "1"/"0" into this file.
> +
> +		Reading this file returns the current enable status of the FN lock functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
> +Date:		August 2025
> +KernelVersion:	6.18
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +                Allows userspace applications to enable/disable the super key functionality
> +                of the integrated keyboard by writing "1"/"0" into this file.
> +
> +		Reading this file returns the current enable status of the super key functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
> +Date:		August 2025
> +KernelVersion:	6.18
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the touchpad toggle functionality
> +		of the integrated touchpad by writing "1"/"0" into this file.
> +
> +		Reading this file returns the current enable status of the touchpad toggle
> +		functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
> +Date:		August 2025
> +KernelVersion:	6.18
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Forces the integrated lightbar to display a rainbow animation when the machine
> +		is not suspended. Writing "1"/"0" into this file enables/disables this
> +		functionality.
> +
> +		Reading this file returns the current status of the rainbow animation functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
> +Date:		August 2025
> +KernelVersion:	6.18
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Causes the integrated lightbar to display a breathing animation when the machine
> +		has been suspended and is running on AC power. Writing "1"/"0" into this file
> +		enables/disables this functionality.
> +
> +		Reading this file returns the current status of the breathing animation
> +		functionality.
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..e246bf293450
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -0,0 +1,198 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +========================================
> +Uniwill Notebook driver (uniwill-laptop)
> +========================================
> +
> +Introduction
> +============
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provide a EC interface
> +for controlling various platform settings like sensors and fan control. This interface is
> +used by the ``uniwill-laptop`` driver to map those features onto standard kernel interfaces.
> +
> +EC WMI interface description
> +============================
> +
> +The EC WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +   Description("Class used to operate methods on a ULong"),
> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
> +  class AcpiTest_MULong {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(1), Implemented, read, write, Description("Return the contents of a ULong")]
> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(2), Implemented, read, write, Description("Set the contents of a ULong")]
> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(3), Implemented, read, write,
> +     Description("Generate an event containing ULong data")]
> +    void FireULong([in, Description("WMI requires a parameter")] uint32 Hack);
> +
> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Set the contents of a ULong")]
> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
> +                     [out, Description("Ulong Data")] uint32 Return);
> +
> +    [WmiMethodId(5), Implemented, read, write,
> +     Description("Get and Set the contents of a ULong for Dollby button")]
> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
> +                   [out, Description("Ulong Data")] uint32 Return);
> +  };
> +
> +Most of the WMI-related code was copied from the Windows driver samples, which unfortunately means
> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for autoloading.
> +
> +WMI method GetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no function.
> +
> +WMI method SetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no function.
> +
> +WMI method FireULong()
> +----------------------
> +
> +This WMI method allows to inject a WMI event with a 32-bit payload. Its primary purpose seems
> +to be debugging.
> +
> +WMI method GetSetULong()
> +------------------------
> +
> +This WMI method is used to communicate with the EC. The ``Data`` argument holds the following
> +information (starting with the least significant byte):
> +
> +1. 16-bit address
> +2. 16-bit data (set to ``0x0000`` when reading)
> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing)
> +4. 16-bit reserved (set to ``0x0000``)
> +
> +The first 8 bits of the ``Return`` value contain the data returned by the EC when reading.
> +The special value ``0xFEFEFEFE`` is used to indicate a communication failure with the EC.
> +
> +WMI method GetButton()
> +----------------------
> +
> +This WMI method is not implemented on all machines and has an unknown purpose.
> +
> +Reverse-Engineering the EC WMI interface
> +========================================
> +
> +.. warning:: Randomly poking the EC can potentially cause damage to the machine and other unwanted
> +             side effects, please be careful.
> +
> +The EC behind the ``GetSetULong`` method is used by the OEM software supplied by the manufacturer.
> +Reverse-engineering of this software is difficult since it uses an obfuscator, however some parts
> +are not obfuscated. In this case `dnSpy <https://github.com/dnSpy/dnSpy>`_ could also be helpful.
> +
> +The EC can be accessed under Windows using powershell (requires admin privileges):
> +
> +::
> +
> +  > $obj = Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_MULong | Select-Object -First 1
> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Arguments @{Data = <input>}
> +
> +WMI event interface description
> +===============================
> +
> +The WMI interface description can also be decoded from the embedded binary MOF (bmof)
> +data:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +   Description("Class containing event generated ULong data"),
> +   guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
> +  class AcpiTest_EventULong : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, write, Description("ULong Data")] uint32 ULong;
> +  };
> +
> +Most of the WMI-related code was again copied from the Windows driver samples, causing this WMI
> +interface to suffer from the same restrictions as the EC WMI interface described above.
> +
> +WMI event data
> +--------------
> +
> +The WMI event data contains a single 32-bit value which is used to indicate various platform events.
> +
> +Reverse-Engineering the Uniwill WMI event interface
> +===================================================
> +
> +The driver logs debug messages when receiving a WMI event. Thus enabling debug messages will be
> +useful for finding unknown event codes.
> +
> +EC ACPI interface description
> +=============================
> +
> +The ``INOU0000`` ACPI device is a virtual device used to access various hardware registers
> +available on notebooks manufactured by Uniwill. Reading and writing those registers happens
> +by calling ACPI control methods. The ``uniwill-laptop`` driver uses this device to communicate
> +with the EC because the ACPI control methods are faster than the WMI methods described above.
> +
> +ACPI control methods used for reading registers take a single ACPI integer containing the address
> +of the register to read and return a ACPI integer containing the data inside said register. ACPI
> +control methods used for writing registers however take two ACPI integers, with the additional
> +ACPI integer containing the data to be written into the register. Such ACPI control methods return
> +nothing.
> +
> +System memory
> +-------------
> +
> +System memory can be accessed with a granularity of either a single byte (``MMRB`` for reading and
> +``MMWB`` for writing) or four bytes (``MMRD`` for reading and ``MMWD`` for writing). Those ACPI
> +control methods are unused because they provide no benefit when compared to the native memory
> +access functions provided by the kernel.
> +
> +EC RAM
> +------
> +
> +The internal RAM of the EC can be accessed with a granularity of a single byte using the ``ECRR``
> +(read) and ``ECRW`` (write) ACPI control methods, with the maximum register address being ``0xFFF``.
> +The OEM software waits 6 ms after calling one of those ACPI control methods, likely to avoid
> +overwhelming the EC when being connected over LPC.
> +
> +PCI config space
> +----------------
> +
> +The PCI config space can be accessed with a granularity of four bytes using the ``PCRD`` (read) and
> +``PCWD`` (write) ACPI control methods. The exact address format is unknown, and poking random PCI
> +devices might confuse the PCI subsystem. Because of this those ACPI control methods are not used.
> +
> +IO ports
> +--------
> +
> +IO ports can be accessed with a granularity of four bytes using the ``IORD`` (read) and ``IOWD``
> +(write) ACPI control methods. Those ACPI control methods are unused because they provide no benefit
> +when compared to the native IO port access functions provided by the kernel.
> +
> +CMOS RAM
> +--------
> +
> +The CMOS RAM can be accessed with a granularity of a single byte using the ``RCMS`` (read) and
> +``WCMS`` ACPI control methods. Using those ACPI methods might interfere with the native CMOS RAM
> +access functions provided by the kernel due to the usage of indexed IO, so they are unused.
> +
> +Indexed IO
> +----------
> +
> +Indexed IO with IO ports with a granularity of a single byte can be performed using the ``RIOP``
> +(read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
> +provide no benifit when compared to the native IO port access functions provided by the kernel.
> +
> +Special thanks go to github user `pobrn` which developed the
> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
> +The same is true for Tuxedo Computers, which developed the
> +`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers>`_ package
> +which also served as a foundation for this driver.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d68604fddd8..b4623730a41d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25915,6 +25915,16 @@ L:	linux-scsi@vger.kernel.org
>   S:	Maintained
>   F:	drivers/ufs/host/ufs-renesas.c
>   
> +UNIWILL LAPTOP DRIVER
> +M:	Armin Wolf <W_Armin@gmx.de>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +F:	Documentation/wmi/devices/uniwill-laptop.rst
> +F:	drivers/platform/x86/uniwill/uniwill-acpi.c
> +F:	drivers/platform/x86/uniwill/uniwill-wmi.c
> +F:	drivers/platform/x86/uniwill/uniwill-wmi.h
> +
>   UNSORTED BLOCK IMAGES (UBI)
>   M:	Richard Weinberger <richard@nod.at>
>   R:	Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 46e62feeda3c..1e9b84f1098f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -74,6 +74,8 @@ config HUAWEI_WMI
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called huawei-wmi.
>   
> +source "drivers/platform/x86/uniwill/Kconfig"
> +
>   config UV_SYSFS
>   	tristate "Sysfs structure for UV systems"
>   	depends on X86_UV
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c7db2a88c11a..d722e244a4a7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,6 +110,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+= toshiba-wmi.o
>   # before toshiba_acpi initializes
>   obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
>   
> +# Uniwill
> +obj-y				+= uniwill/
> +
>   # Inspur
>   obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+= inspur_platform_profile.o
>   
> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/uniwill/Kconfig
> new file mode 100644
> index 000000000000..d07cc8440188
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Uniwill X86 Platform Specific Drivers
> +#
> +
> +menuconfig X86_PLATFORM_DRIVERS_UNIWILL
> +	bool "Uniwill X86 Platform Specific Device Drivers"
> +	depends on X86_PLATFORM_DEVICES
> +	help
> +	  Say Y here to see options for device drivers for various
> +	  Uniwill x86 platforms, including many OEM laptops originally
> +	  manufactured by Uniwill.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +
> +if X86_PLATFORM_DRIVERS_UNIWILL
> +
> +config UNIWILL_LAPTOP
> +	tristate "Uniwill Laptop Extras"
> +	default m
> +	depends on ACPI
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on HWMON
> +	depends on INPUT
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on DMI
> +	select REGMAP
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver adds support for various extra features found on Uniwill laptops,
> +	  like the lightbar, hwmon sensors and hotkeys. It also supports many OEM laptops
> +	  originally manufactured by Uniwill.
> +
> +	  If you have such a laptop, say Y or M here.
> +
> +endif
> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/uniwill/Makefile
> new file mode 100644
> index 000000000000..05cd1747a240
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Makefile for linux/drivers/platform/x86/uniwill
> +# Uniwill X86 Platform Specific Drivers
> +#
> +
> +obj-$(CONFIG_UNIWILL_LAPTOP)	+= uniwill-laptop.o
> +uniwill-laptop-y		:= uniwill-acpi.o uniwill-wmi.o
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> new file mode 100644
> index 000000000000..cf4c037294ac
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -0,0 +1,1547 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux driver for Uniwill notebooks.
> + *
> + * Special thanks go to Pőcze Barnabás, Christoffer Sandberg and Werner Sembach
> + * for supporting the development of this driver either through prior work or
> + * by answering questions regarding the underlying ACPI and WMI interfaces.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/fixp-arith.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/kernel.h>
> +#include <linux/kstrtox.h>
> +#include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/limits.h>
> +#include <linux/list.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/printk.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include <acpi/battery.h>
> +
> +#include "uniwill-wmi.h"
> +
> +#define EC_ADDR_BAT_POWER_UNIT_1	0x0400
> +
> +#define EC_ADDR_BAT_POWER_UNIT_2	0x0401
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1	0x0402
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2	0x0403
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_1	0x0404
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_2	0x0405
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1	0x0408
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2	0x0409
> +
> +#define EC_ADDR_BAT_STATUS_1		0x0432
> +#define BAT_DISCHARGING			BIT(0)
> +
> +#define EC_ADDR_BAT_STATUS_2		0x0433
> +
> +#define EC_ADDR_BAT_CURRENT_1		0x0434
> +
> +#define EC_ADDR_BAT_CURRENT_2		0x0435
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1	0x0436
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2	0x0437
> +
> +#define EC_ADDR_BAT_VOLTAGE_1		0x0438
> +
> +#define EC_ADDR_BAT_VOLTAGE_2		0x0439
> +
> +#define EC_ADDR_CPU_TEMP		0x043E
> +
> +#define EC_ADDR_GPU_TEMP		0x044F
> +
> +#define EC_ADDR_MAIN_FAN_RPM_1		0x0464
> +
> +#define EC_ADDR_MAIN_FAN_RPM_2		0x0465
> +
> +#define EC_ADDR_SECOND_FAN_RPM_1	0x046C
> +
> +#define EC_ADDR_SECOND_FAN_RPM_2	0x046D
> +
> +#define EC_ADDR_DEVICE_STATUS		0x047B
> +#define WIFI_STATUS_ON			BIT(7)
> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
> +
> +#define EC_ADDR_BAT_ALERT		0x0494
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_1	0x04A6
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
> +
> +#define EC_ADDR_PROJECT_ID		0x0740
> +
> +#define EC_ADDR_AP_OEM			0x0741
> +#define	ENABLE_MANUAL_CTRL		BIT(0)
> +#define ITE_KBD_EFFECT_REACTIVE		BIT(3)
> +#define FAN_ABNORMAL			BIT(5)
> +
> +#define EC_ADDR_SUPPORT_5		0x0742
> +#define FAN_TURBO_SUPPORTED		BIT(4)
> +#define FAN_SUPPORT			BIT(5)
> +
> +#define EC_ADDR_CTGP_DB_CTRL		0x0743
> +#define CTGP_DB_GENERAL_ENABLE		BIT(0)
> +#define CTGP_DB_DB_ENABLE		BIT(1)
> +#define CTGP_DB_CTGP_ENABLE		BIT(2)
> +
> +#define EC_ADDR_CTGP_OFFSET		0x0744
> +
> +#define EC_ADDR_TPP_OFFSET		0x0745
> +
> +#define EC_ADDR_MAX_TGP			0x0746
> +
> +#define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
> +#define LIGHTBAR_APP_EXISTS		BIT(0)
> +#define LIGHTBAR_POWER_SAVE		BIT(1)
> +#define LIGHTBAR_S0_OFF			BIT(2)
> +#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
> +#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
> +
> +#define EC_ADDR_LIGHTBAR_AC_RED		0x0749
> +
> +#define EC_ADDR_LIGHTBAR_AC_GREEN	0x074A
> +
> +#define EC_ADDR_LIGHTBAR_AC_BLUE	0x074B
> +
> +#define EC_ADDR_BIOS_OEM		0x074E
> +#define FN_LOCK_STATUS			BIT(4)
> +
> +#define EC_ADDR_MANUAL_FAN_CTRL		0x0751
> +#define FAN_LEVEL_MASK			GENMASK(2, 0)
> +#define FAN_MODE_TURBO			BIT(4)
> +#define FAN_MODE_HIGH			BIT(5)
> +#define FAN_MODE_BOOST			BIT(6)
> +#define FAN_MODE_USER			BIT(7)
> +
> +#define EC_ADDR_PWM_1			0x075B
> +
> +#define EC_ADDR_PWM_2			0x075C
> +
> +/* Unreliable */
> +#define EC_ADDR_SUPPORT_1		0x0765
> +#define AIRPLANE_MODE			BIT(0)
> +#define GPS_SWITCH			BIT(1)
> +#define OVERCLOCK			BIT(2)
> +#define MACRO_KEY			BIT(3)
> +#define SHORTCUT_KEY			BIT(4)
> +#define SUPER_KEY_LOCK			BIT(5)
> +#define LIGHTBAR			BIT(6)
> +#define FAN_BOOST			BIT(7)
> +
> +#define EC_ADDR_SUPPORT_2		0x0766
> +#define SILENT_MODE			BIT(0)
> +#define USB_CHARGING			BIT(1)
> +#define RGB_KEYBOARD			BIT(2)
> +#define CHINA_MODE			BIT(5)
> +#define MY_BATTERY			BIT(6)
> +
> +#define EC_ADDR_TRIGGER			0x0767
> +#define TRIGGER_SUPER_KEY_LOCK		BIT(0)
> +#define TRIGGER_LIGHTBAR		BIT(1)
> +#define TRIGGER_FAN_BOOST		BIT(2)
> +#define TRIGGER_SILENT_MODE		BIT(3)
> +#define TRIGGER_USB_CHARGING		BIT(4)
> +#define RGB_APPLY_COLOR			BIT(5)
> +#define RGB_LOGO_EFFECT			BIT(6)
> +#define RGB_RAINBOW_EFFECT		BIT(7)
> +
> +#define EC_ADDR_SWITCH_STATUS		0x0768
> +#define SUPER_KEY_LOCK_STATUS		BIT(0)
> +#define LIGHTBAR_STATUS			BIT(1)
> +#define FAN_BOOST_STATUS		BIT(2)
> +#define MACRO_KEY_STATUS		BIT(3)
> +#define MY_BAT_POWER_BAT_STATUS		BIT(4)
> +
> +#define EC_ADDR_RGB_RED			0x0769
> +
> +#define EC_ADDR_RGB_GREEN		0x076A
> +
> +#define EC_ADDR_RGB_BLUE		0x076B
> +
> +#define EC_ADDR_ROMID_START		0x0770
> +#define ROMID_LENGTH			14
> +
> +#define EC_ADDR_ROMID_EXTRA_1		0x077E
> +
> +#define EC_ADDR_ROMID_EXTRA_2		0x077F
> +
> +#define EC_ADDR_BIOS_OEM_2		0x0782
> +#define FAN_V2_NEW			BIT(0)
> +#define FAN_QKEY			BIT(1)
> +#define FAN_TABLE_OFFICE_MODE		BIT(2)
> +#define FAN_V3				BIT(3)
> +#define DEFAULT_MODE			BIT(4)
> +
> +#define EC_ADDR_PL1_SETTING		0x0783
> +
> +#define EC_ADDR_PL2_SETTING		0x0784
> +
> +#define EC_ADDR_PL4_SETTING		0x0785
> +
> +#define EC_ADDR_FAN_DEFAULT		0x0786
> +#define FAN_CURVE_LENGTH		5
> +
> +#define EC_ADDR_KBD_STATUS		0x078C
> +#define KBD_WHITE_ONLY			BIT(0)	// ~single color
> +#define KBD_SINGLE_COLOR_OFF		BIT(1)
> +#define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
> +#define KBD_APPLY			BIT(4)
> +#define KBD_BRIGHTNESS			GENMASK(7, 5)
> +
> +#define EC_ADDR_FAN_CTRL		0x078E
> +#define FAN3P5				BIT(1)
> +#define CHARGING_PROFILE		BIT(3)
> +#define UNIVERSAL_FAN_CTRL		BIT(6)
> +
> +#define EC_ADDR_BIOS_OEM_3		0x07A3
> +#define FAN_REDUCED_DURY_CYCLE		BIT(5)
> +#define FAN_ALWAYS_ON			BIT(6)
> +
> +#define EC_ADDR_BIOS_BYTE		0x07A4
> +#define FN_LOCK_SWITCH			BIT(3)
> +
> +#define EC_ADDR_OEM_3			0x07A5
> +#define POWER_LED_MASK			GENMASK(1, 0)
> +#define POWER_LED_LEFT			0x00
> +#define POWER_LED_BOTH			0x01
> +#define POWER_LED_NONE			0x02
> +#define FAN_QUIET			BIT(2)
> +#define OVERBOOST			BIT(4)
> +#define HIGH_POWER			BIT(7)
> +
> +#define EC_ADDR_OEM_4			0x07A6
> +#define OVERBOOST_DYN_TEMP_OFF		BIT(1)
> +#define TOUCHPAD_TOGGLE_OFF		BIT(6)
> +
> +#define EC_ADDR_CHARGE_CTRL		0x07B9
> +#define CHARGE_CTRL_MASK		GENMASK(6, 0)
> +#define CHARGE_CTRL_REACHED		BIT(7)
> +
> +#define EC_ADDR_UNIVERSAL_FAN_CTRL	0x07C5
> +#define SPLIT_TABLES			BIT(7)
> +
> +#define EC_ADDR_AP_OEM_6		0x07C6
> +#define ENABLE_UNIVERSAL_FAN_CTRL	BIT(2)
> +#define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
> +#define BATTERY_ERM_STATUS_REACHED	BIT(4)
> +
> +#define EC_ADDR_CHARGE_PRIO		0x07CC
> +#define CHARGING_PERFORMANCE		BIT(7)
> +
> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
> +#define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
> +
> +#define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
> +
> +#define EC_ADDR_LIGHTBAR_BAT_GREEN	0x07E4
> +
> +#define EC_ADDR_LIGHTBAR_BAT_BLUE	0x07E5
> +
> +#define EC_ADDR_CPU_TEMP_END_TABLE	0x0F00
> +
> +#define EC_ADDR_CPU_TEMP_START_TABLE	0x0F10
> +
> +#define EC_ADDR_CPU_FAN_SPEED_TABLE	0x0F20
> +
> +#define EC_ADDR_GPU_TEMP_END_TABLE	0x0F30
> +
> +#define EC_ADDR_GPU_TEMP_START_TABLE	0x0F40
> +
> +#define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
> +
> +/*
> + * Those two registers technically allow for manual fan control,
> + * but are unstable on some models and are likely not meant to
> + * be used by applications as they are only accessible when using
> + * the WMI interface.
> + */
> +#define EC_ADDR_PWM_1_WRITEABLE		0x1804
> +
> +#define EC_ADDR_PWM_2_WRITEABLE		0x1809
> +
> +#define DRIVER_NAME	"uniwill"
> +
> +/*
> + * The OEM software always sleeps up to 6 ms after reading/writing EC
> + * registers, so we emulate this behaviour for maximum compatibility.
> + */
> +#define UNIWILL_EC_DELAY_US	6000
> +
> +#define PWM_MAX			200
> +#define FAN_TABLE_LENGTH	16
> +
> +#define LED_CHANNELS		3
> +#define LED_MAX_BRIGHTNESS	200
> +
> +#define UNIWILL_FEATURE_FN_LOCK_TOGGLE		BIT(0)
> +#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE	BIT(1)
> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
> +#define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
> +#define UNIWILL_FEATURE_BATTERY			BIT(4)
> +#define UNIWILL_FEATURE_HWMON			BIT(5)
> +
> +struct uniwill_data {
> +	struct device *dev;
> +	acpi_handle handle;
> +	struct regmap *regmap;
> +	struct acpi_battery_hook hook;
> +	unsigned int last_charge_ctrl;
> +	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
> +	unsigned int last_switch_status;
> +	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
> +	struct list_head batteries;
> +	struct mutex led_lock;		/* Protects writes to the lightbar registers */
> +	struct led_classdev_mc led_mc_cdev;
> +	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> +	struct mutex input_lock;	/* Protects input sequence during notify */
> +	struct input_dev *input_device;
> +	struct notifier_block nb;
> +};
> +
> +struct uniwill_battery_entry {
> +	struct list_head head;
> +	struct power_supply *battery;
> +};
> +
> +static bool force;
> +module_param_unsafe(force, bool, 0);
> +MODULE_PARM_DESC(force, "Force loading without checking for supported devices\n");
> +
> +/* Feature bitmask since the associated registers are not reliable */
> +static unsigned int supported_features;
> +
> +static const char * const uniwill_temp_labels[] = {
> +	"CPU",
> +	"GPU",
> +};
> +
> +static const char * const uniwill_fan_labels[] = {
> +	"Main",
> +	"Secondary",
> +};
> +
> +static const struct key_entry uniwill_keymap[] = {
> +	/* Reported via keyboard controller */
> +	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }},
> +	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }},
> +
> +	/* Reported when the user locks/unlocks the super key */
> +	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }},
> +	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }},
> +	/* Optional, might not be reported by all devices */
> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
> +
> +	/* Reported in manual mode when toggling the airplane mode status */
> +	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
> +
> +	/* Reported when user wants to cycle the platform profile */
> +	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }},
> +
> +	/* Reported when the user wants to adjust the brightness of the keyboard */
> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLUMDOWN }},
> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { KEY_KBDILLUMUP }},
> +
> +	/* Reported when the user wants to toggle the microphone mute status */
> +	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }},
> +
> +	/* Reported when the user locks/unlocks the Fn key */
> +	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
> +
> +	/* Reported when the user wants to toggle the brightness of the keyboard */
> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTOGGLE }},
> +
> +	/* FIXME: find out the exact meaning of those events */
> +	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }},
> +	{ KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE,             { KEY_UNKNOWN }},
> +
> +	/* Reported when the user wants to toggle the benchmark mode status */
> +	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
> +
> +	{ KE_END }
> +};
> +
> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	union acpi_object params[2] = {
> +		{
> +			.integer = {
> +				.type = ACPI_TYPE_INTEGER,
> +				.value = reg,
> +			},
> +		},
> +		{
> +			.integer = {
> +				.type = ACPI_TYPE_INTEGER,
> +				.value = val,
> +			},
> +		},
> +	};
> +	struct uniwill_data *data = context;
> +	struct acpi_object_list input = {
> +		.count = ARRAY_SIZE(params),
> +		.pointer = params,
> +	};
> +	acpi_status status;
> +
> +	status = acpi_evaluate_object(data->handle, "ECRW", &input, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
> +
> +	return 0;
> +}
> +
> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	union acpi_object params[1] = {
> +		{
> +			.integer = {
> +				.type = ACPI_TYPE_INTEGER,
> +				.value = reg,
> +			},
> +		},
> +	};
> +	struct uniwill_data *data = context;
> +	struct acpi_object_list input = {
> +		.count = ARRAY_SIZE(params),
> +		.pointer = params,
> +	};
> +	unsigned long long output;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(data->handle, "ECRR", &input, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	if (output > U8_MAX)
> +		return -ENXIO;
> +
> +	usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
> +
> +	*val = output;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus uniwill_ec_bus = {
> +	.reg_write = uniwill_ec_reg_write,
> +	.reg_read = uniwill_ec_reg_read,
> +	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_AP_OEM:
> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
> +	case EC_ADDR_LIGHTBAR_AC_RED:
> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
> +	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_OEM_4:
> +	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_RED:
> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_CPU_TEMP:
> +	case EC_ADDR_GPU_TEMP:
> +	case EC_ADDR_MAIN_FAN_RPM_1:
> +	case EC_ADDR_MAIN_FAN_RPM_2:
> +	case EC_ADDR_SECOND_FAN_RPM_1:
> +	case EC_ADDR_SECOND_FAN_RPM_2:
> +	case EC_ADDR_BAT_ALERT:
> +	case EC_ADDR_PROJECT_ID:
> +	case EC_ADDR_AP_OEM:
> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
> +	case EC_ADDR_LIGHTBAR_AC_RED:
> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
> +	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_PWM_1:
> +	case EC_ADDR_PWM_2:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_OEM_4:
> +	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_RED:
> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_CPU_TEMP:
> +	case EC_ADDR_GPU_TEMP:
> +	case EC_ADDR_MAIN_FAN_RPM_1:
> +	case EC_ADDR_MAIN_FAN_RPM_2:
> +	case EC_ADDR_SECOND_FAN_RPM_1:
> +	case EC_ADDR_SECOND_FAN_RPM_2:
> +	case EC_ADDR_BAT_ALERT:
> +	case EC_ADDR_PWM_1:
> +	case EC_ADDR_PWM_2:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_CHARGE_CTRL:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config uniwill_ec_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.writeable_reg = uniwill_writeable_reg,
> +	.readable_reg = uniwill_readable_reg,
> +	.volatile_reg = uniwill_volatile_reg,
> +	.can_sleep = true,
> +	.max_register = 0xFFF,
> +	.cache_type = REGCACHE_MAPLE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct device_attribute *attr,
> +					   const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (enable)
> +		value = FN_LOCK_STATUS;
> +	else
> +		value = 0;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct device_attribute *attr,
> +					  char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock_toggle_enable);
> +
> +static ssize_t super_key_toggle_enable_store(struct device *dev, struct device_attribute *attr,
> +					     const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->super_key_lock);
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We can only toggle the super key lock, so we return early if the setting
> +	 * is already in the correct state.
> +	 */
> +	if (enable == !(value & SUPER_KEY_LOCK_STATUS))
> +		return count;
> +
> +	ret = regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				TRIGGER_SUPER_KEY_LOCK);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t super_key_toggle_enable_show(struct device *dev, struct device_attribute *attr,
> +					    char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
> +}
> +
> +static DEVICE_ATTR_RW(super_key_toggle_enable);
> +
> +static ssize_t touchpad_toggle_enable_store(struct device *dev, struct device_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (enable)
> +		value = 0;
> +	else
> +		value = TOUCHPAD_TOGGLE_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t touchpad_toggle_enable_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
> +}
> +
> +static DEVICE_ATTR_RW(touchpad_toggle_enable);
> +
> +static ssize_t rainbow_animation_store(struct device *dev, struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (enable)
> +		value = LIGHTBAR_WELCOME;
> +	else
> +		value = 0;
> +
> +	guard(mutex)(&data->led_lock);
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t rainbow_animation_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
> +}
> +
> +static DEVICE_ATTR_RW(rainbow_animation);
> +
> +static ssize_t breathing_in_suspend_store(struct device *dev, struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (enable)
> +		value = 0;
> +	else
> +		value = LIGHTBAR_S3_OFF;
> +
> +	/* We only access a single register here, so we do not need to use data->led_lock */
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S3_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t breathing_in_suspend_show(struct device *dev, struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
> +}
> +
> +static DEVICE_ATTR_RW(breathing_in_suspend);
> +
> +static struct attribute *uniwill_attrs[] = {
> +	/* Keyboard-related */
> +	&dev_attr_fn_lock_toggle_enable.attr,
> +	&dev_attr_super_key_toggle_enable.attr,
> +	&dev_attr_touchpad_toggle_enable.attr,
> +	/* Lightbar-related */
> +	&dev_attr_rainbow_animation.attr,
> +	&dev_attr_breathing_in_suspend.attr,
> +	NULL
> +};
> +
> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	if (attr == &dev_attr_fn_lock_toggle_enable.attr) {
> +		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_super_key_toggle_enable.attr) {
> +		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_touchpad_toggle_enable.attr) {
> +		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_rainbow_animation.attr ||
> +	    attr == &dev_attr_breathing_in_suspend.attr) {
> +		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +			return attr->mode;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group uniwill_group = {
> +	.is_visible = uniwill_attr_is_visible,
> +	.attrs = uniwill_attrs,
> +};
> +
> +static const struct attribute_group *uniwill_groups[] = {
> +	&uniwill_group,
> +	NULL
> +};
> +
> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			long *val)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	__be16 rpm;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
> +			break;
> +		case 1:
> +			ret = regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = value * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	case hwmon_fan:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_bulk_read(data->regmap, EC_ADDR_MAIN_FAN_RPM_1, &rpm,
> +					       sizeof(rpm));
> +			break;
> +		case 1:
> +			ret = regmap_bulk_read(data->regmap, EC_ADDR_SECOND_FAN_RPM_1, &rpm,
> +					       sizeof(rpm));
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = be16_to_cpu(rpm);
> +		return 0;
> +	case hwmon_pwm:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
> +			break;
> +		case 1:
> +			ret = regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = fixp_linear_interpolate(0, 0, PWM_MAX, U8_MAX, value);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int uniwill_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			       int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		*str = uniwill_temp_labels[channel];
> +		return 0;
> +	case hwmon_fan:
> +		*str = uniwill_fan_labels[channel];
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops uniwill_ops = {
> +	.visible = 0444,
> +	.read = uniwill_read,
> +	.read_string = uniwill_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const uniwill_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info uniwill_chip_info = {
> +	.ops = &uniwill_ops,
> +	.info = uniwill_info,
> +};
> +
> +static int uniwill_hwmon_init(struct uniwill_data *data)
> +{
> +	struct device *hdev;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +		return 0;
> +
> +	hdev = devm_hwmon_device_register_with_info(data->dev, "uniwill", data,
> +						    &uniwill_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hdev);
> +}
> +
> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] = {
> +	EC_ADDR_LIGHTBAR_BAT_RED,
> +	EC_ADDR_LIGHTBAR_BAT_GREEN,
> +	EC_ADDR_LIGHTBAR_BAT_BLUE,
> +};
> +
> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] = {
> +	EC_ADDR_LIGHTBAR_AC_RED,
> +	EC_ADDR_LIGHTBAR_AC_GREEN,
> +	EC_ADDR_LIGHTBAR_AC_BLUE,
> +};
> +
> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *led_mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct uniwill_data *data = container_of(led_mc_cdev, struct uniwill_data, led_mc_cdev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = led_mc_calc_color_components(led_mc_cdev, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->led_lock);
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		/* Prevent the brightness values from overflowing */
> +		value = min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightness);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (brightness)
> +		value = 0;
> +	else
> +		value = LIGHTBAR_S0_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S0_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_S0_OFF, value);
> +}
> +
> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S3_OFF | LIGHTBAR_WELCOME)
> +
> +static int uniwill_led_init(struct uniwill_data *data)
> +{
> +	struct led_init_data init_data = {
> +		.devicename = DRIVER_NAME,
> +		.default_label = "multicolor:" LED_FUNCTION_STATUS,
> +		.devname_mandatory = true,
> +	};
> +	unsigned int color_indices[3] = {
> +		LED_COLOR_ID_RED,
> +		LED_COLOR_ID_GREEN,
> +		LED_COLOR_ID_BLUE,
> +	};
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +		return 0;
> +
> +	ret = devm_mutex_init(data->dev, &data->led_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * The EC has separate lightbar settings for AC and battery mode,
> +	 * so we have to ensure that both settings are the same.
> +	 */
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	value |= LIGHTBAR_APP_EXISTS;
> +	ret = regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * The breathing animation during suspend is not supported when
> +	 * running on battery power.
> +	 */
> +	value |= LIGHTBAR_S3_OFF;
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_MASK, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
> +	data->led_mc_cdev.led_cdev.max_brightness = LED_MAX_BRIGHTNESS;
> +	data->led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
> +	data->led_mc_cdev.led_cdev.brightness_set_blocking = uniwill_led_brightness_set;
> +
> +	if (value & LIGHTBAR_S0_OFF)
> +		data->led_mc_cdev.led_cdev.brightness = 0;
> +	else
> +		data->led_mc_cdev.led_cdev.brightness = LED_MAX_BRIGHTNESS;
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		data->led_mc_subled_info[i].color_index = color_indices[i];
> +
> +		ret = regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i], &value);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Make sure that the initial intensity value is not greater than
> +		 * the maximum brightness.
> +		 */
> +		value = min(LED_MAX_BRIGHTNESS, value);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->led_mc_subled_info[i].intensity = value;
> +		data->led_mc_subled_info[i].channel = i;
> +	}
> +
> +	data->led_mc_cdev.subled_info = data->led_mc_subled_info;
> +	data->led_mc_cdev.num_colors = LED_CHANNELS;
> +
> +	return devm_led_classdev_multicolor_register_ext(data->dev, &data->led_mc_cdev,
> +							 &init_data);
> +}
> +
> +static int uniwill_get_property(struct power_supply *psy, const struct power_supply_ext *ext,
> +				void *drvdata, enum power_supply_property psp,
> +				union power_supply_propval *val)
> +{
> +	struct uniwill_data *data = drvdata;
> +	union power_supply_propval prop;
> +	unsigned int regval;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_HEALTH:
> +		ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT, &prop);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!prop.intval) {
> +			val->intval = POWER_SUPPLY_HEALTH_NO_BATTERY;
> +			return 0;
> +		}
> +
> +		ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_STATUS, &prop);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (prop.intval == POWER_SUPPLY_STATUS_UNKNOWN) {
> +			val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
> +			return 0;
> +		}
> +
> +		ret = regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (regval) {
> +			/* Charging issue */
> +			val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
> +			return 0;
> +		}
> +
> +		val->intval = POWER_SUPPLY_HEALTH_GOOD;
> +		return 0;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int uniwill_set_property(struct power_supply *psy, const struct power_supply_ext *ext,
> +				void *drvdata, enum power_supply_property psp,
> +				const union power_supply_propval *val)
> +{
> +	struct uniwill_data *data = drvdata;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		if (val->intval < 1 || val->intval > 100)
> +			return -EINVAL;
> +
> +		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> +					  val->intval);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int uniwill_property_is_writeable(struct power_supply *psy,
> +					 const struct power_supply_ext *ext, void *drvdata,
> +					 enum power_supply_property psp)
> +{
> +	if (psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +		return true;
> +
> +	return false;
> +}
> +
> +static const enum power_supply_property uniwill_properties[] = {
> +	POWER_SUPPLY_PROP_HEALTH,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext uniwill_extension = {
> +	.name = DRIVER_NAME,
> +	.properties = uniwill_properties,
> +	.num_properties = ARRAY_SIZE(uniwill_properties),
> +	.get_property = uniwill_get_property,
> +	.set_property = uniwill_set_property,
> +	.property_is_writeable = uniwill_property_is_writeable,
> +};
> +
> +static int uniwill_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct uniwill_data *data = container_of(hook, struct uniwill_data, hook);
> +	struct uniwill_battery_entry *entry;
> +	int ret;
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	ret = power_supply_register_extension(battery, &uniwill_extension, data->dev, data);
> +	if (ret < 0) {
> +		kfree(entry);
> +		return ret;
> +	}
> +
> +	guard(mutex)(&data->battery_lock);
> +
> +	entry->battery = battery;
> +	list_add(&entry->head, &data->batteries);
> +
> +	return 0;
> +}
> +
> +static int uniwill_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct uniwill_data *data = container_of(hook, struct uniwill_data, hook);
> +	struct uniwill_battery_entry *entry, *tmp;
> +
> +	scoped_guard(mutex, &data->battery_lock) {
> +		list_for_each_entry_safe(entry, tmp, &data->batteries, head) {
> +			if (entry->battery == battery) {
> +				list_del(&entry->head);
> +				kfree(entry);
> +				break;
> +			}
> +		}
> +	}
> +
> +	power_supply_unregister_extension(battery, &uniwill_extension);
> +
> +	return 0;
> +}
> +
> +static int uniwill_battery_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	ret = devm_mutex_init(data->dev, &data->battery_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	INIT_LIST_HEAD(&data->batteries);
> +	data->hook.name = "Uniwill Battery Extension";
> +	data->hook.add_battery = uniwill_add_battery;
> +	data->hook.remove_battery = uniwill_remove_battery;
> +
> +	return devm_battery_hook_register(data->dev, &data->hook);
> +}
> +
> +static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action, void *dummy)
> +{
> +	struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
> +	struct uniwill_battery_entry *entry;
> +
> +	switch (action) {
> +	case UNIWILL_OSD_BATTERY_ALERT:
> +		guard(mutex)(&data->battery_lock);
> +		list_for_each_entry(entry, &data->batteries, head) {
> +			power_supply_changed(entry->battery);
> +		}
> +
> +		return NOTIFY_OK;
> +	default:
> +		guard(mutex)(&data->input_lock);
> +		sparse_keymap_report_event(data->input_device, action, 1, true);
> +
> +		return NOTIFY_OK;
> +	}
> +}
> +
> +static int uniwill_input_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	ret = devm_mutex_init(data->dev, &data->input_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->input_device = devm_input_allocate_device(data->dev);
> +	if (!data->input_device)
> +		return -ENOMEM;
> +
> +	ret = sparse_keymap_setup(data->input_device, uniwill_keymap, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->input_device->name = "Uniwill WMI hotkeys";
> +	data->input_device->phys = "wmi/input0";
> +	data->input_device->id.bustype = BUS_HOST;
> +	ret = input_register_device(data->input_device);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->nb.notifier_call = uniwill_notifier_call;
> +
> +	return devm_uniwill_wmi_register_notifier(data->dev, &data->nb);
> +}
> +
> +static void uniwill_disable_manual_control(void *context)
> +{
> +	struct uniwill_data *data = context;
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_ec_init(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(data->dev, "Project ID: %u\n", value);
> +
> +	ret = regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_control, data);
> +}
> +
> +static int uniwill_probe(struct platform_device *pdev)
> +{
> +	struct uniwill_data *data;
> +	struct regmap *regmap;
> +	acpi_handle handle;
> +	int ret;
> +
> +	handle = ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = &pdev->dev;
> +	data->handle = handle;
> +	platform_set_drvdata(pdev, data);
> +
> +	regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwill_ec_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data->regmap = regmap;
> +	ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_ec_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_battery_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_led_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_hwmon_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_input_init(data);
> +}
> +
> +static void uniwill_shutdown(struct platform_device *pdev)
> +{
> +	struct uniwill_data *data = platform_get_drvdata(pdev);
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +		return 0;
> +
> +	/*
> +	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
> +	 * ourselves.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_switch_status);
> +}
> +
> +static int uniwill_suspend_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	/*
> +	 * Save the current charge limit in order to restore it during resume.
> +	 * We cannot use the regmap code for that since this register needs to
> +	 * be declared as volatile due to CHARGE_CTRL_REACHED.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge_ctrl);
> +}
> +
> +static int uniwill_suspend(struct device *dev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = uniwill_suspend_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_suspend_battery(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	regcache_cache_only(data->regmap, true);
> +	regcache_mark_dirty(data->regmap);
> +
> +	return 0;
> +}
> +
> +static int uniwill_resume_keyboard(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +		return 0;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & SUPER_KEY_LOCK_STATUS))
> +		return 0;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static int uniwill_resume_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> +				  data->last_charge_ctrl);
> +}
> +
> +static int uniwill_resume(struct device *dev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(data->regmap, false);
> +
> +	ret = regcache_sync(data->regmap);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_resume_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_battery(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
> +
> +/*
> + * We only use the DMI table for auoloading because the ACPI device itself
> + * does not guarantee that the underlying EC implementation is supported.
> + */
> +static const struct acpi_device_id uniwill_id_table[] = {
> +	{ "INOU0000" },
> +	{ },
> +};
> +
> +static struct platform_driver uniwill_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.dev_groups = uniwill_groups,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.acpi_match_table = uniwill_id_table,
> +		.pm = pm_sleep_ptr(&uniwill_pm_ops),
> +	},
> +	.probe = uniwill_probe,
> +	.shutdown = uniwill_shutdown,
> +};
> +
> +static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
> +	{
> +		.ident = "Intel NUC x15",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
> +		},
> +		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +					UNIWILL_FEATURE_BATTERY |
> +					UNIWILL_FEATURE_HWMON),
> +	},
> +	{
> +		.ident = "Intel NUC x15",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
> +		},
> +		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +					UNIWILL_FEATURE_LIGHTBAR |
> +					UNIWILL_FEATURE_BATTERY |
> +					UNIWILL_FEATURE_HWMON),
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
> +
> +static int __init uniwill_init(void)
> +{
> +	const struct dmi_system_id *id;
> +	int ret;
> +
> +	id = dmi_first_match(uniwill_dmi_table);
> +	if (!id) {
> +		if (!force)
> +			return -ENODEV;
> +
> +		/* Assume that the device supports all features */
> +		supported_features = UINT_MAX;
> +		pr_warn("Loading on a potentially unsupported device\n");
> +	} else {
> +		supported_features = (uintptr_t)id->driver_data;
> +	}
> +
> +	ret = platform_driver_register(&uniwill_driver);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_wmi_register_driver();
> +	if (ret < 0) {
> +		platform_driver_unregister(&uniwill_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +module_init(uniwill_init);
> +
> +static void __exit uniwill_exit(void)
> +{
> +	uniwill_wmi_unregister_driver();
> +	platform_driver_unregister(&uniwill_driver);
> +}
> +module_exit(uniwill_exit);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("Uniwill notebook driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform/x86/uniwill/uniwill-wmi.c
> new file mode 100644
> index 000000000000..31d9c39f14ab
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux hotkey driver for Uniwill notebooks.
> + *
> + * Special thanks go to Pőcze Barnabás, Christoffer Sandberg and Werner Sembach
> + * for supporting the development of this driver either through prior work or
> + * by answering questions regarding the underlying WMI interface.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/notifier.h>
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "uniwill-wmi.h"
> +
> +#define DRIVER_NAME		"uniwill-wmi"
> +#define UNIWILL_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
> +
> +static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
> +
> +static void devm_uniwill_wmi_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
> +}
> +
> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret = blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_notifier, nb);
> +}
> +
> +static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	u32 value;
> +
> +	if (obj->type != ACPI_TYPE_INTEGER)
> +		return;
> +
> +	value = obj->integer.value;
> +
> +	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
> +
> +	blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
> +}
> +
> +/*
> + * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
> + * from the Windows driver example, and others probably did the same.
> + *
> + * Because of this we cannot use this WMI GUID for autoloading. Instead the
> + * associated driver will be registered manually after matching a DMI table.
> + */
> +static const struct wmi_device_id uniwill_wmi_id_table[] = {
> +	{ UNIWILL_EVENT_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver uniwill_wmi_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = uniwill_wmi_id_table,
> +	.notify = uniwill_wmi_notify,
> +	.no_singleton = true,
> +};
> +
> +int __init uniwill_wmi_register_driver(void)
> +{
> +	return wmi_driver_register(&uniwill_wmi_driver);
> +}
> +
> +void __exit uniwill_wmi_unregister_driver(void)
> +{
> +	wmi_driver_unregister(&uniwill_wmi_driver);
> +}
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
> new file mode 100644
> index 000000000000..2bf69f2d8038
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Linux hotkey driver for Uniwill notebooks.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#ifndef UNIWILL_WMI_H
> +#define UNIWILL_WMI_H
> +
> +#include <linux/init.h>
> +
> +#define UNIWILL_OSD_CAPSLOCK			0x01
> +#define UNIWILL_OSD_NUMLOCK			0x02
> +#define UNIWILL_OSD_SCROLLLOCK			0x03
> +
> +#define UNIWILL_OSD_TOUCHPAD_ON			0x04
> +#define UNIWILL_OSD_TOUCHPAD_OFF		0x05
> +
> +#define UNIWILL_OSD_SILENT_MODE_ON		0x06
> +#define UNIWILL_OSD_SILENT_MODE_OFF		0x07
> +
> +#define UNIWILL_OSD_WLAN_ON			0x08
> +#define UNIWILL_OSD_WLAN_OFF			0x09
> +
> +#define UNIWILL_OSD_WIMAX_ON			0x0A
> +#define UNIWILL_OSD_WIMAX_OFF			0x0B
> +
> +#define UNIWILL_OSD_BLUETOOTH_ON		0x0C
> +#define UNIWILL_OSD_BLUETOOTH_OFF		0x0D
> +
> +#define UNIWILL_OSD_RF_ON			0x0E
> +#define UNIWILL_OSD_RF_OFF			0x0F
> +
> +#define UNIWILL_OSD_3G_ON			0x10
> +#define UNIWILL_OSD_3G_OFF			0x11
> +
> +#define UNIWILL_OSD_WEBCAM_ON			0x12
> +#define UNIWILL_OSD_WEBCAM_OFF			0x13
> +
> +#define UNIWILL_OSD_BRIGHTNESSUP		0x14
> +#define UNIWILL_OSD_BRIGHTNESSDOWN		0x15
> +
> +#define UNIWILL_OSD_RADIOON			0x1A
> +#define UNIWILL_OSD_RADIOOFF			0x1B
> +
> +#define UNIWILL_OSD_POWERSAVE_ON		0x31
> +#define UNIWILL_OSD_POWERSAVE_OFF		0x32
> +
> +#define UNIWILL_OSD_MENU			0x34
> +
> +#define UNIWILL_OSD_MUTE			0x35
> +#define UNIWILL_OSD_VOLUMEDOWN			0x36
> +#define UNIWILL_OSD_VOLUMEUP			0x37
> +
> +#define UNIWILL_OSD_MENU_2			0x38
> +
> +#define UNIWILL_OSD_LIGHTBAR_ON			0x39
> +#define UNIWILL_OSD_LIGHTBAR_OFF		0x3A
> +
> +#define UNIWILL_OSD_KB_LED_LEVEL0		0x3B
> +#define UNIWILL_OSD_KB_LED_LEVEL1		0x3C
> +#define UNIWILL_OSD_KB_LED_LEVEL2		0x3D
> +#define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
> +#define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
> +
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
> +
> +#define UNIWILL_OSD_MENU_JP			0x42
> +
> +#define UNIWILL_OSD_CAMERA_ON			0x90
> +#define UNIWILL_OSD_CAMERA_OFF			0x91
> +
> +#define UNIWILL_OSD_RFKILL			0xA4
> +
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
> +
> +#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
> +
> +#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED	0xA7
> +
> +#define UNIWILL_OSD_LCD_SW			0xA9
> +
> +#define UNIWILL_OSD_FAN_OVERTEMP		0xAA
> +
> +#define UNIWILL_OSD_DC_ADAPTER_CHANGED		0xAB
> +
> +#define UNIWILL_OSD_BAT_HP_OFF			0xAC
> +
> +#define UNIWILL_OSD_FAN_DOWN_TEMP		0xAD
> +
> +#define UNIWILL_OSD_BATTERY_ALERT		0xAE
> +
> +#define UNIWILL_OSD_TIMAP_HAIERLB_SW		0xAF
> +
> +#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE	0xB0
> +
> +#define UNIWILL_OSD_KBDILLUMDOWN		0xB1
> +#define UNIWILL_OSD_KBDILLUMUP			0xB2
> +
> +#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE	0xB3
> +#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE	0xB4
> +
> +#define UNIWILL_OSD_MIC_MUTE			0xB7
> +
> +#define UNIWILL_OSD_FN_LOCK			0xB8
> +#define UNIWILL_OSD_KBDILLUMTOGGLE		0xB9
> +
> +#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H	0xBE
> +
> +#define UNIWILL_OSD_BAT_ERM_UPDATE		0xBF
> +
> +#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
> +
> +#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
> +
> +struct device;
> +struct notifier_block;
> +
> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifier_block *nb);
> +
> +int __init uniwill_wmi_register_driver(void);
> +
> +void __exit uniwill_wmi_unregister_driver(void);
> +
> +#endif /* UNIWILL_WMI_H */

