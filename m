Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61C2169E96
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2020 07:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgBXGl2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Feb 2020 01:41:28 -0500
Received: from olimex.com ([184.105.72.32]:44216 "EHLO olimex.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726997AbgBXGl2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 24 Feb 2020 01:41:28 -0500
Received: from 94.155.250.134 ([94.155.250.134])
        by olimex.com with ESMTPSA (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD) (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
        for <linux-leds@vger.kernel.org>; Sun, 23 Feb 2020 22:31:11 -0800
Subject: Re: [linux-sunxi] Re: [PATCH 0/4] Add support for charger LED for
 AXP813 and TBS A711 Tablet
To:     linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200223131435.681620-1-megous@megous.com>
 <20200223132730.6g7tnm2f263oubhv@core.my.home>
 <20200223133517.hfqrg5dta2xk4zj3@core.my.home>
From:   Stefan Mavrodiev <stefan@olimex.com>
Message-ID: <1464324b-2b69-c20e-4af8-f32ae5451ea6@olimex.com>
Date:   Mon, 24 Feb 2020 08:31:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200223133517.hfqrg5dta2xk4zj3@core.my.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 2/23/20 3:35 PM, Ondřej Jirman wrote:
> On Sun, Feb 23, 2020 at 02:27:30PM +0100, megous hlavni wrote:
>> On Sun, Feb 23, 2020 at 02:14:31PM +0100, megous hlavni wrote:
>>> The tablet has a charger LED exposed on the top. This LED is controlled
>>> by AXP813 PMIC. Add support for enabling the LED and using it either
>>> for charging indication (handled by PMIC automatically) or for other uses
>>> via user control.
>> Dang, I just noticed someone sent a similar driver recently, although I had this
>> one prepared for quite some time (since 2017) in my tree. I guess I should have
>> sent it earlier.
>>
>> Please ignore.
> Though the meaning of "recently" is a bit relative. The other work was sent in
> a year ago. Here's a reference:
>
>    https://lore.kernel.org/patchwork/cover/1042764/

Hi,

I'm the author of the 'other' work. I don't know the full story here, 
but I don't
mind someone else submitting this patch as his.

When I submitted the last patch, there was the proposal to use the 
ledtrig-pattern instead
of sysfs entries. Also AXP209 has inverted CTRL bit.

Please read the the 'other' discussion.

Best regards,
Stefan Mavrodiev

>
>> regards,
>> 	o.
>>
>>
>>> Please take a look.
>>>
>>> thank you and regards,
>>>    Ondrej Jirman
>>>
>>> Ondrej Jirman (4):
>>>    dt-bindings: leds: Add a binding for AXP813 charger led
>>>    leds: axp20x: Support charger LED on AXP20x like PMICs
>>>    ARM: dts: axp813: Add charger LED
>>>    ARM: dts: sun8i-a83t-tbs-a711: Enable charging LED
>>>
>>>   .../devicetree/bindings/leds/leds-axp20x.yaml |  24 ++
>>>   arch/arm/boot/dts/axp81x.dtsi                 |   5 +
>>>   arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts     |   4 +
>>>   drivers/leds/Kconfig                          |   7 +
>>>   drivers/leds/Makefile                         |   1 +
>>>   drivers/leds/leds-axp20x.c                    | 240 ++++++++++++++++++
>>>   drivers/mfd/axp20x.c                          |   3 +
>>>   7 files changed, 284 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.yaml
>>>   create mode 100644 drivers/leds/leds-axp20x.c
>>>
>>> -- 
>>> 2.25.1
>>>
