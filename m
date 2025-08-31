Return-Path: <linux-leds+bounces-5329-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF394B3D4BB
	for <lists+linux-leds@lfdr.de>; Sun, 31 Aug 2025 20:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701C0175D27
	for <lists+linux-leds@lfdr.de>; Sun, 31 Aug 2025 18:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEBE271A71;
	Sun, 31 Aug 2025 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="H7HMUZt/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F419755B;
	Sun, 31 Aug 2025 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756666652; cv=none; b=fsMLIhIcpq/cuZEOaD5feCLL9ukBGSwVTSzWR3uFzMIgr7ISe61kQ1Wp0dvt2tHr0gbayXrEPN9QI0SXt4xKtUdA8+vv7dJ9wPOB13CvP4V6v7xiOvuqdIx5VoY/n8iRVS5Z7Jpso7rMJbnzG1DMzvkyIAZcqC/BZ2bt5AKdS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756666652; c=relaxed/simple;
	bh=dd8m5gL/kp6PDPmNGYGzijIf9HCZbCT/40NIGhLhh0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eS0KzH9hTEs7eLQp8/R7jU1AH0AYPjM8xO0zZfv7AGUXTaTG6jfnTuhjdX+kiJK14Dv5GQusrSj1SVqMlWIMh5RNix7l74U31901AdfKNb8GefjeVDSN+O9V5UhEZfrFWmUzdltSMSErDxzAxfBjSarPOA7WFaeqem3lYk1rjHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=H7HMUZt/; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756666646; x=1757271446; i=w_armin@gmx.de;
	bh=pjufr5cIf/LgqLsIKMKfVxvv5Ou/4XIujz/RZDH3WII=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H7HMUZt/YuHPhKnf3JcuNpqCjZIYy1PVQeewMQK96t8Q7es5Jp6cBihHChFq8Jby
	 vDOjw8uJK+W4U/bZn/d7qv6CIbS/IUEcGrv/DpR6Ka8Q/s568OEMRv1e9FRbs5z4a
	 FnYUmjoObLhZqKw+RJ/5vSwRZGtqHW5vAcbcKTFVl5JSvKxc07esQqklC9jVXSQq5
	 YDV7MVz1JARI6bxUCXzgv9US4t7NTfVPTQ/sRxkowzXiGdzHnqemb4BNg4MadFHbg
	 VSNKS+cw8d2qSdhtNw36qdr0t/gY8uj8cV6vVq6eGeSWXnri8XHpJduK75FozYsQg
	 O0pOzUk1yzUV7J66Cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.241.135.1] ([176.2.64.54]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1uJSUQ0tdo-00cZVb; Sun, 31
 Aug 2025 20:57:26 +0200
Message-ID: <84cbf9b1-34f7-42b7-b30f-ca4f9125f050@gmx.de>
Date: Sun, 31 Aug 2025 20:57:17 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: Add Uniwill laptop driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, chumuzero@gmail.com, corbet@lwn.net,
 cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250803210157.8185-1-W_Armin@gmx.de>
 <20250803210157.8185-3-W_Armin@gmx.de>
 <8b876756-79cc-5af2-df07-ba9ac0004950@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <8b876756-79cc-5af2-df07-ba9ac0004950@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mZz/J7T+DBgj6keCmTymJAP3IabuZ3y7p5hlAHBZW0f6Lk/M+SG
 sfitgBXoyERTcAH7VgYcUotw0nFTfTHjYsrizpmjMpuXbSioDrJxeYx76zGpXvaxWI25Gpm
 u4an+vsC1ksMa7CjEiCaAMKeR94wNapomDox9At99E2MUKziu/OQauxv4K7NHSLXbCN+SBo
 ihhRLrj7JjR6sgO2fIIMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KHf+sI5tlr8=;Mg9oF09mfBZspqYDdl+g+KlO0Ck
 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

Am 05.08.25 um 09:50 schrieb Ilpo J=C3=A4rvinen:

> On Sun, 3 Aug 2025, Armin Wolf wrote:
>
>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>> interface to talk with the embedded controller, but relies on a
>> DMI whitelist for autoloading since Uniwill just copied the WMI
>> GUID from the Windows driver example.
>>
>> The driver is reverse-engineered based on the following information:
>> - OEM software from intel
>> - https://github.com/pobrn/qc71_laptop
>> - https://gitlab.com/tuxedocomputers/development/packages/tuxedo-driver=
s
>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>
>> The underlying EC supports various features, including hwmon sensors,
>> battery charge limiting, a RGB lightbar and keyboard-related controls.
>>
>> Reported-by: cyear <chumuzero@gmail.com>
>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>   Documentation/wmi/devices/uniwill-laptop.rst  |  118 ++
>>   MAINTAINERS                                   |    8 +
>>   drivers/platform/x86/uniwill/Kconfig          |   17 +
>>   drivers/platform/x86/uniwill/Makefile         |    1 +
>>   drivers/platform/x86/uniwill/uniwill-laptop.c | 1484 ++++++++++++++++=
+
>>   drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>>   7 files changed, 1683 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-lap=
top
>>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Do=
cumentation/ABI/testing/sysfs-driver-uniwill-laptop
>> new file mode 100644
>> index 000000000000..7a540a7b9f24
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -0,0 +1,53 @@
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/f=
n_lock
>> +Date:		June 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Allows userspace applications to enable/disable the FN lock feature
>> +		of the integrated keyboard by writing "enable"/"disable" into this f=
ile.
> Is this "enable" / "disable" really worth over just using normal bool?

Hi,

personally i like having self-describing values instead of plain 0/1, so i=
 would be in
favor of keeping it.

>> +
>> +		Reading this file returns the current enable status of the FN lock f=
unctionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/s=
uper_key_lock
>> +Date:		June 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +                Allows userspace applications to enable/disable the su=
per key functionality
>> +                of the integrated keyboard by writing "enable"/"disabl=
e" into this file.
>> +
>> +		Reading this file returns the current enable status of the super key=
 functionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/t=
ouchpad_toggle
>> +Date:		June 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Allows userspace applications to enable/disable the touchpad toggle =
functionality
>> +		of the integrated touchpad by writing "enable"/"disable" into this f=
ile.
>> +
>> +		Reading this file returns the current enable status of the touchpad =
toggle
>> +		functionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/r=
ainbow_animation
>> +Date:		June 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Forces the integrated lightbar to display a rainbow animation when t=
he machine
>> +		is not suspended. Writing "enable"/"disable" into this file enables/=
disables
>> +		this functionality.
>> +
>> +		Reading this file returns the current status of the rainbow animatio=
n functionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/b=
reathing_in_suspend
>> +Date:		June 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Causes the integrated lightbar to display a breathing animation when=
 the machine
>> +		has been suspended and is running on AC power. Writing "enable"/"dis=
able" into
>> +		this file enables/disables this functionality.
>> +
>> +		Reading this file returns the current status of the breathing animat=
ion
>> +		functionality.
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentati=
on/wmi/devices/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..b785763a5e32
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -0,0 +1,118 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Uniwill WMI Notebook driver (uniwill-laptop)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Many notebooks manufactured by Uniwill (either directly or as ODM) pro=
vide a WMI-based
>> +EC interface for controlling various platform settings like sensors an=
d fan control.
>> +This interface is used by the ``uniwill-laptop`` driver to map those f=
eatures onto standard
>> +kernel interfaces.
>> +
>> +WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>> +
>> +::
>> +
>> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +   Description("Class used to operate methods on a ULong"),
>> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
>> +  class AcpiTest_MULong {
>> +    [key, read] string InstanceName;
>> +    [read] boolean Active;
>> +
>> +    [WmiMethodId(1), Implemented, read, write, Description("Return the=
 contents of a ULong")]
>> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
>> +
>> +    [WmiMethodId(2), Implemented, read, write, Description("Set the co=
ntents of a ULong")]
>> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
>> +
>> +    [WmiMethodId(3), Implemented, read, write,
>> +     Description("Generate an event containing ULong data")]
>> +    void FireULong([in, Description("WMI requires a parameter")] uint3=
2 Hack);
>> +
>> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Se=
t the contents of a ULong")]
>> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
>> +                     [out, Description("Ulong Data")] uint32 Return);
>> +
>> +    [WmiMethodId(5), Implemented, read, write,
>> +     Description("Get and Set the contents of a ULong for Dollby butto=
n")]
>> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
>> +                   [out, Description("Ulong Data")] uint32 Return);
>> +  };
>> +
>> +Most of the WMI-related code was copied from the Windows driver sample=
s, which unfortunately means
>> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for =
autoloading.
>> +
>> +WMI method GetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has no =
function.
>> +
>> +WMI method SetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has no =
function.
>> +
>> +WMI method FireULong()
>> +----------------------
>> +
>> +This WMI method allows to inject a WMI event with a 32-bit payload. It=
s primary purpose seems
>> +to be debugging.
>> +
>> +WMI method GetSetULong()
>> +------------------------
>> +
>> +This WMI method is used to communicate with the EC. The ``Data`` argum=
ent hold the following
>> +information (starting with the least significant byte):
>> +
>> +1. 16-bit address
>> +2. 16-bit data (set to ``0x0000`` when reading)
>> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing=
)
>> +4. 16-bit reserved (set to ``0x0000``)
>> +
>> +The first 8 bits of the ``Return`` value contain the data returned by =
the EC when reading.
>> +The special value ``0xFEFEFEFE`` is used to indicate a communication f=
ailure with the EC.
>> +
>> +WMI method GetButton()
>> +----------------------
>> +
>> +This WMI method is not implemented on all machines and has an unknown =
purpose.
>> +
>> +Relation with the ``INOU0000`` ACPI device
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +It seems that many of the embedded controller registers can also be ac=
cessed by using the ``ECRR``
>> +and ``ECRW`` ACPI control methods under the ``INOU0000`` ACPI device. =
This sidesteps the overhead
>> +of the WMI interface but does not work for the registers in the range =
between ``0x1800`` and
>> +``0x18FF``. More research is needed to determine whether this interfac=
e imposes additional
>> +restrictions.
>> +
>> +Reverse-Engineering the Uniwill WMI interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. warning:: Randomly poking the EC can potentially cause damage to th=
e machine and other unwanted
>> +             side effects, please be careful.
>> +
>> +The EC behind the ``GetSetULong`` method is used by the OEM software s=
upplied by the manufacturer.
>> +Reverse-engineering of this software is difficult since it uses an obf=
uscator, however some parts
>> +are not obfuscated. In this case `dnSpy <https://github.com/dnSpy/dnSp=
y>`_ could also be helpful.
>> +
>> +The EC can be accessed under Windows using powershell (requires admin =
privileges):
>> +
>> +::
>> +
>> +  > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_M=
ULong | Select-Object -First 1
>> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Argume=
nts @{Data =3D <input>}
>> +
>> +Special thanks go to github user `pobrn` which developed the
>> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which =
this driver is partly based.
>> +The same is true for Tuxedo Computers, which developed the
>> +`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packag=
es/tuxedo-drivers>`_ package
>> +which also served as a foundation for this driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c6222f9d0984..d1901990a7a3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25499,6 +25499,14 @@ L:	linux-scsi@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/ufs/host/ufs-renesas.c
>>  =20
>> +UNIWILL LAPTOP DRIVER
>> +M:	Armin Wolf <W_Armin@gmx.de>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +F:	Documentation/wmi/devices/uniwill-laptop.rst
>> +F:	drivers/platform/x86/uniwill/uniwill-laptop.c
>> +
>>   UNIWILL WMI DRIVER
>>   M:	Armin Wolf <W_Armin@gmx.de>
>>   L:	platform-driver-x86@vger.kernel.org
>> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x8=
6/uniwill/Kconfig
>> index 7571b30edb11..46d9af52b3f2 100644
>> --- a/drivers/platform/x86/uniwill/Kconfig
>> +++ b/drivers/platform/x86/uniwill/Kconfig
>> @@ -16,6 +16,23 @@ menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>>  =20
>>   if X86_PLATFORM_DRIVERS_UNIWILL
>>  =20
>> +config UNIWILL_LAPTOP
>> +	tristate "Uniwill Laptop Extras"
>> +	default m
>> +	depends on ACPI_WMI
>> +	depends on ACPI_BATTERY
>> +	depends on UNIWILL_WMI
>> +	depends on HWMON
>> +	depends on LEDS_CLASS_MULTICOLOR
>> +	depends on DMI
>> +	select REGMAP
>> +	help
>> +	  This driver adds support for various extra features found on Uniwil=
l laptops,
>> +	  like the lightbar and hwmon sensors. It also supports many OEM lapt=
ops
>> +	  originally manufactured by Uniwill.
>> +
>> +	  If you have such a laptop, say Y or M here.
>> +
>>   config UNIWILL_WMI
>>   	tristate "Uniwill WMI Event Driver"
>>   	default m
>> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x=
86/uniwill/Makefile
>> index a5a300be63f3..b55169a49e1e 100644
>> --- a/drivers/platform/x86/uniwill/Makefile
>> +++ b/drivers/platform/x86/uniwill/Makefile
>> @@ -4,4 +4,5 @@
>>   # Uniwill X86 Platform Specific Drivers
>>   #
>>  =20
>> +obj-$(CONFIG_UNIWILL_LAPTOP)	+=3D uniwill-laptop.o
>>   obj-$(CONFIG_UNIWILL_WMI)	+=3D uniwill-wmi.o
>> diff --git a/drivers/platform/x86/uniwill/uniwill-laptop.c b/drivers/pl=
atform/x86/uniwill/uniwill-laptop.c
>> new file mode 100644
>> index 000000000000..0ac5a51b792b
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-laptop.c
>> @@ -0,0 +1,1484 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux driver for Uniwill notebooks.
>> + *
>> + * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg=
 and Werner Sembach
>> + * for supporting the development of this driver either through prior =
work or
>> + * by answering questions regarding the underlying WMI interface.
>> + *
>> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
>> + */
>> +
>> +#define pr_format(fmt) KBUILD_MODNAME ": " fmt
> pr_fmt()
>
Good catch, will fix.

>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/device/driver.h>
>> +#include <linux/dmi.h>
>> +#include <linux/errno.h>
>> +#include <linux/fixp-arith.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/kstrtox.h>
>> +#include <linux/leds.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/limits.h>
>> +#include <linux/list.h>
>> +#include <linux/minmax.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/notifier.h>
>> +#include <linux/pm.h>
>> +#include <linux/printk.h>
>> +#include <linux/regmap.h>
>> +#include <linux/string.h>
>> +#include <linux/string_choices.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +#include <linux/unaligned.h>
>> +#include <linux/units.h>
>> +#include <linux/wmi.h>
>> +
>> +#include <acpi/battery.h>
>> +
>> +#include "uniwill-wmi.h"
>> +
>> +#define EC_ADDR_BAT_POWER_UNIT_1	0x0400
>> +
>> +#define EC_ADDR_BAT_POWER_UNIT_2	0x0401
>> +
>> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1	0x0402
>> +
>> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2	0x0403
>> +
>> +#define EC_ADDR_BAT_FULL_CAPACITY_1	0x0404
>> +
>> +#define EC_ADDR_BAT_FULL_CAPACITY_2	0x0405
>> +
>> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1	0x0408
>> +
>> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2	0x0409
>> +
>> +#define EC_ADDR_BAT_STATUS_1		0x0432
>> +#define BAT_DISCHARGING			BIT(0)
>> +
>> +#define EC_ADDR_BAT_STATUS_2		0x0433
>> +
>> +#define EC_ADDR_BAT_CURRENT_1		0x0434
>> +
>> +#define EC_ADDR_BAT_CURRENT_2		0x0435
>> +
>> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1	0x0436
>> +
>> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2	0x0437
>> +
>> +#define EC_ADDR_BAT_VOLTAGE_1		0x0438
>> +
>> +#define EC_ADDR_BAT_VOLTAGE_2		0x0439
>> +
>> +#define EC_ADDR_CPU_TEMP		0x043E
>> +
>> +#define EC_ADDR_GPU_TEMP		0x044F
>> +
>> +#define EC_ADDR_MAIN_FAN_RPM_1		0x0464
>> +
>> +#define EC_ADDR_MAIN_FAN_RPM_2		0x0465
>> +
>> +#define EC_ADDR_SECOND_FAN_RPM_1	0x046C
>> +
>> +#define EC_ADDR_SECOND_FAN_RPM_2	0x046D
>> +
>> +#define EC_ADDR_DEVICE_STATUS		0x047B
>> +#define WIFI_STATUS_ON			BIT(7)
>> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
>> +
>> +#define EC_ADDR_BAT_ALERT		0x0494
>> +
>> +#define EC_ADDR_BAT_CYCLE_COUNT_1	0x04A6
>> +
>> +#define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
>> +
>> +#define EC_ADDR_PROJECT_ID		0x0740
>> +
>> +#define EC_ADDR_AP_OEM			0x0741
>> +#define	ENABLE_MANUAL_CTRL		BIT(0)
>> +#define ITE_KBD_EFFECT_REACTIVE		BIT(3)
>> +#define FAN_ABNORMAL			BIT(5)
>> +
>> +#define EC_ADDR_SUPPORT_5		0x0742
>> +#define FAN_TURBO_SUPPORTED		BIT(4)
>> +#define FAN_SUPPORT			BIT(5)
>> +
>> +#define EC_ADDR_CTGP_DB_CTRL		0x0743
>> +#define CTGP_DB_GENERAL_ENABLE		BIT(0)
>> +#define CTGP_DB_DB_ENABLE		BIT(1)
>> +#define CTGP_DB_CTGP_ENABLE		BIT(2)
>> +
>> +#define EC_ADDR_CTGP_OFFSET		0x0744
>> +
>> +#define EC_ADDR_TPP_OFFSET		0x0745
>> +
>> +#define EC_ADDR_MAX_TGP			0x0746
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
>> +#define LIGHTBAR_APP_EXISTS		BIT(0)
>> +#define LIGHTBAR_POWER_SAVE		BIT(1)
>> +#define LIGHTBAR_S0_OFF			BIT(2)
>> +#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
>> +#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_RED		0x0749
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_GREEN	0x074A
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_BLUE	0x074B
>> +
>> +#define EC_ADDR_BIOS_OEM		0x074E
>> +#define FN_LOCK_STATUS			BIT(4)
>> +
>> +#define EC_ADDR_MANUAL_FAN_CTRL		0x0751
>> +#define FAN_LEVEL_MASK			GENMASK(2, 0)
>> +#define FAN_MODE_TURBO			BIT(4)
>> +#define FAN_MODE_HIGH			BIT(5)
>> +#define FAN_MODE_BOOST			BIT(6)
>> +#define FAN_MODE_USER			BIT(7)
>> +
>> +#define EC_ADDR_PWM_1			0x075B
>> +
>> +#define EC_ADDR_PWM_2			0x075C
>> +
>> +/* Unreliable */
>> +#define EC_ADDR_SUPPORT_1		0x0765
>> +#define AIRPLANE_MODE			BIT(0)
>> +#define GPS_SWITCH			BIT(1)
>> +#define OVERCLOCK			BIT(2)
>> +#define MACRO_KEY			BIT(3)
>> +#define SHORTCUT_KEY			BIT(4)
>> +#define SUPER_KEY_LOCK			BIT(5)
>> +#define LIGHTBAR			BIT(6)
>> +#define FAN_BOOST			BIT(7)
>> +
>> +#define EC_ADDR_SUPPORT_2		0x0766
>> +#define SILENT_MODE			BIT(0)
>> +#define USB_CHARGING			BIT(1)
>> +#define RGB_KEYBOARD			BIT(2)
>> +#define CHINA_MODE			BIT(5)
>> +#define MY_BATTERY			BIT(6)
>> +
>> +#define EC_ADDR_TRIGGER			0x0767
>> +#define TRIGGER_SUPER_KEY_LOCK		BIT(0)
>> +#define TRIGGER_LIGHTBAR		BIT(1)
>> +#define TRIGGER_FAN_BOOST		BIT(2)
>> +#define TRIGGER_SILENT_MODE		BIT(3)
>> +#define TRIGGER_USB_CHARGING		BIT(4)
>> +#define RGB_APPLY_COLOR			BIT(5)
>> +#define RGB_LOGO_EFFECT			BIT(6)
>> +#define RGB_RAINBOW_EFFECT		BIT(7)
>> +
>> +#define EC_ADDR_SWITCH_STATUS		0x0768
>> +#define SUPER_KEY_LOCK_STATUS		BIT(0)
>> +#define LIGHTBAR_STATUS			BIT(1)
>> +#define FAN_BOOST_STATUS		BIT(2)
>> +#define MACRO_KEY_STATUS		BIT(3)
>> +#define MY_BAT_POWER_BAT_STATUS		BIT(4)
>> +
>> +#define EC_ADDR_RGB_RED			0x0769
>> +
>> +#define EC_ADDR_RGB_GREEN		0x076A
>> +
>> +#define EC_ADDR_RGB_BLUE		0x076B
>> +
>> +#define EC_ADDR_ROMID_START		0x0770
>> +#define ROMID_LENGTH			14
>> +
>> +#define EC_ADDR_ROMID_EXTRA_1		0x077E
>> +
>> +#define EC_ADDR_ROMID_EXTRA_2		0x077F
>> +
>> +#define EC_ADDR_BIOS_OEM_2		0x0782
>> +#define FAN_V2_NEW			BIT(0)
>> +#define FAN_QKEY			BIT(1)
>> +#define FAN_TABLE_OFFICE_MODE		BIT(2)
>> +#define FAN_V3				BIT(3)
>> +#define DEFAULT_MODE			BIT(4)
>> +
>> +#define EC_ADDR_PL1_SETTING		0x0783
>> +
>> +#define EC_ADDR_PL2_SETTING		0x0784
>> +
>> +#define EC_ADDR_PL4_SETTING		0x0785
>> +
>> +#define EC_ADDR_FAN_DEFAULT		0x0786
>> +#define FAN_CURVE_LENGTH		5
>> +
>> +#define EC_ADDR_KBD_STATUS		0x078C
>> +#define KBD_WHITE_ONLY			BIT(0)	// ~single color
>> +#define KBD_SINGLE_COLOR_OFF		BIT(1)
>> +#define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
>> +#define KBD_APPLY			BIT(4)
>> +#define KBD_BRIGHTNESS			GENMASK(7, 5)
>> +
>> +#define EC_ADDR_FAN_CTRL		0x078E
>> +#define FAN3P5				BIT(1)
>> +#define CHARGING_PROFILE		BIT(3)
>> +#define UNIVERSAL_FAN_CTRL		BIT(6)
>> +
>> +#define EC_ADDR_BIOS_OEM_3		0x07A3
>> +#define FAN_REDUCED_DURY_CYCLE		BIT(5)
>> +#define FAN_ALWAYS_ON			BIT(6)
>> +
>> +#define EC_ADDR_BIOS_BYTE		0x07A4
>> +#define FN_LOCK_SWITCH			BIT(3)
>> +
>> +#define EC_ADDR_OEM_3			0x07A5
>> +#define POWER_LED_MASK			GENMASK(1, 0)
>> +#define POWER_LED_LEFT			0x00
>> +#define POWER_LED_BOTH			0x01
>> +#define POWER_LED_NONE			0x02
>> +#define FAN_QUIET			BIT(2)
>> +#define OVERBOOST			BIT(4)
>> +#define HIGH_POWER			BIT(7)
>> +
>> +#define EC_ADDR_OEM_4			0x07A6
>> +#define OVERBOOST_DYN_TEMP_OFF		BIT(1)
>> +#define TOUCHPAD_TOGGLE_OFF		BIT(6)
>> +
>> +#define EC_ADDR_CHARGE_CTRL		0x07B9
>> +#define CHARGE_CTRL_MASK		GENMASK(6, 0)
>> +#define CHARGE_CTRL_REACHED		BIT(7)
>> +
>> +#define EC_ADDR_UNIVERSAL_FAN_CTRL	0x07C5
>> +#define SPLIT_TABLES			BIT(7)
>> +
>> +#define EC_ADDR_AP_OEM_6		0x07C6
>> +#define ENABLE_UNIVERSAL_FAN_CTRL	BIT(2)
>> +#define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
>> +#define BATTERY_ERM_STATUS_REACHED	BIT(4)
>> +
>> +#define EC_ADDR_CHARGE_PRIO		0x07CC
>> +#define CHARGING_PERFORMANCE		BIT(7)
>> +
>> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>> +#define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_GREEN	0x07E4
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_BLUE	0x07E5
>> +
>> +#define EC_ADDR_CPU_TEMP_END_TABLE	0x0F00
>> +
>> +#define EC_ADDR_CPU_TEMP_START_TABLE	0x0F10
>> +
>> +#define EC_ADDR_CPU_FAN_SPEED_TABLE	0x0F20
>> +
>> +#define EC_ADDR_GPU_TEMP_END_TABLE	0x0F30
>> +
>> +#define EC_ADDR_GPU_TEMP_START_TABLE	0x0F40
>> +
>> +#define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
>> +
>> +/*
>> + * Those two registers technically allow for manual fan control,
>> + * but are unstable on some models and are likely not meant to
>> + * be used by applications.
>> + */
>> +#define EC_ADDR_PWM_1_WRITEABLE		0x1804
>> +
>> +#define EC_ADDR_PWM_2_WRITEABLE		0x1809
>> +
>> +#define DRIVER_NAME	"uniwill"
>> +#define UNIWILL_GUID	"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
>> +
>> +#define PWM_MAX			200
>> +#define FAN_TABLE_LENGTH	16
>> +
>> +#define LED_CHANNELS		3
>> +#define LED_MAX_BRIGHTNESS	200
>> +
>> +#define UNIWILL_FEATURE_FN_LOCK		BIT(0)
>> +#define UNIWILL_FEATURE_SUPER_KEY_LOCK	BIT(1)
>> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE BIT(2)
>> +#define UNIWILL_FEATURE_LIGHTBAR	BIT(3)
>> +#define UNIWILL_FEATURE_BATTERY		BIT(4)
>> +#define UNIWILL_FEATURE_HWMON		BIT(5)
>> +
>> +enum uniwill_method {
>> +	UNIWILL_GET_ULONG	=3D 0x01,
>> +	UNIWILL_SET_ULONG	=3D 0x02,
>> +	UNIWILL_FIRE_ULONG	=3D 0x03,
>> +	UNIWILL_GET_SET_ULONG	=3D 0x04,
>> +	UNIWILL_GET_BUTTON	=3D 0x05,
>> +};
>> +
>> +struct uniwill_method_buffer {
>> +	__le16 address;
>> +	__le16 data;
>> +	__le16 operation;
>> +	__le16 reserved;
>> +} __packed;
>> +
>> +struct uniwill_data {
>> +	struct wmi_device *wdev;
>> +	struct regmap *regmap;
>> +	struct acpi_battery_hook hook;
>> +	unsigned int last_charge_ctrl;
>> +	struct mutex battery_lock;	/* Protects the list of currently register=
ed batteries */
>> +	unsigned int last_switch_status;
>> +	struct mutex super_key_lock;	/* Protects the toggling of the super ke=
y lock state */
>> +	struct list_head batteries;
>> +	struct led_classdev_mc led_mc_cdev;
>> +	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>> +	struct notifier_block nb;
>> +};
>> +
>> +struct uniwill_battery_entry {
>> +	struct list_head head;
>> +	struct power_supply *battery;
>> +};
>> +
>> +static bool force;
>> +module_param_unsafe(force, bool, 0);
>> +MODULE_PARM_DESC(force, "Force loading without checking for supported =
devices\n");
>> +
>> +/* Feature bitmask since the associated registers are not reliable */
>> +static uintptr_t supported_features;
> I think uintptr_t should be mostly be reserved to the casting itself. So
> preferrably unsigned int or unsigned long.

Ack.

>> +/*
>> + * "disable" is placed on index 0 so that the return value of sysfs_ma=
tch_string()
>> + * directly translates into a boolean value.
>> + */
>> +static const char * const uniwill_enable_disable_strings[] =3D {
>> +	[0] =3D "disable",
>> +	[1] =3D "enable",
>> +};
>> +
>> +static const char * const uniwill_temp_labels[] =3D {
>> +	"CPU",
>> +	"GPU",
>> +};
>> +
>> +static const char * const uniwill_fan_labels[] =3D {
>> +	"Main",
>> +	"Secondary",
>> +};
>> +
>> +static int uniwill_get_set_ulong(struct wmi_device *wdev, struct uniwi=
ll_method_buffer *input,
>> +				 u32 *output)
>> +{
>> +	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +	struct acpi_buffer in =3D {
>> +		.length =3D sizeof(*input),
>> +		.pointer =3D input,
>> +	};
>> +	union acpi_object *obj;
>> +	acpi_status status;
>> +	int ret =3D 0;
>> +
>> +	status =3D wmidev_evaluate_method(wdev, 0x0, UNIWILL_GET_SET_ULONG, &=
in, &out);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	obj =3D out.pointer;
>> +	if (!obj)
>> +		return -ENODATA;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> +		ret =3D -ENOMSG;
>> +		goto free_obj;
>> +	}
>> +
>> +	if (obj->buffer.length < sizeof(*output)) {
>> +		ret =3D -EPROTO;
>> +		goto free_obj;
>> +	}
>> +
>> +	*output =3D get_unaligned_le32(obj->buffer.pointer);
>> +
>> +free_obj:
>> +	kfree(obj);
>> +
>> +	return ret;
>> +}
>> +
>> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsig=
ned int val)
>> +{
>> +	struct uniwill_method_buffer input =3D {
>> +		.address =3D cpu_to_le16(reg),
>> +		.data =3D cpu_to_le16(val & U8_MAX),
>> +		.operation =3D 0x0000,
>> +	};
>> +	struct uniwill_data *data =3D context;
>> +	u32 output;
>> +	int ret;
>> +
>> +	ret =3D uniwill_get_set_ulong(data->wdev, &input, &output);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (output =3D=3D 0xFEFEFEFE)
>> +		return -ENXIO;
>> +
>> +	return 0;
>> +}
>> +
>> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsign=
ed int *val)
>> +{
>> +	struct uniwill_method_buffer input =3D {
>> +		.address =3D cpu_to_le16(reg),
>> +		.data =3D 0x0000,
>> +		.operation =3D cpu_to_le16(0x0100),
>> +	};
>> +	struct uniwill_data *data =3D context;
>> +	u32 output;
>> +	int ret;
>> +
>> +	ret =3D uniwill_get_set_ulong(data->wdev, &input, &output);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (output =3D=3D 0xFEFEFEFE)
> Please use a define.
>
>> +		return -ENXIO;
>> +
>> +	*val =3D (u8)output;
> Use & here instead. Neither of the types is u8, casting to an intermedia=
te
> type to mask bits is a cast we can do without by coding the true intent.
>
I replaced the WMI interface used to read/write EC registers with a faster=
 variant
using the INOU0000 ACPI device.

Thanks,
Armin Wolf


