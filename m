Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E3239C151
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jun 2021 22:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhFDUal (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Jun 2021 16:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21689 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229854AbhFDUak (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Jun 2021 16:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622838532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SsGVYeypydc8u4iFNETa0oN1HSK19Tp01M5QFxHPCz0=;
        b=WqEB+W70jbxBI80V7IbiwsiAJy7KM+mg6m6MEH7NduECxBc3OntGhnRCNn3IxFVpupSgW/
        zoofNcIS0BBzxn6Ekim3fAnGNWJZXG8tiyI6u8fsEEvhLRma6p5D7Z15f8X/TmpyBkDYAb
        CG94RznpI8exk1CSS3FGza6joOyL97A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-l6WM16xxP-aorMHj8Ibj-g-1; Fri, 04 Jun 2021 16:28:51 -0400
X-MC-Unique: l6WM16xxP-aorMHj8Ibj-g-1
Received: by mail-ej1-f70.google.com with SMTP id q7-20020a1709063607b02903f57f85ac45so3953708ejb.15
        for <linux-leds@vger.kernel.org>; Fri, 04 Jun 2021 13:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SsGVYeypydc8u4iFNETa0oN1HSK19Tp01M5QFxHPCz0=;
        b=F8eUtr3HpyRHE9/uE1vf1nffdt2q0hVCs5MKm0DNaYd3rpObA5ocMeAXHyODKrd9ze
         GPrWULPxPjECEfrwncp+UAtxdIu/7EUUpAvVPCFX9pS0RNrgeFmHrQYzbH9aRvKxqnW+
         L89CF1cFS9xGuJnEjd1fAdvycymFHj5F8E1yke84WfU6r9VirnIGCUN0ADnh/ws76Ok+
         TIWgDhGxOYgNBxjCsX/PWhFjlgJv6Hmy4FII7atBRQhIo/7M6idKw3O/20Nua4lANrRM
         at0XBi5F4W8woU5pWpu7P8+lKlStkyyG23o7zKfEOprAwrX9eOJ0pihQ7n0du/GLZpJJ
         h7Qg==
X-Gm-Message-State: AOAM533e3UQbXKvXVtN7EPJElc5mgnEjXSZJE+7j0lGy44Ksf+8Cj7h+
        MnZ3ytrJ4X/8xJ6Wan6rYFiC4fUihY++HlVldr2FCqOC8ZEHXIRlLN1JBYaTixCffdS1uQ15Chr
        aTHb95d3/qehPyOzMDKPnFw==
X-Received: by 2002:a17:906:5488:: with SMTP id r8mr6023690ejo.374.1622838530044;
        Fri, 04 Jun 2021 13:28:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZr8tMoGUk+6iPIIG2J7wot9p8hXipDIx7G9ak5GRpv0eUFYlrSWsOLmLZliliWaPh8ZtNYQ==
X-Received: by 2002:a17:906:5488:: with SMTP id r8mr6023671ejo.374.1622838529811;
        Fri, 04 Jun 2021 13:28:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m9sm3310162ejj.53.2021.06.04.13.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 13:28:49 -0700 (PDT)
Subject: Re: LEDs with hardware-accelerated patterns, suspend indication
To:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        andy.shevchenko@gmail.com, mchehab+huawei@kernel.org,
        mauro.chehab@huawei.com, linux-leds@vger.kernel.org,
        Jafar Akhondali <jafar.akhoondali@gmail.com>
References: <20210526153040.GA4537@amd>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5fbbab4f-3e22-5a4a-eea8-2531ee165cc4@redhat.com>
Date:   Fri, 4 Jun 2021 22:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526153040.GA4537@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 5/26/21 5:30 PM, Pavel Machek wrote:
> Hi!
> 
> We have hardware trigger for arbitrary patterns... but then we have
> common hardware that can do few simple patterns but not arbitrary
> ones.
> 
> Proposal:
> 
> Have a new hardware trigger "lpattern" that will allow selection of
> patterns hardware can commonly provide. I guess that is "off", "on",
> "blinking", "breathing". Maybe with variations like "slow" and "fast".

Adding Jafar, who has been working on adding support for the hardware
patterns on the Acer Helios 300 RGB keyboard.

Quoting from his patch for this:

Backlight modes:
1: Breath
2: Neon
3: Wave
4: Shifting
5: Zoom

So it looks like we need some more patterns for this to also be
usable for his case, although patterns like wave, shifting and zoom
sound like they are multi-LED patterns.

Jafar can you explain how this works in a bit more detail. I get
the feeling that from a hardware-API pov there are no individual
addressable LEDs, yet some effects do program individual LEDs
differently then their neighbors ?  Or am I just misunderstanding
what some of the effects do ?

> It should provide software fallbacks, so we have reference how the
> patterns should look like and behave.

I think that we should probably define a couple of standard
patterns with sw-fallbacks but also allow drivers to add
driver specific pattern names, which won't have a sw fallback,
this could then be combined with a lpatterns_available sysfs
file or some such which lists the standard patterns + the
driver specific patterns.

This could then e.g. be used by the Acer Helios 300 RGB keyboard
case.

> It is quite common to provide LED with charging activity.
> 
> Proposal:
> 
> Have a trigger called "charging" which would provide three
> subdirectories "charged", "charging" and "discharging" with interface
> similar to the new "lpattern" trigger.

When you say similar, you mean that each dir will have a lpattern
file which can have one of the (standard) lpattern values ?

This sounds good to me (this should work well for the whiskey-cove
PMIC case which we discussed a while ago.

> It is very common to have combined LED for power and suspend.
> 
> Proposal:
> 
> Have a trigger called "sysstate" with three subdirectories "off", "on"
> and "suspended", with interfaces similar to the "lpattern" trigger.

Regards,

Hans

