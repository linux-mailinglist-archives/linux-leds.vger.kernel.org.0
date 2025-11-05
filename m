Return-Path: <linux-leds+bounces-6019-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24913C3822F
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 23:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF44618C7F5D
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 22:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564A72EF673;
	Wed,  5 Nov 2025 22:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OdgtzA1l"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386A22EC0AC;
	Wed,  5 Nov 2025 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762380195; cv=none; b=aM9i3R2q1A+4NBsEPavZKbiEKOcDbOKXwNsV0mlGIRhLkb50p10npdAc5k//KJSsk5m4yhvaL0Hj+ofyW8U5frt77G0xdxShTP/732aPYHzNgrHKHE5O7+lntTihySnxh7MytZLM8BPGGGZzqwqifbKoMM4hBjorM8fc7xczwuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762380195; c=relaxed/simple;
	bh=IKVkN0uGzQz+5bC7ak6P87hG4mCx1zr8Rm8fBWslk0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5HRhstpTYz4dxTvAIN70JeT+B8jVWSwGyJXSrm5mhs+SXoYOtc0CyaRhVhY6WFsf1+9AJpqusga5g8AUrCMHrSIPY66JkW3xHmdCEXtOZHf5asFCbJGXJ977ZmIRktS9pHjXZFyLlIjvOhcHxjAlG1tUJ+l3Z/oToLV8oqTzh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OdgtzA1l; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1762380188; x=1762984988; i=w_armin@gmx.de;
	bh=fRbCSJYu1RVlMfuoV3vXwckER52AqRQGlhZfoVRyNrI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OdgtzA1lCx4X9UESLExyUJU9+zw3yiv7AN4WaLn4IzyEF2HOlSL/MjgC97ONvZBK
	 96SQIqnoLrnnVRGPsedtnU//44TnQ3kqw2rOdZ1BhSJN98HnmO4hX8UbVVVVzqsuy
	 /tM50XaUVmENMnVUxT4u2PIksk623KN/O+FbwGXaoo/YMMkSIEWjTi36/cUEpn2au
	 VhEzLObwWu02ntIRjRWerO4FjcZqJFfxz7pFUlUstjy9BzeYYeW/yqbEhPum1qNm/
	 lw5qwEeo8ABdj6SjFvvltSdl1pzk2wRP0pqM+keM79uvjvjpjRYvL2SKaac2pglH9
	 0rUPyGgx9vmktt1PMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1vzDUz2VkM-00ZWAW; Wed, 05
 Nov 2025 23:03:08 +0100
Message-ID: <d3129b77-a8f9-4aa3-ae5b-9223b4f2b8da@gmx.de>
Date: Wed, 5 Nov 2025 23:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] platform/x86: Add Uniwill laptop driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, chumuzero@gmail.com, corbet@lwn.net,
 cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com, nathan@kernel.org
References: <20251102172942.17879-1-W_Armin@gmx.de>
 <20251102172942.17879-2-W_Armin@gmx.de>
 <9d968cdd-d7d8-8337-c17c-a8f06e2e182f@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <9d968cdd-d7d8-8337-c17c-a8f06e2e182f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vZo9aqdu10ULFKZfHC/Rl0XHbb7dCIF6ttIlXPvTVs5KbnlQmBs
 XmziD+rirCWPetUxjCgOfoSkcRwyXsS6PJOUPZ+iWT/hAOmlLFKuiE8TdzOLsaxdHnzVlnI
 1F7i4mOIRWK8rwhSI/uhRCGA6r7KCx2fYYVu9wKkhCR/MvlEF54QGugfLq7FJooExTWlw5n
 hxirrwFvHRB8km2UN3CVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KWDEY7Fwe6Y=;7h2sd/Y1gzwcaR11q8mo50glnV1
 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

Am 05.11.25 um 15:24 schrieb Ilpo J=C3=A4rvinen:

