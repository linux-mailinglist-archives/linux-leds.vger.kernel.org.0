Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AF526CEAC
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 00:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIPWXZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 18:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgIPWXE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 18:23:04 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B7DC0698CB;
        Wed, 16 Sep 2020 14:46:20 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b79so35953wmb.4;
        Wed, 16 Sep 2020 14:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TNpE8CsFREeG+K3tpZiiQgAwxej8kRutW10++Eia95s=;
        b=qUU6yFVJRDlWK9CY+8guaWsYeP60NzWm/lnQA3EFdwZt0FU1T+e9ykYk5vtfKkdoan
         XNODn7OEREMUstes0cqJW7w0PdLvXbnZBqw0UsgdedtmZzkoEv2oBDvPlegn2LWWscJG
         Ntd4SYFqpGJVyOSEIuIc5n31jBBVYVW8V8lpPG7j9wbQxPz2CPM+BANxZX+OimjzmINO
         YznL4wH5lPYDnfFvMcu2OODynQx/OxPiOu8o2fSqx99kxZf4HVlKvEcHbj6Ot7z6o+rW
         K3W06p1lpiujNJ+URykhFGjvqDB3MqkrKrnkpjCifPNsrL/sl7v2/HFMS7Jxi/hrGqnI
         rYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TNpE8CsFREeG+K3tpZiiQgAwxej8kRutW10++Eia95s=;
        b=NbmPt3gBieSgUnyCsXeC44/zupeBsKewD2+RI0Jcy2rbU1jxkZR2p5l/eFNrIeP6kZ
         iSfsBjrgCA3t2EwK2VpKTRHwt2CyqT6Pdgb6/rr+8+BNUyZRbZBhQdMIOLzcwGFJWX0o
         Zl7F2xnC1tbh1hPk4MSDfzt2ld8N08L3mrEOxD3cjpk6xpNTeD5QAXJXrHdQJkxzQBH9
         I0zPc7msjXMMDsiY8/zE2UIphtGzvmrak7SQZXvBdvp2qMu0Yh5bsmyRls3P3METmaT1
         c/gIXAu+i2ektslUKtXWinqvWZM9yny2jBtkvWihLuUvLAbAF1f0zgDPV0o5MvL99nxA
         6tsw==
X-Gm-Message-State: AOAM531QrBXgD7WP6xCICaclo5JlYxYqpo77EuoGWjpc7eTL3VabADH8
        tAqrp96I7Fx89NBeImFre/TVJi4+4jk=
X-Google-Smtp-Source: ABdhPJzNU4/fp+far1eG+SMuTa/7iTYewsQLdl+VhryRPrpgapQ0aczaIoElQDmRLf6UhkioPr8tYQ==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr6829763wml.149.1600292778569;
        Wed, 16 Sep 2020 14:46:18 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:454d:4013:90b:5314? ([2a01:110f:b59:fd00:454d:4013:90b:5314])
        by smtp.gmail.com with ESMTPSA id n14sm7348572wmi.33.2020.09.16.14.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 14:46:17 -0700 (PDT)
Subject: Re: [PATCH leds + devicetree v2 2/2] leds: trigger: netdev: parse
 `trigger-sources` from device tree
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20200915152616.20591-1-marek.behun@nic.cz>
 <20200915152616.20591-3-marek.behun@nic.cz>
 <03fc62d8-eeaa-7b74-5ed9-7e482ea6b888@gmail.com>
 <20200916021537.106a29e5@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <16947964-1185-ca1b-38b6-f9829bde4105@gmail.com>
Date:   Wed, 16 Sep 2020 23:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916021537.106a29e5@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/16/20 2:15 AM, Marek Behun wrote:
> On Tue, 15 Sep 2020 23:35:25 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> Hi Marek,
>>
>> On 9/15/20 5:26 PM, Marek Behún wrote:
>>> Allow setting netdev LED trigger as default when given LED DT node has
>>> the `trigger-sources` property pointing to a node corresponding to a
>>> network device.
>>>
>>> The specific netdev trigger mode is determined from the `function` LED
>>> property.
>>>
>>> Example:
>>>     eth0: ethernet@30000 {
>>>       compatible = "xyz";
>>>       #trigger-source-cells = <0>;
>>>     };
>>>
>>>     led {
>>>       color = <LED_COLOR_ID_GREEN>;
>>>       function = LED_FUNCTION_LINK;
>>>       trigger-sources = <&eth0>;
>>>     };
>>>
>>> Signed-off-by: Marek Behún <marek.behun@nic.cz>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> ---
>>>    drivers/leds/trigger/ledtrig-netdev.c | 80 ++++++++++++++++++++++++++-
>>>    include/dt-bindings/leds/common.h     |  1 +
>>>    2 files changed, 80 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
>>> index d5e774d830215..99fc2f0c68e12 100644
>>> --- a/drivers/leds/trigger/ledtrig-netdev.c
>>> +++ b/drivers/leds/trigger/ledtrig-netdev.c
>>> @@ -20,6 +20,7 @@
>> [...]
>>
>>>    static int netdev_trig_activate(struct led_classdev *led_cdev)
>>>    {
>>>    	struct led_netdev_data *trigger_data;
>>> @@ -414,10 +479,17 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>>>    	trigger_data->last_activity = 0;
>>>    
>>>    	led_set_trigger_data(led_cdev, trigger_data);
>>> +	netdev_trig_of_parse(led_cdev, trigger_data);
>>
>> Please be aware of LED_INIT_DEFAULT_TRIGGER flag - it would make
>> sense to use it here so as not to unnecessarily call
>> netdev_trig_of_parse(), which makes sense only if trigger will be
>> default, I presume.
>>
>> See timer_trig_activate() in  drivers/leds/trigger/ledtrig-timer.c
>> for reference.
>>
> 
> Hmmm. Jacek, all the triggers that work with the macro
> LED_INIT_DEFAULT_TRIGGER are oneshot, timer and pattern.
> If this macro is set, they all call pattern_init function where they
> read led-pattern from fwnode.

The fact that they all call pattern_init() does not mean that
the use of flag is limited only to this type of triggers.

It has been introduced to allow initialization of default trigger
with required parameters, but in the same time, not to enforce
the same initial parameters each next time the trigger is set
for the LED.

> 
> But there is no device tree in Linux sources using this property.
> In fact the command
>    git grep led-pattern
> yields only 2 files:
>    Documentation/devicetree/bindings/leds/common.yaml
>    drivers/leds/led-core.c
> 
> What is the purpose if no device tree uses this property? Is this used
> from other fwnode sources, like acpi or efi?

This is mainly useful for debugging purposes, probably that's why
it is not present in official dts files yet.

> The reason why I am asking this is that the `led-pattern` property in
> device tree goes against the principle of device tree, that it
> shouldn't set settings settable from userspace, only describe the
> devices on the system and how they are connected to each other.

If that was a hard principle then we wouldn't have properties like
linux,default-trigger. I have once asked Rob about that - see the reply
at the and of message [0].

[0] https://lore.kernel.org/linux-leds/20181025195444.GA12737@bogus/

-- 
Best regards,
Jacek Anaszewski
