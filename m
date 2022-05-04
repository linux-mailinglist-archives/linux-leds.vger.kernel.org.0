Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4D3519B9E
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 11:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347203AbiEDJ21 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 05:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347160AbiEDJ2X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 05:28:23 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321EB252BA
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 02:24:46 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <74896374-d9d5-2f6c-9340-713f2ee57df6@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651656284;
        bh=GPAodxgZi0XfnHltWyuNus1d66FCLfwaa0OHcT3/7es=;
        h=Subject:To:Cc:References:From:In-Reply-To;
        b=NvV6I5L621KyvPVY4uTaKuaz/AdVnZp0YpgVOBs+sB9neGgUbHS+xMmFajiZIItMp
         +nbLbGP5dwES9QdtvrRqE0g4GgjlU6m6tRyt3RJG4GT40x33Ea7uCahS3Awol5MUhD
         TzR8i6WSH/pOSolVl+PgppAn1j9DnTXqO4SmUEEw96Kk+s9xLS3xAovl23fddF7LNm
         3yWVaVS/AzhJHQIILKM5NGoYPrQ6JYKCKxOgnE5ozjgHeh1pVYgKx7eMFY+Bu3YsqM
         tWzawMgXIGzChjhhYr663SdrQ2IVuqF8pt6qeSNGJV8bA0WQzi8uDrXbnMpeNH5hXA
         dpX1iqdQ7rsHw==
Date:   Wed, 4 May 2022 11:24:41 +0200
Mime-Version: 1.0
Subject: Re: AW: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color
 default-intensities property
Content-Language: en-US
To:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
References: <20220502204616.GA27288@ucw.cz>
 <364df52a196fa0ae5db07e599995fcf8dfafb43e.1651577132.git.sven.schwermer@disruptive-technologies.com>
 <GVXP190MB19174C638935B1C6717F8AEBD9C09@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <499bce9d-81d1-8edb-3db5-187e86db71f4@svenschwermer.de>
 <GVXP190MB191792BF0B86407C86A43BB5D9C39@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <GVXP190MB191792BF0B86407C86A43BB5D9C39@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

I did consider placing the property into the multicolor's sub nodes. 
However, multicolor LEDs are not required to have firmware sub nodes. At 
least the multicolor class API does not make any assumptions about this.

One possible solution that I came up with is to do something like this:

multi-led {
	color = <LED_COLOR_ID_RGB>;
	default-intensities = <
		LED_COLOR_ID_RED 100
		LED_COLOR_ID_GREEN 0
		LED_COLOR_ID_BLUE 0
	>;
	led-0 {
		color = <LED_COLOR_ID_RED>;
	};
	led-1 {
		color = <LED_COLOR_ID_GREEN>;
	};
	led-2 {
		color = <LED_COLOR_ID_BLUE>;
	};
};

This requires the array to be twice as long as the number of colors (sub 
LEDs). Each color identifier would be paired with the initial intensity. 
This would limit number of LEDs per color to 1. However, I believe, this 
limitation is already there today.

Thoughts?

Best regards,
Sven

