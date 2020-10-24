Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36401297F50
	for <lists+linux-leds@lfdr.de>; Sat, 24 Oct 2020 23:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1764689AbgJXVuv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 17:50:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42804 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764656AbgJXVuv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 17:50:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09OLobOP099168;
        Sat, 24 Oct 2020 16:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603576237;
        bh=R1NN1eS7kR7NRx3rbYyQanwPSFDdhVsrine5yVMHEt0=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=wiYp2CiNb5XbhRvaNEgE4WwD6TrjoaBkKuBpjKAXuuyvTSe+XIpSc2wbfyzxiZM09
         1oUMZrCodQ5HX/v7fGxCABtnLMAn50JTkQNztSNLWKa6thSZNRXR7oW4oDDqdrB4zg
         dgChuVKoVbn29gQPnXjV5rUFb+neaXU0UM+q+rH4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09OLobB9098843
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 24 Oct 2020 16:50:37 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 24
 Oct 2020 16:50:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 24 Oct 2020 16:50:37 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09OLobUi002931;
        Sat, 24 Oct 2020 16:50:37 -0500
Subject: Re: Clarification regarding multicolor leds
To:     Luca Weiss <luca@z3ntu.xyz>, Alexander Dahl <post@lespocky.de>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        <bjorn.andersson@linaro.org>
References: <24145961.oFyDssk0vh@g550jk>
 <20201024064238.ahnojlj6b7r3eszn@falbala.internal.home.lespocky.de>
 <10310099.4WBubqx7bp@g550jk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1b54cb43-7c68-2108-2e37-b07f244f84d0@ti.com>
Date:   Sat, 24 Oct 2020 16:50:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <10310099.4WBubqx7bp@g550jk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luca

On 10/24/20 4:16 AM, Luca Weiss wrote:
> Hi Alex,
>
> On Samstag, 24. Oktober 2020 08:42:38 CEST Alexander Dahl wrote:
>> Hello Luca,
>>
>> On Sat, Oct 24, 2020 at 12:48:42AM +0200, Luca Weiss wrote:
>>> I'm currently experimenting with the qcom lpg[0] which is a driver for the
>>> rgb notification led found on e.g. Snapdragon 801 devices (and many
>>> more), specifically my example is about the Fairphone 2
>>> (msm8974-fairphone-fp2).
>> Great to hear someone is interested in mainline support for Fairphone.
>> I just bought a used FP2 on ebay. :-)
>>
>>> [0]
>>> https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson@lin
>>> aro.org/>
>>> My dts is looking like the following (abbreviated):
>>>      [in lpg node]
>>>      multi-led {
>>>      
>>>          color = <LED_COLOR_ID_MULTI>;
>>>          function = LED_FUNCTION_STATUS;
>>>          ....
>>>      
>>>      };
>>>
>>> I'm comparing this to the PinePhone where the leds are defined as follows:
>>>      [in gpio-leds node]
>>>      blue {
>>>      
>>>          function = LED_FUNCTION_INDICATOR;
>>>          color = <LED_COLOR_ID_BLUE>;
>>>      
>>>      };
>>>      
>>>      green {
>>>      
>>>          function = LED_FUNCTION_INDICATOR;
>>>          color = <LED_COLOR_ID_GREEN>;
>>>      
>>>      };
>>>      
>>>      red {
>>>      
>>>          function = LED_FUNCTION_INDICATOR;
>>>          color = <LED_COLOR_ID_RED>;
>>>      
>>>      };
>>>
>>> (sidenote: the LED_FUNCTION_INDICATOR should probably also be
>>> LED_FUNCTION_STATUS there; the dts was made before the better descriptions
>>> for the defines have been added)
>>>
>>> This gets the following directories created in /sys/class/leds/:
>>>      blue:indicator
>>>      green:indicator
>>>      red:indicator
>> That's right.  From Linux point of view these behave like three
>> independent LEDs.  It's fully up to userspace to handle this.
> Exactly, that I understand well.
>
>>> But with the multicolor led on the Fairphone 2 only a directory with the
>>> name of "multi-led" gets created which I would have expected to be
>>> "multicolor:status" instead.
>> Obviously it's named after the node label.  If I read
>> Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> correctly, that's how it is supposed to be named?
>>
> That's from the i read from the documentation as well.
>
> How is user space supposed to get function and/or color from the led? I don't
> see it exposed in user space - apart from the directory name (label) in the
> leds-gpio example.
>
> This is what I get in sysfs for the multicolor led with the lpg driver:
>
>      brightness
>      device -> ../../../fc4cf000.spmi:pm8941@1:lpg
>      max_brightness
>      multi_index

If you refer to the ABI doc you see that by reading the multi_index file 
gives you the colors contained within the file.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-class-led-multicolor

Dan