> On Sun, 2 Nov 2025, Armin Wolf wrote:
>
>> Add a new driver for Uniwill laptops. The driver uses a ACPI
>> interface to talk with the embedded controller, but relies on a
>> ACPI WMI interface for receiving event notifications.
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
>> Tested-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>   Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
>>   MAINTAINERS                                   |   10 +
>>   drivers/platform/x86/Kconfig                  |    2 +
>>   drivers/platform/x86/Makefile                 |    3 +
>>   drivers/platform/x86/uniwill/Kconfig          |   38 +
>>   drivers/platform/x86/uniwill/Makefile         |    8 +
>>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 1550 ++++++++++++++++=
+
>>   drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
>>   drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
>>   10 files changed, 2081 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-lap=
top
>>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>   create mode 100644 drivers/platform/x86/uniwill/Kconfig
>>   create mode 100644 drivers/platform/x86/uniwill/Makefile
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Do=
cumentation/ABI/testing/sysfs-driver-uniwill-laptop
>> new file mode 100644
>> index 000000000000..eaeb659793d2
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -0,0 +1,53 @@
>> +What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
>> +Date:		November 2025
>> +KernelVersion:	6.19
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Allows userspace applications to enable/disable the FN lock feature
>> +		of the integrated keyboard by writing "1"/"0" into this file.
>> +
>> +		Reading this file returns the current enable status of the FN lock f=
unctionality.
>> +
>> +What:		/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
>> +Date:		November 2025
>> +KernelVersion:	6.19
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +                Allows userspace applications to enable/disable the su=
per key functionality
>> +                of the integrated keyboard by writing "1"/"0" into thi=
s file.
>> +
>> +		Reading this file returns the current enable status of the super key=
 functionality.
>> +
>> +What:		/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
>> +Date:		November 2025
>> +KernelVersion:	6.19
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Allows userspace applications to enable/disable the touchpad toggle =
functionality
>> +		of the integrated touchpad by writing "1"/"0" into this file.
>> +
>> +		Reading this file returns the current enable status of the touchpad =
toggle
>> +		functionality.
>> +
>> +What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
>> +Date:		November 2025
>> +KernelVersion:	6.19
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Forces the integrated lightbar to display a rainbow animation when t=
he machine
>> +		is not suspended. Writing "1"/"0" into this file enables/disables th=
is
>> +		functionality.
>> +
>> +		Reading this file returns the current status of the rainbow animatio=
n functionality.
>> +
>> +What:		/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
>> +Date:		November 2025
>> +KernelVersion:	6.19
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Causes the integrated lightbar to display a breathing animation when=
 the machine
>> +		has been suspended and is running on AC power. Writing "1"/"0" into =
this file
>> +		enables/disables this functionality.
>> +
>> +		Reading this file returns the current status of the breathing animat=
ion
>> +		functionality.
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentati=
on/wmi/devices/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..e246bf293450
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -0,0 +1,198 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Uniwill Notebook driver (uniwill-laptop)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Many notebooks manufactured by Uniwill (either directly or as ODM) pro=
vide a EC interface
>> +for controlling various platform settings like sensors and fan control=
. This interface is
>> +used by the ``uniwill-laptop`` driver to map those features onto stand=
ard kernel interfaces.
>> +
>> +EC WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +The EC WMI interface description can be decoded from the embedded bina=
ry MOF (bmof)
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
ent holds the following
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
>> +Reverse-Engineering the EC WMI interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
>> +WMI event interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The WMI interface description can also be decoded from the embedded bi=
nary MOF (bmof)
>> +data:
>> +
>> +::
>> +
>> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +   Description("Class containing event generated ULong data"),
>> +   guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
>> +  class AcpiTest_EventULong : WmiEvent {
>> +    [key, read] string InstanceName;
>> +    [read] boolean Active;
>> +
>> +    [WmiDataId(1), read, write, Description("ULong Data")] uint32 ULon=
g;
>> +  };
>> +
>> +Most of the WMI-related code was again copied from the Windows driver =
samples, causing this WMI
>> +interface to suffer from the same restrictions as the EC WMI interface=
 described above.
>> +
>> +WMI event data
>> +--------------
>> +
>> +The WMI event data contains a single 32-bit value which is used to ind=
icate various platform events.
>> +
>> +Reverse-Engineering the Uniwill WMI event interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +The driver logs debug messages when receiving a WMI event. Thus enabli=
ng debug messages will be
>> +useful for finding unknown event codes.
>> +
>> +EC ACPI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +The ``INOU0000`` ACPI device is a virtual device used to access variou=
s hardware registers
>> +available on notebooks manufactured by Uniwill. Reading and writing th=
ose registers happens
>> +by calling ACPI control methods. The ``uniwill-laptop`` driver uses th=
is device to communicate
>> +with the EC because the ACPI control methods are faster than the WMI m=
ethods described above.
>> +
>> +ACPI control methods used for reading registers take a single ACPI int=
eger containing the address
>> +of the register to read and return a ACPI integer containing the data =
inside said register. ACPI
>> +control methods used for writing registers however take two ACPI integ=
ers, with the additional
>> +ACPI integer containing the data to be written into the register. Such=
 ACPI control methods return
