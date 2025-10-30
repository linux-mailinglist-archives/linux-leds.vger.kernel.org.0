Return-Path: <linux-leds+bounces-5946-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAEC20F16
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 16:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3ADE4ECADF
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 15:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2262676F4;
	Thu, 30 Oct 2025 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfY7Anud"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5D1E3DCD;
	Thu, 30 Oct 2025 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838297; cv=none; b=C1tlLInnL4FXji/k623z2jvt7lYHhH5Je41RrfD39ETi+E5pnPDJIejhpGxYCK+QQozAJeWoFd1QH7BqIpEpw7AzZFY17OSbFPP3NnZGHTVDAaZWJYJTkSADzKpLxA1xzdjB5kWYI+9N4P4rQ3Q7ePxcXa8klyArcByIAiyM5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838297; c=relaxed/simple;
	bh=VxKLpjvx10adXnNTSqrJuivtg3NlvL+q3+tu16AxWNw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q/PQkQhwdK0keUApemgkk1AVKwocVOd2D8n1XDVMQkRmgzHyv9HE7S8JLFGwKlqRpqg5alIZvn8/qJ5oBUHaHge7fgfP0tBFV+uqFyup8U1a9gzfYynL3lAVqaNiIJlDbQKYxCF0mCS6m4x7Ro1/cA5gKz2GmcpqXXQ+JfnTvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfY7Anud; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761838293; x=1793374293;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VxKLpjvx10adXnNTSqrJuivtg3NlvL+q3+tu16AxWNw=;
  b=QfY7Anudpx+PVDOQK9uDoAN9x39p2pc/X0zso/N23gpZi5WDpNGP+KVb
   pixJPasLzXH4fjs/XuijT/4YwiVZcRgfEJKDlxQC8zU6rJvp9/f2V/DJJ
   2Fp+4ld02yFNGP0F1sWj2n3dh0lqW/4/Bqa29oRvG4GzGoSMxCPZ1thg8
   jS49OXyCkYNCXqZivaQx7oMckUAI5fAbt8mWJ0J0ecvFCcGluciUIare2
   te6sCkIzGfqtBGSU9lrspOqRx/VdDcgcHfTJeQZAFxwR5u89hkLIm+Tp8
   kxoNUTQQzanRMvdn3Gb5RaEq5Dnr+8vz6BwRbfU+6N1SaHOGPL9HVxIrz
   g==;
X-CSE-ConnectionGUID: +RzTtzq1SrulgyfAIXoyhg==
X-CSE-MsgGUID: /qH5Obh6QkS4LEdq8zSEfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64025197"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64025197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 08:31:32 -0700
X-CSE-ConnectionGUID: KuL4f8XMTcunvjEzdUsJBg==
X-CSE-MsgGUID: CjMPKaHdTxSpvy3LN2Fsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186328342"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.175])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 08:31:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Oct 2025 17:31:21 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de, 
    wse@tuxedocomputers.com, ggo@tuxedocomputers.com, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, rdunlap@infradead.org, 
    alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org, 
    pobrn@protonmail.com, nathan@kernel.org
Subject: Re: [PATCH v5 1/2] platform/x86: Add Uniwill laptop driver
In-Reply-To: <20251005192049.18515-2-W_Armin@gmx.de>
Message-ID: <9a681825-6217-8ffc-ccb7-c24daeeb4867@linux.intel.com>
References: <20251005192049.18515-1-W_Armin@gmx.de> <20251005192049.18515-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-430851434-1761838281=:975"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-430851434-1761838281=:975
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 5 Oct 2025, Armin Wolf wrote:

> Add a new driver for Uniwill laptops. The driver uses a ACPI
> interface to talk with the embedded controller, but relies on a
> ACPI WMI interface for receiving event notifications.
>=20
> The driver is reverse-engineered based on the following information:
> - OEM software from intel
> - https://github.com/pobrn/qc71_laptop
> - https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
> - https://github.com/tuxedocomputers/tuxedo-control-center
>=20
> The underlying EC supports various features, including hwmon sensors,
> battery charge limiting, a RGB lightbar and keyboard-related controls.
>=20
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Tested-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>  Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
>  MAINTAINERS                                   |   10 +
>  drivers/platform/x86/Kconfig                  |    2 +
>  drivers/platform/x86/Makefile                 |    3 +
>  drivers/platform/x86/uniwill/Kconfig          |   38 +
>  drivers/platform/x86/uniwill/Makefile         |    8 +
>  drivers/platform/x86/uniwill/uniwill-acpi.c   | 1549 +++++++++++++++++
>  drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
>  drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
>  10 files changed, 2080 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>  create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>  create mode 100644 drivers/platform/x86/uniwill/Kconfig
>  create mode 100644 drivers/platform/x86/uniwill/Makefile
>  create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
>  create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>  create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docu=
mentation/ABI/testing/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..b17a32216962
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -0,0 +1,53 @@
> +What:=09=09/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
> +Date:=09=09August 2025
> +KernelVersion:=096.18

As usual, these need updating.

> +Contact:=09Armin Wolf <W_Armin@gmx.de>
> +Description:
> +=09=09Allows userspace applications to enable/disable the FN lock featur=
e
> +=09=09of the integrated keyboard by writing "1"/"0" into this file.
> +
> +=09=09Reading this file returns the current enable status of the FN lock=
 functionality.
> +
> +What:=09=09/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
> +Date:=09=09August 2025
> +KernelVersion:=096.18
> +Contact:=09Armin Wolf <W_Armin@gmx.de>
> +Description:
> +                Allows userspace applications to enable/disable the supe=
r key functionality
> +                of the integrated keyboard by writing "1"/"0" into this =
file.
> +
> +=09=09Reading this file returns the current enable status of the super k=
ey functionality.
> +
> +What:=09=09/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
> +Date:=09=09August 2025
> +KernelVersion:=096.18
> +Contact:=09Armin Wolf <W_Armin@gmx.de>
> +Description:
> +=09=09Allows userspace applications to enable/disable the touchpad toggl=
e functionality
> +=09=09of the integrated touchpad by writing "1"/"0" into this file.
> +
> +=09=09Reading this file returns the current enable status of the touchpa=
d toggle
> +=09=09functionality.
> +
> +What:=09=09/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
> +Date:=09=09August 2025
> +KernelVersion:=096.18
> +Contact:=09Armin Wolf <W_Armin@gmx.de>
> +Description:
> +=09=09Forces the integrated lightbar to display a rainbow animation when=
 the machine
> +=09=09is not suspended. Writing "1"/"0" into this file enables/disables =
this
> +=09=09functionality.
> +
> +=09=09Reading this file returns the current status of the rainbow animat=
ion functionality.
> +
> +What:=09=09/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
> +Date:=09=09August 2025
> +KernelVersion:=096.18
> +Contact:=09Armin Wolf <W_Armin@gmx.de>
> +Description:
> +=09=09Causes the integrated lightbar to display a breathing animation wh=
en the machine
> +=09=09has been suspended and is running on AC power. Writing "1"/"0" int=
o this file
> +=09=09enables/disables this functionality.
> +
> +=09=09Reading this file returns the current status of the breathing anim=
ation
> +=09=09functionality.
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation=
/wmi/devices/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..e246bf293450
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -0,0 +1,198 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Uniwill Notebook driver (uniwill-laptop)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provi=
de a EC interface
> +for controlling various platform settings like sensors and fan control. =
This interface is
> +used by the ``uniwill-laptop`` driver to map those features onto standar=
d kernel interfaces.
> +
> +EC WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +The EC WMI interface description can be decoded from the embedded binary=
 MOF (bmof)
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
> +    [WmiMethodId(1), Implemented, read, write, Description("Return the c=
ontents of a ULong")]
> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(2), Implemented, read, write, Description("Set the cont=
ents of a ULong")]
> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(3), Implemented, read, write,
> +     Description("Generate an event containing ULong data")]
> +    void FireULong([in, Description("WMI requires a parameter")] uint32 =
Hack);
> +
> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Set =
the contents of a ULong")]
> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
> +                     [out, Description("Ulong Data")] uint32 Return);
> +
> +    [WmiMethodId(5), Implemented, read, write,
> +     Description("Get and Set the contents of a ULong for Dollby button"=
)]
> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
> +                   [out, Description("Ulong Data")] uint32 Return);
> +  };
> +
> +Most of the WMI-related code was copied from the Windows driver samples,=
 which unfortunately means
> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for au=
toloading.
> +
> +WMI method GetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no fu=
nction.
> +
> +WMI method SetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no fu=
nction.
> +
> +WMI method FireULong()
> +----------------------
> +
> +This WMI method allows to inject a WMI event with a 32-bit payload. Its =
primary purpose seems
> +to be debugging.
> +
> +WMI method GetSetULong()
> +------------------------
> +
> +This WMI method is used to communicate with the EC. The ``Data`` argumen=
t holds the following
> +information (starting with the least significant byte):
> +
> +1. 16-bit address
> +2. 16-bit data (set to ``0x0000`` when reading)
> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing)
> +4. 16-bit reserved (set to ``0x0000``)
> +
> +The first 8 bits of the ``Return`` value contain the data returned by th=
e EC when reading.
> +The special value ``0xFEFEFEFE`` is used to indicate a communication fai=
lure with the EC.
> +
> +WMI method GetButton()
> +----------------------
> +
> +This WMI method is not implemented on all machines and has an unknown pu=
rpose.
> +
> +Reverse-Engineering the EC WMI interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. warning:: Randomly poking the EC can potentially cause damage to the =
machine and other unwanted
> +             side effects, please be careful.
> +
> +The EC behind the ``GetSetULong`` method is used by the OEM software sup=
plied by the manufacturer.
> +Reverse-engineering of this software is difficult since it uses an obfus=
cator, however some parts
> +are not obfuscated. In this case `dnSpy <https://github.com/dnSpy/dnSpy>=
`_ could also be helpful.
> +
> +The EC can be accessed under Windows using powershell (requires admin pr=
ivileges):
> +
> +::
> +
> +  > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_MUL=
ong | Select-Object -First 1
> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Argument=
s @{Data =3D <input>}
> +
> +WMI event interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +The WMI interface description can also be decoded from the embedded bina=
ry MOF (bmof)
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
> +Most of the WMI-related code was again copied from the Windows driver sa=
mples, causing this WMI
> +interface to suffer from the same restrictions as the EC WMI interface d=
escribed above.
> +
> +WMI event data
> +--------------
> +
> +The WMI event data contains a single 32-bit value which is used to indic=
ate various platform events.
> +
> +Reverse-Engineering the Uniwill WMI event interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +The driver logs debug messages when receiving a WMI event. Thus enabling=
 debug messages will be
> +useful for finding unknown event codes.
> +
> +EC ACPI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +The ``INOU0000`` ACPI device is a virtual device used to access various =
hardware registers
> +available on notebooks manufactured by Uniwill. Reading and writing thos=
e registers happens
> +by calling ACPI control methods. The ``uniwill-laptop`` driver uses this=
 device to communicate
> +with the EC because the ACPI control methods are faster than the WMI met=
hods described above.
> +
> +ACPI control methods used for reading registers take a single ACPI integ=
er containing the address
> +of the register to read and return a ACPI integer containing the data in=
side said register. ACPI
> +control methods used for writing registers however take two ACPI integer=
s, with the additional
> +ACPI integer containing the data to be written into the register. Such A=
CPI control methods return
> +nothing.
> +
> +System memory
> +-------------
> +
> +System memory can be accessed with a granularity of either a single byte=
 (``MMRB`` for reading and
> +``MMWB`` for writing) or four bytes (``MMRD`` for reading and ``MMWD`` f=
or writing). Those ACPI
> +control methods are unused because they provide no benefit when compared=
 to the native memory
> +access functions provided by the kernel.
> +
> +EC RAM
> +------
> +
> +The internal RAM of the EC can be accessed with a granularity of a singl=
e byte using the ``ECRR``
> +(read) and ``ECRW`` (write) ACPI control methods, with the maximum regis=
ter address being ``0xFFF``.
> +The OEM software waits 6 ms after calling one of those ACPI control meth=
ods, likely to avoid
> +overwhelming the EC when being connected over LPC.
> +
> +PCI config space
> +----------------
> +
> +The PCI config space can be accessed with a granularity of four bytes us=
ing the ``PCRD`` (read) and
> +``PCWD`` (write) ACPI control methods. The exact address format is unkno=
wn, and poking random PCI
> +devices might confuse the PCI subsystem. Because of this those ACPI cont=
rol methods are not used.
> +
> +IO ports
> +--------
> +
> +IO ports can be accessed with a granularity of four bytes using the ``IO=
RD`` (read) and ``IOWD``
> +(write) ACPI control methods. Those ACPI control methods are unused beca=
use they provide no benefit
> +when compared to the native IO port access functions provided by the ker=
nel.
> +
> +CMOS RAM
> +--------
> +
> +The CMOS RAM can be accessed with a granularity of a single byte using t=
he ``RCMS`` (read) and
> +``WCMS`` ACPI control methods. Using those ACPI methods might interfere =
with the native CMOS RAM
> +access functions provided by the kernel due to the usage of indexed IO, =
so they are unused.
> +
> +Indexed IO
> +----------
> +
> +Indexed IO with IO ports with a granularity of a single byte can be perf=
ormed using the ``RIOP``
> +(read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are=
 unused because they
> +provide no benifit when compared to the native IO port access functions =
provided by the kernel.
> +
> +Special thanks go to github user `pobrn` which developed the
> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which th=
is driver is partly based.
> +The same is true for Tuxedo Computers, which developed the
> +`tuxedo-drivers <https://gitlab.com/tuxedocomputers/development/packages=
/tuxedo-drivers>`_ package
> +which also served as a foundation for this driver.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 48b6b60fd56d..7b58e8d9af3c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25915,6 +25915,16 @@ L:=09linux-scsi@vger.kernel.org
>  S:=09Maintained
>  F:=09drivers/ufs/host/ufs-renesas.c
> =20
> +UNIWILL LAPTOP DRIVER
> +M:=09Armin Wolf <W_Armin@gmx.de>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +F:=09Documentation/wmi/devices/uniwill-laptop.rst
> +F:=09drivers/platform/x86/uniwill/uniwill-acpi.c
> +F:=09drivers/platform/x86/uniwill/uniwill-wmi.c
> +F:=09drivers/platform/x86/uniwill/uniwill-wmi.h

Does these entries have to be this specific?

>  UNSORTED BLOCK IMAGES (UBI)
>  M:=09Richard Weinberger <richard@nod.at>
>  R:=09Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 46e62feeda3c..1e9b84f1098f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -74,6 +74,8 @@ config HUAWEI_WMI
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called huawei-wmi.
> =20
> +source "drivers/platform/x86/uniwill/Kconfig"
> +
>  config UV_SYSFS
>  =09tristate "Sysfs structure for UV systems"
>  =09depends on X86_UV
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index c7db2a88c11a..d722e244a4a7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,6 +110,9 @@ obj-$(CONFIG_TOSHIBA_WMI)=09+=3D toshiba-wmi.o
>  # before toshiba_acpi initializes
>  obj-$(CONFIG_ACPI_TOSHIBA)=09+=3D toshiba_acpi.o
> =20
> +# Uniwill
> +obj-y=09=09=09=09+=3D uniwill/
> +
>  # Inspur
>  obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)=09+=3D inspur_platform_profile.o
> =20
> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/=
uniwill/Kconfig
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
> +=09bool "Uniwill X86 Platform Specific Device Drivers"
> +=09depends on X86_PLATFORM_DEVICES
> +=09help
> +=09  Say Y here to see options for device drivers for various
> +=09  Uniwill x86 platforms, including many OEM laptops originally
> +=09  manufactured by Uniwill.
> +=09  This option alone does not add any kernel code.
> +
> +=09  If you say N, all options in this submenu will be skipped and disab=
led.
> +
> +if X86_PLATFORM_DRIVERS_UNIWILL
> +
> +config UNIWILL_LAPTOP
> +=09tristate "Uniwill Laptop Extras"
> +=09default m
> +=09depends on ACPI
> +=09depends on ACPI_WMI
> +=09depends on ACPI_BATTERY
> +=09depends on HWMON
> +=09depends on INPUT
> +=09depends on LEDS_CLASS_MULTICOLOR
> +=09depends on DMI
> +=09select REGMAP
> +=09select INPUT_SPARSEKMAP
> +=09help
> +=09  This driver adds support for various extra features found on Uniwil=
l laptops,
> +=09  like the lightbar, hwmon sensors and hotkeys. It also supports many=
 OEM laptops
