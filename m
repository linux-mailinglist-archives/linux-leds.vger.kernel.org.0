Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9ABA518CB7
	for <lists+linux-leds@lfdr.de>; Tue,  3 May 2022 20:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbiECTCg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 May 2022 15:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241487AbiECTCc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 May 2022 15:02:32 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B363F8A0
        for <linux-leds@vger.kernel.org>; Tue,  3 May 2022 11:58:57 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <499bce9d-81d1-8edb-3db5-187e86db71f4@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651604333;
        bh=V3V9NfqklucD+vBXB+mrpdm9QwmbSxH4j9b4eEhKd3Y=;
        h=Subject:To:Cc:References:From:In-Reply-To;
        b=DiwgbV3c5T5JF4bWqWWHmwfWp5v8ExdbVfP3O6uow5j9aPFmBk1sy7gMIa5i72JgC
         /PWZQfPsv36gMTlDEhQaCm4h1yWn+KEzJbCNYnXQAtdLgt32aj9fybySnWk6cWmxhn
         0bqMJ0bXia39pxwiPW6z2bvw1FrxYYe+dHLAv8bQclifhdeQo4eGQ10sYJyuXrjgnZ
         jycZbSXMZJqolbBDw8B13+TGpZgxalNqT2/rgh9kqYSYUHnV3fxMb2KmCTpbJnUBVW
         caLc2pHbXeRsrI3yk26Ousemu/nF3BO52pXJFw3hj9hQ5WTTxrKR/RhD4dXdvrz8Zj
         QNsPgA+wkYtcw==
Date:   Tue, 3 May 2022 20:58:51 +0200
Mime-Version: 1.0
Subject: Re: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color
 default-intensities property
Content-Language: en-US
To:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
References: <20220502204616.GA27288@ucw.cz>
 <364df52a196fa0ae5db07e599995fcf8dfafb43e.1651577132.git.sven.schwermer@disruptive-technologies.com>
 <GVXP190MB19174C638935B1C6717F8AEBD9C09@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <GVXP190MB19174C638935B1C6717F8AEBD9C09@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
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

Thanks for making me aware of your patch series. My series would work 
similar to yours, i.e. the default-intensities property would be on the 
same level as color = <LED_COLOR_ID_RGB>.

However, the concern voiced by Jacek is relevant for my patch as well, 
see 
https://lore.kernel.org/all/d5631e35-cd62-106f-2ec4-de3163367bc0@gmail.com/
However, I do not know how to resolve the issue. Perhaps somebody from 
the list has ideas?

Best regards,
Sven

On 5/3/22 15:50, Sven Schuchmann wrote:
> Hello Sven,
> 
> tried this some time ago for the LP50XX
> https://lore.kernel.org/all/20210204143726.27977-1-schuchmann@schleissheimer.de/
> 
> Your solution looks much better.
> Could you give an example of how to use it?
> 
> My Configuration at this time looks like this:
> 
> multi-led@0 {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		reg = <0x0>;
> 		color = <LED_COLOR_ID_RGB>;
> 		function = "eee-led-status";
> 
> 		led-0 {
> 			color = <LED_COLOR_ID_RED>;
> 		};
> 
> 		led-1 {
> 			color = <LED_COLOR_ID_GREEN>;
> 		};
> 
> 		led-2 {
> 			color = <LED_COLOR_ID_BLUE>;
> 		};
> 	};
> 
> 
> Where do I put the "default-intensities"?
> 
> Regards,
> 
>     Sven
> 
>> -----Ursprüngliche Nachricht-----
>> Von: Sven Schwermer <sven@svenschwermer.de>
>> Gesendet: Dienstag, 3. Mai 2022 13:27
>> An: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; pavel@ucw.cz;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; dmurphy@ti.com;
>> devicetree@vger.kernel.org
>> Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>> Betreff: [PATCH v2 1/2] dt-bindings: leds: Add multi-color default-intensities property
>>
>> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>>
>> This allows to assign intensity values to the indivisual sub LEDs
>> (colors) at driver probe time, i.e. most commonly at kernel boot time.
>> This is crucial for setting a specific color early in the boot process.
>>
>> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>> ---
>>
>> Notes:
>>      V1->V2: no changes
>>
>>   .../devicetree/bindings/leds/leds-class-multicolor.yaml    | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> index 37445c68cdef..c483967a847c 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> @@ -31,6 +31,13 @@ patternProperties:
>>             include/linux/leds/common.h.
>>           enum: [ 8, 9 ]
>>
>> +      default-intensities:
>> +        description: |
>> +          This parameter, if present, sets the initial intensities of the
>> +          individual colors. This array must have the same length as the
>> +          multi-color LED has sub LEDs (colors).
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>>       $ref: "common.yaml#"
>>
>>       required:
>> --
>> 2.36.0
> 
