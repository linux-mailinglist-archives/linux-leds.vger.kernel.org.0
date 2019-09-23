Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE4FBBE11
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 23:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389818AbfIWVmJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 17:42:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38810 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389663AbfIWVmJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 17:42:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id 3so10824168wmi.3;
        Mon, 23 Sep 2019 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u2phEEYkBvGvKK2I6xq/vEA7c4Ost+MCUN0yPnMB5Kg=;
        b=b2fF7eRgXbmxQE9Ct6w+cJinP/RjrLK4QXlxFQ8bEOiBM4eAWr/stPtnTjC2AWssop
         zylf0r7zXqaG211hVCC58khKkMy9fz1HmMWcI797n+6h0FRsfNShojK6dzBLiq+XWYSv
         e7pGObeSqWBN/DbefOcy5Y8jH4fWgM6ns1+VP7PWrAse3FybAH6AXjuSwu+Pj4oLBE0a
         d/t40P+IZxEz8QHt/b80z8nqSfXd6lXgT6uqZAXhy4qclUnjsLLzCeJv1GyeYqwlBWyN
         6dnCtHdpwgmRcNAdzEA/oRlP9jFnf1/FIGfH0f2ivQX0pBwsrGfq9VHB/vrKqmsMAet4
         RKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=u2phEEYkBvGvKK2I6xq/vEA7c4Ost+MCUN0yPnMB5Kg=;
        b=WEVHiKAli9XTtGXUrIE4wo8ivvxSql8eZlawDdSwoq9JMCWYSZbPG9ZH8Zy+F1NGni
         NC02/z4wwonEKJA5D5xsJVjLqx1JRHvLP30ibcJIFGTcOJ2hqfVPFMjZ/3zsflxcHHKN
         upgUBpPsA+ISKwx0bBHJpxbmg4u5aj2ZDxbZgtDj8fEV+uUTFG4UOUXBVvJglTXZ4FzC
         uEI7TR8TCiDr4hC/sCaO781NCNVT9KiRCrNBkQWtPfkHT5NzLrq8l3Ckw79FH9A36xvK
         awvxOzKq5Kiu/grfANkhp0om+3Vx04T2sEOqMbPJ2ZB/YaYA5tMbg7z3vixo4a1nibfi
         E3NQ==
X-Gm-Message-State: APjAAAXFt86EUfeLZGG7T7mj1I+reVnIz3LCZ90yTcBWLk+D7YeeUtTS
        AwStr5x/+Vn6l3ZF+efjzK2e+LaO
X-Google-Smtp-Source: APXvYqz5B/kwbNVff9OKkI+jpRz3FHT8H52/oMIDrDeWkLfybFOZyotIpsbE2D07hfP+WHhmCMv3nA==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr1214562wmf.126.1569274925252;
        Mon, 23 Sep 2019 14:42:05 -0700 (PDT)
Received: from [192.168.1.19] (bdr247.neoplus.adsl.tpnet.pl. [83.28.3.247])
        by smtp.gmail.com with ESMTPSA id b184sm19078845wmg.47.2019.09.23.14.42.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 14:42:04 -0700 (PDT)
