Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0BC6E53B7
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 20:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJYSTq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Oct 2019 14:19:46 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41288 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388617AbfJYSTj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Oct 2019 14:19:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9PIJWlc048085;
        Fri, 25 Oct 2019 13:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572027572;
        bh=TyT7CBsVdCrw18MDYwdaL3xqrUebibyHgdcG9ptIpuw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TDzmFhGtjj7z4qFUT32LfuoLaHy8OPWFQoKojGHCeKJRUQKE5YB6yNN1TVHYLmh3e
         +LAP2RxrbMQbybl3I4W1ETIavfP7JY+rRFFWZE4MtpdJJDpBts/h2YXO8Y7KkUVHKP
         O9L0hBvt1c2McRfPkBktxucsUvXp9SbT7Nx6Cf+Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9PIJWhM100154;
        Fri, 25 Oct 2019 13:19:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 25
 Oct 2019 13:19:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 25 Oct 2019 13:19:21 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9PIJVM8126062;
        Fri, 25 Oct 2019 13:19:32 -0500
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
 <a24832d9-1c3d-b3ea-4326-2ef4937d5a59@gmail.com>
 <c9a704d4-b411-59f1-02bf-3ea7b219c4b4@gmail.com>
 <e1b84d15-d670-9393-aa65-85120e522a35@ti.com>
 <0cd2082a-16d7-c414-7bd2-708a97885da1@gmail.com>
 <b469d35b-ca39-2a99-1e86-420edcabf1ac@ti.com>
 <bfcae4c2-aa4d-8460-528f-6029d7a87b4d@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <74868064-6a40-172e-ce28-94722e1f1aaf@ti.com>
Date:   Fri, 25 Oct 2019 13:18:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bfcae4c2-aa4d-8460-528f-6029d7a87b4d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/25/19 1:13 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/25/19 7:57 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 10/22/19 12:41 PM, Jacek Anaszewski wrote:
>>> Dan,
>>>
>>> On 10/22/19 6:37 PM, Dan Murphy wrote:
>>>> Jacek
>>>>
>>>> On 10/18/19 4:56 PM, Jacek Anaszewski wrote:
>>>>> On 10/18/19 11:48 PM, Jacek Anaszewski wrote:
>>>>>> Dan,
>>>>> +        ret = lp5xx_parse_channel_child(child, cfg, i);
>>>>>> I went into details of this parsing and finally came up with
>>>>>> the code which is a bit greater in size, but IMHO cleaner.
>>>>>> Note changes in variable naming. It is not even compile-tested.
>>>>>>
>>>>>> static int lp55xx_parse_common_child(struct device_node *np,
>>>>>>                                        struct lp55xx_led_config *cfg,
>>>>>>                                        int led_number, int *chan_nr)
>>>>>> {
>>>>>>            int ret;
>>>>>>
>>>>>>            of_property_read_string(np, "chan-name",
>>>>>>                                    &cfg[led_number].name);
>>>>>>            of_property_read_u8(np, "led-cur",
>>>>>>                                &cfg[led_number].led_current);
>>>>>>            of_property_read_u8(np, "max-cur",
>>>>>>                                &cfg[led_number].max_current);
>>>>>>
>>>>>>            ret = of_property_read_u32(np, "reg", chan_nr);
>>>>>>            if (ret)
>>>>>>                    return ret;
>>>>>>
>>>>>>            if (chan_nr < 0 || chan_nr > cfg->max_chan_nr) /* side note:
>>>>>> new
>>>>>> max_chan_nr property needed in cfg */
>>>>>>                    return -EINVAL;
>>>>>>
>>>>>>            return 0;
>>>>>> }
>>>>>>
>>>>>> static int lp55xx_parse_mutli_led_child(struct device_node *np,
>>>>>>                                            struct lp55xx_led_config
>>>>>> *cfg,
>>>>>>                                            int child_number,
>>>>>>                                            int color_number)
>>>>>> {
>>>>>>            int chan_nr, color_id;
>>>>>>
>>>>>>            ret = lp55xx_parse_common_child(child, cfg, child_number,
>>>>>> color_number,
>>>>>>                                            &chan_nr);
>>>>>>            if (ret)
>>>>>>                    return ret;
>>>>>>
>>>>>>            ret = of_property_read_u32(child, "color", &color_id);
>>>>>>            if (ret)
>>>>>>                   return ret;
>>>>>>
>>>>>>            cfg[child_number].color_components[color_number].color_id =
>>>>>> color_id;
>>>>>>           
>>>>>> cfg[child_number].color_components[color_number].output_num =
>>>>>> chan_nr;
>>>>>>            set_bit(color_id, &cfg[child_number].available_colors);
>>>>>>
>>>>>>            return 0;
>>>>>> }
>>>>>>
>>>>>> staitc int lp55xx_parse_mutli_led(struct device_node *np,
>>>>>>                                      struct lp55xx_led_config *cfg,
>>>>>>                                      int child_number)
>>>>>> {
>>>>>>            struct device_node *child;
>>>>>>            int num_colors = 0, i = 0;
>>>>> s/, i = 0//
>>>>>
>>>>>>            for_each_child_of_node(np, child) {
>>>>>>                    ret = lp55xx_parse_mutli_led_child(child, cfg,
>>>>>> num_colors,
>>>>>>                                                       child_number, i))
>>>>> Replace above call with below:
>>>>>
>>>>> ret = lp55xx_parse_mutli_led_child(child, cfg, child_number,
>>>>> num_colors);
>>>>>
>>>> I applied your DT parser patch from the v13 series.  Which eliminates
>>>> this comment correct?
>>> Yes, it contains this fix.
>>>
>> OK I added your patch and it broke a lot of the DT parsing for the LP55xx.
>>
>> I would prefer to stick with the original code without having to
>> re-write this again.
> Let me test that with Qemu first.
>
max_channel is never set so not sure where that is supposed to come from 
since each child device has different number of channels.  And if the 
user has to populate that information from the DT then it does not make 
sense as the user would already be aware of the number of channels.  
This information would have to come from the child device some how and 
the children do not have access to the structure to set it.

In checking the chan_nr to the max_channels you are comparing a pointer 
to an integer.  Easy fix but did not solve the registration issues.

cfg->num_colors is not set anywhere so the registration always goes to 
base led_registration.  Unless we key off a different value to determine 
to register to multicolor class or not.  Or we default this to the 
multi_class registration to figure out how to register based on 
available_colors.

That is what I am seeing so far in my debugging and I still don't have 
it working.

Dan