>> +nothing.
>> +
>> +System memory
>> +-------------
>> +
>> +System memory can be accessed with a granularity of either a single by=
te (``MMRB`` for reading and
>> +``MMWB`` for writing) or four bytes (``MMRD`` for reading and ``MMWD``=
 for writing). Those ACPI
>> +control methods are unused because they provide no benefit when compar=
ed to the native memory
>> +access functions provided by the kernel.
>> +
>> +EC RAM
>> +------
>> +
>> +The internal RAM of the EC can be accessed with a granularity of a sin=
gle byte using the ``ECRR``
>> +(read) and ``ECRW`` (write) ACPI control methods, with the maximum reg=
ister address being ``0xFFF``.
>> +The OEM software waits 6 ms after calling one of those ACPI control me=
thods, likely to avoid
>> +overwhelming the EC when being connected over LPC.
>> +
>> +PCI config space
>> +----------------
>> +
>> +The PCI config space can be accessed with a granularity of four bytes =
using the ``PCRD`` (read) and
>> +``PCWD`` (write) ACPI control methods. The exact address format is unk=
nown, and poking random PCI
>> +devices might confuse the PCI subsystem. Because of this those ACPI co=
ntrol methods are not used.
>> +
>> +IO ports
>> +--------
>> +
>> +IO ports can be accessed with a granularity of four bytes using the ``=
IORD`` (read) and ``IOWD``
>> +(write) ACPI control methods. Those ACPI control methods are unused be=
cause they provide no benefit
>> +when compared to the native IO port access functions provided by the k=
ernel.
>> +
>> +CMOS RAM
>> +--------
>> +
>> +The CMOS RAM can be accessed with a granularity of a single byte using=
 the ``RCMS`` (read) and