Subject: Re: [PATCH v8 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-8-dmurphy@ti.com>
 <73a95bac-7433-5b06-5701-c742307aa004@gmail.com>
 <ba92d95a-9f2c-6b37-74d3-4e3a87ad28bf@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6788e600-460a-7846-04d0-480268e674a1@gmail.com>
Date:   Mon, 23 Sep 2019 23:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ba92d95a-9f2c-6b37-74d3-4e3a87ad28bf@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/23/19 5:28 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/21/19 10:13 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/20/19 7:41 PM, Dan Murphy wrote:
>>> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
>>> LP5018, LP5012 and LP5009 RGB LED device driver.  The
>>> LP5036/30/24/18/12/9
>>> can control RGB LEDs individually or as part of a control bank group.
>>> These devices have the ability to adjust the mixing control for the RGB
>>> LEDs to obtain different colors independent of the overall brightness of
>>> the LED grouping.
>>>
>>> Datasheet:
>>> http://www.ti.com/lit/ds/symlink/lp5012.pdf
>>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++++++++++++++++
>>>   1 file changed, 148 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>> b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>> new file mode 100644
>>> index 000000000000..9d05f43042e0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>> @@ -0,0 +1,148 @@
>>> +* Texas Instruments - LP5009/12/18/24/30/36 RGB LED driver
>>> +
>>> +The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB
>>> LEDs into
>>> +a LED group or control them individually.
>>> +
>>> +The difference in these RGB LED drivers is the number of supported
>>> RGB modules.
>>> +
>>> +Required parent properties:
>>> +    - compatible:
>>> +        "ti,lp5009"
>>> +        "ti,lp5012"
>>> +        "ti,lp5018"
>>> +        "ti,lp5024"
>>> +        "ti,lp5030"
>>> +        "ti,lp5036"
>>> +    - reg :  I2C slave address
>>> +        lp5009/12 - 0x28
>>> +        lp5018/24 - 0x28
>>> +        lp5030/36 - 0x30
>>> +    - #address-cells : 1
>>> +    - #size-cells : 0
>>> +
>>> +Optional parent properties:
>>> +    - enable-gpios : gpio pin to enable/disable the device.
>>> +    - vled-supply : LED supply
>>> +
>>> +Required child properties:
>>> +    - #address-cells : 1
>>> +    - #size-cells : 0
>>> +    - reg : This is the LED module number.
>>> +    - color : see Documentation/devicetree/bindings/leds/common.txt
>>> +    - function : see Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +Required child properties only is LED modules will be banked:
>>> +    - ti,led-bank : This property denotes the LED module numbers
>>> that will
>>> +            be controlled as a single RGB cluster.  Each LED module
>>> +            number will be controlled by a single LED class instance.
>>> +            There can only be one instance of the ti,led-bank
>>> +            property for each device node.
>>> +
>>> +Required grandchildren properties:
>>> +    - reg : A single entry denoting the LED module that controls
>>> +        the RGB cluster.
>>> +    - color : see
>>> Documentation/devicetree/bindings/leds/leds-multicolor.txt
>>> +    - led-sources : see
>>> Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +The LED outputs associated with the LED modules are defined in Table
>>> 1 of the
>>> +corresponding data sheets.
>> We must enclose this information here.
> 
> That will make this doc pretty messy especially with the LP5036 entries.
> 
> I would have to do ascii art to make it understandable and basically
> there is not a delta in the lesser devices in the outputs
> 
> I don't see value in reproducing this data sheet contents in the
> dt-bindings.

IMO DT bindings should be self-contained. We cannot assume that
user will always have Internet access.

> For example (LP5012) and then for the LP5036 multiply this by 3
> 
> Table 1.
> 
> Bank Number and LED Number Assignment
> OUT NUMBER BANK NUMBER  RGB LED MODULE NUMBER
> OUT0                    Bank A
> OUT1                    Bank B                        LED0
> OUT2                    Bank C
> 
> OUT3                    Bank A
> OUT4                    Bank B                        LED1
> OUT5                    Bank C
> 
> OUT6                    Bank A
> OUT7                    Bank B                        LED2
> OUT8                    Bank C
> 
> OUT9 (LP5012 only) Bank A
> OUT10 (LP5012 only) Bank B                  LED3
> OUT11 (LP5012 only) Bank C


I'd say it is required. But let's wait for DT guys' opinion.


>>> +
>>> +LP5009 - 2 Total RGB cluster LED outputs 0-1
> 
> This should be 3 total not 2
> 
> Dan
> 
>>> +LP5012 - 4 Total RGB cluster LED outputs 0-3
>>> +LP5018 - 6 Total RGB cluster LED outputs 0-5
>>> +LP5024 - 8 Total RGB cluster LED outputs 0-7
>>> +LP5030 - 10 Total RGB cluster LED outputs 0-9
>>> +LP5036 - 12 Total RGB cluster LED outputs 0-11
>>> +
>>> +Optional child properties:
>>> +    - label : see Documentation/devicetree/bindings/leds/common.txt
>>> +    - linux,default-trigger :
>>> +       see Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +Examples:
>>> +led-controller@29 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +    compatible = "ti,lp5024";
>>> +    reg = <0x29>;
>>> +    enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>> +    vled-supply = <&vmmcsd_fixed>;
>>> +
>>> +    multi-led@1 {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        reg = <1>;
>>> +        color = <LED_COLOR_ID_MULTI>;
>>> +        function = LED_FUNCTION_STATUS;
>>> +
>>> +        led@3 {
>>> +            reg = <3>;
>>> +            color = <LED_COLOR_ID_RED>;
>>> +        };
>>> +
>>> +        led@4 {
>>> +            reg = <4>;
>>> +            color = <LED_COLOR_ID_GREEN>;
>>> +        };
>>> +
>>> +        led@5 {
>>> +            reg = <5>;
>>> +            color = <LED_COLOR_ID_BLUE>;
>>> +        };
>>> +    };
>>> +
>>> +    multi-led@2 {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        reg = <2>;
>>> +        color = <LED_COLOR_ID_MULTI>;
>>> +        function = LED_FUNCTION_STANDBY;
>>> +        ti,led-bank = <2 3 5>;
>>> +
>>> +        led@6 {
>>> +            reg = <0x6>;
>>> +            color = <LED_COLOR_ID_RED>;
>>> +            led-sources = <6 9 15>;
>>> +        };
>>> +
>>> +        led@7 {
>>> +            reg = <0x7>;
>>> +            color = <LED_COLOR_ID_GREEN>;
>>> +            led-sources = <7 10 16>;
>>> +        };
>>> +
>>> +        led@8 {
>>> +            reg = <0x8>;
>>> +            color = <LED_COLOR_ID_BLUE>;
>>> +            led-sources = <8 11 17>;
>>> +        };
>>> +    };
>>> +
>>> +    multi-led@4 {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        reg = <4>;
>>> +        color = <LED_COLOR_ID_MULTI>;
>>> +        function = LED_FUNCTION_ACTIVITY;
>>> +
>>> +        led@12 {
>>> +            reg = <12>;
>>> +            color = <LED_COLOR_ID_RED>;
>>> +        };
>>> +
>>> +        led@13 {
>>> +            reg = <13>;
>>> +            color = <LED_COLOR_ID_GREEN>;
>>> +        };
>>> +
>>> +        led@14 {
>>> +            reg = <14>;
>>> +            color = <LED_COLOR_ID_BLUE>;
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +For more product information please see the link below:
>>> +http://www.ti.com/lit/ds/symlink/lp5012.pdf
>>> +http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>> +http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>>
> 

-- 
Best regards,
Jacek Anaszewski
