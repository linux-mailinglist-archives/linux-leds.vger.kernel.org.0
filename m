Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32B12714E1
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 16:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgITOPP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 10:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOPO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 10:15:14 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC4DC061755;
        Sun, 20 Sep 2020 07:15:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id j11so14296805ejk.0;
        Sun, 20 Sep 2020 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=yYNTisMVd5isgVn9ELoHvJERkwOkxGAPfPN4dbLnY0k=;
        b=Ofuf3EALzhZU9JiPJDnJZSa3DpPGw5ndupEbm5uSzPr7McvWMfh2p6dDny83Et0mz6
         /EHcrIo17MZcROjpnEAY2WCumuC9BWKzqLiKX1K9e58FF9pyx2cF4WgWWf1uVBHKTjwc
         1aNrBzGKnDs6iBoViKTHiZ+lRhLT0dndDIf8wivsqP3lb4dMGMXlOeWftqi3L6fLKNre
         bqUIvlpgPzxuUX5SGnsuwSjeZDaw5K4HP5nZHGxgNc2zJ/L768JYsK+/PLIwTI1tvAwj
         qeqZBlQfon7gez5V7oQKMUbAXTFOJHgrtCHY40WyePpyMvWVivzQU01h1Ib3IVooF1JT
         JCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yYNTisMVd5isgVn9ELoHvJERkwOkxGAPfPN4dbLnY0k=;
        b=nDYR5jJPKleFfFIbJoHQjsSe2B4UfOBBSfWhZiH0hEsMI8sY4Wu+yeoGWgqmSX7JD3
         Jy+xFyq9x9R6GLgsDg+VEYGYWaJVRTFA6wxFyqeXFU19WiO+W590GEz9ignkvwLuA6jJ
         Scg/S+ERcfUqtjQmiQgYzwCeAZp4ewySbXdxcZl/C2MfuEDBok4lUemP0uL00BJXBLW1
         wAxBBHZw+BC2UbCBgoKmT4Wxn3Y9G6hjdtpHfFAjOeLc0u2wR35+FlZLEov9FgNLQcBJ
         kqJGhSPQ0By597nSmdP8zevED6FF74kkVlRqpEIR3bcwfWxHkmMkCeKBt5PWOmHzKP2h
         olCw==
X-Gm-Message-State: AOAM53140VjanbrwzjPXbPmEr2u35KeQsECQ/MoUt1PN0USS2ocW26Gw
        IJ2LiCGUQ1ktuIoPF7JSN3TSWnve75E=
X-Google-Smtp-Source: ABdhPJzXMb2EH2jC+ESXtPhx5Pr6Vo5R32OYgLQL83zV3bPd89LYMvVgKZYmbB6ikbYrrM/gpV1P6g==
X-Received: by 2002:a17:906:3506:: with SMTP id r6mr45344688eja.55.1600611312164;
        Sun, 20 Sep 2020 07:15:12 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id nh1sm6670379ejb.21.2020.09.20.07.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:15:11 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
Date:   Sun, 20 Sep 2020 16:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200919093833.GA14326@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/19/20 11:38 AM, Pavel Machek wrote:
> commit 318681d3e019e39354cc6c2155a7fd1bb8e8084d
> Author: Pavel Machek <pavel@ucw.cz>
> Date:   Sat Sep 19 11:34:58 2020 +0200
> 
>      ledtrig-cpu: Limit to 4 CPUs
>      
>      Some machines have thousands of CPUs... and trigger mechanisms was not
>      really meant for thousands of triggers. I doubt anyone uses this
>      trigger on many-CPU machine; but if they do, they'll need to do it
>      properly.
>      
>      Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
> index 869976d1b734..b7e00b09b137 100644
> --- a/drivers/leds/trigger/ledtrig-cpu.c
> +++ b/drivers/leds/trigger/ledtrig-cpu.c
> @@ -2,14 +2,18 @@
>   /*
>    * ledtrig-cpu.c - LED trigger based on CPU activity
>    *
> - * This LED trigger will be registered for each possible CPU and named as
> - * cpu0, cpu1, cpu2, cpu3, etc.
> + * This LED trigger will be registered for first four CPUs and named
> + * as cpu0, cpu1, cpu2, cpu3. There's additional trigger called cpu that
> + * is on when any CPU is active.
> + *
> + * If you want support for arbitrary number of CPUs, make it one trigger,
> + * with additional sysfs file selecting which CPU to watch.
>    *
>    * It can be bound to any LED just like other triggers using either a
>    * board file or via sysfs interface.
>    *
>    * An API named ledtrig_cpu is exported for any user, who want to add CPU
> - * activity indication in their code
> + * activity indication in their code.
>    *
>    * Copyright 2011 Linus Walleij <linus.walleij@linaro.org>
>    * Copyright 2011 - 2012 Bryan Wu <bryan.wu@canonical.com>
> @@ -145,6 +149,9 @@ static int __init ledtrig_cpu_init(void)
>   	for_each_possible_cpu(cpu) {
>   		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
>   
> +		if (cpu > 4)

NACK. The workaround for this trigger was implemented for a reason -
to make it working on platforms with arbitrary number of logical cpus.
I've got 8, so I am discriminated now. Not saying, that it precludes
trigger registration with no single line of warning.
Regardless of that - you have no guarantee that you're not breaking
anyone - "I doubt" is not a sufficient argument.

> +			continue;
> +
>   		snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
>   
>   		led_trigger_register_simple(trig->name, &trig->_trig);
> 

-- 
Best regards,
Jacek Anaszewski
