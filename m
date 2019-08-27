Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6009E838
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 14:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfH0MoV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 08:44:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52476 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfH0MoV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 08:44:21 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RCiAB8094171;
        Tue, 27 Aug 2019 07:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566909850;
        bh=mL9PuE7SnaQPkLqAoz369d1U3pcy+VQSeEdo39hM018=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=M35G+69K3dVMR8TlTMsz+QVDhP3kt3/+t+MxyHn5I9lx2EyM0206dPD1L1Y+3OH50
         ++gS1741dz2nxPWJ8sJ9sjkpUZDPfGLVvf5LTgKHZCHxEkNBWwvczcu0tMuG0SlNAP
         ypGH2FvGokQLmU4Eq4iEOp+9Uo0IVo0NetVNDNnM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RCiAgt020612
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 07:44:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 07:44:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 07:44:10 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RCi9lx000924;
        Tue, 27 Aug 2019 07:44:09 -0500
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
To:     Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>
CC:     <jacek.anaszewski@gmail.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190820195307.27590-1-dmurphy@ti.com>
 <20190826215822.GY52127@atomide.com> <20190826221413.GA19124@amd>
 <20190826224437.GZ52127@atomide.com> <20190827121818.GB19927@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0eab6f72-ddb7-3da7-e90e-888374531f86@ti.com>
Date:   Tue, 27 Aug 2019 07:44:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827121818.GB19927@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Tony

On 8/27/19 7:18 AM, Pavel Machek wrote:
> On Mon 2019-08-26 15:44:37, Tony Lindgren wrote:
>> * Pavel Machek <pavel@ucw.cz> [190826 22:14]:
>>> On Mon 2019-08-26 14:58:22, Tony Lindgren wrote:
>>>> Hi,
>>>>
>>>> * Dan Murphy <dmurphy@ti.com> [190820 19:53]:
>>>>> Fix the brightness control for I2C mode.  Instead of
>>>>> changing the full scale current register update the ALS target
>>>>> register for the appropriate banks.
>>>>>
>>>>> In addition clean up some code errors and random misspellings found
>>>>> during coding.
>>>>>
>>>>> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
>>>>>
>>>>> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
>>>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>> ---
>>>>>
>>>>> v3 - Removed register define updates - https://lore.kernel.org/patchwork/patch/1114542/
>>>> Looks like starting with this patch in Linux next the LCD on droid4
>>>> is so dim it's unreadable even with brightness set to 255. Setting
>>>> brightness to 0 does blank it completely though.
>>>>
>>>> Did something maybe break with the various patch revisions or are
>>>> we now missing some dts patch?
>>> Maybe missing dts patch. We should provide maximum current the LED can
>>> handle...
>> Or i2c control is somehow broken and only als control now works?

With only setting CONFIG_LEDS_LM3532=m to the next branch I get full 
brightness with 255.

I also see half brightness at 128 with the ramp down working.

I am not able to reproduce this issue on my device.

> Well, max current led is obviously missing. Plus code does not check
> the return from reading led-max-microamp.

led-max-microamp is optional so there is no need to check the return.

full_scale_current should be 0 if not populated and in the init only if 
this variable is set does

the code program the register otherwise it is default of 20.2 mA.

Dan


>
> ret = fwnode_property_read_u32(child, "led-max-microamp",
>                                                 &led->full_scale_current);
>
> Untested, but something like this is neccessary according to code
> review.
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 								Pavel
>
> diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> index 4454449..b883b84 100644
> --- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
> +++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> @@ -395,6 +395,7 @@
>   			ti,led-mode = <0>;
>   			label = ":backlight";
>   			linux,default-trigger = "backlight";
> +			led-max-microamp = 29800;
>   		};
>   
>   		led@1 {
> @@ -402,6 +403,7 @@
>   			led-sources = <1>;
>   			ti,led-mode = <0>;
>   			label = ":kbd_backlight";
> +			led-max-microamp = 29800;
>   		};
>   	};
>   };
>
>
