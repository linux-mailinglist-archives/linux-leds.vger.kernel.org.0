Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899A9241F2C
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 19:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbgHKR1o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 13:27:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56780 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbgHKR1n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 13:27:43 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07BHRRci114491;
        Tue, 11 Aug 2020 12:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597166847;
        bh=FGXj1s1bgapDbOhk+hV14xUat7NY8t3A4MWv2IcwDKU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Bc4KMChoLu7A1OZjgH/ujenQ0xGQgALEF6i7UouPSfEIV7CJ4bFasVdK7ENM4hVkY
         cRuBXODeBCyla+wRJddggnR1JVQuOXefX1X8c8MwDYaG1gEJyOCxwxm7lfOyEvS6Jo
         X5gZoGKV2UesvR5114mrDWMtA34GeLmTkzzgCt7M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07BHRRxS047879
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Aug 2020 12:27:27 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 11
 Aug 2020 12:27:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 11 Aug 2020 12:27:27 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07BHRQmi075923;
        Tue, 11 Aug 2020 12:27:26 -0500
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
 <20200811105413.r2m2f7bubuz55rrt@duo.ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <935119fa-6d1f-8e99-51f9-87966b4d03ad@ti.com>
Date:   Tue, 11 Aug 2020 12:27:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811105413.r2m2f7bubuz55rrt@duo.ucw.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 8/11/20 5:54 AM, Pavel Machek wrote:
> Hi!
>
>> +/* LP5009 and LP5012 registers */
>> +#define LP5012_BNK_BRT		0x03
>> +#define LP5012_BNKA_CLR		0x04
>> +#define LP5012_BNKB_CLR		0x05
>> +#define LP5012_BNKC_CLR		0x06
>> +#define LP5012_LED0_BRT		0x07
>> +#define LP5012_LED1_BRT		0x08
>> +#define LP5012_LED2_BRT		0x09
>> +#define LP5012_LED3_BRT		0x0a
>> +#define LP5012_OUT0_CLR		0x0b
>> +#define LP5012_OUT1_CLR		0x0c
>> +#define LP5012_OUT2_CLR		0x0d
>> +#define LP5012_OUT3_CLR		0x0e
>> +#define LP5012_OUT4_CLR		0x0f
>> +#define LP5012_OUT5_CLR		0x10
>> +#define LP5012_OUT6_CLR		0x11
>> +#define LP5012_OUT7_CLR		0x12
>> +#define LP5012_OUT8_CLR		0x13
>> +#define LP5012_OUT9_CLR		0x14
>> +#define LP5012_OUT10_CLR	0x15
>> +#define LP5012_OUT11_CLR	0x16
>> +#define LP5012_RESET		0x17
>> +
>> +/* LP5018 and LP5024 registers */
>> +#define LP5024_BNK_BRT		0x03
>> +#define LP5024_BNKA_CLR		0x04
>> +#define LP5024_BNKB_CLR		0x05
>> +#define LP5024_BNKC_CLR		0x06
>> +#define LP5024_LED0_BRT		0x07
>> +#define LP5024_LED1_BRT		0x08
>> +#define LP5024_LED2_BRT		0x09
>> +#define LP5024_LED3_BRT		0x0a
>> +#define LP5024_LED4_BRT		0x0b
>> +#define LP5024_LED5_BRT		0x0c
>> +#define LP5024_LED6_BRT		0x0d
>> +#define LP5024_LED7_BRT		0x0e
>> +
>> +#define LP5024_OUT0_CLR		0x0f
>> +#define LP5024_OUT1_CLR		0x10
>> +#define LP5024_OUT2_CLR		0x11
>> +#define LP5024_OUT3_CLR		0x12
>> +#define LP5024_OUT4_CLR		0x13
>> +#define LP5024_OUT5_CLR		0x14
>> +#define LP5024_OUT6_CLR		0x15
>> +#define LP5024_OUT7_CLR		0x16
>> +#define LP5024_OUT8_CLR		0x17
>> +#define LP5024_OUT9_CLR		0x18
>> +#define LP5024_OUT10_CLR	0x19
>> +#define LP5024_OUT11_CLR	0x1a
>> +#define LP5024_OUT12_CLR	0x1b
>> +#define LP5024_OUT13_CLR	0x1c
>> +#define LP5024_OUT14_CLR	0x1d
>> +#define LP5024_OUT15_CLR	0x1e
>> +#define LP5024_OUT16_CLR	0x1f
>> +#define LP5024_OUT17_CLR	0x20
>> +#define LP5024_OUT18_CLR	0x21
>> +#define LP5024_OUT19_CLR	0x22
>> +#define LP5024_OUT20_CLR	0x23
>> +#define LP5024_OUT21_CLR	0x24
>> +#define LP5024_OUT22_CLR	0x25
>> +#define LP5024_OUT23_CLR	0x26
>> +#define LP5024_RESET		0x27
>> +
>> +/* LP5030 and LP5036 registers */
>> +#define LP5036_LED_CFG1		0x03
>> +#define LP5036_BNK_BRT		0x04
>> +#define LP5036_BNKA_CLR		0x05
>> +#define LP5036_BNKB_CLR		0x06
>> +#define LP5036_BNKC_CLR		0x07
>> +#define LP5036_LED0_BRT		0x08
>> +#define LP5036_LED1_BRT		0x09
>> +#define LP5036_LED2_BRT		0x0a
>> +#define LP5036_LED3_BRT		0x0b
>> +#define LP5036_LED4_BRT		0x0c
>> +#define LP5036_LED5_BRT		0x0d
>> +#define LP5036_LED6_BRT		0x0e
>> +#define LP5036_LED7_BRT		0x0f
>> +#define LP5036_LED8_BRT		0x10
>> +#define LP5036_LED9_BRT		0x11
>> +#define LP5036_LED10_BRT	0x12
>> +#define LP5036_LED11_BRT	0x13
>> +
>> +#define LP5036_OUT0_CLR		0x14
>> +#define LP5036_OUT1_CLR		0x15
>> +#define LP5036_OUT2_CLR		0x16
>> +#define LP5036_OUT3_CLR		0x17
>> +#define LP5036_OUT4_CLR		0x18
>> +#define LP5036_OUT5_CLR		0x19
>> +#define LP5036_OUT6_CLR		0x1a
>> +#define LP5036_OUT7_CLR		0x1b
>> +#define LP5036_OUT8_CLR		0x1c
>> +#define LP5036_OUT9_CLR		0x1d
>> +#define LP5036_OUT10_CLR	0x1e
>> +#define LP5036_OUT11_CLR	0x1f
>> +#define LP5036_OUT12_CLR	0x20
>> +#define LP5036_OUT13_CLR	0x21
>> +#define LP5036_OUT14_CLR	0x22
>> +#define LP5036_OUT15_CLR	0x23
>> +#define LP5036_OUT16_CLR	0x24
>> +#define LP5036_OUT17_CLR	0x25
>> +#define LP5036_OUT18_CLR	0x26
>> +#define LP5036_OUT19_CLR	0x27
>> +#define LP5036_OUT20_CLR	0x28
>> +#define LP5036_OUT21_CLR	0x29
>> +#define LP5036_OUT22_CLR	0x2a
>> +#define LP5036_OUT23_CLR	0x2b
>> +#define LP5036_OUT24_CLR	0x2c
>> +#define LP5036_OUT25_CLR	0x2d
>> +#define LP5036_OUT26_CLR	0x2e
>> +#define LP5036_OUT27_CLR	0x2f
>> +#define LP5036_OUT28_CLR	0x30
>> +#define LP5036_OUT29_CLR	0x31
>> +#define LP5036_OUT30_CLR	0x32
>> +#define LP5036_OUT31_CLR	0x33
>> +#define LP5036_OUT32_CLR	0x34
>> +#define LP5036_OUT33_CLR	0x35
>> +#define LP5036_OUT34_CLR	0x36
>> +#define LP5036_OUT35_CLR	0x37
>> +#define LP5036_RESET		0x38
>> +static const struct reg_default lp5012_reg_defs[] = {
> ...
>> +	{LP5012_OUT1_CLR, 0x00},
>> +	{LP5012_OUT2_CLR, 0x00},
>> +	{LP5012_OUT3_CLR, 0x00},
>> +	{LP5012_OUT4_CLR, 0x00},
>> +	{LP5012_OUT5_CLR, 0x00},
>> +	{LP5012_OUT6_CLR, 0x00},
>> +	{LP5012_OUT7_CLR, 0x00},
>> +	{LP5012_OUT8_CLR, 0x00},
>> +	{LP5012_OUT9_CLR, 0x00},
>> +	{LP5012_OUT10_CLR, 0x00},
>> +	{LP5012_OUT11_CLR, 0x00},
>> +	{LP5012_RESET, 0x00}
>> +};
>> +
>> +static const struct reg_default lp5024_reg_defs[] = {
> ...
>> +	{LP5024_OUT1_CLR, 0x00},
>> +	{LP5024_OUT2_CLR, 0x00},
>> +	{LP5024_OUT3_CLR, 0x00},
>> +	{LP5024_OUT4_CLR, 0x00},
>> +	{LP5024_OUT5_CLR, 0x00},
>> +	{LP5024_OUT6_CLR, 0x00},
>> +	{LP5024_OUT7_CLR, 0x00},
>> +	{LP5024_OUT8_CLR, 0x00},
>> +	{LP5024_OUT9_CLR, 0x00},
>> +	{LP5024_OUT10_CLR, 0x00},
>> +	{LP5024_OUT11_CLR, 0x00},
>> +	{LP5024_OUT12_CLR, 0x00},
>> +	{LP5024_OUT13_CLR, 0x00},
>> +	{LP5024_OUT14_CLR, 0x00},
>> +	{LP5024_OUT15_CLR, 0x00},
>> +	{LP5024_OUT16_CLR, 0x00},
>> +	{LP5024_OUT17_CLR, 0x00},
>> +	{LP5024_OUT18_CLR, 0x00},
>> +	{LP5024_OUT19_CLR, 0x00},
>> +	{LP5024_OUT20_CLR, 0x00},
>> +	{LP5024_OUT21_CLR, 0x00},
>> +	{LP5024_OUT22_CLR, 0x00},
>> +	{LP5024_OUT23_CLR, 0x00},
>> +	{LP5024_RESET, 0x00}
>> +};
>> +
>> +static const struct reg_default lp5036_reg_defs[] = {
>> +	{LP5036_OUT1_CLR, 0x00},
>> +	{LP5036_OUT2_CLR, 0x00},
>> +	{LP5036_OUT3_CLR, 0x00},
>> +	{LP5036_OUT4_CLR, 0x00},
>> +	{LP5036_OUT5_CLR, 0x00},
>> +	{LP5036_OUT6_CLR, 0x00},
>> +	{LP5036_OUT7_CLR, 0x00},
>> +	{LP5036_OUT8_CLR, 0x00},
>> +	{LP5036_OUT9_CLR, 0x00},
>> +	{LP5036_OUT10_CLR, 0x00},
>> +	{LP5036_OUT11_CLR, 0x00},
>> +	{LP5036_OUT12_CLR, 0x00},
>> +	{LP5036_OUT13_CLR, 0x00},
>> +	{LP5036_OUT14_CLR, 0x00},
>> +	{LP5036_OUT15_CLR, 0x00},
>> +	{LP5036_OUT16_CLR, 0x00},
>> +	{LP5036_OUT17_CLR, 0x00},
>> +	{LP5036_OUT18_CLR, 0x00},
>> +	{LP5036_OUT19_CLR, 0x00},
>> +	{LP5036_OUT20_CLR, 0x00},
>> +	{LP5036_OUT21_CLR, 0x00},
>> +	{LP5036_OUT22_CLR, 0x00},
>> +	{LP5036_OUT23_CLR, 0x00},
>> +	{LP5036_OUT24_CLR, 0x00},
>> +	{LP5036_OUT25_CLR, 0x00},
>> +	{LP5036_OUT26_CLR, 0x00},
>> +	{LP5036_OUT27_CLR, 0x00},
>> +	{LP5036_OUT28_CLR, 0x00},
>> +	{LP5036_OUT29_CLR, 0x00},
>> +	{LP5036_OUT30_CLR, 0x00},
>> +	{LP5036_OUT31_CLR, 0x00},
>> +	{LP5036_OUT32_CLR, 0x00},
>> +	{LP5036_OUT33_CLR, 0x00},
>> +	{LP5036_OUT34_CLR, 0x00},
>> +	{LP5036_OUT35_CLR, 0x00},
>> +	{LP5036_RESET, 0x00}
>> +};
> Actually... This is quite impressive ammount of code to
> zero-initialize few registers. Could the regmap be told to set the
> range to zero, or use loops to reduce ammount of code?

I am not aware of any regmap calls that will set a range of registers to 
a certain value.

Well it depends on where we want to create the default cache values.

Either we run through a for..loop during driver probe and delay device 
start up or we keep the simple arrays and increase the driver total size.

I am not seeing an advantage or disadvantage of one over the other.  
This is a simpler and more clear way to init the registers versus a loop.

Dan

> Thanks,
> 								Pavel
>
>
