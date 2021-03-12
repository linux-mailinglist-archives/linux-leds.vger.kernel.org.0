Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019D23386D5
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 08:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhCLHwe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Mar 2021 02:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhCLHwV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Mar 2021 02:52:21 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E327BC061574;
        Thu, 11 Mar 2021 23:52:20 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id z8so5567758ljm.12;
        Thu, 11 Mar 2021 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bzfyFJDEDyF/FsL//TnuNcqJ2azu4kGF6viCThrfoGc=;
        b=P3nEU4TFH49uU7L5Jpq8JojkmZ4YwYi3p8gBEmtiUWUpF4fkh72r/sul7j2Y1nPu5e
         qGhrzNyu6eXeX43gjADBEaanESg5yyS/NSPBeeLfGsCyTOs64tekEFBQba/QtyLlFpi5
         +YmK+TlbImJcNRZ9J+JGiUQaGYkkM6qEW3WkW+wDqAzxLPxIFmAGMbBjSly6fAHM+Z2a
         C3Z+oH4TBHuRWZAVsy9chMZcCZ0A0NnSWoOsiLy7WjLlMaQo36aZryLXkXfHjT2u7Yf1
         X9ocwaIY1Uxmg4VpWG+KMp9DQtVsT9A/vghxH3As/h3mgrPpDck1lcpFitk5CGqlO1gv
         Hi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bzfyFJDEDyF/FsL//TnuNcqJ2azu4kGF6viCThrfoGc=;
        b=f7l3DzWK7v23KxAnqNA2m25TY3RpJRJvzUe5MGUsJ+MdIapsqmp0ymLPESEZJCTiUD
         2XwHXL6YHLZK3v3kmU39FdUGGxXgEikOeFKTcXlBdBQZKqntCP20/OGT5LPJG4RyFuj2
         fJP9eD6LevcknLGLeYMCQb70BZlcvYsyzIQo467MIhcq0EU4GiGgdO+EimLWEPuhjHgw
         YOgCPwrWoQJCBUKlECsGcmbdfNO2LrvI+n7FteReGn+27NFrRKgTiiesyb6uyJncklUQ
         BFuqdJO8ejutLyx8LwdGNyDznZPUHKAzXr/+NwaAbLXPd/nHcGdZIWLCV6sF2TntOkx8
         QaMw==
X-Gm-Message-State: AOAM530KjZjybrBmPXTagh+P6jGdbZcYKc7THdoRRsjHRQLve+Z0PmKS
        jbkkIZ2G5avRmbuwgdsOD9Q=
X-Google-Smtp-Source: ABdhPJys6MpLohdk+ccRufyaIodMxP1POirIRI5cektNmprzgzcB6oAs5kB0y3M5CrHfypfynkVWqQ==
X-Received: by 2002:a2e:924b:: with SMTP id v11mr1610652ljg.254.1615535539473;
        Thu, 11 Mar 2021 23:52:19 -0800 (PST)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id h10sm1794290ljb.101.2021.03.11.23.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 23:52:18 -0800 (PST)
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
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <62b556d5-0ebd-0923-69c6-a2fa3ede73b2@gmail.com>
Date:   Fri, 12 Mar 2021 08:52:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210312084414.7e4822bb@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12.03.2021 08:44, Marek Behun wrote:
> On Wed, 10 Mar 2021 08:00:25 +0100
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> The old regex allowed only 1 character to follow the "led-" prefix which
>> was most likely just an overlook. Fix it and while at it allow dashes in
>> node names. It allows more meaningful names and it helpful e.g. when
>> having the same function name with 2 different colors. For example:
>> 1. led-power-white
>> 2. led-power-blue
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>> index 7ad2baeda0b0..ae46a43e480f 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>> @@ -21,7 +21,7 @@ properties:
>>   patternProperties:
>>     # The first form is preferred, but fall back to just 'led' anywhere in the
>>     # node name to at least catch some child nodes.
>> -  "(^led-[0-9a-f]$|led)":
>> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":
> 
> Why not use +, like everywhere else?
>    "(^led-[0-9a-f]+$|led)"

1. Your regex doesn't allow dashes. I described that in commit message.
2. If I use one range and +, that will allow unwanted names like "led--power"
