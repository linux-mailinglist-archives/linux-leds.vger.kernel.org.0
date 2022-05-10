Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA02522410
	for <lists+linux-leds@lfdr.de>; Tue, 10 May 2022 20:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237552AbiEJSb4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 May 2022 14:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245573AbiEJSb4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 May 2022 14:31:56 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9698D3CFCB
        for <linux-leds@vger.kernel.org>; Tue, 10 May 2022 11:31:54 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <3a016b38-57d2-e8d0-0162-734829aa0419@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1652207511;
        bh=IL3zhw62kVj/H8/MNAvgwfK6Sd0tuQIHhgHmQueLz5c=;
        h=Subject:To:Cc:References:From:In-Reply-To;
        b=Es2M+PnpPcSvPr2B0UdOuSDGLC3MEVHfLnXOaKXyE3iy5Y0PYzWZz/2vqMwgwU8Qd
         ed5dimyFx7pTnUvqvsa0MGuAL3F6jcmxBZVFYJSd2/ZbQgVEwoBDOXCg1nHtfro5r+
         wIOzsxwnMd49CzBVlm4m9tVC4bZTWtnk8RiWYQE+cDTpBhxRDDWq0PL1qpyuvBdK7o
         icAerG3byk6iHir2cTg09JOgwl3fwKfg9HvO5MmE8yaZuRjDSgws4jzY0pw8ihChRe
         eRsQVH9OmygtuNVVlonrjOyXtnjyYFDZ4oSdZQoygkwiAeQb2/DdJoDILCmnQk4JpF
         S+a5IPhV1u9wQ==
Date:   Tue, 10 May 2022 20:31:50 +0200
Mime-Version: 1.0
Subject: Re: AW: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color
 default-intensities property
Content-Language: en-US
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schuchmann <schuchmann@schleissheimer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc:     "pavel@ucw.cz" <pavel@ucw.cz>
References: <20220502204616.GA27288@ucw.cz>
 <364df52a196fa0ae5db07e599995fcf8dfafb43e.1651577132.git.sven.schwermer@disruptive-technologies.com>
 <GVXP190MB19174C638935B1C6717F8AEBD9C09@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <499bce9d-81d1-8edb-3db5-187e86db71f4@svenschwermer.de>
 <GVXP190MB191792BF0B86407C86A43BB5D9C39@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <74896374-d9d5-2f6c-9340-713f2ee57df6@svenschwermer.de>
 <46556208-3366-b7e7-4a51-1830461c254c@gmail.com>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <46556208-3366-b7e7-4a51-1830461c254c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 5/8/22 21:55, Jacek Anaszewski wrote:
> Hi Sven and Sven,
> 
> On 5/4/22 11:24, Sven Schwermer wrote:
>> Hi Sven,
>>
>> I did consider placing the property into the multicolor's sub nodes. 
>> However, multicolor LEDs are not required to have firmware sub nodes. 
>> At least the multicolor class API does not make any assumptions about 
>> this.
> 
> So this is something to be clarified. The whole idea relies on having
> sub-nodes in the multi-led node.

As far as I understand, multi-color LEDs don't require actual OF 
sub-nodes. The Turris Omnia LED driver doesn't have sub-nodes, see 
Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml

>>> Maybe it is better to define per Color like this:
>>>
>>> multi-led@0 {
>>>     #address-cells = <1>;
>>>     #size-cells = <0>;
>>>     reg = <0x0>;
>>>     color = <LED_COLOR_ID_RGB>;
>>>     function = "eee-led-status";
>>>     led-0 {
>>>         color = <LED_COLOR_ID_RED>;
>>>         default-intensity = 100
>>>     };
>>>     led-1 {
>>>         color = <LED_COLOR_ID_GREEN>;
>>>         default-intensity = 0
>>>     };
>>>     led-2 {
>>>         color = <LED_COLOR_ID_BLUE>;
>>>         default-intensity = 0
>>>     };
>>> };
> 
> I would go for this. Seems to be the most straightforward solution.

I agree, that this would be the best option. However, as noted above, 
this wouldn't be compatible with all existing multi-color drivers.

Best regards,
Sven