>> +``WCMS`` ACPI control methods. Using those ACPI methods might interfer=
e with the native CMOS RAM
>> +access functions provided by the kernel due to the usage of indexed IO=
, so they are unused.
>> +
>> +Indexed IO
>> +----------
>> +
>> +Indexed IO with IO ports with a granularity of a single byte can be pe=
rformed using the ``RIOP``
>> +(read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods a=
re unused because they
>> +provide no benifit when compared to the native IO port access function=
s provided by the kernel.
>> +
>> +Special thanks go to github user `pobrn` which developed the
>> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which =
this driver is partly based.
>> +The same is true for Tuxedo Computers, which developed the
>> +`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packag=
es/tuxedo-drivers>`_ package
>> +which also served as a foundation for this driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 46126ce2f968..8fce9b5e9fd7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -26376,6 +26376,16 @@ L:	linux-scsi@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/ufs/host/ufs-renesas.c
>>  =20
>> +UNIWILL LAPTOP DRIVER
>> +M:	Armin Wolf <W_Armin@gmx.de>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +F:	Documentation/wmi/devices/uniwill-laptop.rst
>> +F:	drivers/platform/x86/uniwill/uniwill-acpi.c
>> +F:	drivers/platform/x86/uniwill/uniwill-wmi.c
>> +F:	drivers/platform/x86/uniwill/uniwill-wmi.h
>> +
>>   UNSORTED BLOCK IMAGES (UBI)
>>   M:	Richard Weinberger <richard@nod.at>
>>   R:	Zhihao Cheng <chengzhihao1@huawei.com>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> index 46e62feeda3c..1e9b84f1098f 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -74,6 +74,8 @@ config HUAWEI_WMI
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called huawei-wmi.
>>  =20
>> +source "drivers/platform/x86/uniwill/Kconfig"
>> +
>>   config UV_SYSFS
>>   	tristate "Sysfs structure for UV systems"
>>   	depends on X86_UV
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
>> index c7db2a88c11a..d722e244a4a7 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -110,6 +110,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+=3D toshiba-wmi.o
>>   # before toshiba_acpi initializes
>>   obj-$(CONFIG_ACPI_TOSHIBA)	+=3D toshiba_acpi.o
>>  =20
>> +# Uniwill
>> +obj-y				+=3D uniwill/
>> +
>>   # Inspur
>>   obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+=3D inspur_platform_profile.o
>>  =20
>> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x8=
6/uniwill/Kconfig
>> new file mode 100644
>> index 000000000000..d07cc8440188
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/Kconfig
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Uniwill X86 Platform Specific Drivers
>> +#
>> +
>> +menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>> +	bool "Uniwill X86 Platform Specific Device Drivers"
>> +	depends on X86_PLATFORM_DEVICES
>> +	help
>> +	  Say Y here to see options for device drivers for various
>> +	  Uniwill x86 platforms, including many OEM laptops originally
>> +	  manufactured by Uniwill.
>> +	  This option alone does not add any kernel code.
>> +
>> +	  If you say N, all options in this submenu will be skipped and disab=
led.
>> +
>> +if X86_PLATFORM_DRIVERS_UNIWILL
>> +
>> +config UNIWILL_LAPTOP
>> +	tristate "Uniwill Laptop Extras"
>> +	default m
>> +	depends on ACPI
>> +	depends on ACPI_WMI
>> +	depends on ACPI_BATTERY
>> +	depends on HWMON
>> +	depends on INPUT
>> +	depends on LEDS_CLASS_MULTICOLOR
>> +	depends on DMI
>> +	select REGMAP
>> +	select INPUT_SPARSEKMAP
>> +	help
>> +	  This driver adds support for various extra features found on Uniwil=
l laptops,
>> +	  like the lightbar, hwmon sensors and hotkeys. It also supports many=
 OEM laptops
>> +	  originally manufactured by Uniwill.
>> +
>> +	  If you have such a laptop, say Y or M here.
>> +
>> +endif
>> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x=
86/uniwill/Makefile
>> new file mode 100644
>> index 000000000000..05cd1747a240
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/Makefile
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Makefile for linux/drivers/platform/x86/uniwill
>> +# Uniwill X86 Platform Specific Drivers
>> +#
>> +
>> +obj-$(CONFIG_UNIWILL_LAPTOP)	+=3D uniwill-laptop.o
>> +uniwill-laptop-y		:=3D uniwill-acpi.o uniwill-wmi.o
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/plat=
form/x86/uniwill/uniwill-acpi.c
>> new file mode 100644
>> index 000000000000..014960d16211
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -0,0 +1,1550 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux driver for Uniwill notebooks.
>> + *
>> + * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg=
 and Werner Sembach
>> + * for supporting the development of this driver either through prior =
work or
>> + * by answering questions regarding the underlying ACPI and WMI interf=
aces.
>> + *
>> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/array_size.h>
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/device/driver.h>
>> +#include <linux/dmi.h>
>> +#include <linux/errno.h>
>> +#include <linux/fixp-arith.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/init.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
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
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/printk.h>
>> +#include <linux/regmap.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +#include <linux/units.h>
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
>> + * be used by applications as they are only accessible when using
>> + * the WMI interface.
>> + */
>> +#define EC_ADDR_PWM_1_WRITEABLE		0x1804
>> +
>> +#define EC_ADDR_PWM_2_WRITEABLE		0x1809
>> +
>> +#define DRIVER_NAME	"uniwill"
>> +
>> +/*
>> + * The OEM software always sleeps up to 6 ms after reading/writing EC
>> + * registers, so we emulate this behaviour for maximum compatibility.
>> + */
>> +#define UNIWILL_EC_DELAY_US	6000
>> +
>> +#define PWM_MAX			200
>> +#define FAN_TABLE_LENGTH	16
>> +
>> +#define LED_CHANNELS		3
>> +#define LED_MAX_BRIGHTNESS	200
>> +
>> +#define UNIWILL_FEATURE_FN_LOCK_TOGGLE		BIT(0)
>> +#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE	BIT(1)
>> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
>> +#define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>> +#define UNIWILL_FEATURE_BATTERY			BIT(4)
>> +#define UNIWILL_FEATURE_HWMON			BIT(5)
>> +
>> +struct uniwill_data {
>> +	struct device *dev;
>> +	acpi_handle handle;
>> +	struct regmap *regmap;
>> +	struct acpi_battery_hook hook;
>> +	unsigned int last_charge_ctrl;
>> +	struct mutex battery_lock;	/* Protects the list of currently register=
ed batteries */
>> +	unsigned int last_switch_status;
>> +	struct mutex super_key_lock;	/* Protects the toggling of the super ke=
y lock state */
>> +	struct list_head batteries;
>> +	struct mutex led_lock;		/* Protects writes to the lightbar registers =
*/
>> +	struct led_classdev_mc led_mc_cdev;
>> +	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>> +	struct mutex input_lock;	/* Protects input sequence during notify */
>> +	struct input_dev *input_device;
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
>> +static unsigned int supported_features;
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
>> +static const struct key_entry uniwill_keymap[] =3D {
>> +	/* Reported via keyboard controller */
>> +	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOC=
K }},
>> +	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK=
 }},
>> +
>> +	/* Reported when the user locks/unlocks the super key */
>> +	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN=
 }},
>> +	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN=
 }},
