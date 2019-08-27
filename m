Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082F49F4D3
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 23:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730376AbfH0VOt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 17:14:49 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51116 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfH0VOt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 17:14:49 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so523253wml.0;
        Tue, 27 Aug 2019 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yECDAiuiu9jr/nOshuFbg5LajN45t3Fqtc32iDnnNj4=;
        b=Sr8I+2KrGyakUbO16mBUGkqZiojwSQosnNXEu++6pvuqEd2dILfMv07vZ5Vv6B1SRE
         Sj/YcVhxpAEHDFUE6X7GhDm1PKeOT2n8pI+WKkv9nWakvjrpjBbNNzBUseIVO26sR1Y4
         IjrLf0I0/o2Psz/kGa0Z/P8hBAmT7egPD6OyhYKabAmqTr7iPJ/DDC9bOCny6+mgMKnK
         7lwegQvki8ESjOzqXKYZJ0sDl1HBbMR0Je0MgArIWWTrT3qTMDaEFArrlqRduojp/TYZ
         YXnJtU7A40rEexCsw7zr3cyhG8l6yC0PwysxJ12knlGsKWQg4XHQP4q1zZVYXgNV3zzv
         Lckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yECDAiuiu9jr/nOshuFbg5LajN45t3Fqtc32iDnnNj4=;
        b=X+2pwS4220YbviKGz2I3l6KyAxOE3tvVQa3mbL10LI1IfQ+AmjswPlYB3FOVd5LpA2
         im2IAA8QTlMRXyingA7HpTMb5UHgBVaCaCKJoL+Ml0g4eAyOZJxD/Bbm7ie+w7uw9DiC
         mpDcvojQNxAbgLsRd0GzSAOplQM/xgKGTifJYYgeOT+jEnPlPOndOgOYp86Uv5SEMfMo
         EpYi2VF+iqU5wehJER1Fxng8Y1E3/RXh+9ed1476zdRVt5DkA1K4d0owzjEGav3pKe3t
         6VVyYu1lnqZVlXzSU0oKTATIaMiWT9rem1dk2W06GTpfisNL54unqyGTNYxpGPH1EG9i
         sTuA==
X-Gm-Message-State: APjAAAWfEF5KYpudE2Bgb5GzxfViceyGYP8Oq8tcJ7Qu9NsRBLO2sqyz
        PRlSrtqa7VKTzIzLdSatmdh2GDYV
X-Google-Smtp-Source: APXvYqyUoeQFl82ZnGfYrHaOq3DoQDbcX2FuP3GBcJZEA+74Q64a4WWlsP5iy45x4x1AQL0eBYCsmg==
X-Received: by 2002:a05:600c:254a:: with SMTP id e10mr568638wma.113.1566940485789;
        Tue, 27 Aug 2019 14:14:45 -0700 (PDT)
Received: from [192.168.1.19] (ckl27.neoplus.adsl.tpnet.pl. [83.31.87.27])
        by smtp.gmail.com with ESMTPSA id b18sm149395wro.34.2019.08.27.14.14.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 14:14:45 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
Cc:     sre@kernel.org, nekit1000@gmail.com, mpartap@gmx.net,
        merlijn@wizzup.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190820195307.27590-1-dmurphy@ti.com>
 <20190826215822.GY52127@atomide.com> <20190826221413.GA19124@amd>
 <20190826224437.GZ52127@atomide.com> <20190827121818.GB19927@amd>
 <0eab6f72-ddb7-3da7-e90e-888374531f86@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <69925382-d8f4-4916-f121-0184a4219354@gmail.com>
Date:   Tue, 27 Aug 2019 23:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0eab6f72-ddb7-3da7-e90e-888374531f86@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 8/27/19 2:44 PM, Dan Murphy wrote:
> Tony
> 
> On 8/27/19 7:18 AM, Pavel Machek wrote:
>> On Mon 2019-08-26 15:44:37, Tony Lindgren wrote:
>>> * Pavel Machek <pavel@ucw.cz> [190826 22:14]:
>>>> On Mon 2019-08-26 14:58:22, Tony Lindgren wrote:
>>>>> Hi,
>>>>>
>>>>> * Dan Murphy <dmurphy@ti.com> [190820 19:53]:
>>>>>> Fix the brightness control for I2C mode.  Instead of
>>>>>> changing the full scale current register update the ALS target
>>>>>> register for the appropriate banks.
>>>>>>
>>>>>> In addition clean up some code errors and random misspellings found
>>>>>> during coding.
>>>>>>
>>>>>> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
>>>>>>
>>>>>> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
>>>>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>> ---
>>>>>>
>>>>>> v3 - Removed register define updates -
>>>>>> https://lore.kernel.org/patchwork/patch/1114542/
>>>>> Looks like starting with this patch in Linux next the LCD on droid4
>>>>> is so dim it's unreadable even with brightness set to 255. Setting
>>>>> brightness to 0 does blank it completely though.
>>>>>
>>>>> Did something maybe break with the various patch revisions or are
>>>>> we now missing some dts patch?
>>>> Maybe missing dts patch. We should provide maximum current the LED can
>>>> handle...
>>> Or i2c control is somehow broken and only als control now works?
> 
> With only setting CONFIG_LEDS_LM3532=m to the next branch I get full
> brightness with 255.
> 
> I also see half brightness at 128 with the ramp down working.
> 
> I am not able to reproduce this issue on my device.
> 
>> Well, max current led is obviously missing. Plus code does not check
>> the return from reading led-max-microamp.
> 
> led-max-microamp is optional so there is no need to check the return.

It's also ugly to not check it when you have it assigned.
We'll soon receive complaints from static checkers about pointless
assignment.

I'd distinguish between cases when parsing failed,
and when property has not been provided.

if (fwnode_property_present(child, "led-max-microamp")) {
	if (fwnode_property_read_u32(child, "led-max-microamp",
				&led->full_scale_current);
		dev_err(&priv->client->dev,
                         "Failed to parse led-max-microamp property\n")
} else {
	dev_info(&priv->client->dev,
		 led-max-microamp property is missing\n")
}

> full_scale_current should be 0 if not populated and in the init only if
> this variable is set does
> 
> the code program the register otherwise it is default of 20.2 mA.

-- 
Best regards,
Jacek Anaszewski
