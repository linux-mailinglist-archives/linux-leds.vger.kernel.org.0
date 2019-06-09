Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2CC3ABA6
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbfFITbN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:31:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39346 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbfFITbN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:31:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so6197153wma.4
        for <linux-leds@vger.kernel.org>; Sun, 09 Jun 2019 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oPH3foiPKj8zXR/Rrl2Ldifcyr8dOMFlIs11Sg/TPy4=;
        b=Ic9mGLJfZqTq9H1ACNjegFFiHDl2XjeE9e2xtLe18ALcxfUIdn6VxdrIMg+VmIsRMB
         B5GY1APxo1bbPOtyqWIz+Z8x60rGbigd8F3jENrl1HYP9sbdnIyR0vKm6iP4K+JWg+UZ
         yBlnfLNtmPMhwAFLrPEUqg2+mtcceKZQcAgFJGNu9Cfr2PsQeWlpesswaVoxM3j81UEE
         jwM+WSvIP9ycKe8zitIhDM4vmU7+PYCFMaUBuIPzoKi5FeU+ZcWfyice4l07Yw7a6P4/
         azTMBYFOnkl1GeZSBtCwh6hdDAI8S5bK9QtnvxWzySkbh6Cf0uvvvtd4wtpl2i6CeSus
         6M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oPH3foiPKj8zXR/Rrl2Ldifcyr8dOMFlIs11Sg/TPy4=;
        b=dz9P65wyldVJBaBiuzA11WVNxCMWfdzr7jJPJyOqWjeTa0C7kEbqCuMMyP7s9XB1pY
         UL793vEeCrjpxRouNTr7xluqpt42cEn+d4FxXaiovm0QduERlliP/DkcyJsjSjzBUs2p
         txRn9pt5ZypulOG3OiLBYzEojnDAcvDTfVcarXtszWImRjQDA+NsOpykcpGksgzBBZTL
         C0EvNJS0wzHp5G4aFpchnYpSD6RehykJPGMWuVu0jdJWUxeGzFbUTglMteyITWK61Tef
         6ZrWOQb77kJub0oDTEF5D5mKzR+IujBf/JpAZ8bBKWjNyibUJK8o7kAA/aZf1wNznisJ
         RmCw==
X-Gm-Message-State: APjAAAWY3jgVsAeYvzwfMk33hcg/Jv6jN3POZjfZtsOeRN2M/IV+nGAN
        VIALQvi2mk1Y644vX+o1dUHnP2FF
X-Google-Smtp-Source: APXvYqyKOEnrjdrrQSt79h6Ohs42JsMkZ1HXl6Txv9FZnRuznfKxoNccuLhPIlK5FgAJme5jmS3FtA==
X-Received: by 2002:a7b:c001:: with SMTP id c1mr11086740wmb.49.1560108671094;
        Sun, 09 Jun 2019 12:31:11 -0700 (PDT)
Received: from [192.168.1.17] (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id v15sm7966510wrt.25.2019.06.09.12.31.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:31:10 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com>
Date:   Sun, 9 Jun 2019 21:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh,

On 6/9/19 8:13 PM, Oleh Kravchenko wrote:
> Jacek,
> 
> 09.06.19 15:24, Jacek Anaszewski пише:
>> Hi Oleh,
>>
>> On 6/8/19 12:42 AM, Oleh Kravchenko wrote:
>>
>> You want to set timer trigger (first turn it on in the config):
>>
>> echo "timer" > trigger
>>
>> After that two files appear: delay_on and delay_off.
>>
>> ledtrig-timer uses blink_set op for setting up the hw blinking.
> 
> Thank you for explanation.
> 
> I just want to clerify - for now LEDs board has 2 from 3 LEDs with effect function.
> 
> 1. Screen frame led is just blinking, so blink_set() is fit well to this.
> 2. Pipe led actually consist from 3 leds and when effect is enabled next pattern is used:
> 
>        ^
>        |
> LED1  >   OFF  ON   ON   ON
>        |
> LED2  >   OFF  OFF  ON   ON
>        |
> LED3  >   OFF  OFF  OFF  ON
>        |
>        +----^----^----^----^----> time

Pattern trigger applies to a single LED so it won't fit for this
pattern.

Currently we don't support patterns spanning on multiple LEDs,
so you would have to come up with your own solution.

What I can recommend is a trigger that would be created by your driver
and would activate this sequence.

-- 
Best regards,
Jacek Anaszewski
