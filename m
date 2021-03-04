Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E71C32D489
	for <lists+linux-leds@lfdr.de>; Thu,  4 Mar 2021 14:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241530AbhCDNtH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Mar 2021 08:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60527 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241535AbhCDNtF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Mar 2021 08:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614865659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vckiuo5o0lbsf+iCp4TD+mlnrNoZKeBTtEoYHD3gcKU=;
        b=ZqVVsdoZ4VxLPdZzfY9skyL8AXzZP9CnvNWaA5UQHn1WmgVcMEind3/jtSmvK1oX7SujOE
        U6kt7+ieaeXxWj6BT1EtTJmrsheL/nwWPSSbk0x0FIJGwUsmpcWl5YsL6aIQRutcc0lFZj
        gzQHCIyQYILCpOz63gXLkNqiTPSzEgw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-fZAkRPrnO1ybcwXJNjspGw-1; Thu, 04 Mar 2021 08:47:38 -0500
X-MC-Unique: fZAkRPrnO1ybcwXJNjspGw-1
Received: by mail-ed1-f72.google.com with SMTP id h2so9499139edw.10
        for <linux-leds@vger.kernel.org>; Thu, 04 Mar 2021 05:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vckiuo5o0lbsf+iCp4TD+mlnrNoZKeBTtEoYHD3gcKU=;
        b=OJjLUeVtqmIGTu95Q9LL9rXdI0Fzp5CO/oKJXunyQA5ov53J8G9X0vSS4r2bokocxj
         fTsgqU/LAJECffeaP1PfPNySk5XCTQen8G5MEv1SP4NjMRX7kbMVqcQIwZ+DM0TZkO9l
         L4BDrnFmGHn/OpCQxTPNYp63vyiSVr7kFwfEVznrQMpfXrkwPPQ4s7QoO5zYur14sJX+
         SDAIDLpaIKLLGIoTtjk/52bo0KCzE4j+0b9ReK0gSMWwPpQ15wO17BnoNAerFKKv5JvY
         1SEB3JNbTKvU+2ODGZR/1448Na4qOZrzm+C6fZKr0lnOGsiFNNyYsW9HPQ8vJ5f1tY3o
         /eag==
X-Gm-Message-State: AOAM530UbKYs96QQgtC7KCCiNB4kBviXSbA7nJZSFQG8/AUpEEnl+IXz
        Ko9A49XR0YPAYdB6RW9QaQ7QeEeg2KKYbV+4FWFH9YfdTjcpWzgFbzwbjAgFI2NWXq4lkBWfc39
        MmbVTSLQh7aNiRBg80j2FeQ==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr4333419edr.16.1614865657197;
        Thu, 04 Mar 2021 05:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3J+jtz/N74ECvDEpaxRsank0/rYMS/bHniqXvZ9EmFDKyhJ0wsME+zu5fV5pVHJDTZTQ1Gg==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr4333397edr.16.1614865656987;
        Thu, 04 Mar 2021 05:47:36 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ld19sm1373084ejb.102.2021.03.04.05.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:47:36 -0800 (PST)
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com>
 <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
