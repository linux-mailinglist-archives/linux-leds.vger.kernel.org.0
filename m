Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9375B8DE24
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2019 21:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfHNTyz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Aug 2019 15:54:55 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46432 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbfHNTyy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Aug 2019 15:54:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so194814wru.13;
        Wed, 14 Aug 2019 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iqRvknYqtcJYifGXcSuJXeF9zzcpouI8DpoKxmPRgNU=;
        b=Z9D2GDJTNEuoBr/CONhB9k602VeH0HGCxvFXUaUbTcrD5pk63q6ibn81Z+Omh8Hb78
         pyOHxNRi0A0XTdE/b/GPWuxpTak1okBnQfpZy75MXWDwUn7Dzekyz78QWWCoOPqhsGI4
         c2YKilyrIy8F4LTadYU4vK9ccJwADrOOa+5eP2VcpFKDkZuEB3ypXJYNi805JgFd6jc6
         qnFw67UnL0vFeAAjN4gFnH+yDQpxVNPNUFvc/YZGDlnByaJZM6Z/LWsDE/xUNJoMUq3b
         S2NjFXzTWbLcaJEp5FoojV5x5l2hhHzSdcnS5vlQtsZbBmL8OCmzX2Vi0gQW1lmPxo+B
         w7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iqRvknYqtcJYifGXcSuJXeF9zzcpouI8DpoKxmPRgNU=;
        b=KliH4RRb+22ftANkBolcYrep8XsHWXzH1qk7m4lim0VAmOZO2shya19R0xrMOtPBti
         RgsrqnF9WZN9a+Xb1ujgWBHw1voWzptuOhTBFrbSyO/R/wyk9p7OgCHRdN1AQk8nOM2R
         +9L5rx0jOFUHHrL2ohl1vSc0Nil97MPbYESq4AxZ3NeoHMtBBtLmb4Tqrj1SjWhMnMSa
         qCCkXFsk4Jw8IoJS8ajqDuPcl6kvJIfcTNYYCTnA7Z9qD3Ekp+Ftzm8YFdFZmIs6gWBX
         3mG1zgFmrROqiVx6Wf8nZAA9hPOi75ALVwC8gCmM7I+/CpmlMxdYBB0Q+fKtRO7L8wVg
         PhEA==
X-Gm-Message-State: APjAAAVUhEBqX9yySdllhZOxNjoQ2juDNyUSaSETdCmBGB1AmyFred9B
        7Bajw16LWgNrOOWzNw/dJ5m1bvFF
X-Google-Smtp-Source: APXvYqz5Whs90O2nCNqee0Ba2xbzVFV3R/QOxN2Ry2PzwtWHb7DlN00KpxW17fWK3FqytUqKjLJYJg==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr1439305wrn.198.1565812491313;
        Wed, 14 Aug 2019 12:54:51 -0700 (PDT)
Received: from [192.168.1.19] (bky210.neoplus.adsl.tpnet.pl. [83.28.192.210])
        by smtp.gmail.com with ESMTPSA id f70sm640654wme.22.2019.08.14.12.54.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 12:54:50 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
To:     Dan Murphy <dmurphy@ti.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <ea3d06b2-3689-bcfc-8f5f-6345634cfa2b@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d75d5fea-0a7c-b057-d972-c7747df7f33b@gmail.com>
Date:   Wed, 14 Aug 2019 21:54:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ea3d06b2-3689-bcfc-8f5f-6345634cfa2b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 8/13/19 10:31 PM, Dan Murphy wrote:
> Jacek
> 
> Need your input below
> 
> On 8/8/19 3:32 PM, Oleh Kravchenko wrote:
>> Add documentation and example for dt-bindings EL15203000.
>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>   .../bindings/leds/leds-el15203000.txt         | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> new file mode 100644
>> index 000000000000..4c2245babfdc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> @@ -0,0 +1,47 @@
>> +Crane Merchandising System - el15203000 LED driver
>> +--------------------------------------------------
>> +
>> +This LED Board (aka RED LEDs board) is widely used in
>> +coffee vending machines produced by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible : "crane,el15203000"
>> +- reg :
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +- spi-max-frequency : (optional)
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +
>> +Optional LED sub-node properties:
>> +- label :
>> +    see Documentation/devicetree/bindings/leds/common.txt
>> +- linux,default-trigger :
>> +    see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example
>> +-------
>> +
>> +led-controller@0 {
>> +    compatible = "crane,el15203000";
>> +    reg = <0>;
>> +    spi-max-frequency = <50000>;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    /* water pipe */
>> +    pipe@50 {
>> +        reg = <0x50>;
>> +        label = "red:pipe";
> 
> Should we use the color and function property here?

Yes, label is already deprecated in the common LED bindings
in linux-next. We need separate color and function here.

> Not sure what function would be for pipe, screen or vending but there
> may be
> 
> comparable functions that may fit.

These are functions specific to this board and it is not something
that could have some vast system-wide use. Common LED functions aim
rather to unify the naming for LEDs on standard system devices and
peripherals.

I'd not strive for creating common LED_FUNCTION macros for these.

-- 
Best regards,
Jacek Anaszewski
