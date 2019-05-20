Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC041241E3
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 22:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfETUPS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 16:15:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35905 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfETUPR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 May 2019 16:15:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id y10so11305898lfl.3;
        Mon, 20 May 2019 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ulOcPJN5Sj8vXX9GoI4ozux4fpK3FcPD+Ai6tkx85eg=;
        b=uoLOWfozWaID/1KFMb/hu1zMlw/8/pHql6ZcdhMekHN0XS4e15PMIXjFU18l+yrxDQ
         qy/YUKChEGNUZIESvwK356UZ/pPYxX+5N9AcbWBDFQ38SimAQFkEHpe5ZNBa5sr8/5yC
         a/jsn9rSxnO6EoK9KZ/tOPFTTt32ydrP3GYzKIU2ZD9UqiameKf4iwhUdrnZCWxoAJyB
         h8csBd+3/p0gzCw2PCErBR9KJOZVyI5tsXyBtVgsC/qWCkDg0NZJnZZ2v4EIcw7LakpK
         6QHR92Rs5l5YrM8QEKHhvO9OE8I3qkT9uBDR72U9Bs9eyJMjYgk3xgnlTB1tL4OZWp9m
         waWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ulOcPJN5Sj8vXX9GoI4ozux4fpK3FcPD+Ai6tkx85eg=;
        b=rVnX1Frwkl9QxKyqKfCTHPc1PCzkE5JyVQGEEEgVCJMQAKBUSXzp5kK2dMouBr+lNU
         GB3OYP08LDb9oczQhRczdxkQYuJK0kpAtp+5QKlpKX6X4duTleY735m79SIsQR5Zfe/s
         f4g2toOaPo7VWyatNOj3RQXyp533WB0jZdzZWERvFVq/Yw7rdFQ75Jh3PXg5LAc+JZi4
         JNrjcmrSGjbIvAPPdvmf3774uUiTxKRDXPc1fdYK/JdaxHzAy+VmGSZVTDnFxmrhLL0K
         D9kQuhp1vWii0NEICS2HhwMtZbVvt8XZ14ZKfFqy0QfUJ7U7tJxJ68u1I7moIsbmG990
         vuOg==
X-Gm-Message-State: APjAAAWKBGZ3LogANRk82E3USfN0TZK5h5CnLwBQpQbzge8cH/26qot4
        5MEDBW67QxYJPGlJXFWCVgY=
X-Google-Smtp-Source: APXvYqwWvicXJFaMQpoAQ7vJMjoj/fGeFe+QRSbnQHRGM/jYMoucuRhjE79Joho9qq6Ds3sFPWdGGQ==
X-Received: by 2002:a19:c517:: with SMTP id w23mr21024360lfe.73.1558383316086;
        Mon, 20 May 2019 13:15:16 -0700 (PDT)
Received: from [192.168.1.17] (blc206.neoplus.adsl.tpnet.pl. [83.28.196.206])
        by smtp.gmail.com with ESMTPSA id x16sm4100823lji.3.2019.05.20.13.15.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 13:15:15 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Christian Mauderer <oss@c-mauderer.de>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190513193307.11591-1-oss@c-mauderer.de>
 <20190519212501.GC31403@amd>
 <1850ba07-2c0c-2624-4ff3-fd507e49439f@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <99283573-2711-08b6-b95e-27732c175bb4@gmail.com>
Date:   Mon, 20 May 2019 22:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1850ba07-2c0c-2624-4ff3-fd507e49439f@c-mauderer.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christian,

On 5/20/19 7:19 PM, Christian Mauderer wrote:
> On 19/05/2019 23:25, Pavel Machek wrote:
>> Hi!
>>
>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>
>>> This patch adds the binding documentation for a simple SPI based LED
>>> controller which use only one byte for setting the brightness.
>>>
>>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>>> ---
>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>> new file mode 100644
>>> index 000000000000..28b6b2d9091e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>> @@ -0,0 +1,44 @@
>>> +* Single Byte SPI LED Device Driver.
>>
>>> +The driver can be used for controllers with a very simple SPI protocol:
>>> +- one LED is controlled by a single byte on MOSI
>>> +- the value of the byte gives the brightness between two values (lowest to
>>> +  highest)
>>> +- no return value is necessary (no MISO signal)
>>
>> I'd expect this file to be named acb-spi-led.txt, or something, and
>> talk about that u-controller, not its device driver -- as devicetree
>> binding describes hardware, not driver.
>>
>> But you already have an ack from rob, so...
>> 									Pavel
>> 									
> 
> So basically it would have been better to move the description that I
> added to the c-file as "supported devices" in the device tree file?
> 
> With both commits already acked: Rob and Pavel: Should I change that?
> 
> If you both say yes, I would rename the file in the binding like
> suggested and move the detailed protocol description from the driver to
> the binding.

Let's not ramble on it. It is good as is.

Patch set applied to the for-next branch of linux-leds.git.

Thank you for your work.

-- 
Best regards,
Jacek Anaszewski
