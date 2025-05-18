Return-Path: <linux-leds+bounces-4679-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797AABB0A0
	for <lists+linux-leds@lfdr.de>; Sun, 18 May 2025 17:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD0187A949B
	for <lists+linux-leds@lfdr.de>; Sun, 18 May 2025 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B363C155A30;
	Sun, 18 May 2025 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPXRedYo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49ED2FF;
	Sun, 18 May 2025 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747581412; cv=none; b=RYT4byttv6Y8uVsz8yykjlPLuDOzWYh9ZUXW5rSmjW8o2y90h9WreuVuEehmKNun+CKYvjX3jkoSG99zPrIIsVefudvJmw/hW/vKt5AQjQLhz/3zlqwnhW/Kuv5zN2miUnH6uHVUelXhQwyzd047iw/yoJ7mp+3B7ltTBsTpWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747581412; c=relaxed/simple;
	bh=0M99uR6VtEeVu2HM9OV0ioREjPs8FFRmwVuk+RGUQ4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu3tu02GQFAuUIrTZUV2bonkr/yN8cGWMlJe2NQyoKHcIHGCkdJYaEHCyZ+rcYYCtLWmdPj/PJcO2MFsdmjccv9pbOVv+6VNlweIUZ1MaEr5UdlQqvGbCAN0Oulxq+LtihI0fOKKEsWkZuXDFA5eWH3S6F7pU9mpyO9/JXcjnFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPXRedYo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-600dbfe7b37so1171176a12.2;
        Sun, 18 May 2025 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747581409; x=1748186209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jg+fw7EDzEDJpoC1xV70ZlY78TgvZo4INictlSEjOJY=;
        b=SPXRedYo9qbHvP7uT6674G6HVWe6yc/hbvkaZuceV18VmGpsANvGPfRw1K8GNTEMjS
         vxSl+msRbvO77bgUOfTPahkigNeUPbiCzMFaxL7kmtJpPQPL39US8rT4boUN2VRQ/ZXq
         meooA1gdw1CqZfazqSgwBBWHRq/svnsJxZoLRZ4kfQqw5tHNNaj5aBzXD1/TGkRRviHu
         tLGSP5PPkBkiKU16ywi/X8+H6ca2YjgX5IXvQL0BjMGFvdVCu13o2l/Z5ICrdB5M2Rnz
         GWii/Ier4UA3JHJmmhUd3nYqkt0V1baUcx/8H+23Vwy1Rq7nin8EspMpWn/48ntL8CQx
         X7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747581409; x=1748186209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg+fw7EDzEDJpoC1xV70ZlY78TgvZo4INictlSEjOJY=;
        b=Di1Xm6apw/un4HC6m7bDORnrr/xg3zZog4SvZYTRlI6t/5pVy4iI4lJM1HLER9YdJm
         BC1DZ1+hCQQSUN7orvUmIlHEY7Y2aqJQV4q8ld9WHysV4x0Us1LkT/sQZuYitC9e7Qgr
         ykp87m4NjhurJoJuQgDEh7bwLRyoG6BgrBxJ+hr51A5fy4Bz0Qf5YpT6CieNXMqpdt44
         NAHNHQAKYKJXcgmtKj8qaGJNwhk/ZiNpDaMhujXYjOJC6mddVrwmxFym8+v/smfE8FjZ
         QjH+/50OhbNmtjfQwrayfh1ZkhbJ7p9F/e+YYGHqOpFv9rofFpZok/oCXXp+OmhlPu/Z
         GkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW73GXG+d3QPvHhU9JIklaJuKUlKcWLW6tsbnsopfltbEFD1snZyyR7Rjphm0NZRoooCj3DBxY3lCxfSSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9sts9IYfGzVyvnsUQovPDUpLnURArkwcSLoEs2IwXNR7TayOj
	NB1e3psSql/HFFy++noKE1ZbXfXpKZ6sP9AHHcdteq9R7cYlmJAgeP4zmA9a99NN
X-Gm-Gg: ASbGncughG6FeKe+058uUDUasqtPfwXCMZ5Kg0QlbKauZs0NVsZKdVJNonALJrNIHAY
	60QkfDsl7xL9qLfWTaN32p6Gbd/dJkKKnK3SPt9xe5IMQqVBwsrJGIsP3LwnWh+ZLzm+cjRW8Rs
	4mvTLLqDbL62SUDRTG138x3QqM4mL1ag3NBu3S53lucUT8aKGbUqWw+mM+VNCcKunj3fyfYihcv
	hUyUcZ/ai6MzjiC+5ML0fd5NzZVQKhrVa3Eic1QmBVI2C41sSLdZOmsqjiSyK5Pjlpf74oWR1R/
	UN2ulTTLpPMen18zR7uQbC35CK3q/Sd+GqYq+0eVPsJDjgQnFtYrMZ2uWGPowjOY
X-Google-Smtp-Source: AGHT+IHSOLfOZHtwSC7zPakNnnPK/cOfsN5BxsWd7LyoOBbgaJNyZ4rD5Oxax3ZtQFz2hu/tjMToqA==
X-Received: by 2002:a17:907:d643:b0:ad5:6b8a:a0a6 with SMTP id a640c23a62f3a-ad56b8aa760mr159432466b.58.1747581408781;
        Sun, 18 May 2025 08:16:48 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e680sm455554966b.37.2025.05.18.08.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 08:16:48 -0700 (PDT)
