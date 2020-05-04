Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0892A1C4878
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 22:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgEDUkm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 16:40:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42316 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgEDUkl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 16:40:41 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044Kea0K089197;
        Mon, 4 May 2020 15:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588624836;
        bh=lv6TC7aSuO22gPGDe/fPeNjVbeZdq1DIoXMXrdKh8oc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uiOiwfTg6Vg1HE0GMb8a7h/rnCIqmiQxXPtU44Br8gQb6mcRN4+MwvZorRoupKWar
         VOsoeMLjCiy4QD+UKfj+u7+/wSspvejGmutCxWY9f46ImjY81B5J1xX6Qjo8l75u4f
         fd46BDaBNZYpY+vAOinbq/RWGl0nX9sA9ht5vUx4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044KeaCn078149
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 May 2020 15:40:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 15:40:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 15:40:36 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044Kea77031863;
        Mon, 4 May 2020 15:40:36 -0500
Subject: Re: [PATCH v24 02/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200503123215.6449-1-dmurphy@ti.com>
 <20200503123215.6449-3-dmurphy@ti.com>
 <b33c83a2-4cf1-7137-74d9-7e1cb8b00737@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <33114e81-e276-4659-c667-c9a3d61265c9@ti.com>
Date:   Mon, 4 May 2020 15:31:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b33c83a2-4cf1-7137-74d9-7e1cb8b00737@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/4/20 3:31 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 5/3/20 2:32 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via the intensity file and the latter is controlled
>> via brightness file.
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
> [...]
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,17 @@ config LEDS_CLASS_FLASH
>>         for the flash related features of a LED device. It can be built
>>         as a module.
>>   +config LEDS_CLASS_MULTI_COLOR
>> +    tristate "LED MultiColor LED Class Support"
>> +    depends on LEDS_CLASS
>> +    depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>
> I was saying about adding this dependency to the drivers based on
> LED mc class. This way it does not make any sense. Moreover it is
> erroneous:
>
> $ make menuconfig
> drivers/leds/Kconfig:33:error: recursive dependency detected!
>
> Instead you should add it to the Kconfig entries of all drivers
> that depend on LED mc class, i.e.:
>
> - config LEDS_LP50XX
> - config LEDS_LP5521
> - config LEDS_LP5523
>
> Moreover there are still some checkpatch.pl problems:
>
> ---------------------------------------------------------------
> 0003-leds-multicolor-Introduce-a-multicolor-class-definit.patch
> ---------------------------------------------------------------
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #89: FILE: Documentation/leds/leds-class-multicolor.rst:1:
> +====================================

Great another requirement and issue


>
> ERROR: spaces required around that '=' (ctx:WxO)
> #294: FILE: drivers/leds/led-class-multicolor.c:62:
> +        ret =-EINVAL;
>              ^
>
> ERROR: space required before that '-' (ctx:OxV)
> #294: FILE: drivers/leds/led-class-multicolor.c:62:
> +        ret =-EINVAL;
>
Ack


> WARNING: DT binding documents should be licensed (GPL-2.0-only OR 
> BSD-2-Clause)
> #31: FILE: Documentation/devicetree/bindings/leds/leds-lp50xx.yaml:1:
> +# SPDX-License-Identifier: GPL-2.0
>
ack
> WARNING: Block comments use * on subsequent lines
> #705: FILE: drivers/leds/leds-lp50xx.c:636:
> +        /* There are only 3 LEDs per module otherwise they should be
> +           banked which also is presented as 3 LEDs*/
>
> WARNING: Block comments use a trailing */ on a separate line
> #705: FILE: drivers/leds/leds-lp50xx.c:636:
> +           banked which also is presented as 3 LEDs*/
>
Ack
>
> ---------------------------------------------------------------
> 0008-ARM-dts-n900-Add-reg-property-to-the-LP5523-channel-.patch
> ---------------------------------------------------------------
> WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?
>
> ---------------------------------------------------------------
> 0009-ARM-dts-imx6dl-yapp4-Add-reg-property-to-the-lp5562-.patch
> ---------------------------------------------------------------
> WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?
>
> ---------------------------------------------------------------
> 0010-ARM-dts-ste-href-Add-reg-property-to-the-LP5521-chan.patch
> ---------------------------------------------------------------
> WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?
>
ACK * 3

Dan