Date:   Thu, 4 Mar 2021 14:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/4/21 11:11 AM, Andy Shevchenko wrote:
> On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
> <henning.schild@siemens.com> wrote:
>>
>> From: Henning Schild <henning.schild@siemens.com>
>>
>> This mainly implements detection of these devices and will allow
>> secondary drivers to work on such machines.
>>
>> The identification is DMI-based with a vendor specific way to tell them
>> apart in a reliable way.
>>
>> Drivers for LEDs and Watchdogs will follow to make use of that platform
>> detection.
> 
>> Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> 
> The order is wrong taking into account the From line in the body. So,
> it's not clear who is the author, who is a co-developer, and who is
> the committer (one person may utilize few roles).
> Check for the rest of the series as well (basically this is the rule
> of thumb to recheck entire code for the comment you have got at any
> single place of it).
> 
> ...
> 
>> +config SIEMENS_SIMATIC_IPC
>> +       tristate "Siemens Simatic IPC Class driver"
>> +       depends on PCI
>> +       help
>> +         This Simatic IPC class driver is the central of several drivers. It
>> +         is mainly used for system identification, after which drivers in other
>> +         classes will take care of driving specifics of those machines.
>> +         i.e. leds and watchdogs
> 
> LEDs
> watchdog. (missed period and singular form)
> 
> Module name?
> 
>>  endif # X86_PLATFORM_DEVICES
> 
> Not sure about the ordering of the section in Kconfig, but it is up to
> maintainers.
> 
> ...
> 
>> +# Siemens Simatic Industrial PCs
>> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC)      += simatic-ipc.o
> 
> Ditto.
> 
> ...
> 
>> + * Siemens SIMATIC IPC driver for LEDs
> 
> It seems to be used in patch 4 which is not LED related. Also, why is
> it here if it's for LEDs?
> 
> ...
> 
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
> 
> Replace with SPDX
> 
> ...
> 
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
> 
> Ordered?
> 
>> +#include <linux/platform_data/x86/simatic-ipc.h>
> 
> ...
> 
>> +static int register_platform_devices(u32 station_id)
>> +{
>> +       int i;
>> +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
>> +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
> 
> Reversed xmas tree order?
> 
>> +       platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
>> +               if (device_modes[i].station_id == station_id) {
>> +                       ledmode = device_modes[i].led_mode;
>> +                       wdtmode = device_modes[i].wdt_mode;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
>> +               platform_data.devmode = ledmode;
> 
>> +               ipc_led_platform_device = platform_device_register_data
>> +                       (NULL, KBUILD_MODNAME "_leds", PLATFORM_DEVID_NONE,
>> +                        &platform_data, sizeof(struct simatic_ipc_platform));
> 
> Strange indentation (second line).
> 
>> +               if (IS_ERR(ipc_led_platform_device))
>> +                       return PTR_ERR(ipc_led_platform_device);
> 
>> +               pr_debug(KBUILD_MODNAME ": device=%s created\n",
>> +                        ipc_led_platform_device->name);
> 
> Utilize pr_fmt() instead of adding prefixes like this.
> 
>> +       }
> 
>> +       if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
>> +               platform_data.devmode = wdtmode;
>> +               ipc_wdt_platform_device = platform_device_register_data
>> +                       (NULL, KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
>> +                        &platform_data, sizeof(struct simatic_ipc_platform));
>> +               if (IS_ERR(ipc_wdt_platform_device))
>> +                       return PTR_ERR(ipc_wdt_platform_device);
>> +
>> +               pr_debug(KBUILD_MODNAME ": device=%s created\n",
>> +                        ipc_wdt_platform_device->name);
>> +       }
> 
> Same comments as above.
> 
>> +       if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
>> +           wdtmode == SIMATIC_IPC_DEVICE_NONE) {
>> +               pr_warn(KBUILD_MODNAME
>> +                       ": unsupported IPC detected, station id=%08x\n",
>> +                       station_id);
> 
> Ugly indentation. With pr_fmt() in use will be much better.
> 
>> +               return -EINVAL;
> 
>> +       } else {
> 
> Redundant.
> 
>> +               return 0;
>> +       }
>> +}
> 
> ...
> 
>> +/*
>> + * Get membase address from PCI, used in leds and wdt modul. Here we read
>> + * the bar0. The final address calculation is done in the appropriate modules
> 
> bar -> BAR
> Missed period.
> 
>> + */
> 
>> +
> 
> Unneeded blank line.
> 
>> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
>> +{
>> +       u32 bar0 = 0;
> 
>> +#ifdef CONFIG_PCI
> 
> It's ugly besides the fact that you have a dependency.
> 
>> +       struct pci_bus *bus;
> 
> Missed blank line.
> 
>> +       /*
>> +        * The GPIO memory is bar0 of the hidden P2SB device. Unhide the device
>> +        * to have a quick look at it, before we hide it again.
>> +        * Also grab the pci rescan lock so that device does not get discovered
>> +        * and remapped while it is visible.
>> +        * This code is inspired by drivers/mfd/lpc_ich.c
>> +        */
>> +       bus = pci_find_bus(0, 0);
>> +       pci_lock_rescan_remove();
>> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
>> +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
>> +
>> +       bar0 &= ~0xf;
>> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
>> +       pci_unlock_rescan_remove();
>> +#endif /* CONFIG_PCI */
>> +       return bar0;
>> +}
>> +EXPORT_SYMBOL(simatic_ipc_get_membase0);
> 
> Oy vey! I know what this is and let's do it differently. I have some
> (relatively old) patch series I can send you privately for testing.

This bit stood out the most to me too, it would be good if we can this fixed
in some cleaner work. So I'm curious how things will look with Andy's work
integrated.

Also I don't think this should be exported. Instead this (or its replacement)
should be used to get the address for an IOMEM resource to add the platform 
devices when they are instantiated. Then the platform-dev drivers can just
use the regular functions to get their resources instead of relying on this
module.

Regards,

Hans




> 
> ...
> 
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
> 
> Not needed when you have SPDX.
> 
> ...
> 
>> +#include <linux/pci.h>
> 
> Wrong header. Should be types.h
> 
> ...
> 
>> +#include <linux/dmi.h>
>> +#include <linux/platform_data/x86/simatic-ipc-base.h>
> 
> Missed headers. You need to include ones that the code below is a
> direct user of.
> 
> Like types.h
> 