On 5/4/22 09:17, Sven Schuchmann wrote:
> Hello Sven,
> 
> 
>> -----Ursprüngliche Nachricht-----
>> Von: Sven Schwermer <sven@svenschwermer.de>
>> Gesendet: Dienstag, 3. Mai 2022 20:59
>> An: Sven Schuchmann <schuchmann@schleissheimer.de>; linux-leds@vger.kernel.org
>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>; pavel@ucw.cz
>> Betreff: Re: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color default-intensities
>> property
>>
>> Hi Sven,
>>
>> Thanks for making me aware of your patch series. My series would work
>> similar to yours, i.e. the default-intensities property would be on the
>> same level as color = <LED_COLOR_ID_RGB>.
>>
>> However, the concern voiced by Jacek is relevant for my patch as well,
>> see
>> https://lore.kernel.org/all/d5631e35-cd62-106f-2ec4-de3163367bc0@gmail.com/
>> However, I do not know how to resolve the issue. Perhaps somebody from
>> the list has ideas?
> 
> I also do not have an idea. But maybe we can talk about how the definition
> should look like in DT. As far as I understood with your patch I would
> have define the LED as follows:
> 
> multi-led@0 {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	reg = <0x0>;
> 	color = <LED_COLOR_ID_RGB>;
> 	default-intensities = <100 0 0>  <----
> 	function = "eee-led-status";
> 	led-0 {
> 		color = <LED_COLOR_ID_RED>;
> 	};
> 	led-1 {
> 		color = <LED_COLOR_ID_GREEN>;
> 	};
> 	led-2 {
> 		color = <LED_COLOR_ID_BLUE>;
> 	};
> };
> 
> 
> Maybe it is better to define per Color like this:
> 
> multi-led@0 {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	reg = <0x0>;
> 	color = <LED_COLOR_ID_RGB>;
> 	function = "eee-led-status";
> 	led-0 {
> 		color = <LED_COLOR_ID_RED>;
> 		default-intensity = 100
> 	};
> 	led-1 {
> 		color = <LED_COLOR_ID_GREEN>;
> 		default-intensity = 0
> 	};
> 	led-2 {
> 		color = <LED_COLOR_ID_BLUE>;
> 		default-intensity = 0
> 	};
> };
> 
> 
> I think this could then be handled by RGBW LEDs also.
> 
> Best Regards,
> 
>     Sven
> 
> 
> 
>>
>> Best regards,
>> Sven
>>
>> On 5/3/22 15:50, Sven Schuchmann wrote:
>>> Hello Sven,
>>>
>>> tried this some time ago for the LP50XX
>>> https://lore.kernel.org/all/20210204143726.27977-1-schuchmann@schleissheimer.de/
>>>
>>> Your solution looks much better.
>>> Could you give an example of how to use it?
>>>
>>> My Configuration at this time looks like this:
>>>
>>> multi-led@0 {
>>> 		#address-cells = <1>;
>>> 		#size-cells = <0>;
>>> 		reg = <0x0>;
>>> 		color = <LED_COLOR_ID_RGB>;
>>> 		function = "eee-led-status";
>>>
>>> 		led-0 {
>>> 			color = <LED_COLOR_ID_RED>;
>>> 		};
>>>
>>> 		led-1 {
>>> 			color = <LED_COLOR_ID_GREEN>;
>>> 		};
>>>
>>> 		led-2 {
>>> 			color = <LED_COLOR_ID_BLUE>;
>>> 		};
>>> 	};
>>>
>>>
>>> Where do I put the "default-intensities"?
>>>
>>> Regards,
>>>
>>>      Sven
>>>
>>>> -----Ursprüngliche Nachricht-----
>>>> Von: Sven Schwermer <sven@svenschwermer.de>
>>>> Gesendet: Dienstag, 3. Mai 2022 13:27
>>>> An: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; pavel@ucw.cz;
>>>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; dmurphy@ti.com;
>>>> devicetree@vger.kernel.org
>>>> Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>>>> Betreff: [PATCH v2 1/2] dt-bindings: leds: Add multi-color default-intensities property
>>>>
>>>> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>>>>
>>>> This allows to assign intensity values to the indivisual sub LEDs
>>>> (colors) at driver probe time, i.e. most commonly at kernel boot time.
>>>> This is crucial for setting a specific color early in the boot process.
>>>>
>>>> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>>>> ---
>>>>
>>>> Notes:
>>>>       V1->V2: no changes
>>>>
>>>>    .../devicetree/bindings/leds/leds-class-multicolor.yaml    | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>>> b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>>> index 37445c68cdef..c483967a847c 100644
>>>> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>>> @@ -31,6 +31,13 @@ patternProperties:
>>>>              include/linux/leds/common.h.
>>>>            enum: [ 8, 9 ]
>>>>
>>>> +      default-intensities:
>>>> +        description: |
>>>> +          This parameter, if present, sets the initial intensities of the
>>>> +          individual colors. This array must have the same length as the
>>>> +          multi-color LED has sub LEDs (colors).
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +
>>>>        $ref: "common.yaml#"
>>>>
>>>>        required:
>>>> --
>>>> 2.36.0
>>>
