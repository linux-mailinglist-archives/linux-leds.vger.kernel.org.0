Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2FB22B7D0
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgGWUbo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgGWUbo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:31:44 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4B5C0619DC
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:31:44 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id e22so5455783edq.8
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 13:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7e9PhYSHXI55VLDzFZA/CWum+P1vqY/Iq46EGI3J/Lg=;
        b=pED0heWOqlj51/usMMQm3Kgx/Te96cuiuJLhBc3cA0oued/qYV4iTqYT3Qj/uHqCoj
         61oNlKIbSYWP9velNBwjQPj8v2BFJjDmbOn5CF0ovZPg9mzO5k4cprYDV2ESJ6VfR/O/
         UvKYuvzQBrpEQK5MTA75VoPLRgba4IuMPRNbxry5aNrN0Z+WjuurCAQKBlQp6bhswscs
         2qIaT20yGiQqzP4lZnxUE7LntIxiDJ2HHU6d/N2/kGiBUrcpbw+ivmefcgpMO1IvauWo
         wb8WLWC3hUppViPEr3rfC2BPCdatI1wFeghJvrz+7Zg86Yd5pguMBCEqVnj+D+/rkpES
         BixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7e9PhYSHXI55VLDzFZA/CWum+P1vqY/Iq46EGI3J/Lg=;
        b=k+2BrJo/c5cNzvnrS2RFrYeoVe4Nc6u5R5xO5T4cF95YPeVdtbTOhgI5HYygiAyAjz
         JZrgAIqkM80HpiYiwkYpBp+ENQtBWNMrTc0yrVAqMVjgbS2c4oua9I6EUy6MmylIrAas
         yyxkA99CrX8+2EZbYm18a8icvTvWLX1uTRcB/H+wlN6GXN3mXOFHmT86WaWKm5VDbAmb
         /CCpBQzHULgmdOnh9SiqfYrLLi8AMmUOGbaqz4gIaJVTeotha4kgP+i56mwd511AC0o3
         2En6jXLS4D/cG3m5tEc4a6wj7Jv86LP/0O2tnS/mtUO5tby0ep2F6VajVC7tFZ0PnvLM
         CvhA==
X-Gm-Message-State: AOAM531iFElch/98A/OV0lBtplVBqF3y17RdviY/Zfzvtov5KhUohR0d
        slbAi44KLZK0MCLlIrxTFqI=
X-Google-Smtp-Source: ABdhPJzKI92SFpHfKNru69QoP1ZYoLXrxMr6350Npm9b9XoxC4rr8hhHS5FuINgiqLfJ0aklVzdTFg==
X-Received: by 2002:a05:6402:1d3a:: with SMTP id dh26mr5862663edb.349.1595536302793;
        Thu, 23 Jul 2020 13:31:42 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a882:7627:8b01:53ad? ([2a01:110f:b59:fd00:a882:7627:8b01:53ad])
        by smtp.gmail.com with ESMTPSA id dh16sm2762397edb.3.2020.07.23.13.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 13:31:42 -0700 (PDT)
Subject: Re: [PATCH] leds: add orange color
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd> <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
 <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
Date:   Thu, 23 Jul 2020 22:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/23/20 10:16 PM, Pavel Machek wrote:
> Hi!
> 
>>>>> Many network devices have LEDs with green and orange color, instead of
>>>>> green and yellow.
>>>>
>>>> Is it likely that we see device having both yellow and orange LEDs?
>>>
>>> Why should we?
>>
>> This question actually refers to the below sentence...
>>
>>>> I'd simply lie and say those LEDs are yellow...
>>
>> So, why do you think we should strive to limit the number
>> of color definitions?
> 
> Because there's infinitely many colors :-). And programmers are bad at
> differentiating them. You can't really tell wavelength of light by
> looking at it.
> 
> I mean.. yes, maybe we can add orange, pink, green-blue, violet,
> ... white at different temperatures ...
> 
> It will be rather long list.

I think that we should allow setting the LED color name after
what manufacturer claims it is.

-- 
Best regards,
Jacek Anaszewski
