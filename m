Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8843613C07
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 22:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfEDUHx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 16:07:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35749 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfEDUHx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 16:07:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id z26so3126655ljj.2;
        Sat, 04 May 2019 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZHl1pbFAD06vM4SRj+T3eEbwjMbL1OGEhThMHUqWxkM=;
        b=Iz0DEO8TASaj59hC5/ORUEdKwTOCeoZp6Mkvivx3T/f9akrTbWxUwDAOglCKTrMFAj
         b0nP1N1jISnwRFNP1WbgG+L+HW70HZyHIzBGg3ufelzANGZW3dvTBy336TesN4CvuP7J
         QfM8eJ4iaFpE1SeqEO7FALsanGQ80luB3cAmJz9VUCZz2Cj7UUpit54MZJBQO3h22r55
         MWyXqXlW2wIlZbV2c2SECPS8rmyLIpCS/7o5/TMtKrIAVFzZUVvGKrRwPY8X7lAFO2+I
         X/g1Z8ptkSp9JDvy+GyAnDDdNLQk5UqBfduio+UCqWljO5uRdQrs1SEisuCe4SfqgI5x
         5B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZHl1pbFAD06vM4SRj+T3eEbwjMbL1OGEhThMHUqWxkM=;
        b=Gh49+q8DHmJkWEE7WRKxuJfthCir4BujCKXuaIHA9sar9cx5CMsjcr50yd3YGt54ZC
         fB+5v7MEEDU8H9T5du3Ak/93J80BDbtUQOb58KS1dV243uEAhoA/1KHzHB0qt4fKGkuc
         vsSo1Y7FYDXBHhlE9/9+rNWqjcEc/ZvnnfEFHXekt6MfSO69Wo1nHiu93/t1vjIFZ4ol
         w0/zijdcGR6ChqqqSKFWgsfVGnhRe6IMf08bVyQs3AG3dW55cCJ9y7QVoGXDEMcVcGiu
         82mUUMOkKpMIlOqUUMFlXAufYLdWTeiKOguptdBPH41d0uPjR5eVb2/cvpUVN1EctDm1
         RxHA==
X-Gm-Message-State: APjAAAU/PFX8WYYo7QVWfi4NmZr+94GJ0S/SHMlD6Ts3SxQeWhb244O8
        EJTaO9m4hkYnTO/k+KnDeXU=
X-Google-Smtp-Source: APXvYqyBIVb838xbD1NrDHp1sI197fvFT7vb/cRysyHs5nTM5sUjXzVRxxGIyOpIUJJvERzSUDXz4g==
X-Received: by 2002:a2e:9094:: with SMTP id l20mr9027428ljg.60.1557000470733;
        Sat, 04 May 2019 13:07:50 -0700 (PDT)
Received: from [192.168.1.19] (cit41.neoplus.adsl.tpnet.pl. [83.31.43.41])
        by smtp.gmail.com with ESMTPSA id f9sm1051635ljf.69.2019.05.04.13.07.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 13:07:49 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
To:     Christian Mauderer <oss@c-mauderer.de>, list@c-mauderer.de,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <d1704398-ae90-b4e8-50d3-f9533d94ab2b@gmail.com>
 <1ae5880f-7af3-ac14-6515-31217b6ed8fb@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <3bfa6347-d957-f57e-ce11-6a26cd2b7817@gmail.com>
Date:   Sat, 4 May 2019 22:07:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1ae5880f-7af3-ac14-6515-31217b6ed8fb@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/4/19 10:01 PM, Christian Mauderer wrote:
> On 04/05/2019 21:45, Jacek Anaszewski wrote:
>> I missed two issues, please take a look below.
>>
>>> On 5/4/19 2:28 PM, list@c-mauderer.de wrote:
>>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>>
>> [...]
>>>> +- ubnt-spi,max_bright:    Value for the maximum brightness. Default
>>
>>  From DT POV the only valid reason for which max brightness level would
>> need to be limited is a protection against hardware damage. Please use
>> led-max-microamp property for that if this is the case. Otherwise such
>> setting can be skipped.
>>
>> There are two bindings that allow for configuring max-brightness level
>> but they quite old.
>>
> 
> My intention with that has been slightly different than limiting the
> current:
> 
> The driver uses a very simple protocol for setting the brightness: It
> sends one byte via SPI. The value of that byte can be (for that
> controller) between 0 and 63. My intention when adding the limits has
> been to allow adaption to similar hardware by changing the values. If
> for example some other controller wants brightness values between 42 and
> 173 the off_bright could be set to 42 and the max_bright to 173.
> 
> Note that Pavel Machek suggested: "Alternatively, call its led-spi-byte,
> or something, as it is really trivial protocol. Maybe other chips will
> have same interface?"
> 
> If I follow that suggestion (which I think would be a good idea), I
> would even need the values as mandatory ones instead of optional ones.
> Would "led-spi-byte,off-value" and "led-spi-byte,max-value" be better
> names in that case?

Yes, that makes perfect sense.

>>>> value for that
>>>> +            is 63.
>>>> +- label:        A label for the LED. If one is given, the LED will be
>>>> +            named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
>>>> +
>>
>> Please use just:
>>
>> label : see Documentation/devicetree/bindings/leds/common.txt
>>
> I'll use that.

Thanks!

-- 
Best regards,
Jacek Anaszewski
