Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE4F166755
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 20:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgBTTlx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 14:41:53 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50241 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728334AbgBTTlx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 14:41:53 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so3288450wmb.0;
        Thu, 20 Feb 2020 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yaDet44CykPMZQLHWRI6AFztZUKK++JHWg7tSO0I/gw=;
        b=NQJGz6KmacfwFirdmZbYEtKGjIdRouL56gKjS7dJNBgMx7S820EIyGWbIjNEhTyjEJ
         lPLzD+7709AGhl+l+6NK1B1PKV/LxMsQ2WOeZPvrgBWhDnnk5MDtPMgp2H+VLJnTZPtU
         /c49aA1qc64yJyrvZqrA4i0XVvQH9SNyZfYjA115yb03U8kiBpCo+DzcTcMM8xzugbeP
         BY4BXUM/I7WGnEgrZda4Qb434ISeGUdVKVsBTFxiCwPPVEd3Jbf/6JxLyNi2soF1j9Ig
         3ec7bFbkVoipxFA1y8kKm/Tx6ZLkP6M0nNym0hy26xzPo3uz7cC6lJUIQzJv+Zq4TayH
         cmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yaDet44CykPMZQLHWRI6AFztZUKK++JHWg7tSO0I/gw=;
        b=CG+u+5VKy9ta/+htVaAo/i4Ro0n8MXpzIe3uadblGtdUVV3RWlNE8IOKC2roh7x2oM
         sjJtbOjcqyDUuneqPd9o00NaWY2XXzd76/6ubtvT37zQwKw9HsRKVYrDBztjKHOZVwuz
         0LQKZFYflr+W00VkwHtaXaR2cPWbIT22Q2yPLEbEoLGv18odZtACzuf4AVZpR6pOzQrD
         6HVlzluqIR4cfgRo+R7/QUM0+2w9uWoDqd/0zjZsrPY1ocEg7VbXW79sT1hRuqsvlaY2
         +bowVaQv6V6jUMsk+tga28L9/azo/nOxaYsZB52eE4qHQno6nCN4Ilp4ebXkFX1HOmfw
         li3A==
X-Gm-Message-State: APjAAAXkpHO9IN1ViugVf74FksKquAQ+WxS9EGSSicT3dt0KsvLIwUnR
        zncpkTcabYOkyW7gq9j4dWk=
X-Google-Smtp-Source: APXvYqyY8R75N3Zqg18aVePfaQqX12X0YBKQbs+tfGIEqU7NSsuza7Nh+fS5HtCTJut25xB/C/SJGA==
X-Received: by 2002:a1c:282:: with SMTP id 124mr5910502wmc.62.1582227711095;
        Thu, 20 Feb 2020 11:41:51 -0800 (PST)
Received: from [192.168.1.23] (afdg242.neoplus.adsl.tpnet.pl. [95.49.84.242])
        by smtp.gmail.com with ESMTPSA id k10sm676601wrd.68.2020.02.20.11.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 11:41:50 -0800 (PST)
Subject: Re: [PATCH 2/3] dt-bindings: leds: Shiji Lighting APA102C LED driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
 <1582018657-5720-3-git-send-email-nbelin@baylibre.com>
 <CAMuHMdWPgUKOHyspV3bL_4YKsxgXvEgQqdOzoo-8s8gi_g3rVw@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cb7bbe8a-73dc-8640-7b5d-79a7a3d64e84@gmail.com>
Date:   Thu, 20 Feb 2020 20:41:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWPgUKOHyspV3bL_4YKsxgXvEgQqdOzoo-8s8gi_g3rVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Geert,

On 2/20/20 11:30 AM, Geert Uytterhoeven wrote:
> Hi Nicolas,
> 
> CC devicetree, Lukas
> 
> On Tue, Feb 18, 2020 at 10:39 AM Nicolas Belin <nbelin@baylibre.com> wrote:
>> Document Shiji Lighting APA102C LED driver device tree bindings.
>>
>> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
>> ---
>>  .../devicetree/bindings/leds/leds-apa102c.yaml     | 91 ++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-apa102c.yaml b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
>> new file mode 100644
>> index 000000000000..24bc2fc19fcb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/leds-apa102c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LED driver for Shiji Lighting - APA102C
>> +
>> +maintainers:
>> +  - Nicolas Belin <nbelin@baylibre.com>
>> +
>> +description:
>> +  Each LED is represented as a sub-node of the leds-apa102c device.  Each LED
>> +  is a three color RGB LED with 32 levels brightness adjustment that can be
>> +  cascaded so that multiple LEDs can be set with a single command.
>> +
>> +properties:
>> +  compatible:
>> +    const: shiji,apa102c
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  spi-max-frequency:
>> +    maximum: 1000000
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - spi-max-frequency
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +
>> +patternProperties:
>> +  "^led@[0-9]+$":
>> +    type: object
>> +    description: |
>> +      Properties for an array of connected LEDs.
>> +
>> +    properties:
>> +      reg:
>> +        description: |
>> +          This property corresponds to the led index. It has to be between 0
>> +          and the number of managed leds minus 1
>> +        maxItems: 1
>> +
>> +      label:
>> +        description: |
>> +          This property corresponds to the name of the led. If not set,
>> +          the led index will be used to create the led name instead
>> +        maxItems: 1
>> +
>> +      linux,default-trigger: true
>> +
>> +    required:
>> +      - reg
>> +
>> +examples:
>> +  - |
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        led-controller@0 {
>> +            compatible = "shiji,apa102c";
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            spi-max-frequency = <1000000>;
>> +            led@0 {
>> +                reg = <0>;
>> +                label = "led1";
>> +            };
>> +
>> +            led@1 {
>> +                reg = <1>;
>> +                label = "led2";
>> +            };
>> +
>> +            led@2 {
>> +                reg = <2>;
>> +                label = "led3";
>> +            };
>> +        };
>> +    };
> 
> Perhaps this should use "#daisy-chained-devices" instead of listing all LEDs
> explicitly?
> Or would that cause problems w.r.t. LED labeling?

It would be against common LED bindings.

Besides, this daisy-chain-devices property is not well documented.
I.e. I don't see how it facilitates conveying information on output
ID (here reg is used for that), and as you already mentioned
- LED labeling.

Generally speaking, I don't think it is applicable to the LED subsystem.

> Documentation/devicetree/bindings/common-properties.txt
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
Best regards,
Jacek Anaszewski
