Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3C713DEBB
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2020 16:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgAPPZH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jan 2020 10:25:07 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42712 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgAPPZH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jan 2020 10:25:07 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GFOx7b098767;
        Thu, 16 Jan 2020 09:24:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579188299;
        bh=Tf129wgmRT3W3nq93jyOsnWCVa9uRqpmqZ5E47xgQ1A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=D0yRpziaqpENz0Vs/lLN+sAJbzEerf6STQwQsDywZQYTOkqmo+U8eb53JnG7+BiPE
         slvLazi/1i7U4iSFSi0CvHA3avvPQvvYVh1sBU92qs/mbDT71ZMuoRgSPImB4i/900
         eru/u4a54tJMTpq1Wv8ZwjX8UCJ/B4Gec2vjiyHs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GFOxc9102915
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 09:24:59 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 09:24:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 09:24:59 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GFOwbq125808;
        Thu, 16 Jan 2020 09:24:58 -0600
Subject: Re: [PATCH] leds: add SGI IP30 led support
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20200115130536.11453-1-tbogendoerfer@suse.de>
 <b5bf7941-3fc1-641d-5482-509eeae34eac@ti.com>
 <20200116120545.2f4a907b9ddda84e76e445e1@suse.de>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <4a6dd4c6-4719-6662-a5ac-eef9a4112c2e@ti.com>
Date:   Thu, 16 Jan 2020 09:21:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116120545.2f4a907b9ddda84e76e445e1@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thomas

On 1/16/20 5:05 AM, Thomas Bogendoerfer wrote:
> On Wed, 15 Jan 2020 07:46:13 -0600
> Dan Murphy <dmurphy@ti.com> wrote:
>
>> Thomas
>>
>> On 1/15/20 7:05 AM, Thomas Bogendoerfer wrote:
>>> This patch implemenets a driver to support the front panel LEDs of
>>> SGI Octane (IP30) workstations.
>> Thanks for the patch
>>
>> Some nitpicks below
>>
>>
>>> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>>> ---
>>>    drivers/leds/Kconfig     | 11 ++++++
>>>    drivers/leds/Makefile    |  1 +
>>>    drivers/leds/leds-ip30.c | 82 ++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 94 insertions(+)
>>>    create mode 100644 drivers/leds/leds-ip30.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 4b68520ac251..8ef0fe900928 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -836,6 +836,17 @@ config LEDS_LM36274
>>>    	  Say Y to enable the LM36274 LED driver for TI LMU devices.
>>>    	  This supports the LED device LM36274.
>>>    
>>> +config LEDS_IP30
>>> +	tristate "LED support for SGI Octane machines"
>>> +	depends on LEDS_CLASS
>>> +	depends on SGI_MFD_IOC3
>> What is the dependency on the MFD?
> the gpio lines where the leds are connected are managed by the mfd ioc3 driver.
> So without that driver this led driver will not be started.
Ack
>
>>> +
>>> +
>>> +	if (num == 0) {
>>> +		data->cdev.name = "ip30:white";
>> This also needs a function as defined in dt-bindings/common.h
>>> +		data->cdev.default_trigger = "default-on";
>> The name, color, function and trigger can be pulled from the DT or Firmware.
>>
>> The firmware should contain a node for each LED to be configured.
> SGI Octanes don't have DT and the firmware just toggles some of the leds,
> but doesn't provide informations about it. That's why this is hardcoded
> in the driver. The MFD driver detects the ioc3 chip and knows it's a
> SGI Octane mainboard and creates the led platform device.
>
> How is the correct way to this without DT ?

Please refer to the leds-class document (1) under LED device naming 
convention

If you don't have a DT then set the name accordingly.  The functions are 
defined in the common.h and the colors are exported in the leds-class driver


1 https://www.kernel.org/doc/Documentation/leds/leds-class.rst

>
>>> +	} else {
>>> +		data->cdev.name = "ip30:red";
>> Same as above
>>> +		data->cdev.default_trigger = "panic";
>>> +		writel(0, data->reg);
>> Is the LED on by default?
> Depends on the hardware state. If PROM firmware detects some hardware issues,
> it turns on the red LED. Otherwise it's off.

So why would we turn it off if the PROM FW turned it on?

Dan


