Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D4033F9AC
	for <lists+linux-leds@lfdr.de>; Wed, 17 Mar 2021 21:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbhCQUD2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Mar 2021 16:03:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47979 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233351AbhCQUDN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 17 Mar 2021 16:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616011392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HwJ9TXTu++FXWJPVVeBtvy+lQhOEWQWY2oBpOepSq6I=;
        b=Q/j4CfltEC89VAatrd+32fELhgJJcTrSsLIqsKgvLeWQ2mRp5OaOtXdUt4DXZHIUojOnni
        2DrjrQUV6ngJgRQ0oP0jaqouJNh+rNg6gMpD6zzdkmh8rHzGWeZv4XE9KZf4TmLZT/M7Qq
        kPmoHmxDz5xZAnCtj+cE4qvwyOnGd0k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-1KSsKr_gPra4OrPiyTwbKg-1; Wed, 17 Mar 2021 16:03:10 -0400
X-MC-Unique: 1KSsKr_gPra4OrPiyTwbKg-1
Received: by mail-ed1-f69.google.com with SMTP id f9so15654290edd.13
        for <linux-leds@vger.kernel.org>; Wed, 17 Mar 2021 13:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HwJ9TXTu++FXWJPVVeBtvy+lQhOEWQWY2oBpOepSq6I=;
        b=k/Y7ssudgoHJllp7yOECZ0i3EcexH0uK24g6FVFhLbhSoH8nFjIeVcv9jhhk9Bga91
         Y0oXLwiTs3K3O9ZPrJfxxWV4Coh0EoGojxjjI9PFGEGw7gB7RZGpeyAOKyczt1P59L7f
         ervluEzzAxWykf4dUst0otk7oHb29zzfDtmz6tlMx2gHYdrpd36m5+Tz4AADfIQH84vX
         0t0Mgv3Oa9mhLT/jd6oSnIRXAuamrpZhEQ1HJrdUREKv1YQRhCYp02AyBFmkhuYY2TWK
         Rjlq0MPm+mdPZ59dybs7Mdiu1qWwpimpa4PRgp5q33RJcHaTh+7muLi0VW/iuLJTubil
         eyFg==
X-Gm-Message-State: AOAM530XWAHLlAczqkCoo5yMIFr860OhrnsfUEzgJXz+okZ2VTcIAgEX
        b1oumFtZT/lGtjKC/QFybl5lnA2ceKQ62deEbttBJci/6urmbXpqs6YaYNP0Hw5zejDEVukYtt7
        7II2gUq4C9e9bPd9Y5fa4Rg==
X-Received: by 2002:a05:6402:1115:: with SMTP id u21mr44199728edv.383.1616011389263;
        Wed, 17 Mar 2021 13:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo4c8JjgJKYU4UbOZ7P7IHLU7WgoQ+vXAgJua3OZItOXAYRcju0/gF7IIHAJjnPsNY6k8hcQ==
X-Received: by 2002:a05:6402:1115:: with SMTP id u21mr44199693edv.383.1616011389050;
        Wed, 17 Mar 2021 13:03:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n16sm12252728ejy.35.2021.03.17.13.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 13:03:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Henning Schild <henning.schild@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
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
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-2-henning.schild@siemens.com>
 <CAHp75VdXDcTfNL9QRQ5XE-zVLHacfMKHUxhse3=dAfJbOJdObQ@mail.gmail.com>
 <20210317201311.70528fd4@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <92080a68-9029-3103-9240-65c92d17bf16@redhat.com>
