Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907182A3304
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 19:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgKBSai (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 13:30:38 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47366 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgKBSai (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 13:30:38 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A2IU65f075772;
        Mon, 2 Nov 2020 12:30:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604341806;
        bh=eyikvyOADXRmirW8NUXz20t+vqM77BxXUZpx1lg31Aw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JMK1sYJavYyvttH9hBYlQVtvuHh2Ato7nnuy4s7QJuAdFb/LRnob/ap/8QXocHU1A
         CZ5KWA232p5kYBGNF56PO2JvlcoQdKLKgyjGNZNnvvRS99FTEKfYQCfXN6PvslKkhl
         1BBT9Jw7+AYnSEJ1JDp1UifdpKbRg1OjS+a1UfpA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A2IU6Ya054554
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Nov 2020 12:30:06 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 2 Nov
 2020 12:30:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 2 Nov 2020 12:30:05 -0600
Received: from [10.250.36.55] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A2IU5AF082833;
        Mon, 2 Nov 2020 12:30:05 -0600
Subject: Re: [PATCH v7 0/6] Add support for the IEI WT61P803 PUZZLE MCU
To:     Luka Kovacic <luka.kovacic@sartura.hr>, Pavel Machek <pavel@ucw.cz>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>
References: <20201025005916.64747-7-luka.kovacic@sartura.hr>
 <20201025005916.64747-6-luka.kovacic@sartura.hr>
 <20201025005916.64747-5-luka.kovacic@sartura.hr>
 <20201025005916.64747-4-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr>
 <20201025005916.64747-2-luka.kovacic@sartura.hr>
 <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201029180105.GD26053@duo.ucw.cz>
 <CADZsf3YE3d=dtMVVYHL91Z1WFcpNN4vyJJ6RG7VnJ2V-DqE+wQ@mail.gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7821443b-ddbc-fc92-b990-14d116dda853@ti.com>
Date:   Mon, 2 Nov 2020 12:29:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADZsf3YE3d=dtMVVYHL91Z1WFcpNN4vyJJ6RG7VnJ2V-DqE+wQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 11/1/20 3:56 AM, Luka Kovacic wrote:
> Hello Pavel,
>
> On Thu, Oct 29, 2020 at 7:01 PM Pavel Machek <pavel@ucw.cz> wrote:
>> Hi!
>>
>>> +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
>>> +Date:                September 2020
>>> +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
>>> +Description: (RO) Power status indicates the host platform power on method.
>>> +             Value mapping (bitwise list):
>>> +             0x80 - Null
>>> +             0x40 - Firmware flag
>>> +             0x20 - Power loss detection flag (powered off)
>>> +             0x10 - Power loss detection flag (AC mode)
>>> +             0x08 - Button power on
>>> +             0x04 - WOL power on
>>> +             0x02 - RTC alarm power on
>>> +             0x01 - AC recover power on
>> It would be nice to put this into standard place somewhere. Many
>> machines will want to expose this information.
> As this is specific to this microcontroller and to how it encodes
> these values, I don't see a need to change this.
> This isn't used anywhere else.
>
>> If not, at least spell out WoL, as it is not that common of acronym.
> Okay.

WoL is a very common acronym especially in the networking space

But the overall this section does not make sense

The description says that it indicates platform power on method but what 
is NULL power on? There are flags for power loss detection.

Does the RTC mean that the processor real time clock woke up the uC? Or 
that the internal RTC woke up the controller?

And for the 
/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status 
what are those values?

It seems like some ABI's are documented well with formats and others are 
just described without a format.

For instance

/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/version the format 
of this version is not described but 
/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/build_info is.


Dan

