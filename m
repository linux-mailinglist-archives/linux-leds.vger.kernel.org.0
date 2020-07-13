Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B1921E20B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 23:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgGMV2x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 17:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgGMV2w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 17:28:52 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB1DC061755;
        Mon, 13 Jul 2020 14:28:52 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a1so9592438edt.10;
        Mon, 13 Jul 2020 14:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Ko+tWmnzBB3nKRx32WCJEtNPAc5X2qQdpUQLqvYvwU=;
        b=g/ZP2DBcYqX5d4g6Guf0sKImn0bMrQL4VroJiqYXhgtkH96/ScPoEFPPPO7At+DuK+
         7hIkg8n7m/oszH/F+1bdw3O8j5Q+70rwAr29OM8swiw9z0vrfzyM7K3ImsPtaSXE6/3/
         8Rhz7c6qjuJpB/MBYRpsrOR2g7wldTR5lxpMlhJu19Yo5lYi4WIct5C8Nu9USmgzAu7u
         tmeDNJQ8I0zahDaSiozqtgAFxFM/HLMrydCKzPiBqsaeNn0GNmBOpTkObltU9nGeOFWx
         h4IOGEUswfeeqjF3tpYpuEd4YVcnMb+qFXIbnvoQHwW1zyefRxdYFOV/hO/c9kZYYxwU
         x1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Ko+tWmnzBB3nKRx32WCJEtNPAc5X2qQdpUQLqvYvwU=;
        b=AdWp9MVBzkLK52rdQvdqDyMWnCps/fDACcjCepOIsP7vhBzH6Psv6WFx0zCietCkU4
         G+WxAFPl4m6RMycu9h2ZtGd5tx6eoBO3SA2fczy/m4YV2Pd+Y9hQ+7RXpRBtdk18ttlJ
         WMfLJbkVYCYb5h01qhLQ0c+rL76/MICIoI3dkhSphWDgQuyd4Y/MLL5AjsPhJ/0xAUjg
         jtTuIEiIsb2OVLw2plSwQslOMDDlXHyEp8U31ZP/TLzv9NSvKwkwHRzKabEZ2SM6I/Vo
         /wLGwXi8TO5oJ4YOe2tngCKDAHQDdCGs0etUer+wWMzoc0EQZcDEUcpJKy1o1TlltciB
         fpNg==
X-Gm-Message-State: AOAM531tSl4Y3J3JK6wgLbz50OAsvEt5qVcGoyrP9pL2pUEU5cSwOdFH
        tvu1Ijp7h+KBVyo/M3yIW2dNllxP
X-Google-Smtp-Source: ABdhPJwhCW2OW9B2YYFuzdPoyuFYuNZkft51XuoHfzoHy3EtZ88dfi4c9M8VvCVe1J9973X9UcnfNw==
X-Received: by 2002:aa7:c606:: with SMTP id h6mr1295881edq.363.1594675731090;
        Mon, 13 Jul 2020 14:28:51 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e124:492d:3208:4365? ([2a01:110f:b59:fd00:e124:492d:3208:4365])
        by smtp.gmail.com with ESMTPSA id d26sm12116076edz.93.2020.07.13.14.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 14:28:50 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
To:     Rob Herring <robh@kernel.org>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org
References: <20200712210601.5239-1-marek.behun@nic.cz>
 <20200712210601.5239-2-marek.behun@nic.cz>
 <4609c389-4be6-0987-5078-725b43153596@gmail.com>
 <20200712234035.213348aa@nic.cz>
 <ff707d34-8fc0-342e-3df2-e96e5493004b@gmail.com>
 <20200713150634.GA176775@bogus>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <01ead073-71e0-6bd3-7fcf-32aa0fd9c7a5@gmail.com>
Date:   Mon, 13 Jul 2020 23:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713150634.GA176775@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/13/20 5:06 PM, Rob Herring wrote:
> On Mon, Jul 13, 2020 at 12:11:51AM +0200, Jacek Anaszewski wrote:
>> On 7/12/20 11:40 PM, Marek Behun wrote:
>>> On Sun, 12 Jul 2020 23:27:07 +0200
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>
>>>>> +            multi-led@0 {
>>>>> +                reg = <0>;
>>>>> +                color = <LED_COLOR_ID_MULTI>;
>>>>> +                function = LED_FUNCTION_POWER;
>>>>
>>>> Please provide child nodes for each color LED. Let's stick
>>>> to the bindings closely and not make any deviations from
>>>> the beginning.
>>>
>>> Why? It would make sense if there were devices using this controller
>>> having other configuration, but on Omnia, all LEDs are RGB.
>>>
>>> Also, if I do this, should I also make the driver check in the probe
>>> function whether the per-channel child nodes are correct? Eg. if they
>>> are always three: one for red, one for green and one for blue? Or
>>> should the driver ignore this and only the device tree binding specify
>>> it?
>>>
>>> Because the way the driver is written now, it only registers
>>> multi-color RGB LEDs.
>>
>> This is not RGB framework, but multicolor framework. It is not justified
>> to pretend that RGB is default. Unless you would state that clearly in
>> the comment in DT, but that should be agreed upon with Rob.
> 
> If the LEDs are fixed in h/w and never vary for this controller, then
> they don't need to be in DT. However, is it really possible that a
> channel only supports 1 color of LED? I don't think so.

Theoretically we could allow for registering two LEDs as LED multi
color device and the other one as monochrome LED class device
but I admit that this would be a bit convoluted and entail unnecessary
complexity in the driver.

So I'm OK with no child nodes for these bindings, but let's add some
comment justifying that.

-- 
Best regards,
Jacek Anaszewski
