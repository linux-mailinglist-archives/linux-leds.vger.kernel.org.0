Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B40ED3099
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 20:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfJJSnA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Oct 2019 14:43:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50593 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfJJSnA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Oct 2019 14:43:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id 5so8015740wmg.0;
        Thu, 10 Oct 2019 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nIWIITr28i6KbyOyO87MIlIpYz5kcwfm7f7WnksAVIY=;
        b=Ux6mXJAjmffQ/0lVNbiGdeZ8TLd8LEJnk7LUi/x8WpWU6TocItMTaDfwLfI/eUyCdf
         Frxofqg0Pv23Ibctq+MzKyh4MoWlmln10hDuszJVE0jugYOaBQF2MtB7nEJI7+M1L9Hr
         JrwEYUaLeUbScAq5PuMpNSPR8wE1U/+oyINGErWMdJtPnnxkMAB19d2y7kjWP4jmVc1U
         xMbDqhTYg4E2JClwniAlRLoYtgHzm2trSVXFXnhVpiZsGbUCTqFj0Gm0Zyfl7rQMrpG8
         7VOexWqAvplM7V5Be+AWYJOkga7CN9PZXICCQM8iW+2vZ/kiQj02NsZ6MRfQPLSvYRdr
         d/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nIWIITr28i6KbyOyO87MIlIpYz5kcwfm7f7WnksAVIY=;
        b=EfOXF8F9Ze8b26UqXS8wB3tdPpe2eYSecgv/vYcUDFZVl9+Ugk8uPMMs3DTK18wnbd
         B0783cli93RmwfkTpHORHpwbLv10sCYy5a9hw1h6pIer1fuFNmFiIGL/evBPrf+ZElnS
         E1IOyGfjC3i5fkLu3ZnQtCODT+7xOISjqCo+YyB+ZYkW1yfw6eOJ0XmNwg2rPIRyo9DO
         MB5fBt53MRqJQCyNEjuPwE05EUdAwJr7B9wO7R+mfy2wBN3Ac8wQSN7QoMmJ5CL1eNMi
         9NsesisDo5e+s2M7/W6bqo4DmXx/9/8ME5R70fuZ/jDE2EMyX62BYpntTZiJWp6s/OYJ
         5F5A==
X-Gm-Message-State: APjAAAXSXmQcuCSmtb45CiTYERrwRQoBIe+RGNW5CdMcnqPaHiTSSUYA
        21u/Y4/5xJMjAxDmQYndcHdfxe5L
X-Google-Smtp-Source: APXvYqz6gNCnFend5AFxlJA12xqK71Ro5ZuLDWRY0mL9QugtJXE+VPdqG73Kj+uA4L2rMyZztEHhZQ==
X-Received: by 2002:a1c:2e4c:: with SMTP id u73mr14940wmu.94.1570732976973;
        Thu, 10 Oct 2019 11:42:56 -0700 (PDT)
Received: from [192.168.1.19] (bkt243.neoplus.adsl.tpnet.pl. [83.28.187.243])
        by smtp.gmail.com with ESMTPSA id 79sm8157164wmb.7.2019.10.10.11.42.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 11:42:56 -0700 (PDT)
Subject: Re: [PATCH v11 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191008204800.19870-1-dmurphy@ti.com>
 <20191008204800.19870-2-dmurphy@ti.com>
 <487f2425-1570-c946-c4a6-3da60ad21f2c@gmail.com>
 <fc2de5ad-5dd6-0ea0-5ec6-2dfdd7429c09@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <63197144-11e1-f6bb-f1aa-13b33435f2f2@gmail.com>
Date:   Thu, 10 Oct 2019 20:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc2de5ad-5dd6-0ea0-5ec6-2dfdd7429c09@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/10/19 2:49 AM, Dan Murphy wrote:
> Jacek
> 
> On 10/9/19 5:07 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 10/8/19 10:47 PM, Dan Murphy wrote:
>>> Add DT bindings for the LEDs multicolor class framework.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   .../bindings/leds/leds-class-multicolor.txt   | 98 +++++++++++++++++++
>>>   1 file changed, 98 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>> b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>> new file mode 100644
>>> index 000000000000..8619c9bf1811
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>> @@ -0,0 +1,98 @@
>>> +* Multicolor LED properties
>>> +
>>> +Bindings for multi color LEDs show how to describe current outputs of
>>> +either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
>>> +etc.) or standalone LEDs, to achieve logically grouped multi-color LED
>>> +modules. This is achieved by adding multi-led nodes layer to the
>>> +monochrome LED bindings.
>>> +
>>> +The nodes and properties defined in this document are unique to the
>>> multicolor
>>> +LED class.  Common LED nodes and properties are inherited from the
>>> common.txt
>>> +within this documentation directory.
>>> +
>>> +Required LED Child properties:
>> s/Child/child/
> 
> Ack
> 
> 
>>
>>> +    - color : For multicolor LED support this property should be
>>> defined as
>>> +          LED_COLOR_ID_MULTI and further definition can be found in
>>> +          include/linux/leds/common.h.
>>> +
>>> +led-controller@30 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +    compatible = "ti,lp5024";
>>> +    reg = <0x29>;
>>> +
>>> +    multi-led@1 {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        reg = <1>;
>>> +        color = <LED_COLOR_ID_MULTI>;
>>> +        function = LED_FUNCTION_STATUS;
>> Status is not too fancy function for multi color LED ;-)
>> I'd skip it entirely for this example if we don't have
>> anything suitable at the moment for our disposal.
> 
> Not sure I understand.  Status is a good example as a RGB module can be
> used to present charging status

So, maybe LED_FUNCTION_CHARGING ? This implies that color can change
gradually during charging. However me might think of adding
LED_FUNCTION_VBAT or so.

-- 
Best regards,
Jacek Anaszewski
