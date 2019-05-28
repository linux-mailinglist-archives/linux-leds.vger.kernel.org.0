Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5AD2CEA6
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 20:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbfE1S3k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 May 2019 14:29:40 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35764 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbfE1S3k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 May 2019 14:29:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so18702125ljb.2;
        Tue, 28 May 2019 11:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ApSQAPYNVrYgxmMbeV7SpyKXmQ3NzOUV65344N4/CnE=;
        b=mhDr4uaFWIOl1c1lee2gXgfPk8pxOyjT+EhoF89F1baYQ1fmEyzGn2AYIBwLrqO+0B
         hPCZgZDYW9TUIlqalR4XMnLtK7yVWw3oXE4WBbjs8OvNE3c6nus2cjEOgAlo1ELhrExk
         +Q6mHKrkSc6e/nXKPB212elX8TEsD1EmRiy+UXjzeEuDzUaMNLexmG3Akg8+x0KmLqpL
         JcdERCVOWsEt7AN2kqDN+owYbk5Br8xEjs8n1z3LMu6rGBzWeYTDER5/YCQrQfPboj1v
         ZbWD44lgw6Qhbh7FF5qOq8lEOtbxclOhikil3/eKxScAhh21k710E06560bijSBft6yR
         G0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ApSQAPYNVrYgxmMbeV7SpyKXmQ3NzOUV65344N4/CnE=;
        b=EWOMwQyQAa6emWgVFlvwu552AEGTnVL5eKjzcQhdSdIKzbzXyX609ckMTXgOi2Omdm
         UpG+owg3EUIL/8GxHYa8yVZlHJ0sDGhqbHlp4CA8hwH6j6KQEBts5TD3Xk3olZXEhQSQ
         lz4Y45yyVoB3urfjww32dLPB468CAw81BOjga7yCiVi1oPSX47OJ4mZ4EwNg80M2zobM
         v/FC1j3TNyPR6X2PqUJRFoxqOi6E3e/6RFhRn35iJP7rTQJY4RMwMREV8ftzi2Nn51rk
         3zSG10nVq0Kb/OzAgspgs5Xq7uV5V/99DZqRQCF/03XbLT48KLHK9N64WOq4EBE+56DJ
         q5xA==
X-Gm-Message-State: APjAAAXqSokj9/GfOHFyXOy3hT6xHA9ux0ASI5Qj92wlqiH+zzvXR6aA
        x7CQYoDzyNPVoYKXLwlcCa+JEzob
X-Google-Smtp-Source: APXvYqwBVP84sl2b4o1kholgXysCiQIje+AspwOKOeG07Hvt9f++cEkdNQFtQblo1E8pZbqHosTNBg==
X-Received: by 2002:a2e:5852:: with SMTP id x18mr30961474ljd.81.1559068177786;
        Tue, 28 May 2019 11:29:37 -0700 (PDT)
Received: from [192.168.1.17] (cis152.neoplus.adsl.tpnet.pl. [83.31.42.152])
        by smtp.gmail.com with ESMTPSA id m11sm3000176lfk.82.2019.05.28.11.29.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:29:37 -0700 (PDT)
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
 <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
 <185abdd6-100c-0a71-2da9-8f556d8ea701@ti.com>
 <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
 <e54d9d29-5daa-fd3a-a5a9-ebd2450882ee@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c947d07c-2a8d-b9a8-b2ac-6c249ac54bca@gmail.com>
Date:   Tue, 28 May 2019 20:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e54d9d29-5daa-fd3a-a5a9-ebd2450882ee@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/28/19 8:19 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/28/19 12:44 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 5/28/19 7:32 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 5/27/19 3:00 PM, Jacek Anaszewski wrote:
>>>> Hi Dan,
>>>>
>>>> Thank you for the update.
>>>>
>>>> One thing is missing here - we need to document how legacy brightness
>>>> levels map to the sub-LED color levels, i.e. what you do in
>>>> multicolor_set_brightness().
>>>
>>>
>>> Ok so i will need to document the algorithm that is used to determine 
>>> the color LED brightness.
>>
>> Right, and please send just an update of that single patch.
>>
> 
> So you are asking for v4 with only this patch updated.

Not exactly - I am asking for v4 of this patch. We don't need
to spam the lists with the rest of unaltered patches from the series.

The interface seems to be the most vital part of this patch set,
and it is possible that it will undergo at least slight modifications.

We will move to discussing the code once we achieve a total consensus.

-- 
Best regards,
Jacek Anaszewski
