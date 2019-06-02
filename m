Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8FF83231E
	for <lists+linux-leds@lfdr.de>; Sun,  2 Jun 2019 13:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFBLU2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 Jun 2019 07:20:28 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36430 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfFBLU2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 Jun 2019 07:20:28 -0400
Received: by mail-lj1-f195.google.com with SMTP id m22so13341729ljc.3
        for <linux-leds@vger.kernel.org>; Sun, 02 Jun 2019 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2DemwRZV/qneJImyeNEfV1scHidzT0frVxTVFqS7fbg=;
        b=pfN4HLFXZcuN8UNkrKLd/bg0yH4/OIFTRjvY+n8t4FLsc2Ya3D5c4f+ITo2HRlAucM
         /qdLwJoj1o2LQQ9QUXbWzH7/11wegb6/477bAMWFLU1kdZWYddzzVX0IXDjQhpvsj8P+
         83Y8OOy29uBM49BgrJJ/ND8tvG5HV+4Vg/HP+xQMK62QODmOvEZcJuMpHRjJnsrMJzMw
         zPI5AemQtHew9X4S0mHQ2Q6j0b8nMb9cDQtESgmRjHr7qSXAxD13TeMJU693TP26UNuy
         oF0R9OeUtAdntu3Mn8rhZ/gCEt8osoZn8vEJntYITWCRwE0aZs4M6cfoTBO5w+rn9lS8
         6e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2DemwRZV/qneJImyeNEfV1scHidzT0frVxTVFqS7fbg=;
        b=EylOxjge95FjHh0Xc2gcIo3Tf0bcofv5rgsyK8kcCdH6+VknG6TdZOYi4OWX3OOi1t
         8ej7Bfp/sy7ZLwysNHLRvo5EbvuMh8v95zOL9WFIlAujePpv+ZG1EOyhAchqWlEbgZ1M
         jqEmGxLJzAa4AavGTJFLQQA27USfBRyR5HC2gPqj22H9Mme3Z2eRt+AImb246HebDkFX
         gDGvWnIiUhpU3zeSPTOAxVnNXVVk+IAP3TJvK0EyW8E9xJYRuamTa2MX9f8MqokY1cqH
         SyyyURUeValYakOzRDKPqBdhEKiH0CEjWWSm3SCn8+8iJIH/dLktFdu37KcShwEhy5IA
         yTYg==
X-Gm-Message-State: APjAAAUbKlSxq0min1umDjXGCScZNGw8+83fgqd8zenZxZDKsX9hdGQF
        oIKrnwzzJDR2USlsVzsjAtG9EL8+
X-Google-Smtp-Source: APXvYqwtJGICo8ty4kUFr419VVIz+Qu8mF2bLfNJVqCEVgCph9hIiMZjn1QOHReV9r97y8ykUjYDSw==
X-Received: by 2002:a2e:98d9:: with SMTP id s25mr7715864ljj.155.1559474425535;
        Sun, 02 Jun 2019 04:20:25 -0700 (PDT)
Received: from [192.168.1.17] (ciu19.neoplus.adsl.tpnet.pl. [83.31.44.19])
        by smtp.gmail.com with ESMTPSA id s9sm2307312ljd.82.2019.06.02.04.20.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 04:20:24 -0700 (PDT)
Subject: Re: [PATCH] leds: core: Support blocking HW blink operations
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20181127150106.20213-1-linus.walleij@linaro.org>
 <20190601203747.GA13060@amd>
 <CACRpkdYUJURZB1+yTL0psc1qMhdV=UHmjtOY7UrGg7x-2tvJXQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <abb42645-87e3-619d-c8d7-2d67814409cf@gmail.com>
Date:   Sun, 2 Jun 2019 13:20:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYUJURZB1+yTL0psc1qMhdV=UHmjtOY7UrGg7x-2tvJXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/1/19 11:47 PM, Linus Walleij wrote:
> On Sat, Jun 1, 2019 at 10:37 PM Pavel Machek <pavel@ucw.cz> wrote:
>> On Tue 2018-11-27 16:01:06, Linus Walleij wrote:
> 
>>> I ran into this when working on a keyboard driver for
>>> the Razer family: the .blink_set() callback for setting
>>> hardware blinking on a LED only exist in a non-blocking
>>> (fastpath) variant, such as when blinking can be enabled
>>> by simply writing a memory-mapped register and protected
>>> by spinlocks.
>>>
>>> On USB keyboards with blinkable LEDs controlled with USB
>>> out-of-band commands this will of course not work: these
>>> calls need to come from process context.
>>>
>>> To support this: add a new .blink_set_blocking() callback
>>> in the same vein as .brightness_set_blocking() and add
>>> a flag and some code to the delayed work so that this
>>> will be able to fire the .blink_set_blocking() call.
>>>
>>> ALl of this will be handled transparently from the
>>> led_blink_set() call so all current users can keep
>>> using that.
>>>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Fun. I just realized thinkpad x60 needs something similar...
> 
> Hm yeah. The discussion with Jacek came to the conclusion that he
> thinks (if I understand correctly!) that the LED core is too helpful and
> client drivers should create process contexts instead (like workers
> I suppose) and use the opaque interfaces from there, whether they
> are blocking or not, and that it was a mistake from the beginning
> to create a helper thread inside the LED core.
> 
> I like APIs that are narrow and deep so I would prefer to do it my
> way (i.e. this patch) but arguably it is a matter of taste.
> 
> I hope to get back to this patch set at some point.

Well, yes, I missed the fact that we already had the use case
in mainline where blink_set is called from atomic context,
which is led_trigger_blink{_oneshot}().

So, Pavel, you seem to have good setup for testing this Linus'
patch.

-- 
Best regards,
Jacek Anaszewski