Date:   Wed, 17 Mar 2021 21:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317201311.70528fd4@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/17/21 8:13 PM, Henning Schild wrote:
> Am Mon, 15 Mar 2021 12:31:11 +0200
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> 
>> On Mon, Mar 15, 2021 at 12:02 PM Henning Schild
>> <henning.schild@siemens.com> wrote:
>>>
>>> This mainly implements detection of these devices and will allow
>>> secondary drivers to work on such machines.
>>>
>>> The identification is DMI-based with a vendor specific way to tell
>>> them apart in a reliable way.
>>>
>>> Drivers for LEDs and Watchdogs will follow to make use of that
>>> platform detection.  
>>
>> ...
>>
>>> +static int register_platform_devices(u32 station_id)
>>> +{
>>> +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
>>> +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
>>> +       int i;
>>> +
>>> +       platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
>>> +
>>> +       for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
>>> +               if (device_modes[i].station_id == station_id) {
>>> +                       ledmode = device_modes[i].led_mode;
>>> +                       wdtmode = device_modes[i].wdt_mode;
>>> +                       break;
>>> +               }
>>> +       }
>>> +
>>> +       if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
>>> +               platform_data.devmode = ledmode;
>>> +               ipc_led_platform_device =
>>> +                       platform_device_register_data(NULL,
>>> +                               KBUILD_MODNAME "_leds",
>>> PLATFORM_DEVID_NONE,
>>> +                               &platform_data,
>>> +                               sizeof(struct
>>> simatic_ipc_platform));
>>> +               if (IS_ERR(ipc_led_platform_device))
>>> +                       return PTR_ERR(ipc_led_platform_device);
>>> +
>>> +               pr_debug("device=%s created\n",
>>> +                        ipc_led_platform_device->name);
>>> +       }
>>> +
>>> +       if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
>>> +               platform_data.devmode = wdtmode;
>>> +               ipc_wdt_platform_device =
>>> +                       platform_device_register_data(NULL,
>>> +                               KBUILD_MODNAME "_wdt",
>>> PLATFORM_DEVID_NONE,
>>> +                               &platform_data,
>>> +                               sizeof(struct
>>> simatic_ipc_platform));
>>> +               if (IS_ERR(ipc_wdt_platform_device))
>>> +                       return PTR_ERR(ipc_wdt_platform_device);
>>> +
>>> +               pr_debug("device=%s created\n",
>>> +                        ipc_wdt_platform_device->name);
>>> +       }
>>> +
>>> +       if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
>>> +           wdtmode == SIMATIC_IPC_DEVICE_NONE) {
>>> +               pr_warn("unsupported IPC detected, station
>>> id=%08x\n",
>>> +                       station_id);
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       return 0;
>>> +}  
>>
>> Why not use MFD here?
> 
> Never had a close look at mfd to be honest. I might
> 
> With the custom dmi matching on 129 being part of the header, and the
> p2sb unhide moving out as well ... that first driver ends up being not
> too valuable indeed
> 
> It just identifies the box and tells subsequent drivers which one it
> is, which watchdog and LED path to take. Moving the knowledge of which
> box has which LED/watchdog into the respective drivers seems to be the
> better way to go.
> 
> So we would end up with a LED and a watchdog driver both
> MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");
> and doing the identification with the inline dmi from that header,
> doing p2sb with the support to come ... possibly a "//TODO\ninline" in
> the meantime.
> 
> So no "main platform" driver anymore, but still central platform
> headers.
> 
> Not sure how this sounds, but i think making that change should be
> possible. And that is what i will try and go for in v3.

Dropping the main drivers/platform/x86 driver sounds good to me,
I was already wondering a bit about its function since it just
instantiates devs to which the other ones bind to then instantiate
more devs (in the LED case).

Regards,

Hans


>> ...
>>
>>> +/*
>>> + * Get membase address from PCI, used in leds and wdt modul. Here
>>> we read
>>> + * the bar0. The final address calculation is done in the
>>> appropriate modules
>>> + */  
>>
>> No blank line here.
>>
>> I would add FIXME or REVISIT here to point out that this should be
>> deduplicated in the future.
>>
>>> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
>>> +{
>>> +       struct pci_bus *bus;
>>> +       u32 bar0 = 0;
>>> +
>>> +       /*
>>> +        * The GPIO memory is bar0 of the hidden P2SB device.
>>> Unhide the device  
>>
>> No, it's not a GPIO's bar. It's P2SB's one. GPIO resides in that bar
>> somewhere.
>>
>>> +        * to have a quick look at it, before we hide it again.
>>> +        * Also grab the pci rescan lock so that device does not
>>> get discovered
>>> +        * and remapped while it is visible.
>>> +        * This code is inspired by drivers/mfd/lpc_ich.c
>>> +        */
>>> +       bus = pci_find_bus(0, 0);
>>> +       pci_lock_rescan_remove();
>>> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
>>> +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0,
>>> &bar0); +
>>> +       bar0 &= ~0xf;
>>> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
>>> +       pci_unlock_rescan_remove();
>>> +
>>> +       return bar0;
>>> +}
>>> +EXPORT_SYMBOL(simatic_ipc_get_membase0);  
>>
>> ...
>>
>>> +static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
>>> +{
>>> +       u32 station_id = SIMATIC_IPC_INVALID_STATION_ID;
>>> +       int i;  
>>
>> Reversed xmas tree order, please.
>>
>>> +       struct {
>>> +               u8      type;           /* type (0xff = binary) */
>>> +               u8      len;            /* len of data entry */
>>> +               u8      reserved[3];
>>> +               u32     station_id;     /* station id (LE) */  
>>
>>> +       } __packed
>>> +       *data_entry = (void *)data + sizeof(struct dmi_header);  
>>
>> Can be one line.
>>
>>> +       /* find 4th entry in OEM data */
>>> +       for (i = 0; i < 3; i++)  
>>
>> 3 is magic!
>>
>>> +               data_entry = (void *)((u8 *)(data_entry) +
>>> data_entry->len); +
>>> +       /* decode station id */
>>> +       if (data_entry && (u8 *)data_entry < data + max_len &&
>>> +           data_entry->type == 0xff && data_entry->len == 9)
>>> +               station_id = le32_to_cpu(data_entry->station_id);
>>> +
>>> +       return station_id;
>>> +}  
>>
> 