> +=09  originally manufactured by Uniwill.
> +
> +=09  If you have such a laptop, say Y or M here.
> +
> +endif
> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86=
/uniwill/Makefile
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
> +obj-$(CONFIG_UNIWILL_LAPTOP)=09+=3D uniwill-laptop.o
> +uniwill-laptop-y=09=09:=3D uniwill-acpi.o uniwill-wmi.o
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> new file mode 100644
> index 000000000000..7750b0b1299b
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -0,0 +1,1549 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux driver for Uniwill notebooks.
> + *
> + * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg a=
nd Werner Sembach
> + * for supporting the development of this driver either through prior wo=
rk or
> + * by answering questions regarding the underlying ACPI and WMI interfac=
es.
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
> +#define EC_ADDR_BAT_POWER_UNIT_1=090x0400
> +
> +#define EC_ADDR_BAT_POWER_UNIT_2=090x0401
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1=090x0402
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2=090x0403
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_1=090x0404
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_2=090x0405
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1=090x0408
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2=090x0409
> +
> +#define EC_ADDR_BAT_STATUS_1=09=090x0432
> +#define BAT_DISCHARGING=09=09=09BIT(0)
> +
> +#define EC_ADDR_BAT_STATUS_2=09=090x0433
> +
> +#define EC_ADDR_BAT_CURRENT_1=09=090x0434
> +
> +#define EC_ADDR_BAT_CURRENT_2=09=090x0435
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1=090x0436
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2=090x0437
> +
> +#define EC_ADDR_BAT_VOLTAGE_1=09=090x0438
> +
> +#define EC_ADDR_BAT_VOLTAGE_2=09=090x0439
> +
> +#define EC_ADDR_CPU_TEMP=09=090x043E
> +
> +#define EC_ADDR_GPU_TEMP=09=090x044F
> +
> +#define EC_ADDR_MAIN_FAN_RPM_1=09=090x0464
> +
> +#define EC_ADDR_MAIN_FAN_RPM_2=09=090x0465
> +
> +#define EC_ADDR_SECOND_FAN_RPM_1=090x046C
> +
> +#define EC_ADDR_SECOND_FAN_RPM_2=090x046D
> +
> +#define EC_ADDR_DEVICE_STATUS=09=090x047B
> +#define WIFI_STATUS_ON=09=09=09BIT(7)
> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
> +
> +#define EC_ADDR_BAT_ALERT=09=090x0494
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_1=090x04A6
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_2=090x04A7
> +
> +#define EC_ADDR_PROJECT_ID=09=090x0740
> +
> +#define EC_ADDR_AP_OEM=09=09=090x0741
> +#define=09ENABLE_MANUAL_CTRL=09=09BIT(0)
> +#define ITE_KBD_EFFECT_REACTIVE=09=09BIT(3)
> +#define FAN_ABNORMAL=09=09=09BIT(5)
> +
> +#define EC_ADDR_SUPPORT_5=09=090x0742
> +#define FAN_TURBO_SUPPORTED=09=09BIT(4)
> +#define FAN_SUPPORT=09=09=09BIT(5)
> +
> +#define EC_ADDR_CTGP_DB_CTRL=09=090x0743
> +#define CTGP_DB_GENERAL_ENABLE=09=09BIT(0)
> +#define CTGP_DB_DB_ENABLE=09=09BIT(1)
> +#define CTGP_DB_CTGP_ENABLE=09=09BIT(2)
> +
> +#define EC_ADDR_CTGP_OFFSET=09=090x0744
> +
> +#define EC_ADDR_TPP_OFFSET=09=090x0745
> +
> +#define EC_ADDR_MAX_TGP=09=09=090x0746
> +
> +#define EC_ADDR_LIGHTBAR_AC_CTRL=090x0748
> +#define LIGHTBAR_APP_EXISTS=09=09BIT(0)
> +#define LIGHTBAR_POWER_SAVE=09=09BIT(1)
> +#define LIGHTBAR_S0_OFF=09=09=09BIT(2)
> +#define LIGHTBAR_S3_OFF=09=09=09BIT(3)=09// Breathing animation when sus=
pended
> +#define LIGHTBAR_WELCOME=09=09BIT(7)=09// Rainbow animation
> +
> +#define EC_ADDR_LIGHTBAR_AC_RED=09=090x0749
> +
> +#define EC_ADDR_LIGHTBAR_AC_GREEN=090x074A
> +
> +#define EC_ADDR_LIGHTBAR_AC_BLUE=090x074B
> +
> +#define EC_ADDR_BIOS_OEM=09=090x074E
> +#define FN_LOCK_STATUS=09=09=09BIT(4)
> +
> +#define EC_ADDR_MANUAL_FAN_CTRL=09=090x0751
> +#define FAN_LEVEL_MASK=09=09=09GENMASK(2, 0)
> +#define FAN_MODE_TURBO=09=09=09BIT(4)
> +#define FAN_MODE_HIGH=09=09=09BIT(5)
> +#define FAN_MODE_BOOST=09=09=09BIT(6)
> +#define FAN_MODE_USER=09=09=09BIT(7)
> +
> +#define EC_ADDR_PWM_1=09=09=090x075B
> +
> +#define EC_ADDR_PWM_2=09=09=090x075C
> +
> +/* Unreliable */
> +#define EC_ADDR_SUPPORT_1=09=090x0765
> +#define AIRPLANE_MODE=09=09=09BIT(0)
> +#define GPS_SWITCH=09=09=09BIT(1)
> +#define OVERCLOCK=09=09=09BIT(2)
> +#define MACRO_KEY=09=09=09BIT(3)
> +#define SHORTCUT_KEY=09=09=09BIT(4)
> +#define SUPER_KEY_LOCK=09=09=09BIT(5)
> +#define LIGHTBAR=09=09=09BIT(6)
> +#define FAN_BOOST=09=09=09BIT(7)
> +
> +#define EC_ADDR_SUPPORT_2=09=090x0766
> +#define SILENT_MODE=09=09=09BIT(0)
> +#define USB_CHARGING=09=09=09BIT(1)
> +#define RGB_KEYBOARD=09=09=09BIT(2)
> +#define CHINA_MODE=09=09=09BIT(5)
> +#define MY_BATTERY=09=09=09BIT(6)
> +
> +#define EC_ADDR_TRIGGER=09=09=090x0767
> +#define TRIGGER_SUPER_KEY_LOCK=09=09BIT(0)
> +#define TRIGGER_LIGHTBAR=09=09BIT(1)
> +#define TRIGGER_FAN_BOOST=09=09BIT(2)
> +#define TRIGGER_SILENT_MODE=09=09BIT(3)
> +#define TRIGGER_USB_CHARGING=09=09BIT(4)
> +#define RGB_APPLY_COLOR=09=09=09BIT(5)
> +#define RGB_LOGO_EFFECT=09=09=09BIT(6)
> +#define RGB_RAINBOW_EFFECT=09=09BIT(7)
> +
> +#define EC_ADDR_SWITCH_STATUS=09=090x0768
> +#define SUPER_KEY_LOCK_STATUS=09=09BIT(0)
> +#define LIGHTBAR_STATUS=09=09=09BIT(1)
> +#define FAN_BOOST_STATUS=09=09BIT(2)
> +#define MACRO_KEY_STATUS=09=09BIT(3)
> +#define MY_BAT_POWER_BAT_STATUS=09=09BIT(4)
> +
> +#define EC_ADDR_RGB_RED=09=09=090x0769
> +
> +#define EC_ADDR_RGB_GREEN=09=090x076A
> +
> +#define EC_ADDR_RGB_BLUE=09=090x076B
> +
> +#define EC_ADDR_ROMID_START=09=090x0770
> +#define ROMID_LENGTH=09=09=0914
> +
> +#define EC_ADDR_ROMID_EXTRA_1=09=090x077E
> +
> +#define EC_ADDR_ROMID_EXTRA_2=09=090x077F
> +
> +#define EC_ADDR_BIOS_OEM_2=09=090x0782
> +#define FAN_V2_NEW=09=09=09BIT(0)
> +#define FAN_QKEY=09=09=09BIT(1)
> +#define FAN_TABLE_OFFICE_MODE=09=09BIT(2)
> +#define FAN_V3=09=09=09=09BIT(3)
> +#define DEFAULT_MODE=09=09=09BIT(4)
> +
> +#define EC_ADDR_PL1_SETTING=09=090x0783
> +
> +#define EC_ADDR_PL2_SETTING=09=090x0784
> +
> +#define EC_ADDR_PL4_SETTING=09=090x0785
> +
> +#define EC_ADDR_FAN_DEFAULT=09=090x0786
> +#define FAN_CURVE_LENGTH=09=095
> +
> +#define EC_ADDR_KBD_STATUS=09=090x078C
> +#define KBD_WHITE_ONLY=09=09=09BIT(0)=09// ~single color
> +#define KBD_SINGLE_COLOR_OFF=09=09BIT(1)
> +#define KBD_TURBO_LEVEL_MASK=09=09GENMASK(3, 2)
> +#define KBD_APPLY=09=09=09BIT(4)
> +#define KBD_BRIGHTNESS=09=09=09GENMASK(7, 5)
> +
> +#define EC_ADDR_FAN_CTRL=09=090x078E
> +#define FAN3P5=09=09=09=09BIT(1)
> +#define CHARGING_PROFILE=09=09BIT(3)
> +#define UNIVERSAL_FAN_CTRL=09=09BIT(6)
> +
> +#define EC_ADDR_BIOS_OEM_3=09=090x07A3
> +#define FAN_REDUCED_DURY_CYCLE=09=09BIT(5)
> +#define FAN_ALWAYS_ON=09=09=09BIT(6)
> +
> +#define EC_ADDR_BIOS_BYTE=09=090x07A4
> +#define FN_LOCK_SWITCH=09=09=09BIT(3)
> +
> +#define EC_ADDR_OEM_3=09=09=090x07A5
> +#define POWER_LED_MASK=09=09=09GENMASK(1, 0)
> +#define POWER_LED_LEFT=09=09=090x00
> +#define POWER_LED_BOTH=09=09=090x01
> +#define POWER_LED_NONE=09=09=090x02
> +#define FAN_QUIET=09=09=09BIT(2)
> +#define OVERBOOST=09=09=09BIT(4)
> +#define HIGH_POWER=09=09=09BIT(7)
> +
> +#define EC_ADDR_OEM_4=09=09=090x07A6
> +#define OVERBOOST_DYN_TEMP_OFF=09=09BIT(1)
> +#define TOUCHPAD_TOGGLE_OFF=09=09BIT(6)
> +
> +#define EC_ADDR_CHARGE_CTRL=09=090x07B9
> +#define CHARGE_CTRL_MASK=09=09GENMASK(6, 0)
> +#define CHARGE_CTRL_REACHED=09=09BIT(7)
> +
> +#define EC_ADDR_UNIVERSAL_FAN_CTRL=090x07C5
> +#define SPLIT_TABLES=09=09=09BIT(7)
> +
> +#define EC_ADDR_AP_OEM_6=09=090x07C6
> +#define ENABLE_UNIVERSAL_FAN_CTRL=09BIT(2)
> +#define BATTERY_CHARGE_FULL_OVER_24H=09BIT(3)
> +#define BATTERY_ERM_STATUS_REACHED=09BIT(4)
> +
> +#define EC_ADDR_CHARGE_PRIO=09=090x07CC
> +#define CHARGING_PERFORMANCE=09=09BIT(7)
> +
> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
> +#define EC_ADDR_LIGHTBAR_BAT_CTRL=090x07E2
> +
> +#define EC_ADDR_LIGHTBAR_BAT_RED=090x07E3
> +
> +#define EC_ADDR_LIGHTBAR_BAT_GREEN=090x07E4
> +
> +#define EC_ADDR_LIGHTBAR_BAT_BLUE=090x07E5
> +
> +#define EC_ADDR_CPU_TEMP_END_TABLE=090x0F00
> +
> +#define EC_ADDR_CPU_TEMP_START_TABLE=090x0F10
> +
> +#define EC_ADDR_CPU_FAN_SPEED_TABLE=090x0F20
> +
> +#define EC_ADDR_GPU_TEMP_END_TABLE=090x0F30
> +
> +#define EC_ADDR_GPU_TEMP_START_TABLE=090x0F40
> +
> +#define EC_ADDR_GPU_FAN_SPEED_TABLE=090x0F50
> +
> +/*
> + * Those two registers technically allow for manual fan control,
> + * but are unstable on some models and are likely not meant to
> + * be used by applications as they are only accessible when using
> + * the WMI interface.
> + */
> +#define EC_ADDR_PWM_1_WRITEABLE=09=090x1804
> +
> +#define EC_ADDR_PWM_2_WRITEABLE=09=090x1809
> +
> +#define DRIVER_NAME=09"uniwill"
> +
> +/*
> + * The OEM software always sleeps up to 6 ms after reading/writing EC
> + * registers, so we emulate this behaviour for maximum compatibility.
> + */
> +#define UNIWILL_EC_DELAY_US=096000
> +
> +#define PWM_MAX=09=09=09200
> +#define FAN_TABLE_LENGTH=0916
> +
> +#define LED_CHANNELS=09=093
> +#define LED_MAX_BRIGHTNESS=09200
> +
> +#define UNIWILL_FEATURE_FN_LOCK_TOGGLE=09=09BIT(0)
> +#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE=09BIT(1)
> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE=09=09BIT(2)
> +#define UNIWILL_FEATURE_LIGHTBAR=09=09BIT(3)
> +#define UNIWILL_FEATURE_BATTERY=09=09=09BIT(4)
> +#define UNIWILL_FEATURE_HWMON=09=09=09BIT(5)
> +
> +struct uniwill_data {
> +=09struct device *dev;
> +=09acpi_handle handle;
> +=09struct regmap *regmap;
> +=09struct acpi_battery_hook hook;
> +=09unsigned int last_charge_ctrl;
> +=09struct mutex battery_lock;=09/* Protects the list of currently regist=
ered batteries */
> +=09unsigned int last_switch_status;
> +=09struct mutex super_key_lock;=09/* Protects the toggling of the super =
key lock state */
> +=09struct list_head batteries;
> +=09struct mutex led_lock;=09=09/* Protects writes to the lightbar regist=
ers */
> +=09struct led_classdev_mc led_mc_cdev;
> +=09struct mc_subled led_mc_subled_info[LED_CHANNELS];
> +=09struct mutex input_lock;=09/* Protects input sequence during notify *=
/
> +=09struct input_dev *input_device;
> +=09struct notifier_block nb;
> +};
> +
> +struct uniwill_battery_entry {
> +=09struct list_head head;
> +=09struct power_supply *battery;
> +};
> +
> +static bool force;
> +module_param_unsafe(force, bool, 0);
> +MODULE_PARM_DESC(force, "Force loading without checking for supported de=
vices\n");
> +
> +/* Feature bitmask since the associated registers are not reliable */
> +static unsigned int supported_features;
> +
> +static const char * const uniwill_temp_labels[] =3D {
> +=09"CPU",
> +=09"GPU",
> +};
> +
> +static const char * const uniwill_fan_labels[] =3D {
> +=09"Main",
> +=09"Secondary",
> +};
> +
> +static const struct key_entry uniwill_keymap[] =3D {
> +=09/* Reported via keyboard controller */
> +=09{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOC=
K }},
> +=09{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK=
 }},
