Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892CF1148A7
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2019 22:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbfLEV3a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Dec 2019 16:29:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34589 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfLEV33 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Dec 2019 16:29:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so5461809wrr.1;
        Thu, 05 Dec 2019 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p6XeDVfXJXDY6vmGQcPi9hO08mBkSCiJu8FQSQ0cj3w=;
        b=HuG+MvCFTHxfctuF/67HQnVGXGnZXk9DhaN8ZP0gyO/9jToboxErb7BhBULdzTzES2
         NXO2pUq4e9MdfPPeESbco6w08NDfOS4Zwb+X9Vieofblq8QRQbOPU5/Er4lqiWyqNd7r
         SX8StMTMxY4mphAyLirIauJYLToNyoV6sUDZP5VOT4qJyUzHYP3kX4tGZQzsopfIqQnZ
         XoBHaBgtOUo3yyQ+QC22wyQ4euCZPXAc7BSgAllTMc05L/6rThUWLcSUm1r6AVtqzMnB
         wgBsUmw0aj0/GyBzlrVJkYu+bPFxgKwmkJ+sqIdpFOlEA3DMAgtVCf/lozlaLNxStgqE
         ljUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=p6XeDVfXJXDY6vmGQcPi9hO08mBkSCiJu8FQSQ0cj3w=;
        b=dqp3RyavEgfhTu/+Su/xDtJSbMONMQSLA2htiYGWOlqD8sytnuKo7vPoKGMC/9UZvu
         MpSF/04ZuyQ3L4FLrXH2IqPsRLg3T7YrRca2CqQRTr/zH5oPqSDYW0ZPx1IMHDC1MfLF
         gKGqqjxDTt4G9Wn0/q17amEcLh8qMvAibiC4pnjCUND3vJdaHK6i9CCu+lAU+kdLAfA4
         jHKidzUQO3Oqz/fD7AIgTJAhBMkrEJfb/pVyhal5djnDDTHGxr+/k2eh3Ux4SHH5EQS+
         Fnfx5uvc8H7Pt0biJY8obpwHOM6DinmVubVB8nS77F6GWnh0+DTIhwo4RBOTNSoS9TId
         bFpw==
X-Gm-Message-State: APjAAAUN7t712f46fvK+ox7zGoOWA479G31rm3c7QA5/THV1Jah0uFG8
        3LVoh1+ey+szTSTJLUwsGJpFfN7cQc0=
X-Google-Smtp-Source: APXvYqxWEsVdzSO/iCccH4M+FStzZRD/Hlq6noCRCw49p5Wy3BzRuUqE+guwP6QwARqOxsZ3tFx9LA==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr12197470wrx.153.1575581366642;
        Thu, 05 Dec 2019 13:29:26 -0800 (PST)
Received: from [192.168.1.19] (bla66.neoplus.adsl.tpnet.pl. [83.28.194.66])
        by smtp.gmail.com with ESMTPSA id e6sm12844395wru.44.2019.12.05.13.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 13:29:25 -0800 (PST)
Subject: Re: "leds: gpio: Use generic support for composing LED names" breaks
 gpio debugfs
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Pavel Machek <pavel@ucw.cz>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191204110219.GV25745@shell.armlinux.org.uk>
 <fb88206c-a094-df37-04af-71a1174fb0f6@gmail.com>
 <CACRpkdZzzaaDM_Y8-Zf8AQrmfcVd+i0Uk0vYccnizG73cjEooA@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <74f9dd94-f6d6-2116-3de4-ce62f0280537@gmail.com>
Date:   Thu, 5 Dec 2019 22:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdZzzaaDM_Y8-Zf8AQrmfcVd+i0Uk0vYccnizG73cjEooA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/5/19 12:45 AM, Linus Walleij wrote:
> On Wed, Dec 4, 2019 at 9:52 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
> 
>> It seem that the only proper solution would be introducing a new
>> pre_register_cdev(const char *name) op to the LED core, that would allow
>> drivers to come up with their implementation thereof. In this particular
>> case leds-gpio driver would need to put there gpiod initialization.
> 
> I don't know the particulars but if it helps you can at any point
> call:
> int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
> 
> For any successfully obtained descriptor, to set the consumer name,
> i.e. the text appearing in debugfs and the GPIO character device.

Thanks for the pointer. I've just used that to fix the issue.

-- 
Best regards,
Jacek Anaszewski