>> +	/* Optional, might not be reported by all devices */
>> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
>> +
>> +	/* Reported in manual mode when toggling the airplane mode status */
>> +	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL =
}},
>> +
>> +	/* Reported when user wants to cycle the platform profile */
>> +	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN=
 }},
>> +
>> +	/* Reported when the user wants to adjust the brightness of the keybo=
ard */
>> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLU=
MDOWN }},
>> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { KEY_KBDILLU=
MUP }},
>> +
>> +	/* Reported when the user wants to toggle the microphone mute status =
*/
>> +	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE=
 }},
>> +
>> +	/* Reported when the user locks/unlocks the Fn key */
>> +	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC =
}},
>> +
>> +	/* Reported when the user wants to toggle the brightness of the keybo=
ard */
>> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLU=
MTOGGLE }},
>> +
>> +	/* FIXME: find out the exact meaning of those events */
>> +	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN=
 }},
>> +	{ KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE,             { KEY_UNKNOWN=
 }},
>> +
>> +	/* Reported when the user wants to toggle the benchmark mode status *=
/
>> +	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN=
 }},
>> +
>> +	{ KE_END }
>> +};
>> +
>> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsig=
ned int val)
>> +{
>> +	union acpi_object params[2] =3D {
>> +		{
>> +			.integer =3D {
>> +				.type =3D ACPI_TYPE_INTEGER,
>> +				.value =3D reg,
>> +			},
>> +		},
>> +		{
>> +			.integer =3D {
>> +				.type =3D ACPI_TYPE_INTEGER,
>> +				.value =3D val,
>> +			},
>> +		},
>> +	};
>> +	struct uniwill_data *data =3D context;
>> +	struct acpi_object_list input =3D {
>> +		.count =3D ARRAY_SIZE(params),
>> +		.pointer =3D params,
>> +	};
>> +	acpi_status status;
>> +
>> +	status =3D acpi_evaluate_object(data->handle, "ECRW", &input, NULL);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
>> +
>> +	return 0;
>> +}
>> +
>> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsign=
ed int *val)
>> +{
>> +	union acpi_object params[1] =3D {
>> +		{
>> +			.integer =3D {
>> +				.type =3D ACPI_TYPE_INTEGER,
>> +				.value =3D reg,
>> +			},
>> +		},
>> +	};
>> +	struct uniwill_data *data =3D context;
>> +	struct acpi_object_list input =3D {
>> +		.count =3D ARRAY_SIZE(params),
>> +		.pointer =3D params,
>> +	};
>> +	unsigned long long output;
>> +	acpi_status status;
>> +
>> +	status =3D acpi_evaluate_integer(data->handle, "ECRR", &input, &outpu=
t);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	if (output > U8_MAX)
>> +		return -ENXIO;
>> +
>> +	usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
>> +
>> +	*val =3D output;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct regmap_bus uniwill_ec_bus =3D {
>> +	.reg_write =3D uniwill_ec_reg_write,
>> +	.reg_read =3D uniwill_ec_reg_read,
>> +	.reg_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
>> +	.val_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
>> +};
>> +
>> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg=
)
>> +{
>> +	switch (reg) {
>> +	case EC_ADDR_AP_OEM:
>> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
>> +	case EC_ADDR_LIGHTBAR_AC_RED:
>> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
>> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
>> +	case EC_ADDR_BIOS_OEM:
>> +	case EC_ADDR_TRIGGER:
>> +	case EC_ADDR_OEM_4:
>> +	case EC_ADDR_CHARGE_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_RED:
>> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case EC_ADDR_CPU_TEMP:
>> +	case EC_ADDR_GPU_TEMP:
>> +	case EC_ADDR_MAIN_FAN_RPM_1:
>> +	case EC_ADDR_MAIN_FAN_RPM_2:
>> +	case EC_ADDR_SECOND_FAN_RPM_1:
>> +	case EC_ADDR_SECOND_FAN_RPM_2:
>> +	case EC_ADDR_BAT_ALERT:
>> +	case EC_ADDR_PROJECT_ID:
>> +	case EC_ADDR_AP_OEM:
>> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
>> +	case EC_ADDR_LIGHTBAR_AC_RED:
>> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
>> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
>> +	case EC_ADDR_BIOS_OEM:
>> +	case EC_ADDR_PWM_1:
>> +	case EC_ADDR_PWM_2:
>> +	case EC_ADDR_TRIGGER:
>> +	case EC_ADDR_SWITCH_STATUS:
>> +	case EC_ADDR_OEM_4:
>> +	case EC_ADDR_CHARGE_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_RED:
>> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case EC_ADDR_CPU_TEMP:
>> +	case EC_ADDR_GPU_TEMP:
>> +	case EC_ADDR_MAIN_FAN_RPM_1:
>> +	case EC_ADDR_MAIN_FAN_RPM_2:
>> +	case EC_ADDR_SECOND_FAN_RPM_1:
>> +	case EC_ADDR_SECOND_FAN_RPM_2:
>> +	case EC_ADDR_BAT_ALERT:
>> +	case EC_ADDR_PWM_1:
>> +	case EC_ADDR_PWM_2:
>> +	case EC_ADDR_TRIGGER:
>> +	case EC_ADDR_SWITCH_STATUS:
>> +	case EC_ADDR_CHARGE_CTRL:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static const struct regmap_config uniwill_ec_config =3D {
>> +	.reg_bits =3D 16,
>> +	.val_bits =3D 8,
>> +	.writeable_reg =3D uniwill_writeable_reg,
>> +	.readable_reg =3D uniwill_readable_reg,
>> +	.volatile_reg =3D uniwill_volatile_reg,
>> +	.can_sleep =3D true,
>> +	.max_register =3D 0xFFF,
>> +	.cache_type =3D REGCACHE_MAPLE,
>> +	.use_single_read =3D true,
>> +	.use_single_write =3D true,
>> +};
>> +
>> +static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct =
device_attribute *attr,
>> +					   const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	bool enable;
>> +	int ret;
>> +
>> +	ret =3D kstrtobool(buf, &enable);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (enable)
>> +		value =3D FN_LOCK_STATUS;
>> +	else
>> +		value =3D 0;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_ST=
ATUS, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct d=
evice_attribute *attr,
>> +					  char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
>> +}
>> +
>> +static DEVICE_ATTR_RW(fn_lock_toggle_enable);
>> +
>> +static ssize_t super_key_toggle_enable_store(struct device *dev, struc=
t device_attribute *attr,
>> +					     const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	bool enable;
>> +	int ret;
>> +
>> +	ret =3D kstrtobool(buf, &enable);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	guard(mutex)(&data->super_key_lock);
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * We can only toggle the super key lock, so we return early if the s=
etting
>> +	 * is already in the correct state.
>> +	 */
>> +	if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
>> +		return count;
>> +
>> +	ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPE=
R_KEY_LOCK,
>> +				TRIGGER_SUPER_KEY_LOCK);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t super_key_toggle_enable_show(struct device *dev, struct=
 device_attribute *attr,
>> +					    char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
>> +}
>> +
>> +static DEVICE_ATTR_RW(super_key_toggle_enable);
>> +
>> +static ssize_t touchpad_toggle_enable_store(struct device *dev, struct=
 device_attribute *attr,
>> +					    const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	bool enable;
>> +	int ret;
>> +
>> +	ret =3D kstrtobool(buf, &enable);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (enable)
>> +		value =3D 0;
>> +	else
>> +		value =3D TOUCHPAD_TOGGLE_OFF;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGG=
LE_OFF, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t touchpad_toggle_enable_show(struct device *dev, struct =
device_attribute *attr,
>> +					   char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
>> +}
>> +
>> +static DEVICE_ATTR_RW(touchpad_toggle_enable);
>> +
>> +static ssize_t rainbow_animation_store(struct device *dev, struct devi=
ce_attribute *attr,
>> +				       const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	bool enable;
>> +	int ret;
>> +
>> +	ret =3D kstrtobool(buf, &enable);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (enable)
>> +		value =3D LIGHTBAR_WELCOME;
>> +	else
>> +		value =3D 0;
>> +
>> +	guard(mutex)(&data->led_lock);
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_WELCOME, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_WELCOME, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t rainbow_animation_show(struct device *dev, struct devic=
e_attribute *attr, char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
>> +}
>> +
>> +static DEVICE_ATTR_RW(rainbow_animation);
>> +
>> +static ssize_t breathing_in_suspend_store(struct device *dev, struct d=
evice_attribute *attr,
>> +					  const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	bool enable;
>> +	int ret;
>> +
>> +	ret =3D kstrtobool(buf, &enable);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (enable)
>> +		value =3D 0;
>> +	else
>> +		value =3D LIGHTBAR_S3_OFF;
>> +
>> +	/* We only access a single register here, so we do not need to use da=
ta->led_lock */
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S3_OFF, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t breathing_in_suspend_show(struct device *dev, struct de=
vice_attribute *attr,
>> +					 char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
>> +}
>> +
>> +static DEVICE_ATTR_RW(breathing_in_suspend);
>> +
>> +static struct attribute *uniwill_attrs[] =3D {
>> +	/* Keyboard-related */
>> +	&dev_attr_fn_lock_toggle_enable.attr,
>> +	&dev_attr_super_key_toggle_enable.attr,
>> +	&dev_attr_touchpad_toggle_enable.attr,
>> +	/* Lightbar-related */
>> +	&dev_attr_rainbow_animation.attr,
>> +	&dev_attr_breathing_in_suspend.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct at=
tribute *attr, int n)
>> +{
>> +	if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
>> +			return attr->mode;
>> +	}
>> +
>> +	if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
>> +			return attr->mode;
>> +	}
>> +
>> +	if (attr =3D=3D &dev_attr_touchpad_toggle_enable.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
>> +			return attr->mode;
>> +	}
>> +
>> +	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>> +	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
>> +			return attr->mode;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct attribute_group uniwill_group =3D {
>> +	.is_visible =3D uniwill_attr_is_visible,
>> +	.attrs =3D uniwill_attrs,
>> +};
>> +
>> +static const struct attribute_group *uniwill_groups[] =3D {
>> +	&uniwill_group,
>> +	NULL
>> +};
>> +
>> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types ty=
pe, u32 attr, int channel,
>> +			long *val)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	__be16 rpm;
>> +	int ret;
>> +
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		switch (channel) {
>> +		case 0:
>> +			ret =3D regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
>> +			break;
>> +		case 1:
>> +			ret =3D regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		*val =3D value * MILLIDEGREE_PER_DEGREE;
>> +		return 0;
>> +	case hwmon_fan:
>> +		switch (channel) {
>> +		case 0:
>> +			ret =3D regmap_bulk_read(data->regmap, EC_ADDR_MAIN_FAN_RPM_1, &rpm=
,
>> +					       sizeof(rpm));
>> +			break;
>> +		case 1:
>> +			ret =3D regmap_bulk_read(data->regmap, EC_ADDR_SECOND_FAN_RPM_1, &r=
pm,
>> +					       sizeof(rpm));
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		*val =3D be16_to_cpu(rpm);
>> +		return 0;
>> +	case hwmon_pwm:
>> +		switch (channel) {
>> +		case 0:
>> +			ret =3D regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
>> +			break;
>> +		case 1:
>> +			ret =3D regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		*val =3D fixp_linear_interpolate(0, 0, PWM_MAX, U8_MAX, value);
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int uniwill_read_string(struct device *dev, enum hwmon_sensor_t=
ypes type, u32 attr,
>> +			       int channel, const char **str)
>> +{
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		*str =3D uniwill_temp_labels[channel];
>> +		return 0;
>> +	case hwmon_fan:
>> +		*str =3D uniwill_fan_labels[channel];
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static const struct hwmon_ops uniwill_ops =3D {
>> +	.visible =3D 0444,
>> +	.read =3D uniwill_read,
>> +	.read_string =3D uniwill_read_string,
>> +};
>> +
>> +static const struct hwmon_channel_info * const uniwill_info[] =3D {
>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	HWMON_CHANNEL_INFO(fan,
>> +			   HWMON_F_INPUT | HWMON_F_LABEL,
>> +			   HWMON_F_INPUT | HWMON_F_LABEL),
>> +	HWMON_CHANNEL_INFO(pwm,
>> +			   HWMON_PWM_INPUT,
>> +			   HWMON_PWM_INPUT),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info uniwill_chip_info =3D {
>> +	.ops =3D &uniwill_ops,
>> +	.info =3D uniwill_info,
>> +};
>> +
>> +static int uniwill_hwmon_init(struct uniwill_data *data)
>> +{
>> +	struct device *hdev;
>> +
>> +	if (!(supported_features & UNIWILL_FEATURE_HWMON))
>> +		return 0;
>> +
>> +	hdev =3D devm_hwmon_device_register_with_info(data->dev, "uniwill", d=
ata,
>> +						    &uniwill_chip_info, NULL);
>> +
>> +	return PTR_ERR_OR_ZERO(hdev);
>> +}
>> +
>> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS]=
 =3D {
>> +	EC_ADDR_LIGHTBAR_BAT_RED,
>> +	EC_ADDR_LIGHTBAR_BAT_GREEN,
>> +	EC_ADDR_LIGHTBAR_BAT_BLUE,
>> +};
>> +
>> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] =
=3D {
>> +	EC_ADDR_LIGHTBAR_AC_RED,
>> +	EC_ADDR_LIGHTBAR_AC_GREEN,
>> +	EC_ADDR_LIGHTBAR_AC_BLUE,
>> +};
>> +
>> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, e=
num led_brightness brightness)
>> +{
>> +	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
>> +	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwil=
l_data, led_mc_cdev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	guard(mutex)(&data->led_lock);
>> +
>> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
>> +		/* Prevent the brightness values from overflowing */
>> +		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].bright=
ness);
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],=
 value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i]=
