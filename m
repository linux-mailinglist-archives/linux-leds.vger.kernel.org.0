Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF23A2A33A3
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 20:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgKBTFW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 14:05:22 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55634 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKBTFW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 14:05:22 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A2J4tCK090030;
        Mon, 2 Nov 2020 13:04:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604343895;
        bh=5tRMuI4IpHf1UGKQ0FX7HKxoAuFmHgXM+99BquEoqeQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ggelSvtgDDRuW4CMvo+Iw9Izw7BC+WSigYtaq1xtzvG53MXaKDO0L9pH4kAXD1Q+d
         xki3YeA1fTtwYc1oeabLOND5+E/2cZBvZ1Sx0Z+1kcqytpAr8E0ENOf4g3ixruZS+C
         S9UERohYSzHi4Lw/TVOGoWrBVfFlRsj11B7d4SwU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A2J4tqC110866
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Nov 2020 13:04:55 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 2 Nov
 2020 13:04:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 2 Nov 2020 13:04:55 -0600
Received: from [10.250.36.55] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A2J4sru015342;
        Mon, 2 Nov 2020 13:04:54 -0600
Subject: Re: [PATCH v7 0/6] Add support for the IEI WT61P803 PUZZLE MCU
To:     Pavel Machek <pavel@ucw.cz>
CC:     Luka Kovacic <luka.kovacic@sartura.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
 <7821443b-ddbc-fc92-b990-14d116dda853@ti.com>
 <20201102190335.GA25451@duo.ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3d9058ca-d64e-5e55-d032-5860456e5d9a@ti.com>
Date:   Mon, 2 Nov 2020 13:04:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102190335.GA25451@duo.ucw.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 11/2/20 1:03 PM, Pavel Machek wrote:
> On Mon 2020-11-02 12:29:59, Dan Murphy wrote:
>> Hello
>>
>> On 11/1/20 3:56 AM, Luka Kovacic wrote:
>>> Hello Pavel,
>>>
>>> On Thu, Oct 29, 2020 at 7:01 PM Pavel Machek <pavel@ucw.cz> wrote:
>>>> Hi!
>>>>
>>>>> +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
>>>>> +Date:                September 2020
>>>>> +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
>>>>> +Description: (RO) Power status indicates the host platform power on method.
>>>>> +             Value mapping (bitwise list):
>>>>> +             0x80 - Null
>>>>> +             0x40 - Firmware flag
>>>>> +             0x20 - Power loss detection flag (powered off)
>>>>> +             0x10 - Power loss detection flag (AC mode)
>>>>> +             0x08 - Button power on
>>>>> +             0x04 - WOL power on
>>>>> +             0x02 - RTC alarm power on
>>>>> +             0x01 - AC recover power on
>>>> It would be nice to put this into standard place somewhere. Many
>>>> machines will want to expose this information.
>>> As this is specific to this microcontroller and to how it encodes
>>> these values, I don't see a need to change this.
>>> This isn't used anywhere else.
>>>
>>>> If not, at least spell out WoL, as it is not that common of acronym.
>>> Okay.
>> WoL is a very common acronym especially in the networking space
> WoL is common. WOL is not. Better spell it out.

Agreed. Especially if WOL does not mean Wake On Lan

Dan


