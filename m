Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189374A9AA
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2019 20:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbfFRSUC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Jun 2019 14:20:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55870 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbfFRSUC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Jun 2019 14:20:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so4340196wmj.5;
        Tue, 18 Jun 2019 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+LXVMvTFUwJBFpEvMsN842aQOTnTAKRmXA9B+zSWFu8=;
        b=OShX/vFCgI01v/2ZPXl4IXL+jfeOD5h+TbQGuiF52KcrJ1AA2yfvVby+cL8Z0KgX16
         gj1RiuBzUDJPVU6vw3DvO9L43/gTwg0lUUQKndfF9a1iDQHO4TdPl6UzNTK/y1or09F/
         h/JgDtbgGqRYudVzAE1t0shiOpDoU4y+mkIkWS1Od9fxa7jthMUWWL1BdXcir5yVRYs3
         wLe9/eXeDxfmD8fTGDmcYzpEZPNszIrZiKczsTT6gyEyOFGhiRDSmXlZNIU7XT8VDor8
         hLdX9LFILYBRVh3T4Foq5O8A/0edEf6UWABMkUUtC+s5tAH0kNVy7a5GnXDGvepBJgtH
         74Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+LXVMvTFUwJBFpEvMsN842aQOTnTAKRmXA9B+zSWFu8=;
        b=rQGapxZgkadEjdTbkLRo+ZP25VZaWKXTJW5hKHpLvOXwm9YHV+BF8ulEpOPmaTKIos
         sHOrcC9TGJ+VML2Wrd1K8tsGQzheebEMf81pP8nwhff3WXUv84I2HbW1tOrEkDuBxaMG
         V0rvdRPqjpHAWyUyc9DWbR5RiAGRju2M+CI/EZ0ALL0aWQS1mkyV3mHCDRSP0fhuaD4a
         okrVjL4/4qkoP0kCcxEOTougX1yjqMJP4OF8IkYjSV3huZPSuSy1w5o7od4G296oXtno
         6b+vTywH4lTsWDrxDOKp5MVjCg+t7tR14OElQr7AKMiW3zDjO+w1PbEFlv9ddWt+McSJ
         cPPA==
X-Gm-Message-State: APjAAAVr6Kx4PSXI28VbFsAMeRrljTrYRaD4DAYLS2MyZxRG5sYjNNsS
        pL/zFjP03Voc/PA6+CG2aOf6Sa4J
X-Google-Smtp-Source: APXvYqxUaMolRXclPnR0KaiziF+EYmITD5riBMvMMQv7sc5eyYlugNXjXDa1LFTokW4BkCmyr8bm5w==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr4808911wme.177.1560882000147;
        Tue, 18 Jun 2019 11:20:00 -0700 (PDT)
Received: from [192.168.1.17] (dqd9.neoplus.adsl.tpnet.pl. [83.24.163.9])
        by smtp.gmail.com with ESMTPSA id s12sm3321599wmh.34.2019.06.18.11.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 11:19:59 -0700 (PDT)
Subject: Re: [PATCH v3 2/9] dt: bindings: Add multicolor class dt bindings
 documention
To:     Rob Herring <robh@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-3-dmurphy@ti.com> <20190614170011.GA3277@bogus>
 <c234361e-f5f7-f8d7-18c6-9cc8ef74ac99@ti.com>
 <CAL_JsqK7u1xXNmwtHjUd7Z5ewHd9_d51quH4zMXxEd63egd28w@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <afc7f11f-7f8d-7680-aef3-58c26e8b34fa@gmail.com>
Date:   Tue, 18 Jun 2019 20:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK7u1xXNmwtHjUd7Z5ewHd9_d51quH4zMXxEd63egd28w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/18/19 5:36 PM, Rob Herring wrote:
> On Fri, Jun 14, 2019 at 11:18 AM Dan Murphy <dmurphy@ti.com> wrote:
>>
>> Rob
>>
>> Thanks for the review
>>
>> On 6/14/19 12:00 PM, Rob Herring wrote:
>>> On Thu, May 23, 2019 at 02:08:13PM -0500, Dan Murphy wrote:
>>>> Add DT bindings for the LEDs multicolor class framework.
>>>>
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>> ---
>>>>    .../bindings/leds/leds-class-multicolor.txt   | 97 +++++++++++++++++++
>>>>    1 file changed, 97 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>>> new file mode 100644
>>>> index 000000000000..e2a2ce3279cb
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>>> @@ -0,0 +1,97 @@
>>>> +* Multicolor LED properties
>>>> +
>>>> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
>>>> +can be grouped together and also provide a modeling mechanism so that the
>>>> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
>>>> +
>>>> +The nodes and properties defined in this document are unique to the multicolor
>>>> +LED class.  Common LED nodes and properties are inherited from the common.txt
>>>> +within this documentation directory.
>>>> +
>>>> +Required LED Child properties:
>>>> +    - color : For multicolor LED support this property should be defined as
>>>> +              LED_COLOR_ID_MULTI and further definition can be found in
>>>> +              include/linux/leds/common.h.
>>>> +
>>>> +led-controller@30 {
>>>> +    #address-cells = <1>;
>>>> +    #size-cells = <0>;
>>>> +    compatible = "ti,lp5024";
>>>> +    reg = <0x29>;
>>>> +
>>>> +    multi-led@4 {
>>> Typically we sort by address order.
>>
>> These are not addresses these end up being the "module" number that the
>> LEDs below are associated to.
> 
> 'reg' (and the unit-address) is an address in the sense that is how
> you identify a device or sub-device. It doesn't matter what type of
> 'address' it is, DT practice is to sort node in unit-address numerical
> order.
> 
> 'module' is a h/w thing, right? A bank or instance within the device?
> If not, using 'reg' here is not appropriate.

In this case reg represents LEDn_BRIGHTNESS register which controls
a group of three LEDs. The thing is that those registers' addresses
start from 0x07, i.e. the formula for calculating the RGB LED module
address is: LEDn_BRIGHTNESS = 0x07 + n.

 From the above it seems that we should have multi-led@7 and reg = 0x07
for LED0_BRIGHTNESS register governing the brightness of RGB LED
module 0, right?

And regarding sorting by address order I think that Rob was asking for
placing whole multi-led@4 sub-node after multi-led@2 (here sticking to
the numeration from the patch).

-- 
Best regards,
Jacek Anaszewski