, value);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	if (brightness)
>> +		value =3D 0;
>> +	else
>> +		value =3D LIGHTBAR_S0_OFF;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S0_OFF, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LI=
GHTBAR_S0_OFF, value);
>> +}
>> +
>> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBA=
R_S3_OFF | LIGHTBAR_WELCOME)
>> +
>> +static int uniwill_led_init(struct uniwill_data *data)
>> +{
>> +	struct led_init_data init_data =3D {
>> +		.devicename =3D DRIVER_NAME,
>> +		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
>> +		.devname_mandatory =3D true,
>> +	};
>> +	unsigned int color_indices[3] =3D {
>> +		LED_COLOR_ID_RED,
>> +		LED_COLOR_ID_GREEN,
>> +		LED_COLOR_ID_BLUE,
>> +	};
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
>> +		return 0;
>> +
>> +	ret =3D devm_mutex_init(data->dev, &data->led_lock);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * The EC has separate lightbar settings for AC and battery mode,
>> +	 * so we have to ensure that both settings are the same.
>> +	 */
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	value |=3D LIGHTBAR_APP_EXISTS;
>> +	ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * The breathing animation during suspend is not supported when
>> +	 * running on battery power.
>> +	 */
>> +	value |=3D LIGHTBAR_S3_OFF;
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_MASK, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
>> +	data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
>> +	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>> +	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_br=
ightness_set;
>> +
>> +	if (value & LIGHTBAR_S0_OFF)
>> +		data->led_mc_cdev.led_cdev.brightness =3D 0;
>> +	else
>> +		data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
>> +
>> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
>> +		data->led_mc_subled_info[i].color_index =3D color_indices[i];
>> +
>> +		ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i], =
&value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		/*
>> +		 * Make sure that the initial intensity value is not greater than
>> +		 * the maximum brightness.
>> +		 */
>> +		value =3D min(LED_MAX_BRIGHTNESS, value);
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],=
 value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i]=
