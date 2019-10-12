Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF06ED5015
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2019 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfJLNc2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Oct 2019 09:32:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45110 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfJLNc1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Oct 2019 09:32:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so14692234wrm.12;
        Sat, 12 Oct 2019 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zDSzBmf5z3TxLRD0iah6O9fMN8pwfB2WeJ77hCxYLAA=;
        b=PRGMfUUy9yHTmb4dbycfWLu/CSwPF3k6zkEic8Dc+B1F+ZNpn/7j1Fu1xae6YQddZV
         6VOQdt2qT8LHmBWFfmpkaeySFLzK0QiCT6u2bmc3zIfWJOfAjNujuMeDcFOgL/qIq6DZ
         6ZZtaUgSAw6JmXNgJTHepwZlWpxOURYnmTg2iijfNOdZq2ZXpIeMACrJijNFNd27smth
         KL7eEFsqaR8kk/84NalYUJuyb1eG/rgl8qlEigchGhEPUlxz1RftnJD9TTN69pzQVsaK
         H8ibzx7FLWOfVTCJ1+fYhCFc/WiS3+sOzLLltg9y6ejQl8cntvVX2Ts/T+BDxvVW5UKy
         lB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zDSzBmf5z3TxLRD0iah6O9fMN8pwfB2WeJ77hCxYLAA=;
        b=GLpIJ3YVP5jyqYpxbLp4D3kpbsAtvTVwLDsdb0vgoH+691xcycDPzDSOqmyRl5OFfP
         wK+fnYzLoV+d2U17jx/bYtXVdZuxi120MtN6ulKiaVfbC58RgO39NaFKy8WJf2JP4BSl
         oadTTb3V4dyMck7jO9KZWk72fxdKPmRaWcyLMn0qFPUQhzJR9zcnMDfaxtPYbbacj0kw
         wlMW8kKaUMjeokUBu1NEnmL1D36EWXyFCiIOlzmyDQKowX5f3TfsJp2LTIkee+Q8aBD6
         IeGTk2MMPrJo7jCdWkWt8wXiwbBnbY5aaGmehGo3in1aYeNE7i6gcGrwF8bHysK2b7M8
         40BA==
X-Gm-Message-State: APjAAAVDIX53wqn9Zf7WnCXZhvSsjxwaNkF9fW/F1urqujie+60GzgB9
        RBl/raMx3aDV67Ds3/Y5rYI=
X-Google-Smtp-Source: APXvYqzPrIDkW8twwEdQDQlXMMHtHuUEvtAnRKBzSDkhLsQnTl72ZBNyW4sIvKZ+5V6poimihZDTsg==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr16892209wrs.243.1570887143176;
        Sat, 12 Oct 2019 06:32:23 -0700 (PDT)
Received: from [192.168.1.19] (cjl71.neoplus.adsl.tpnet.pl. [83.31.61.71])
        by smtp.gmail.com with ESMTPSA id e6sm17378270wre.29.2019.10.12.06.32.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2019 06:32:22 -0700 (PDT)
Subject: Re: [PATCH v12 08/16] dt: bindings: lp55xx: Update binding for
 Multicolor Framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20191011130657.4713-1-dmurphy@ti.com>
 <20191011130657.4713-9-dmurphy@ti.com>
 <42fb3f20-be4c-8e9e-8035-e4eafbc1e687@gmail.com>
 <0ab2250d-36ff-390a-04e2-48883a930a9a@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3cecddfd-f4d4-0faa-2975-61517e402bd6@gmail.com>
Date:   Sat, 12 Oct 2019 15:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0ab2250d-36ff-390a-04e2-48883a930a9a@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/12/19 2:54 AM, Dan Murphy wrote:
> Jacek
> 
> On 10/11/19 3:15 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 10/11/19 3:06 PM, Dan Murphy wrote:
>>> Update the DT binding to include the properties to use the
>>> multicolor framework for the devices that use the LP55xx
>>> framework.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> CC: Tony Lindgren <tony@atomide.com>
>>> CC: "Benoît Cousson" <bcousson@baylibre.com>
>>> CC: Linus Walleij <linus.walleij@linaro.org>
>>> CC: Shawn Guo <shawnguo@kernel.org>
>>> CC: Sascha Hauer <s.hauer@pengutronix.de>
>>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> CC: Fabio Estevam <festevam@gmail.com>
>>> CC: NXP Linux Team <linux-imx@nxp.com>
>>> ---
>>>   .../devicetree/bindings/leds/leds-lp55xx.txt  | 149 +++++++++++++++---
>>>   1 file changed, 124 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>>> b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>>> index bfe2805c5534..736a2e1538be 100644
>>> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>>> @@ -1,6 +1,8 @@
>>>   Binding for TI/National Semiconductor LP55xx LED Drivers
>>>     Required properties:
>>> +- #address-cells: 1
>>> +- #size-cells: 0
>>>   - compatible: one of
>>>       national,lp5521
>>>       national,lp5523
>>> @@ -14,6 +16,18 @@ Required properties:
>>>   Each child has own specific current settings
>>>   - led-cur: Current setting at each LED channel (mA x10, 0 if LED is
>>> not connected)
>>>   - max-cur: Maximun current at each LED channel.
>>> +- reg: Output channel for the LED.  This is zero based channel
>>> identifier and
>>> +    the data sheet is a one based channel identifier.
>>> +    reg value to output to LED output number
>>> +    D1 = reg value is 0
>>> +    D2 = reg value is 1
>>> +    D3 = reg value is 2
>>> +    D4 = reg value is 3
>>> +    D5 = reg value is 4
>>> +    D6 = reg value is 5
>>> +    D7 = reg value is 6
>>> +    D8 = reg value is 7
>>> +    D9 = reg value is 8
>>>     Optional properties:
>>>   - enable-gpio: GPIO attached to the chip's enable pin
>>> @@ -35,23 +49,28 @@ example 1) LP5521
>>>   on channel 0.
>>>     lp5521@32 {
>> While at it let's fix node prefix to led-controller.
>> It will not break anyone and yet it will adapt the node naming
>> to what is now recommended.
> 
> I would love to do that but honestly I prefer to fix that in a different
> patch series and not add more changes to this patch review.

ack

>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>>       compatible = "national,lp5521";
>>>       reg = <0x32>;
>>>       label = "lp5521_pri";
>>>       clock-mode = /bits/ 8 <2>;
>>>   -    chan0 {
>>> +    chan@0 {
>> Similarly in case of every child node:
>>

>>> +Multicolor LED example:
>>> +lp5523: lp5523@32 {
>> Do you really need "lp5523:" node label ?
>>
>> Besides:
>>
>> s/lp5523@32/led-controller@32/
> 
> This change I will make since I added this.

Good, it was the first thing that struck me - if we're
adding new bindings they should conform to the current
standards.

-- 
Best regards,
Jacek Anaszewski
