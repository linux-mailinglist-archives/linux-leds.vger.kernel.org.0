Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13722C1719
	for <lists+linux-leds@lfdr.de>; Mon, 23 Nov 2020 22:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgKWUxA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Nov 2020 15:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgKWUxA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Nov 2020 15:53:00 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D886C0613CF;
        Mon, 23 Nov 2020 12:53:00 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p19so663527wmg.0;
        Mon, 23 Nov 2020 12:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TklskZDnCVeTGWPgpS/EioL+kUbmsF81Ea3U/G7UyjM=;
        b=XalzOCONIhWS9jkNG1EunxZBVEy7yc8msz02bgtym8eiZJFJEZRHy1JQTXBOjyeF9Q
         4URaCOA6xTWvoKVsf2WQLh1rdy4ArdnXv5iBb3mFok8XX0V3DGk5FVw5OAjUD9h3E3PQ
         T4sa48kAMq3wdKEePwAUpx9KLTQJ4GBcucX5AM2/c69fVSnP5VSN5Sy1148iyMqgbgPW
         /tZY3+JA7KqsST89d2tfLGpkdGeZVv4wT84vJKubQBIccNfrdnB85q1SNABgvanqyYts
         7FXxIzk1A1R4lbI5YbTNDqWtWMHn2hT5Yl/GdwFHBWHG0Ehloqc2VXXD1VngfDCwIJRa
         oqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TklskZDnCVeTGWPgpS/EioL+kUbmsF81Ea3U/G7UyjM=;
        b=BRv1r3o2+hkZnyNAguMIA3GCddEB654RV5WyXkCBxurn2teXFXSobFyZoYor5yES1e
         lxdUDjsb3i2yQd3i1jR8BK9KWgVey+v9iEJKAmSTMQAahf489V1DPmyGEImtiwO7yXuz
         Sx/nKgV2tYuCNFX3tnd3MBlvUy5KFBDAMpIDlWUBQbO9zNx2oapeW5NeGj4hmMZmcIBA
         +RiGNeDejghLmj6fXE72zX1wEC0z6iZLZ1GoHMW+Zkdmqw+xbpLauy7ouBiiXlfljCjP
         kHs0yhUKC+JTVNDYg++9GGE38EHl+x/FYtyGjOX5VIYXttGk5H7EPb7LICZzgGPtOWvt
         5mKg==
X-Gm-Message-State: AOAM531wXf3mJTI7EnQzojBJxbnCrufSJJNt675bJkZtQiCEW2Jrb9m4
        0Gjrb/HWBe1/Uuie79Ypwhc=
X-Google-Smtp-Source: ABdhPJzJyKRYbtdA9Cx+e50La8cu1sTApANl+eqq31Z3u2jcpquwGMQrfTZIEq4gm1VUzJpDGUK3FA==
X-Received: by 2002:a1c:3b07:: with SMTP id i7mr760093wma.118.1606164778848;
        Mon, 23 Nov 2020 12:52:58 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:7836:e682:dddf:6361? ([2a01:110f:b59:fd00:7836:e682:dddf:6361])
        by smtp.gmail.com with ESMTPSA id b4sm1109779wmc.1.2020.11.23.12.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 12:52:58 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
Date:   Mon, 23 Nov 2020 21:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/23/20 4:00 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年11月20日 週五 上午6:26寫道：
>>
>> On 11/19/20 10:57 PM, Pavel Machek wrote:
>>> On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
>>>> Hi Pavel, Gene,
>>>>
>>>> On 11/18/20 10:37 PM, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>>>
>>>>>> Add LED_COLOR_ID_MOONLIGHT definitions
>>>>>
>>>>> Why is moonlight a color? Camera flashes are usually white, no?
>>>>>
>>>>> At least it needs a comment...
>>>>
>>>> That's my fault, In fact I should have asked about adding
>>>> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...
>>>
>>> Aha, that makes more sense.
>>>
>>> But please let's call it "torch" if we do that, as that is already
>>> used in kernel sources... and probably in the interface, too:
>>
>> I'd say that torch is something different that moonlight,
>> but we would need more input from Gene to learn more about
>> the nature of light emitted by ML LED on his device.
>>
>> Please note that torch is usually meant as the other mode of
>> flash LED (sometimes it is called "movie mode"), which is already
>> handled by brightness file of LED class flash device (i.e. its LED class
>> subset), and which also maps to v4l2-flash TORCH mode.
>>
> 
> It's used to front camera fill light.
> More brightness than screen backlight, and more soft light than flash.
> I think LED_ID_COLOR_WHITE is okay.

So why in v6 you assigned LED_COLOR_ID_AMBER to it?

Regardless of that, now we're talking about LED function - you chose
LED_FUNCTION_INDICATOR for it, but inferring from your above description
- it certainly doesn't fit here.

Also register names, containing part "ML" indicate that this LED's
intended function is moonlinght, which your description somehow
corroborates.

Moonlight LEDs become ubiquitous nowadays so sooner or later we will
need to add this function anyway [0].

[0] 
https://landscapelightingoakville.com/what-is-moon-lighting-and-why-does-it-remain-so-popular/

-- 
Best regards,
Jacek Anaszewski