, value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		data->led_mc_subled_info[i].intensity =3D value;
>> +		data->led_mc_subled_info[i].channel =3D i;
>> +	}
>> +
>> +	data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
>> +	data->led_mc_cdev.num_colors =3D LED_CHANNELS;
>> +
>> +	return devm_led_classdev_multicolor_register_ext(data->dev, &data->le=
d_mc_cdev,
>> +							 &init_data);
>> +}
>> +
>> +static int uniwill_get_property(struct power_supply *psy, const struct=
 power_supply_ext *ext,
>> +				void *drvdata, enum power_supply_property psp,
>> +				union power_supply_propval *val)
>> +{
>> +	struct uniwill_data *data =3D drvdata;
>> +	union power_supply_propval prop;
>> +	unsigned int regval;
>> +	int ret;
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_HEALTH:
>> +		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRES=
ENT, &prop);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		if (!prop.intval) {
>> +			val->intval =3D POWER_SUPPLY_HEALTH_NO_BATTERY;
>> +			return 0;
>> +		}
>> +
>> +		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_STAT=
US, &prop);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		if (prop.intval =3D=3D POWER_SUPPLY_STATUS_UNKNOWN) {
>> +			val->intval =3D POWER_SUPPLY_HEALTH_UNKNOWN;
>> +			return 0;
>> +		}
>> +
>> +		ret =3D regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		if (regval) {
>> +			/* Charging issue */
>> +			val->intval =3D POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
>> +			return 0;
>> +		}
>> +
>> +		val->intval =3D POWER_SUPPLY_HEALTH_GOOD;
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +		ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 10=
0);
> Hmm, this seems to trigger an error from sparse:
>
>    CHECK   drivers/platform/x86/uniwill/uniwill-acpi.c
> drivers/platform/x86/uniwill/uniwill-acpi.c:1125:31: error: too long tok=
en expansion
>
> I guess they do some crazy type validation inside those which expands
> like crazy.
>
> Based on the message and the code, it looks non-error though, just some
> stupid limitation perhaps.

I compiled a custom version of smatch with MAX_STRING increased from 8191 =
to 32764 bytes:

	CHECK   uniwill-acpi.c
   	CHECK   uniwill-wmi.c

So it seems that everything is fine.

Thanks,
Armin Wolf

>> +		return 0;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>

