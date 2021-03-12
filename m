Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50212338855
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 10:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhCLJMh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Mar 2021 04:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbhCLJMa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Mar 2021 04:12:30 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4B7C061574;
        Fri, 12 Mar 2021 01:12:29 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x4so37878994lfu.7;
        Fri, 12 Mar 2021 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HNJhFeoXrYdpWlx1BPvzEwnTrAnSHKYx0VurcHWg9cI=;
        b=Xcj/+9LWPsOiNkRqiUeikK1SnCRr3cmXB8CNzDS7pe2nS4xqNFmS9++yeNXjcRA3aa
         mm0p7/wIhyLQgPxMAwhacoRe7Intoohwawzl0PpElF2hKErjAUM8FJ2LxpMRhVB6v5rM
         qxTtA8KVBPNSSBop3YNsXdE1UHCfHoWY4JijfC+Z9+aUwr8nVrPJZe0b7U3l61SyCWRr
         xixT7zQzdQTbDa9TwcHxCBA1NWhh1D7BmmCLq1AZO+/51CQl04HC5pLo8r9RCR8zcnYh
         ISwL+TuOtOFY3yerDPEsEi1+U8aK8wshIPAadAMDQwF5ji7IR01coxS2pFAqZWjcsgk8
         LOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HNJhFeoXrYdpWlx1BPvzEwnTrAnSHKYx0VurcHWg9cI=;
        b=T8pV9oqa5Wr24oa8+6CnncL2VR1Qy8Ye4LVGwdD1nebHHTCijX0lxm8TuLm4kLCeTy
         V7NC4dA7SnTq7eQSi68zDA7mUn87UOeUMd8Wj5SCU2RbIBs9FdOywuUvKANqumpJ7tNI
         ujjqB2CPmHZ29P0OG0bt7PMWCtZvKfXuDIS1egd9mNK+O+/3EQkEvJs7VwAFLsSnA+16
         p5Lvk0sMNn9d5XUxYkybnYs/z6k3g5gsBHW+6SQ3GM/3buruLfTfw7coEhHi1RvRHo23
         K6Anwx1OtkLWMpTuzrXs5oyqV6qGYSojeq+MOK6puOGe02uoZRxuh79DYidHK0bPdg9/
         i2fw==
X-Gm-Message-State: AOAM532iyP9PT+LoWcJJbc1CnkAPvCGRQnyOPDmaeOEUqf6QjRN1POMm
        aYOMEGbj+6VHizF6YRpTQCo=
X-Google-Smtp-Source: ABdhPJz4fbgYKr2ysCzy9gcDmqJG1xnKam/OMCDGHHc312HoDYE1XhI6WY6aijKzmtCXL8VlWsbAdQ==
X-Received: by 2002:a05:6512:2090:: with SMTP id t16mr5123697lfr.514.1615540348256;
        Fri, 12 Mar 2021 01:12:28 -0800 (PST)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id u11sm1655600lfg.275.2021.03.12.01.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 01:12:27 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20210310070025.9150-1-zajec5@gmail.com>
 <20210312084414.7e4822bb@nic.cz>
 <62b556d5-0ebd-0923-69c6-a2fa3ede73b2@gmail.com>
 <20210312092336.5cbd10cb@nic.cz>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <f9fc4dce-5b9c-5aff-e317-f2daabb73931@gmail.com>
Date:   Fri, 12 Mar 2021 10:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210312092336.5cbd10cb@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12.03.2021 09:23, Marek Behun wrote:
> On Fri, 12 Mar 2021 08:52:16 +0100
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> On 12.03.2021 08:44, Marek Behun wrote:
>>> On Wed, 10 Mar 2021 08:00:25 +0100
>>> Rafał Miłecki <zajec5@gmail.com> wrote:
>>>    
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> The old regex allowed only 1 character to follow the "led-" prefix which
>>>> was most likely just an overlook. Fix it and while at it allow dashes in
>>>> node names. It allows more meaningful names and it helpful e.g. when
>>>> having the same function name with 2 different colors. For example:
>>>> 1. led-power-white
>>>> 2. led-power-blue
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>    Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>>>> index 7ad2baeda0b0..ae46a43e480f 100644
>>>> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>>>> @@ -21,7 +21,7 @@ properties:
>>>>    patternProperties:
>>>>      # The first form is preferred, but fall back to just 'led' anywhere in the
>>>>      # node name to at least catch some child nodes.
>>>> -  "(^led-[0-9a-f]$|led)":
>>>> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":
>>>
>>> Why not use +, like everywhere else?
>>>     "(^led-[0-9a-f]+$|led)"
>>
>> 1. Your regex doesn't allow dashes. I described that in commit message.
> 
> Ah, I confess I did not read the commit message. My fault.
> 
>> 2. If I use one range and +, that will allow unwanted names like "led--power"
> 
> But this can happen anyway. Your regex will match for example
> "led-deaf------beef".

You're right. I probably was overthinking that ;)


> Moreover you give as an example names
>    led-power-white
>    led-power-blue
> but the regex only allows hexadecimal characters, ie
>    led-dead-beef
>    led-1f-3
> 
> The idea is that the string after "led-" is a hexadecimal address.
> Names like
>    led-power-white
> shouldn't be used, as far as I understand.

Oops!
1. My regex was meant to be [0-9][a-z-][0-9][a-z-]+
2. I totally missed that nodename should contain hex num and not a name

My patch is based on bad binding understanding.


So as I understand it now, the point of led hex number is to enumerate
nodes. That way we avoid:
ERROR (duplicate_node_names): /leds/led: Duplicate node name


I'm just wondering if there is some cleaner solution than using those
led-0, led-1, led-2, led-3, led-4 (...) names.

Would that be acceptable to use address with GPIO number? Example:

leds {
	compatible = "gpio-leds";
	led@6 {
		gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
		color = <LED_COLOR_ID_RED>;
	};
	led@7 {
		gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
		color = <LED_COLOR_ID_GREEN>;
	};
};
