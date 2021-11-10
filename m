Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18AB44BDDD
	for <lists+linux-leds@lfdr.de>; Wed, 10 Nov 2021 10:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhKJJiG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Nov 2021 04:38:06 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:51517 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhKJJiG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Nov 2021 04:38:06 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mkk0h-000MaJ-1v; Wed, 10 Nov 2021 10:35:15 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mkk0g-0008Pt-BS; Wed, 10 Nov 2021 10:35:14 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id E47B9240042;
        Wed, 10 Nov 2021 10:35:13 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 6D3ED240041;
        Wed, 10 Nov 2021 10:35:13 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 0571A20176;
        Wed, 10 Nov 2021 10:35:13 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Nov 2021 10:35:12 +0100
From:   Florian Eckert <fe@dev.tdt.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     robh+dt@kernel.org, Eckert.Florian@googlemail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] leds: Add KTD20xx RGB LEDs driver from Kinetic
In-Reply-To: <20211109232917.GA26764@amd>
References: <20211109100822.5412-1-fe@dev.tdt.de>
 <20211109232917.GA26764@amd>
Message-ID: <41f6b993ecb9f37a7cf191f770363a79@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1636536914-0000527C-E04B6D23/0/0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> Hi!

Thanks for reviewing my patchset.

>> Florian Eckert (2):
>>   leds: ktd20xx: Add the KTD20xx family of the RGB LEDs driver from
>>     Kinetic
>>   dt: bindings: KTD20xx: Introduce the ktd20xx family of RGB drivers
> 
> That's... not a nice piece of hardware.

Yes, that may be, but I have tried to use what the chip can do.
So that it works for my use case. It would be great if we could 
integrate it
into the color LED framework of the kernel.


> If this uses non-standard interface, it will need to be
> documented. But I would like to understand the limitations first.

OK Then I will try it.

Register Layout:

| Address |  Name   |  Type  | Access | Default | B7 | B6 | B5 | B4 | B3 
| B2 | B1 | B0 |
|:-------:|:-------:|:------:|:------:|:-------:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|  0x00   |   ID    |  Data  |   R    |  0xA4   | VENDOR[2:0]  |       
DIE_ID[4:0]      |
|  0x01   | MONITOR | Status |   R    |  0x30   |    DIE_REV[3:0]   | SC 
| BE | CE | UV |
|  0x02   | CONTROL | Config |  R/W   |  0x00   |MODE[1:0]| BE 
|TEMP[1:0]|FADE_RATE[2:0]|
|  0x03   |  IRED0  | Config |  R/W   |  0x28   |            
IRED_SET0[7:0]             |
|  0x04   |  IGRN0  | Config |  R/W   |  0x28   |            
IGRN_SET0[7:0]             |
|  0x05   |  IBLU0  | Config |  R/W   |  0x28   |            
IBLU_SET0[7:0]             |
|  0x06   |  IRED1  | Config |  R/W   |  0x60   |            
IRED_SET1[7:0]             |
|  0x07   |  IGRN1  | Config |  R/W   |  0x60   |            
IGRN_SET1[7:0]             |
|  0x08   |  IBLU1  | Config |  R/W   |  0x60   |            
IBLU_SET1[7:0]             |
|  0x09   | ISELA12 | Config |  R/W   |  0x00   
|ENA1|RGBA1_SEL[2:0]|ENA2|RGBA2_SEL[2:0]|
|  0x0A   | ISELA34 | Config |  R/W   |  0x00   
|ENA3|RGBA3_SEL[2:0]|ENA4|RGBA4_SEL[2:0]|
|  0x0B   | ISELB12 | Config |  R/W   |  0x00   
|ENB1|RGBB1_SEL[2:0]|ENB2|RGBB2_SEL[2:0]|
|  0x0C   | ISELB34 | Config |  R/W   |  0x00   
|ENB3|RGBB3_SEL[2:0]|ENB4|RGBB4_SEL[2:0]|
|  0x0D   | ISELC12 | Config |  R/W   |  0x00   
|ENC1|RGBC1_SEL[2:0]|ENC2|RGBC2_SEL[2:0]|
|  0x0E   | ISELc34 | Config |  R/W   |  0x00   
|ENC3|RGBC3_SEL[2:0]|ENC4|RGBC4_SEL[2:0]|

The registers 0x0A to 0x0E controls the LEDs. Each register controls two 
LEDs.
The top bit [3] of each byte nibble controls whether the LED is on or 
off.
The other bits [0:2] of each nibble, select which color register to use 
Ixxx_SET0
and Ixxx_SET1 (0x03 to 0x08).

Bit 0 -> Blue (RGBxx_SEL):
If this bit is set to 1 then use IBLU_SET1 value otherwise bit is 0 use 
IBLU_SET0 value.

Bit 1 -> Green RGBxx_SEL):
If this bit is set to 1 then use IGRN_SET1 value otherwise bit is 0 use 
IGRN_SET0 value.

Bit 2 -> Red RGBxx_SEL):
If this bit is set to 1 then use IRED_SET1 value otherwise bit is 0 use 
IRED_SET0 value.

This means that we can define two colors from the full RGB range in the 
Ixxx_SET0
and Ixxx_SET1 respectively. And the LEDs can select which RGB color, 
value they want
to use for the individual basic color via the RGBxx_SEL. In reality, 
this is the electrical
current that the LED gets. The different electric currents produce a 
color depending
on the current ratio.

There are now various possibilities for the whole chip to fit into the 
color LED framework
of the kernel.

Variant1:
Prefill Ixxx_SET0 with one value for example 0x28 and set Ixxx_SET1 to 
0x00.
Then we could select with the RGBxx_SEl[2:0] of an LED which color we 
want.
But we only could have 8 colors because of the limition

This are the colors we could produce with this setup.
| Red | Green | Blue |   Color |
|:---:|:-----:|:----:|:-------:|
|  0  |   0   |   1  |  Blue   |
|  0  |   1   |   0  |  Green  |
|  0  |   1   |   1  |Turquoise|
|  1  |   0   |   0  |  Red    |
|  1  |   0   |   1  |  Purple |
|  1  |   1   |   0  |  Yellow |
|  1  |   1   |   1  |  White  |
|  0  |   0   |   0  |  Black  |

The color brightness for the eight RGB colors can only be changed 
together.
To do this, the value of the entire Ixxx_SET0 must be changed at once, 
for
example 0x28 -> 0x14 to halve the brightness. However, this applies to 
all LEDS!
This variant would fit into the color LED framework of the kernel.

Variant2:
Prefill Ixxx_SET0 and Ixxx_SET1 via device sysfs with an RGB color, and
the select for every LEDS with RGBxx[2:0] which color ratio we want to 
use.
The problem with this is that we have to decide beforehand which color
we want to use. We should not change the Ixxx_SET0 and Ixx_SET1 register
value because that would affect all the LEDs! This variant would not fit 
so well
into the color LED framework of the kernel, as we could not selectively 
change the
color for each LED.

I hope I could make it understandable, if not please ask :-)

> Do you have actual device where this is used?

I don't know where the chip is installed, but we just have
new hardware in the pipeline that has this chip for LED control.
For our setup we only need 7 colors. Therefore, this chip is sufficient.


- Best regards

Florian