> +
> +=09/* Reported when the user locks/unlocks the super key */
> +=09{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN=
 }},
> +=09{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN=
 }},
> +=09/* Optional, might not be reported by all devices */
> +=09{ KE_IGNORE,=09UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,=09{ KEY_UNKNOWN }}=
,
> +
> +=09/* Reported in manual mode when toggling the airplane mode status */
> +=09{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL =
}},
> +
> +=09/* Reported when user wants to cycle the platform profile */
> +=09{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN=
 }},
> +
> +=09/* Reported when the user wants to adjust the brightness of the keybo=
ard */
> +=09{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLU=
MDOWN }},
> +=09{ KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { KEY_KBDILLU=
MUP }},
> +
> +=09/* Reported when the user wants to toggle the microphone mute status =
*/
> +=09{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE=
 }},
> +
> +=09/* Reported when the user locks/unlocks the Fn key */
> +=09{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC =
}},
> +
> +=09/* Reported when the user wants to toggle the brightness of the keybo=
ard */
> +=09{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLU=
MTOGGLE }},
> +
> +=09/* FIXME: find out the exact meaning of those events */
> +=09{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN=
 }},
> +=09{ KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE,             { KEY_UNKNOWN=
 }},
> +
> +=09/* Reported when the user wants to toggle the benchmark mode status *=
/
> +=09{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN=
 }},
> +
> +=09{ KE_END }
> +};
> +
> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigne=
d int val)
> +{
> +=09union acpi_object params[2] =3D {
> +=09=09{
> +=09=09=09.integer =3D {
> +=09=09=09=09.type =3D ACPI_TYPE_INTEGER,
> +=09=09=09=09.value =3D reg,
> +=09=09=09},
> +=09=09},
> +=09=09{
> +=09=09=09.integer =3D {
> +=09=09=09=09.type =3D ACPI_TYPE_INTEGER,
> +=09=09=09=09.value =3D val,
> +=09=09=09},
> +=09=09},
> +=09};
> +=09struct uniwill_data *data =3D context;
> +=09struct acpi_object_list input =3D {
> +=09=09.count =3D ARRAY_SIZE(params),

Add include.

> +=09=09.pointer =3D params,
> +=09};
> +=09acpi_status status;
> +
> +=09status =3D acpi_evaluate_object(data->handle, "ECRW", &input, NULL);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
> +
> +=09return 0;
> +}
> +
> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsigned=
 int *val)
> +{
> +=09union acpi_object params[1] =3D {
> +=09=09{
> +=09=09=09.integer =3D {
> +=09=09=09=09.type =3D ACPI_TYPE_INTEGER,
> +=09=09=09=09.value =3D reg,
> +=09=09=09},
> +=09=09},
> +=09};
> +=09struct uniwill_data *data =3D context;
> +=09struct acpi_object_list input =3D {
> +=09=09.count =3D ARRAY_SIZE(params),
> +=09=09.pointer =3D params,
> +=09};
> +=09unsigned long long output;
> +=09acpi_status status;
> +
> +=09status =3D acpi_evaluate_integer(data->handle, "ECRR", &input, &outpu=
t);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09if (output > U8_MAX)
> +=09=09return -ENXIO;
> +
> +=09usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
> +
> +=09*val =3D output;
> +
> +=09return 0;
> +}
> +
> +static const struct regmap_bus uniwill_ec_bus =3D {
> +=09.reg_write =3D uniwill_ec_reg_write,
> +=09.reg_read =3D uniwill_ec_reg_read,
> +=09.reg_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
> +=09.val_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +=09switch (reg) {
> +=09case EC_ADDR_AP_OEM:
> +=09case EC_ADDR_LIGHTBAR_AC_CTRL:
> +=09case EC_ADDR_LIGHTBAR_AC_RED:
> +=09case EC_ADDR_LIGHTBAR_AC_GREEN:
> +=09case EC_ADDR_LIGHTBAR_AC_BLUE:
> +=09case EC_ADDR_BIOS_OEM:
> +=09case EC_ADDR_TRIGGER:
> +=09case EC_ADDR_OEM_4:
> +=09case EC_ADDR_CHARGE_CTRL:
> +=09case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +=09case EC_ADDR_LIGHTBAR_BAT_RED:
> +=09case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +=09case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +=09=09return true;
> +=09default:
> +=09=09return false;
> +=09}
> +}
> +
> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
> +{
> +=09switch (reg) {
> +=09case EC_ADDR_CPU_TEMP:
> +=09case EC_ADDR_GPU_TEMP:
> +=09case EC_ADDR_MAIN_FAN_RPM_1:
> +=09case EC_ADDR_MAIN_FAN_RPM_2:
> +=09case EC_ADDR_SECOND_FAN_RPM_1:
> +=09case EC_ADDR_SECOND_FAN_RPM_2:
> +=09case EC_ADDR_BAT_ALERT:
> +=09case EC_ADDR_PROJECT_ID:
> +=09case EC_ADDR_AP_OEM:
> +=09case EC_ADDR_LIGHTBAR_AC_CTRL:
> +=09case EC_ADDR_LIGHTBAR_AC_RED:
> +=09case EC_ADDR_LIGHTBAR_AC_GREEN:
> +=09case EC_ADDR_LIGHTBAR_AC_BLUE:
> +=09case EC_ADDR_BIOS_OEM:
> +=09case EC_ADDR_PWM_1:
> +=09case EC_ADDR_PWM_2:
> +=09case EC_ADDR_TRIGGER:
> +=09case EC_ADDR_SWITCH_STATUS:
> +=09case EC_ADDR_OEM_4:
> +=09case EC_ADDR_CHARGE_CTRL:
> +=09case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +=09case EC_ADDR_LIGHTBAR_BAT_RED:
> +=09case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +=09case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +=09=09return true;
> +=09default:
> +=09=09return false;
> +=09}
> +}
> +
> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +=09switch (reg) {
> +=09case EC_ADDR_CPU_TEMP:
> +=09case EC_ADDR_GPU_TEMP:
> +=09case EC_ADDR_MAIN_FAN_RPM_1:
> +=09case EC_ADDR_MAIN_FAN_RPM_2:
> +=09case EC_ADDR_SECOND_FAN_RPM_1:
> +=09case EC_ADDR_SECOND_FAN_RPM_2:
> +=09case EC_ADDR_BAT_ALERT:
> +=09case EC_ADDR_PWM_1:
> +=09case EC_ADDR_PWM_2:
> +=09case EC_ADDR_TRIGGER:
> +=09case EC_ADDR_SWITCH_STATUS:
> +=09case EC_ADDR_CHARGE_CTRL:
> +=09=09return true;
> +=09default:
> +=09=09return false;
> +=09}
> +}
> +
> +static const struct regmap_config uniwill_ec_config =3D {
> +=09.reg_bits =3D 16,
> +=09.val_bits =3D 8,
> +=09.writeable_reg =3D uniwill_writeable_reg,
> +=09.readable_reg =3D uniwill_readable_reg,
> +=09.volatile_reg =3D uniwill_volatile_reg,
> +=09.can_sleep =3D true,
> +=09.max_register =3D 0xFFF,
> +=09.cache_type =3D REGCACHE_MAPLE,
> +=09.use_single_read =3D true,
> +=09.use_single_write =3D true,
> +};
> +
> +static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct de=
vice_attribute *attr,
> +=09=09=09=09=09   const char *buf, size_t count)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09bool enable;
> +=09int ret;
> +
> +=09ret =3D kstrtobool(buf, &enable);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if (enable)
> +=09=09value =3D FN_LOCK_STATUS;
> +=09else
> +=09=09value =3D 0;
> +
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_ST=
ATUS, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
> +static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct dev=
ice_attribute *attr,
> +=09=09=09=09=09  char *buf)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock_toggle_enable);
> +
> +static ssize_t super_key_toggle_enable_store(struct device *dev, struct =
device_attribute *attr,
> +=09=09=09=09=09     const char *buf, size_t count)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09bool enable;
> +=09int ret;
> +
> +=09ret =3D kstrtobool(buf, &enable);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09guard(mutex)(&data->super_key_lock);
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09/*
> +=09 * We can only toggle the super key lock, so we return early if the s=
etting
> +=09 * is already in the correct state.
> +=09 */
> +=09if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
> +=09=09return count;
> +
> +=09ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPE=
R_KEY_LOCK,
> +=09=09=09=09TRIGGER_SUPER_KEY_LOCK);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
> +static ssize_t super_key_toggle_enable_show(struct device *dev, struct d=
evice_attribute *attr,
> +=09=09=09=09=09    char *buf)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
> +}
> +
> +static DEVICE_ATTR_RW(super_key_toggle_enable);
> +
> +static ssize_t touchpad_toggle_enable_store(struct device *dev, struct d=
evice_attribute *attr,
> +=09=09=09=09=09    const char *buf, size_t count)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09bool enable;
> +=09int ret;
> +
> +=09ret =3D kstrtobool(buf, &enable);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if (enable)
> +=09=09value =3D 0;
> +=09else
> +=09=09value =3D TOUCHPAD_TOGGLE_OFF;
> +
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGG=
LE_OFF, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
> +static ssize_t touchpad_toggle_enable_show(struct device *dev, struct de=
vice_attribute *attr,
> +=09=09=09=09=09   char *buf)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
> +}
> +
> +static DEVICE_ATTR_RW(touchpad_toggle_enable);
> +
> +static ssize_t rainbow_animation_store(struct device *dev, struct device=
_attribute *attr,
> +=09=09=09=09       const char *buf, size_t count)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09bool enable;
> +=09int ret;
> +
> +=09ret =3D kstrtobool(buf, &enable);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if (enable)
> +=09=09value =3D LIGHTBAR_WELCOME;
> +=09else
> +=09=09value =3D 0;
> +
> +=09guard(mutex)(&data->led_lock);
> +
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_WELCOME, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_WELCOME, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
> +static ssize_t rainbow_animation_show(struct device *dev, struct device_=
attribute *attr, char *buf)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
> +}
> +
> +static DEVICE_ATTR_RW(rainbow_animation);
> +
> +static ssize_t breathing_in_suspend_store(struct device *dev, struct dev=
ice_attribute *attr,
> +=09=09=09=09=09  const char *buf, size_t count)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09bool enable;
> +=09int ret;
> +
> +=09ret =3D kstrtobool(buf, &enable);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if (enable)
> +=09=09value =3D 0;
> +=09else
> +=09=09value =3D LIGHTBAR_S3_OFF;
> +
> +=09/* We only access a single register here, so we do not need to use da=
ta->led_lock */
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S3_OFF, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
> +static ssize_t breathing_in_suspend_show(struct device *dev, struct devi=
ce_attribute *attr,
> +=09=09=09=09=09 char *buf)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
> +}
> +
> +static DEVICE_ATTR_RW(breathing_in_suspend);
> +
> +static struct attribute *uniwill_attrs[] =3D {
> +=09/* Keyboard-related */
> +=09&dev_attr_fn_lock_toggle_enable.attr,
> +=09&dev_attr_super_key_toggle_enable.attr,
> +=09&dev_attr_touchpad_toggle_enable.attr,
> +=09/* Lightbar-related */
> +=09&dev_attr_rainbow_animation.attr,
> +=09&dev_attr_breathing_in_suspend.attr,
> +=09NULL
> +};
> +
> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attr=
ibute *attr, int n)
> +{
> +=09if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
> +=09=09if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
> +=09=09=09return attr->mode;
> +=09}
> +
> +=09if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
> +=09=09if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
> +=09=09=09return attr->mode;
> +=09}
> +
> +=09if (attr =3D=3D &dev_attr_touchpad_toggle_enable.attr) {
> +=09=09if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +=09=09=09return attr->mode;
> +=09}
> +
> +=09if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
> +=09    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> +=09=09if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +=09=09=09return attr->mode;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static const struct attribute_group uniwill_group =3D {
> +=09.is_visible =3D uniwill_attr_is_visible,
> +=09.attrs =3D uniwill_attrs,
> +};
> +
> +static const struct attribute_group *uniwill_groups[] =3D {
> +=09&uniwill_group,
> +=09NULL
> +};
> +
> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types type=
, u32 attr, int channel,
> +=09=09=09long *val)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09__be16 rpm;
> +=09int ret;
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09switch (channel) {
> +=09=09case 0:
> +=09=09=09ret =3D regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
> +=09=09=09break;
> +=09=09case 1:
> +=09=09=09ret =3D regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EOPNOTSUPP;
> +=09=09}
> +
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09*val =3D value * MILLIDEGREE_PER_DEGREE;
> +=09=09return 0;
> +=09case hwmon_fan:
> +=09=09switch (channel) {
> +=09=09case 0:
> +=09=09=09ret =3D regmap_bulk_read(data->regmap, EC_ADDR_MAIN_FAN_RPM_1, =
&rpm,
> +=09=09=09=09=09       sizeof(rpm));
> +=09=09=09break;
> +=09=09case 1:
> +=09=09=09ret =3D regmap_bulk_read(data->regmap, EC_ADDR_SECOND_FAN_RPM_1=
, &rpm,
> +=09=09=09=09=09       sizeof(rpm));
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EOPNOTSUPP;
> +=09=09}
> +
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09*val =3D be16_to_cpu(rpm);
> +=09=09return 0;
> +=09case hwmon_pwm:
> +=09=09switch (channel) {
> +=09=09case 0:
> +=09=09=09ret =3D regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
> +=09=09=09break;
> +=09=09case 1:
> +=09=09=09ret =3D regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EOPNOTSUPP;
> +=09=09}
> +
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09*val =3D fixp_linear_interpolate(0, 0, PWM_MAX, U8_MAX, value);
> +=09=09return 0;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +}
> +
> +static int uniwill_read_string(struct device *dev, enum hwmon_sensor_typ=
es type, u32 attr,
> +=09=09=09       int channel, const char **str)
> +{
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09*str =3D uniwill_temp_labels[channel];
> +=09=09return 0;
> +=09case hwmon_fan:
> +=09=09*str =3D uniwill_fan_labels[channel];
> +=09=09return 0;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +}
> +
> +static const struct hwmon_ops uniwill_ops =3D {
> +=09.visible =3D 0444,
> +=09.read =3D uniwill_read,
> +=09.read_string =3D uniwill_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const uniwill_info[] =3D {
> +=09HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL),
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_LABEL),
> +=09HWMON_CHANNEL_INFO(pwm,
> +=09=09=09   HWMON_PWM_INPUT,
> +=09=09=09   HWMON_PWM_INPUT),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info uniwill_chip_info =3D {
> +=09.ops =3D &uniwill_ops,
> +=09.info =3D uniwill_info,
> +};
> +
> +static int uniwill_hwmon_init(struct uniwill_data *data)
> +{
> +=09struct device *hdev;
> +
> +=09if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +=09=09return 0;
> +
> +=09hdev =3D devm_hwmon_device_register_with_info(data->dev, "uniwill", d=
ata,
> +=09=09=09=09=09=09    &uniwill_chip_info, NULL);
> +
> +=09return PTR_ERR_OR_ZERO(hdev);
> +}
> +
> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] =
=3D {
> +=09EC_ADDR_LIGHTBAR_BAT_RED,
> +=09EC_ADDR_LIGHTBAR_BAT_GREEN,
> +=09EC_ADDR_LIGHTBAR_BAT_BLUE,
> +};
> +
> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] =
=3D {
> +=09EC_ADDR_LIGHTBAR_AC_RED,
> +=09EC_ADDR_LIGHTBAR_AC_GREEN,
> +=09EC_ADDR_LIGHTBAR_AC_BLUE,
> +};
> +
> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enu=
m led_brightness brightness)
> +{
> +=09struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +=09struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwil=
l_data, led_mc_cdev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09guard(mutex)(&data->led_lock);
> +
> +=09for (int i =3D 0; i < LED_CHANNELS; i++) {
> +=09=09/* Prevent the brightness values from overflowing */
> +=09=09value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brig=
htness);
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[=
i], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09}
> +
> +=09if (brightness)
> +=09=09value =3D 0;
> +=09else
> +=09=09value =3D LIGHTBAR_S0_OFF;
> +
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S0_OFF, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LI=
GHTBAR_S0_OFF, value);
> +}
> +
> +#define LIGHTBAR_MASK=09(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBA=
R_S3_OFF | LIGHTBAR_WELCOME)
> +
> +static int uniwill_led_init(struct uniwill_data *data)
> +{
> +=09struct led_init_data init_data =3D {
> +=09=09.devicename =3D DRIVER_NAME,
> +=09=09.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
> +=09=09.devname_mandatory =3D true,
> +=09};
> +=09unsigned int color_indices[3] =3D {
> +=09=09LED_COLOR_ID_RED,
> +=09=09LED_COLOR_ID_GREEN,
> +=09=09LED_COLOR_ID_BLUE,
> +=09};
> +=09unsigned int value;
> +=09int ret;
> +
> +=09if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +=09=09return 0;
> +
> +=09ret =3D devm_mutex_init(data->dev, &data->led_lock);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09/*
> +=09 * The EC has separate lightbar settings for AC and battery mode,
> +=09 * so we have to ensure that both settings are the same.
> +=09 */
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09value |=3D LIGHTBAR_APP_EXISTS;
> +=09ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09/*
> +=09 * The breathing animation during suspend is not supported when
> +=09 * running on battery power.
> +=09 */
> +=09value |=3D LIGHTBAR_S3_OFF;
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_MASK, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
> +=09data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
> +=09data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
> +=09data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_br=
ightness_set;
> +
> +=09if (value & LIGHTBAR_S0_OFF)
> +=09=09data->led_mc_cdev.led_cdev.brightness =3D 0;
> +=09else
> +=09=09data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
> +
> +=09for (int i =3D 0; i < LED_CHANNELS; i++) {
> +=09=09data->led_mc_subled_info[i].color_index =3D color_indices[i];
> +
> +=09=09ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i]=
, &value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09/*
> +=09=09 * Make sure that the initial intensity value is not greater than
> +=09=09 * the maximum brightness.
> +=09=09 */
> +=09=09value =3D min(LED_MAX_BRIGHTNESS, value);
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[=
i], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09data->led_mc_subled_info[i].intensity =3D value;
> +=09=09data->led_mc_subled_info[i].channel =3D i;
> +=09}
> +
> +=09data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
> +=09data->led_mc_cdev.num_colors =3D LED_CHANNELS;
> +
> +=09return devm_led_classdev_multicolor_register_ext(data->dev, &data->le=
d_mc_cdev,
> +=09=09=09=09=09=09=09 &init_data);
> +}
> +
> +static int uniwill_get_property(struct power_supply *psy, const struct p=
ower_supply_ext *ext,
> +=09=09=09=09void *drvdata, enum power_supply_property psp,
> +=09=09=09=09union power_supply_propval *val)
> +{
> +=09struct uniwill_data *data =3D drvdata;
> +=09union power_supply_propval prop;
> +=09unsigned int regval;
> +=09int ret;
> +
> +=09switch (psp) {
> +=09case POWER_SUPPLY_PROP_HEALTH:
> +=09=09ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PR=
ESENT, &prop);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09if (!prop.intval) {
> +=09=09=09val->intval =3D POWER_SUPPLY_HEALTH_NO_BATTERY;
> +=09=09=09return 0;
> +=09=09}
> +
> +=09=09ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_ST=
ATUS, &prop);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09if (prop.intval =3D=3D POWER_SUPPLY_STATUS_UNKNOWN) {
> +=09=09=09val->intval =3D POWER_SUPPLY_HEALTH_UNKNOWN;
> +=09=09=09return 0;
> +=09=09}
> +
> +=09=09ret =3D regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09if (regval) {
> +=09=09=09/* Charging issue */
> +=09=09=09val->intval =3D POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
> +=09=09=09return 0;
> +=09=09}
> +
> +=09=09val->intval =3D POWER_SUPPLY_HEALTH_GOOD;
> +=09=09return 0;
> +=09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +=09=09ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, =
100);
> +=09=09return 0;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +}
> +
> +static int uniwill_set_property(struct power_supply *psy, const struct p=
ower_supply_ext *ext,
> +=09=09=09=09void *drvdata, enum power_supply_property psp,
> +=09=09=09=09const union power_supply_propval *val)
> +{
> +=09struct uniwill_data *data =3D drvdata;
> +
> +=09switch (psp) {
> +=09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +=09=09if (val->intval < 1 || val->intval > 100)
> +=09=09=09return -EINVAL;
> +
> +=09=09return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARG=
E_CTRL_MASK,
> +=09=09=09=09=09  val->intval);
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +}
> +
> +static int uniwill_property_is_writeable(struct power_supply *psy,
> +=09=09=09=09=09 const struct power_supply_ext *ext, void *drvdata,
> +=09=09=09=09=09 enum power_supply_property psp)
> +{
> +=09if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +=09=09return true;
> +
> +=09return false;
> +}
> +
> +static const enum power_supply_property uniwill_properties[] =3D {
> +=09POWER_SUPPLY_PROP_HEALTH,
> +=09POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext uniwill_extension =3D {
> +=09.name =3D DRIVER_NAME,
> +=09.properties =3D uniwill_properties,
> +=09.num_properties =3D ARRAY_SIZE(uniwill_properties),
> +=09.get_property =3D uniwill_get_property,
> +=09.set_property =3D uniwill_set_property,
> +=09.property_is_writeable =3D uniwill_property_is_writeable,
> +};
> +
> +static int uniwill_add_battery(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> +{
> +=09struct uniwill_data *data =3D container_of(hook, struct uniwill_data,=
 hook);
> +=09struct uniwill_battery_entry *entry;
> +=09int ret;
> +
> +=09entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
> +=09if (!entry)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D power_supply_register_extension(battery, &uniwill_extension, =
data->dev, data);
> +=09if (ret < 0) {
> +=09=09kfree(entry);
> +=09=09return ret;
> +=09}
> +
> +=09guard(mutex)(&data->battery_lock);
> +
> +=09entry->battery =3D battery;
> +=09list_add(&entry->head, &data->batteries);
> +
> +=09return 0;
> +}
> +
> +static int uniwill_remove_battery(struct power_supply *battery, struct a=
cpi_battery_hook *hook)
> +{
> +=09struct uniwill_data *data =3D container_of(hook, struct uniwill_data,=
 hook);
> +=09struct uniwill_battery_entry *entry, *tmp;
> +
> +=09scoped_guard(mutex, &data->battery_lock) {
> +=09=09list_for_each_entry_safe(entry, tmp, &data->batteries, head) {
> +=09=09=09if (entry->battery =3D=3D battery) {
> +=09=09=09=09list_del(&entry->head);
> +=09=09=09=09kfree(entry);
> +=09=09=09=09break;
> +=09=09=09}
> +=09=09}
> +=09}
> +
> +=09power_supply_unregister_extension(battery, &uniwill_extension);
> +
> +=09return 0;
> +}
> +
> +static int uniwill_battery_init(struct uniwill_data *data)
> +{
> +=09int ret;
> +
> +=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +=09=09return 0;
> +
> +=09ret =3D devm_mutex_init(data->dev, &data->battery_lock);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09INIT_LIST_HEAD(&data->batteries);
> +=09data->hook.name =3D "Uniwill Battery Extension";
> +=09data->hook.add_battery =3D uniwill_add_battery;
> +=09data->hook.remove_battery =3D uniwill_remove_battery;
> +
> +=09return devm_battery_hook_register(data->dev, &data->hook);
> +}
> +
> +static int uniwill_notifier_call(struct notifier_block *nb, unsigned lon=
g action, void *dummy)
> +{
> +=09struct uniwill_data *data =3D container_of(nb, struct uniwill_data, n=
b);
> +=09struct uniwill_battery_entry *entry;
> +
> +=09switch (action) {
> +=09case UNIWILL_OSD_BATTERY_ALERT:
> +=09=09mutex_lock(&data->battery_lock);
> +=09=09list_for_each_entry(entry, &data->batteries, head) {
> +=09=09=09power_supply_changed(entry->battery);
> +=09=09}
> +=09=09mutex_unlock(&data->battery_lock);
> +
> +=09=09return NOTIFY_OK;
> +=09default:
> +=09=09mutex_lock(&data->input_lock);
> +=09=09sparse_keymap_report_event(data->input_device, action, 1, true);
> +=09=09mutex_unlock(&data->input_lock);
> +
> +=09=09return NOTIFY_OK;
> +=09}
> +}
> +
> +static int uniwill_input_init(struct uniwill_data *data)
> +{
> +=09int ret;
> +
> +=09ret =3D devm_mutex_init(data->dev, &data->input_lock);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09data->input_device =3D devm_input_allocate_device(data->dev);
> +=09if (!data->input_device)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D sparse_keymap_setup(data->input_device, uniwill_keymap, NULL)=
;
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09data->input_device->name =3D "Uniwill WMI hotkeys";
> +=09data->input_device->phys =3D "wmi/input0";
> +=09data->input_device->id.bustype =3D BUS_HOST;
> +=09ret =3D input_register_device(data->input_device);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09data->nb.notifier_call =3D uniwill_notifier_call;
> +
> +=09return devm_uniwill_wmi_register_notifier(data->dev, &data->nb);
> +}
> +
> +static void uniwill_disable_manual_control(void *context)
> +{
> +=09struct uniwill_data *data =3D context;
> +
> +=09regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_ec_init(struct uniwill_data *data)
> +{
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09dev_dbg(data->dev, "Project ID: %u\n", value);
> +
> +=09ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_C=
TRL);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return devm_add_action_or_reset(data->dev, uniwill_disable_manual_con=
trol, data);
> +}
> +
> +static int uniwill_probe(struct platform_device *pdev)
> +{
> +=09struct uniwill_data *data;
> +=09struct regmap *regmap;
> +=09acpi_handle handle;
> +=09int ret;
> +
> +=09handle =3D ACPI_HANDLE(&pdev->dev);
> +=09if (!handle)
> +=09=09return -ENODEV;
> +
> +=09data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +
> +=09data->dev =3D &pdev->dev;
> +=09data->handle =3D handle;
> +=09platform_set_drvdata(pdev, data);
> +
> +=09regmap =3D devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwi=
ll_ec_config);
> +=09if (IS_ERR(regmap))
> +=09=09return PTR_ERR(regmap);
> +
> +=09data->regmap =3D regmap;
> +=09ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_ec_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_battery_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_led_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_hwmon_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return uniwill_input_init(data);
> +}
> +
> +static void uniwill_shutdown(struct platform_device *pdev)
> +{
> +=09struct uniwill_data *data =3D platform_get_drvdata(pdev);
> +
> +=09regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
> +{
> +=09if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +=09=09return 0;
> +
> +=09/*
> +=09 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to res=
tore it
> +=09 * ourselves.
> +=09 */
> +=09return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_s=
witch_status);
> +}
> +
> +static int uniwill_suspend_battery(struct uniwill_data *data)
> +{
> +=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +=09=09return 0;
> +
> +=09/*
> +=09 * Save the current charge limit in order to restore it during resume=
=2E
> +=09 * We cannot use the regmap code for that since this register needs t=
o
> +=09 * be declared as volatile due to CHARGE_CTRL_REACHED.
> +=09 */
> +=09return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_cha=
rge_ctrl);
> +}
> +
> +static int uniwill_suspend(struct device *dev)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09int ret;
> +
> +=09ret =3D uniwill_suspend_keyboard(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_suspend_battery(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09regcache_cache_only(data->regmap, true);
> +=09regcache_mark_dirty(data->regmap);
> +
> +=09return 0;
> +}
> +
> +static int uniwill_resume_keyboard(struct uniwill_data *data)
> +{
> +=09unsigned int value;
> +=09int ret;
> +
> +=09if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +=09=09return 0;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value =
& SUPER_KEY_LOCK_STATUS))
> +=09=09return 0;
> +
> +=09return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER=
_KEY_LOCK,
> +=09=09=09=09 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static int uniwill_resume_battery(struct uniwill_data *data)
> +{
> +=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +=09=09return 0;
> +
> +=09return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_C=
TRL_MASK,
> +=09=09=09=09  data->last_charge_ctrl);
> +}
> +
> +static int uniwill_resume(struct device *dev)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09int ret;
> +
> +=09regcache_cache_only(data->regmap, false);
> +
> +=09ret =3D regcache_sync(data->regmap);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_resume_keyboard(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return uniwill_resume_battery(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill=
_resume);
> +
> +/*
> + * We only use the DMI table for auoloading because the ACPI device itse=
lf
> + * does not guarantee that the underlying EC implementation is supported=
=2E
> + */
> +static const struct acpi_device_id uniwill_id_table[] =3D {
> +=09{ "INOU0000" },
> +=09{ },
> +};
> +
> +static struct platform_driver uniwill_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D DRIVER_NAME,
> +=09=09.dev_groups =3D uniwill_groups,
> +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +=09=09.acpi_match_table =3D uniwill_id_table,
> +=09=09.pm =3D pm_sleep_ptr(&uniwill_pm_ops),
> +=09},
> +=09.probe =3D uniwill_probe,
> +=09.shutdown =3D uniwill_shutdown,
> +};
> +
> +static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
> +=09{
> +=09=09.ident =3D "Intel NUC x15",
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
> +=09=09},
> +=09=09.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +=09=09=09=09=09UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +=09=09=09=09=09UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +=09=09=09=09=09UNIWILL_FEATURE_BATTERY |
> +=09=09=09=09=09UNIWILL_FEATURE_HWMON),
> +=09},
> +=09{
> +=09=09.ident =3D "Intel NUC x15",
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
> +=09=09},
> +=09=09.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +=09=09=09=09=09UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +=09=09=09=09=09UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +=09=09=09=09=09UNIWILL_FEATURE_LIGHTBAR |
> +=09=09=09=09=09UNIWILL_FEATURE_BATTERY |
> +=09=09=09=09=09UNIWILL_FEATURE_HWMON),
> +=09},
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
> +
> +static int __init uniwill_init(void)
> +{
> +=09const struct dmi_system_id *id;
> +=09int ret;
> +
> +=09id =3D dmi_first_match(uniwill_dmi_table);
> +=09if (!id) {
> +=09=09if (!force)
> +=09=09=09return -ENODEV;
> +
> +=09=09/* Assume that the device supports all features */
> +=09=09supported_features =3D UINT_MAX;
> +=09=09pr_warn("Loading on a potentially unsupported device\n");
> +=09} else {
> +=09=09supported_features =3D (uintptr_t)id->driver_data;
> +=09}
> +
> +=09ret =3D platform_driver_register(&uniwill_driver);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_wmi_register_driver();
> +=09if (ret < 0) {
> +=09=09platform_driver_unregister(&uniwill_driver);
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +module_init(uniwill_init);
> +
> +static void __exit uniwill_exit(void)
> +{
> +=09uniwill_wmi_unregister_driver();
> +=09platform_driver_unregister(&uniwill_driver);
> +}
> +module_exit(uniwill_exit);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("Uniwill notebook driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platfor=
m/x86/uniwill/uniwill-wmi.c
> new file mode 100644
> index 000000000000..31d9c39f14ab
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux hotkey driver for Uniwill notebooks.
> + *
> + * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg a=
nd Werner Sembach
> + * for supporting the development of this driver either through prior wo=
rk or
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
> +#define DRIVER_NAME=09=09"uniwill-wmi"
> +#define UNIWILL_EVENT_GUID=09"ABBC0F72-8EA1-11D1-00A0-C90629100000"
> +
> +static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
> +
> +static void devm_uniwill_wmi_unregister_notifier(void *data)
> +{
> +=09struct notifier_block *nb =3D data;
> +
> +=09blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
> +}
> +
> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifi=
er_block *nb)
> +{
> +=09int ret;
> +
> +=09ret =3D blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb)=
;
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_noti=
fier, nb);
> +}
> +
> +static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_objec=
t *obj)
> +{
> +=09u32 value;
> +
> +=09if (obj->type !=3D ACPI_TYPE_INTEGER)
> +=09=09return;
> +
> +=09value =3D obj->integer.value;
> +
> +=09dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
> +
> +=09blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
> +}
> +
> +/*
> + * We cannot fully trust this GUID since Uniwill just copied the WMI GUI=
D
> + * from the Windows driver example, and others probably did the same.
> + *
> + * Because of this we cannot use this WMI GUID for autoloading. Instead =
the
> + * associated driver will be registered manually after matching a DMI ta=
ble.
> + */
> +static const struct wmi_device_id uniwill_wmi_id_table[] =3D {
> +=09{ UNIWILL_EVENT_GUID, NULL },
> +=09{ }
> +};
> +
> +static struct wmi_driver uniwill_wmi_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D DRIVER_NAME,
> +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +=09},
> +=09.id_table =3D uniwill_wmi_id_table,
> +=09.notify =3D uniwill_wmi_notify,
> +=09.no_singleton =3D true,
> +};
> +
> +int __init uniwill_wmi_register_driver(void)
> +{
> +=09return wmi_driver_register(&uniwill_wmi_driver);
> +}
> +
> +void __exit uniwill_wmi_unregister_driver(void)
> +{
> +=09wmi_driver_unregister(&uniwill_wmi_driver);
> +}
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platfor=
m/x86/uniwill/uniwill-wmi.h
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
> +#define UNIWILL_OSD_CAPSLOCK=09=09=090x01
> +#define UNIWILL_OSD_NUMLOCK=09=09=090x02
> +#define UNIWILL_OSD_SCROLLLOCK=09=09=090x03
> +
> +#define UNIWILL_OSD_TOUCHPAD_ON=09=09=090x04
> +#define UNIWILL_OSD_TOUCHPAD_OFF=09=090x05
> +
> +#define UNIWILL_OSD_SILENT_MODE_ON=09=090x06
> +#define UNIWILL_OSD_SILENT_MODE_OFF=09=090x07
> +
> +#define UNIWILL_OSD_WLAN_ON=09=09=090x08
> +#define UNIWILL_OSD_WLAN_OFF=09=09=090x09
> +
> +#define UNIWILL_OSD_WIMAX_ON=09=09=090x0A
> +#define UNIWILL_OSD_WIMAX_OFF=09=09=090x0B
> +
> +#define UNIWILL_OSD_BLUETOOTH_ON=09=090x0C
> +#define UNIWILL_OSD_BLUETOOTH_OFF=09=090x0D
> +
> +#define UNIWILL_OSD_RF_ON=09=09=090x0E
> +#define UNIWILL_OSD_RF_OFF=09=09=090x0F
> +
> +#define UNIWILL_OSD_3G_ON=09=09=090x10
> +#define UNIWILL_OSD_3G_OFF=09=09=090x11
> +
> +#define UNIWILL_OSD_WEBCAM_ON=09=09=090x12
> +#define UNIWILL_OSD_WEBCAM_OFF=09=09=090x13
> +
> +#define UNIWILL_OSD_BRIGHTNESSUP=09=090x14
> +#define UNIWILL_OSD_BRIGHTNESSDOWN=09=090x15
> +
> +#define UNIWILL_OSD_RADIOON=09=09=090x1A
> +#define UNIWILL_OSD_RADIOOFF=09=09=090x1B
> +
> +#define UNIWILL_OSD_POWERSAVE_ON=09=090x31
> +#define UNIWILL_OSD_POWERSAVE_OFF=09=090x32
> +
> +#define UNIWILL_OSD_MENU=09=09=090x34
> +
> +#define UNIWILL_OSD_MUTE=09=09=090x35
> +#define UNIWILL_OSD_VOLUMEDOWN=09=09=090x36
> +#define UNIWILL_OSD_VOLUMEUP=09=09=090x37
> +
> +#define UNIWILL_OSD_MENU_2=09=09=090x38
> +
> +#define UNIWILL_OSD_LIGHTBAR_ON=09=09=090x39
> +#define UNIWILL_OSD_LIGHTBAR_OFF=09=090x3A
> +
> +#define UNIWILL_OSD_KB_LED_LEVEL0=09=090x3B
> +#define UNIWILL_OSD_KB_LED_LEVEL1=09=090x3C
> +#define UNIWILL_OSD_KB_LED_LEVEL2=09=090x3D
> +#define UNIWILL_OSD_KB_LED_LEVEL3=09=090x3E
> +#define UNIWILL_OSD_KB_LED_LEVEL4=09=090x3F
> +
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE=090x40
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE=090x41
> +
> +#define UNIWILL_OSD_MENU_JP=09=09=090x42
> +
> +#define UNIWILL_OSD_CAMERA_ON=09=09=090x90
> +#define UNIWILL_OSD_CAMERA_OFF=09=09=090x91
> +
> +#define UNIWILL_OSD_RFKILL=09=09=090xA4
> +
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED=090xA5
> +
> +#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED=090xA6
> +
> +#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED=090xA7
> +
> +#define UNIWILL_OSD_LCD_SW=09=09=090xA9
> +
> +#define UNIWILL_OSD_FAN_OVERTEMP=09=090xAA
> +
> +#define UNIWILL_OSD_DC_ADAPTER_CHANGED=09=090xAB
> +
> +#define UNIWILL_OSD_BAT_HP_OFF=09=09=090xAC
> +
> +#define UNIWILL_OSD_FAN_DOWN_TEMP=09=090xAD
> +
> +#define UNIWILL_OSD_BATTERY_ALERT=09=090xAE
> +
> +#define UNIWILL_OSD_TIMAP_HAIERLB_SW=09=090xAF
> +
> +#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE=090xB0
> +
> +#define UNIWILL_OSD_KBDILLUMDOWN=09=090xB1
> +#define UNIWILL_OSD_KBDILLUMUP=09=09=090xB2
> +
> +#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE=090xB3
> +#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE=090xB4
> +
> +#define UNIWILL_OSD_MIC_MUTE=09=09=090xB7
> +
> +#define UNIWILL_OSD_FN_LOCK=09=09=090xB8
> +#define UNIWILL_OSD_KBDILLUMTOGGLE=09=090xB9
> +
> +#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H=090xBE
> +
> +#define UNIWILL_OSD_BAT_ERM_UPDATE=09=090xBF
> +
> +#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE=090xC0
> +
> +#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED=090xF0
> +
> +struct device;
> +struct notifier_block;
> +
> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifi=
er_block *nb);
> +
> +int __init uniwill_wmi_register_driver(void);
> +
> +void __exit uniwill_wmi_unregister_driver(void);
> +
> +#endif /* UNIWILL_WMI_H */
>=20

Read through it and it looks mostly fine, just a few nits noted above.

--=20
 i.


--8323328-430851434-1761838281=:975--