Message-ID: <735ee040-192a-47c1-b714-1983d650a175@gmail.com>
Date: Sun, 18 May 2025 17:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <Johan.Adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kernel <Kernel@axis.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <5d34aec7-5027-4575-b860-afdf7b2c0757@gmail.com>
 <PAWPR02MB92815DC59F65E90956269EEC9B91A@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <449cf572-f637-42c9-b804-aaf74178e96b@gmail.com>
 <PAWPR02MB928130924556174EA494C97D9B90A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <PAWPR02MB928130924556174EA494C97D9B90A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 5/15/25 09:36, Johan Adolfsson wrote:
> Hi Jacek,
> 
>> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Sent: Wednesday, May 14, 2025 21:55
>> To: Johan Adolfsson; Lee Jones; Pavel Machek
>> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel
>> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi_index
>>
>> Hi Johan,
>>
>> On 5/14/25 16:34, Johan Adolfsson wrote:
>> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Sent: Tuesday, May 13, 2025 21:52
>> To: Johan Adolfsson; Lee Jones; Pavel Machek
>> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel
>> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi_index
>> ..
>>>>                         }
>>>> +                     ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
>>>> +                     if (ret) {
>>>> +                             multi_index = num_colors;
>>>
>>> Why not to fail if 'reg' parsing fails?
>>> It is marked required in DT bindings [0].
>>
>>> I didn't want to start failing if reg is missing since it has never been handled until now, despite what the doc says since 2022...
>>
>> There is one in-tree user [0], and we will need to patch it as well,
>> because it uses reg 0,1,2 for each RGB LED module, instead of iout
>> numbers as it will be after your change.
> 
> Not sure i follow you here. What works for me is starting with reg = <0> for the childs of each bank (multi-led).
> The register (maps to iout I guess) is calculated based on led_number * 3 + i where i is the offset as well as the color_index in subled_info (reg).
> So I don't think additional changes to that dts is needed.

OK, if we document that reg properly as an index of the LED within
given RGB LED module. Initially I thought that it would be better to map
it directly to the IOUT, but the way you propose will allow to keep
existing DTS unchanged.

>> We will need to also state clearly in the bindings that 'reg' property
>> maps to iouts for the non-banked RGB LED modules.
> 
> Not sure it actually does, haven't really tested that, or at least not gotten it to work as I expected.
> For the non-rgb led in the product I requested those to be on the first pin on each bank (wasting 2 pins per bank),
> since I couldn't figure out how to configure it in another way when prototyping.
> 
> Since the 3 outputs per bank share a single brightness setting, it could complicate things as well.
> (And we didn't need all the pins anyway)

Here I was talking about non-banked LEDs. But regarding banked LEDs,
setting LEDn_Bank_EN bits assigns all three LEDs from given RGB LED
module to the bank. Then all IOUTs from the module are controlled via
BANK_A/B/C_Color registers, and by common Bank_Brightness register.

>> For banked RGB LED modules it is more tricky, because there is one
>> LED multicolor class device created for them. Probably to be correct
>> we would need make the 'reg' properties in the subnodes also arrays
>> reflecting iouts that will be governed by BANK_A_Color, BANK_B_Color,
>> and BANK_C_Color registers respectively. And DT parser in the driver
>> would need to enforce proper iout definition for the banked modules
> 
>> E.g. the multi-led@3 node from the example should look like below:
>>
>>              multi-led@3 {
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>>                  reg = <0x3>, <0x4>, <0x5>;
>>                  color = <LED_COLOR_ID_RGB>;
>>                  function = LED_FUNCTION_STANDBY;
>>
>>                  led@9 {
>>                      reg = <0x9>, <0xc>, <0xf>;
>>                      color = <LED_COLOR_ID_RED>;
>>                  };
>>
>>                  led@a {
>>                      reg = <0xa>, <0xd>, <0x10>;
>>                      color = <LED_COLOR_ID_GREEN>;
>>                  };
>>
>>                  led@b {
>>                      reg = <0xb>, <0xe>, <0x11>;
>>                      color = <LED_COLOR_ID_BLUE>;
>>                  };
>>
>>
>> [0] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
> 
> Not sure about that, I dont' think we handle an array of reg values within the led node.

Above I proposed to implement handling of it. But, if we are not going
to treat subLED's reg properties as IOUTs, but as an index of the LED
within RGB LED module, then we should change the bindings example for
the banked case to the following, i.e. have subLED's reg also 0,1,2:

             multi-led@3 {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 reg = <0x3>, <0x4>, <0x5>;
                 color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_STANDBY;

                 led@0 {
                     reg = <0x0>;
                     color = <LED_COLOR_ID_RED>;
                 };

                 led@1 {
                     reg = <0x1>;
                     color = <LED_COLOR_ID_GREEN>;
                 };

                 led@2 {
                     reg = <0x2>;
                     color = <LED_COLOR_ID_BLUE>;
                 };
            };


-- 
Best regards,
Jacek Anaszewski


