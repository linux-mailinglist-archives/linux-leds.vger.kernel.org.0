Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF09B051B
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 23:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbfIKVJm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 17:09:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50958 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfIKVJm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 17:09:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id c10so5077590wmc.0;
        Wed, 11 Sep 2019 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n16cPyUGslM6KMKGbHaPh288+P0FaBAw+lG06g1Nsw4=;
        b=M9/FZLqiGbfJbFPYPnS0AWkZBGsF6WSq9ZqNROTIP3AqCrwh5ytgU66WNZWYJ1Gepc
         /5K0IZrXhcT9oxyS5vkrqUbuA7CjanlruwKyXkw8SWn6ZIRCCb0WZfjKTPBqqqN0IOZo
         XBJrK347WAewZpIeai3f64n3POWzgXitZqWOgKAbSvGDLJRtb8xH6a+4X+jQCUJWidVo
         66TsBhXiJVR84MhhmSTy9W/XDvcUqALz26J0dWFHStcewoqEVtO3oYgnXHFfgGILxY7g
         ApL6wQhYq3E9aGy3R0TWs2SDjBtsO1dEKINl6G0RdP4L1BGO+sUgaEeni2oAEQHERTxC
         kwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=n16cPyUGslM6KMKGbHaPh288+P0FaBAw+lG06g1Nsw4=;
        b=kjun+++QFb2z0XV8kmfL2ukv7v7UhWF18a1jCNSyhKTR9v2nOqtpBPwbc1+5HcPk4E
         qrAZm3TfgKjmpejVXbDaG/PE1/bwSc8WB2W6EdK1pJ/PetywBQnLFF5ynCyLP0jUFZ9v
         Kc0NuCu9kWyFG70eq2ReitR4CKg0qRMG0m/5qKrUJXJd/Em1diRoXworYBmI+CL8eth4
         kshiIyRQdFngm8MfjeKUR54HhVuigQOVTfdgZgGEvNYO3XCxUtImcBU+k5O37JXX/E8K
         +YE7e3vMEAGVybR7aMFMQUKb8F4YrVX520vAEFY7uUazQyCEbQxGM+OYyCX2KXs4159K
         RAyg==
X-Gm-Message-State: APjAAAXj7UarEQ3VPwqHrYo80FRUBp5gW9xTJayTfetwD2Fjy6VVBBsL
        RmJTeUC1HywCrZ6RsLL7kFY=
X-Google-Smtp-Source: APXvYqygJFbSgl4cLcozHtIErNsR8Dyd+uAkq1MxbwyU8bYhY+1YmLssi+Ufo1/OhBAvXP/CEU2Cfg==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr5240725wmj.73.1568236177991;
        Wed, 11 Sep 2019 14:09:37 -0700 (PDT)
Received: from [192.168.1.19] (bku184.neoplus.adsl.tpnet.pl. [83.28.188.184])
        by smtp.gmail.com with ESMTPSA id q25sm4601862wmj.22.2019.09.11.14.09.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 14:09:37 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] dt-bindings: Add docs for EL15203000
To:     Dan Murphy <dmurphy@ti.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        pavel@ucw.cz
Cc:     Rob Herring <robh@kernel.org>
References: <20190909071632.14392-1-oleg@kaa.org.ua>
 <20190909071632.14392-2-oleg@kaa.org.ua>
 <0a24cdf0-4915-ff59-482d-d25def25d65f@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c18f370a-1765-695f-59de-81192e4e75e8@gmail.com>
Date:   Wed, 11 Sep 2019 23:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0a24cdf0-4915-ff59-482d-d25def25d65f@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/11/19 9:48 PM, Dan Murphy wrote:
> Oleh
> 
> On 9/9/19 2:16 AM, Oleh Kravchenko wrote:
>> Add documentation and example for dt-bindings EL15203000.
>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>   .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> new file mode 100644
>> index 000000000000..c00e1b55db97
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> @@ -0,0 +1,54 @@
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
> 
> FYI this binding Documentation/devicetree/bindings/spi/spi-bus.txt
> points to spi-controller.yaml binding
> 
> so maybe update it to the correct binding.
> 
>> +- spi-max-frequency : (optional)
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
> Your driver does not read spi-max-frequency, this is a property of the
> spi driver so I am not sure you
> 
> need to mention that here unless this property needs to be set
> specifically for this device.  If it does then it is not optional
> 
> for this device and it should be documented what the max freq is.

Right, this should have different form. We have two similar occurrences
in other LED bindings and in a few bindings pertinent to other
subsystems. This property is parsed in spi.c for each child node
of parent spi node.

It should be like below:

Property rules described in
Documentation/devicetree/bindings/spi/spi-bus.txt
apply. In particular, "reg" and "spi-max-frequency" properties must be
given.

>> +
>> +Optional LED sub-node properties:
>> +- function:
>> +    see Documentation/devicetree/bindings/leds/common.txt
> 
> You point the user to the common file but you use hard coded function
> names in the example.
> 
> The leds/common.txt file points to the include/dt-bindings/leds/common.h
> file and the binding says
> 
> "If there is no matching LED_FUNCTION available, add a new one."
> 
> Now I know we don't want to add the pipe, screen or vend so you probably
> do not want to have the user
> 
> going to that header.
> 
> Not sure how to fix this but the documentation is misleading. Jacek?

I'd just resort to common sense. If the function seems to be generic
enough then it deserves its own definition. We might change it to:

"If there is no matching LED_FUNCTION available and it is plausible
that it will be in demand in the future, add a new one."

> 
>> +- color:
>> +    see Documentation/devicetree/bindings/leds/common.txt
>> +- label:
>> +    see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> 
> Not sure if someone asked for this here but since this is a new driver
> it should not even speak of the "label" property.

Agreed.

-- 
Best regards,
Jacek Anaszewski
