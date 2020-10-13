Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1947228D1AF
	for <lists+linux-leds@lfdr.de>; Tue, 13 Oct 2020 18:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbgJMQDd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Oct 2020 12:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgJMQDd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2020 12:03:33 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF048C0613D0;
        Tue, 13 Oct 2020 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=Wpdl5tmrKPjaaberUFjqSupjb1ATAi0ONSt07SJCKQE=; b=Qpsok+Ackr0F9fwvi+JJfjEWBO
        ydN8fGyBOrx2oXRI3B8z11e1rwafRpIYB7W7cVONGuNlmz/j3nlMWJQaNMvM7AbR1INCM9YFMDJ/j
        9mbbiQHyYqSsp2i8NOGTn9wjxjzADDES40eEhTsHRv2Jy8Ese85FHspwd5wlb85CKlSvjY1bRT10/
        FL4FQ6/86KmubEHIU2IQyrt5MB4YClGHFgQtxJ3R+KcufBFEwMquBcvgdH4Rle6jC9UpcKbAqBoIM
        meg7RqWxMtu2k4iibade5EOZZ9SrlZXbNrr/BfMvTqq5AgpqjQScFYpiEg3otce49R8tUpntEXuLL
        OWU6gDvA==;
Received: from [2601:1c0:6280:3f0::507c]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSMls-0007AD-36; Tue, 13 Oct 2020 16:03:28 +0000
Subject: Re: disabling CONFIG_LED_CLASS
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
Message-ID: <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
Date:   Tue, 13 Oct 2020 09:03:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <43b79598-1592-683f-46df-9e5489110780@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/13/20 8:53 AM, Randy Dunlap wrote:
> [adding LED people + list]
> 
> On 10/13/20 6:24 AM, Udo van den Heuvel wrote:
>> L.S.,
>>
>> Even after removing all LED referneces from .config, a `make oldconfig`
>> leads to:
>>
>> *
>> * LED Support
>> *
>> LED Support (NEW_LEDS) [Y/?] (NEW) y
>>   LED Class Support (LEDS_CLASS) [M/y/?] (NEW) n
>>
>> Where 'n' is not a valid choice.
>> So why is this LED thing forced upon us and how do we get rid of it?
>>
>> Or else please explain how to make this work on a Gigabyte Technology
>> Co., Ltd. X570 AORUS PRO...
>>
>> Kind regards,
>> Udo
>>
>>
>> On 13-10-2020 11:24, Udo van den Heuvel wrote:
>>> Hello,
>>>
>>> While looking at the 5.9 kernel config I noticed there is no easy way to
>>> disable LED support in general.
>>> There's this NEW_LEDS thing that is not shown, etc.
>>> So I get:
>>>
>>> # make oldconfig
>>> scripts/kconfig/conf  --oldconfig Kconfig
>>> *
>>> * Restart config...
>>> *
>>> *
>>> * LED Support
>>> *
>>> LED Support (NEW_LEDS) [Y/?] (NEW) y
>>>   LED Class Support (LEDS_CLASS) [M/y/?] (NEW) n
>>>
>>> CONFIG_LEDS_CLASS:
>>>
>>> This option enables the LED sysfs class in /sys/class/leds.  You'll
>>> need this to do anything useful with LEDs.  If unsure, say N.
>>>
>>> Symbol: LEDS_CLASS [=m]
>>> Type  : tristate
>>> Defined at drivers/leds/Kconfig:17
>>>   Prompt: LED Class Support
>>>   Depends on: NEW_LEDS [=y]
>>>   Location:
>>>     -> Device Drivers
>>>       -> LED Support (NEW_LEDS [=y])
>>> Selected by [m]:
>>>   - SND_HDA_GENERIC [=m] && SOUND [=y] && !UML && SND [=m] && SND_HDA
>>> [=m] && SND_HDA_GENERIC_LEDS [=y]
>>> Selected by [n]:
>>>   - TS5500 [=n] && X86_32 [=n] && MELAN [=n]
>>>   - ADB_PMU_LED [=n] && MACINTOSH_DRIVERS [=n] && PPC_PMAC && ADB_PMU [=n]
>>>   - ATH5K [=n] && NETDEVICES [=y] && WLAN [=n] && WLAN_VENDOR_ATH [=n]
>>> && (PCI [=y] || ATH25) && MAC80211 [=n]
>>>   - ATH9K [=n] && NETDEVICES [=y] && WLAN [=n] && WLAN_VENDOR_ATH [=n]
>>> && MAC80211 [=n] && HAS_DMA [=y]
>>>   - ATH9K_HTC [=n] && NETDEVICES [=y] && WLAN [=n] && WLAN_VENDOR_ATH
>>> [=n] && USB [=y] && MAC80211 [=n]
>>>   - CARL9170_LEDS [=n] && NETDEVICES [=y] && WLAN [=n] &&
>>> WLAN_VENDOR_ATH [=n] && CARL9170 [=n]
>>>   - BRCMSMAC [=n] && NETDEVICES [=y] && WLAN [=n] &&
>>> WLAN_VENDOR_BROADCOM [=n] && MAC80211 [=n] && BCMA_POSSIBLE [=y] &&
>>> BCMA_DRIVER_GPIO [=n]
>>>   - IWLEGACY [=n] && NETDEVICES [=y] && WLAN [=n] && WLAN_VENDOR_INTEL [=n]
>>>   - INPUT_WISTRON_BTNS [=n] && !UML && INPUT [=y] && INPUT_MISC [=y] &&
>>> X86_32 [=n]
>>>   - SENSORS_APPLESMC [=n] && HWMON [=y] && INPUT [=y] && X86 [=y]
>>>   - IR_REDRAT3 [=n] && RC_DEVICES [=n] && USB_ARCH_HAS_HCD [=y] &&
>>> RC_CORE [=n]
>>>   - IR_WINBOND_CIR [=n] && RC_DEVICES [=n] && (X86 [=y] && PNP [=y] ||
>>> COMPILE_TEST [=n]) && RC_CORE [=n]
>>>   - IR_TTUSBIR [=n] && RC_DEVICES [=n] && USB_ARCH_HAS_HCD [=y] &&
>>> RC_CORE [=n]
>>>   - BACKLIGHT_ADP8860 [=n] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE
>>> [=y] && I2C [=y]
>>>   - BACKLIGHT_ADP8870 [=n] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE
>>> [=y] && I2C [=y]
>>>   - BACKLIGHT_LM3639 [=n] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE
>>> [=y] && I2C [=y]
>>>   - SND_USB_TONEPORT [=n] && SOUND [=y] && !UML && SND [=m] && SND_USB
>>> [=y] && USB [=y]
>>>   - HID_LENOVO [=n] && INPUT [=y] && HID [=y]
>>>   - HID_WACOM [=n] && INPUT [=y] && HID [=y] && USB_HID [=m]
>>>   - HUAWEI_WMI [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] &&
>>> ACPI_BATTERY [=n] && ACPI_WMI [=n] && INPUT [=y]
>>>   - ACER_WMI [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI [=y]
>>> && BACKLIGHT_CLASS_DEVICE [=y] && SERIO_I8042 [=y] && INPUT [=y] &&
>>> (RFKILL [=n] || RFKILL [=n]=n) && ACPI_WMI [=n]
>>>   - ASUS_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && BACKLIGHT_CLASS_DEVICE [=y] && INPUT [=y] && (RFKILL [=n] ||
>>> RFKILL [=n]=n) && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n)
>>>   - ASUS_WIRELESS [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && INPUT [=y]
>>>   - ASUS_WMI [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI_WMI
>>> [=n] && ACPI_BATTERY [=n] && INPUT [=y] && HWMON [=y] &&
>>> BACKLIGHT_CLASS_DEVICE [=y] && (RFKILL [=n] || RFKILL [=n]=n) &&
>>> HOTPLUG_PCI [=n] && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n)
>>>   - EEEPC_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && INPUT [=y] && (RFKILL [=n] || RFKILL [=n]=n) && (ACPI_VIDEO [=n]
>>> || ACPI_VIDEO [=n]=n) && HOTPLUG_PCI [=n] && BACKLIGHT_CLASS_DEVICE [=y]
>>>   - DELL_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && DMI
>>> [=y] && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] || ACPI_VIDEO
>>> [=n]=n) && (RFKILL [=n] || RFKILL [=n]=n) && SERIO_I8042 [=y] &&
>>> DELL_SMBIOS [=n]
>>>   - FUJITSU_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && INPUT [=y] && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] ||
>>> ACPI_VIDEO [=n]=n)
>>>   - HP_ACCEL [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && INPUT [=y]
>>> && ACPI [=y] && SERIO_I8042 [=y]
>>>   - THINKPAD_ACPI [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && ACPI_BATTERY [=n] && INPUT [=y] && (RFKILL [=n] || RFKILL
>>> [=n]=n) && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n) &&
>>> BACKLIGHT_CLASS_DEVICE [=y]
>>>   - SAMSUNG_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] &&
>>> (RFKILL [=n] || RFKILL [=n]=n) && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n)
>>> && BACKLIGHT_CLASS_DEVICE [=y]
>>>   - ACPI_TOSHIBA [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && ACPI_WMI [=n] && BACKLIGHT_CLASS_DEVICE [=y] && INPUT [=y] &&
>>> (SERIO_I8042 [=y] || SERIO_I8042 [=y]=n) && (ACPI_VIDEO [=n] ||
>>> ACPI_VIDEO [=n]=n) && (RFKILL [=n] || RFKILL [=n]=n) && IIO [=n]
>>>   - LG_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI [=y]
>>> && ACPI_WMI [=n] && INPUT [=y]
>>>   - SYSTEM76_ACPI [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI [=y]
>>>   - TOPSTAR_LAPTOP [=n] && X86 [=y] && X86_PLATFORM_DEVICES [=n] && ACPI
>>> [=y] && INPUT [=y]
>>>
>>>
>>> And there is no 'n' option. None of the devices as dependencies (on the
>>> left) are enabled.
>>> SND_HDA_GENERIC_LEDS is automagically enabled and disabling it via vi is
>>> no option.
>>> So how do I disable this stuff?
>>>
>>> Kind regards,
>>> Udo

Hi,

I was able to disable LEDS_CLASS and NEW_LEDS after I disabled the following
config symbols:


--- xx64/config-def64	2020-10-13 08:53:56.050501724 -0700
+++ xx64/.config	2020-10-13 08:58:12.439205389 -0700
-CONFIG_MAC80211_LEDS=y
-CONFIG_RFKILL_LEDS=y
-# CONFIG_LED_TRIGGER_PHY is not set
-CONFIG_INPUT_LEDS=y
-# CONFIG_HID_LED is not set
-# CONFIG_USB_LED_TRIG is not set
-# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_EEEPC_LAPTOP=y
+# CONFIG_EEEPC_LAPTOP is not set

This last one was the biggest problem for me.
I started with x86_64 defconfig.


-- 
~Randy

