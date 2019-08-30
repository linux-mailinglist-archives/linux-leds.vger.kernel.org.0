Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B20CA3EBC
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 22:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfH3UDn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 16:03:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44627 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbfH3UDn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Aug 2019 16:03:43 -0400
Received: by mail-wr1-f65.google.com with SMTP id b6so5319001wrv.11;
        Fri, 30 Aug 2019 13:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nbYgAXFqpEWpNeQdfqqbRNi1Pqjjuw9bXcRhhmygscU=;
        b=ghce4EdrrmKF/JNEWJmx3/wD4G8s8LJIBaS6IXeGu/PtAqH2YS+e9eXg2yrVT0Cu5e
         6zHKsEP8MbyQOoS4zY9vYYDFPxS12ZqLbf8WUXCCPZ63RKYE5Br9Iiq/rwl/2JNRyQRv
         i+BxBZTYfsBexhmFAQ64yKXwIZQjdC+1imU/B7c7cLxn09eSW0An6P86ISuKGZQyIN1j
         +t9AniPdKTy84ym/hScLXQRl1ysm4fjSIooE1EGDCRe6OF4lAQ6plwhhB62TrRtbIcUs
         58jSa6bPc6nArWDLV9pQd/qPOCeMicooefr3m4bZIvKJTv0VBMD/mlkw70nahZFO/evw
         a31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nbYgAXFqpEWpNeQdfqqbRNi1Pqjjuw9bXcRhhmygscU=;
        b=p1ZsXT+6DJmXKQ+0h4hxWElXYwIOdUOfl4tLK5kW2bw8mniiTrmjXI13IjbRWO51xx
         gdBUTOY6sQG8z4JVgu0p0RJWBo9Qenh+xWacclO/RwXcFFF9Z97Busm3Ybuqppl0c+DR
         JvrC3Oge3iafuLgWNgEzC+XvViJxqaXPCAXmf5NbMllvBy3ypdb4WaxrWK4HzGVvsYVC
         EZ9/xZ35ugDUzFHDDnLv5MLwHuOQbXUA+yy4UWYwthLWX5IU3WCNcZgogWULmFVn1pPf
         1vjbiPwtjX24on4CdeI6XxQ1RGSS0fPapDedexSag/LCtTxcfsFuV95uN/Rlq0bZ6P7q
         GUXg==
X-Gm-Message-State: APjAAAV0ZTMLtwjBPdvAhTuIxFquKQ3cq8jlcMdmz8I79aXlGgi9apAR
        gb7l9M19mE2y82A0RT4AGNXVuFxw
X-Google-Smtp-Source: APXvYqw78Idx922crI47NGdYtGq3qj3NX4iTuBc15dSzGBN8eNCnIDEkIdUbdjAc+RTAZk8WJeXAog==
X-Received: by 2002:a05:6000:104c:: with SMTP id c12mr19509276wrx.328.1567195419866;
        Fri, 30 Aug 2019 13:03:39 -0700 (PDT)
Received: from [192.168.1.19] (bkn35.neoplus.adsl.tpnet.pl. [83.28.181.35])
        by smtp.gmail.com with ESMTPSA id f24sm6524809wmc.25.2019.08.30.13.03.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 13:03:39 -0700 (PDT)
Subject: Re: [PATCH] leds: lm3532: Fix optional led-max-microamp prop error
 handling
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190829191836.9648-1-dmurphy@ti.com>
 <ff3a0662-a71b-79d5-6d28-a882f9f77f89@gmail.com> <20190829212247.GB32254@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5afc6d1e-3cec-7d80-0911-9c42f973dae2@gmail.com>
Date:   Fri, 30 Aug 2019 22:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829212247.GB32254@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/29/19 11:22 PM, Pavel Machek wrote:
> On Thu 2019-08-29 22:04:18, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thanks for the update.
>>
>> On 8/29/19 9:18 PM, Dan Murphy wrote:
>>> Fix the error handling for the led-max-microamp property.
>>> Need to check if the property is present and then if it is
>>> retrieve the setting and its max boundary
>>>
>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>  drivers/leds/leds-lm3532.c | 14 +++++++++-----
>>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
>>> index c5cfd8e3f15f..13b4265fb85a 100644
>>> --- a/drivers/leds/leds-lm3532.c
>>> +++ b/drivers/leds/leds-lm3532.c
>>> @@ -601,11 +601,15 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>>>  			goto child_out;
>>>  		}
>>>  
>>> -		ret = fwnode_property_read_u32(child, "led-max-microamp",
>>> -					       &led->full_scale_current);
>>> -
>>> -		if (led->full_scale_current > LM3532_FS_CURR_MAX)
>>> -			led->full_scale_current = LM3532_FS_CURR_MAX;
>>> +		if (fwnode_property_present(child, "led-max-microamp")) {
>>> +			if (fwnode_property_read_u32(child, "led-max-microamp",
>>> +						     &led->full_scale_current))
>>> +				dev_err(&priv->client->dev,
>>> +					"Failed getting led-max-microamp\n");
>>> +
>>> +			if (led->full_scale_current > LM3532_FS_CURR_MAX)
>>> +				led->full_scale_current = LM3532_FS_CURR_MAX;
>>
>> One more nit: we have min() macro in kernel.h for such things.
> 
> Actually, I believe this one is okay. min() would be also good, but
> improvement is not that big, as it still duplicates the argument.
> 
> led->full_scale_current = min(led->full_scale_current, LM3532_FS_CURR_MAX)

I don't see any excuse for not improving that if we are at patch stage.
It looks simply cleaner.

-- 
Best regards,
Jacek Anaszewski
