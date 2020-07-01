Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C552211522
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2020 23:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgGAV2f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Jul 2020 17:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGAV2f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Jul 2020 17:28:35 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AA0C08C5C1;
        Wed,  1 Jul 2020 14:28:35 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dr13so26564710ejc.3;
        Wed, 01 Jul 2020 14:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2y7y+Op5oyWYys3aPK2F6xIGs6iua31K9nYNmwmPnoM=;
        b=g/lWe6IOtLO3rB1CxjsEcUq3cjJkeGrLeHIZFNFNgeNfCQ5HpBdaty+X1cOkhYRZ5V
         kJVaPllB4ziNS9bU1AUITNm2fdPD4s/g2Mdl5Wqdj5pB+Fa6TXJruEG69iH+tKoTEXXN
         MWy3uSRApMakoGx20EFsR0TQUVIijiTFFTF7md87TPFe1y3EbUNqVoCu0MfBvxpIFFmW
         qgO/B33CbRxfFmZSue5/aCek25iw585DuAtW9B2L5+WA7Snwnltui6XjlukZ0POYw/Bg
         5VoazkFd1QtjEgd1x3PerBj7SgM9zfDUkd5nP1BoS0S7zwI0Oep62F2M70Euw0BOp/ls
         +ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2y7y+Op5oyWYys3aPK2F6xIGs6iua31K9nYNmwmPnoM=;
        b=B9omv4d2l7QpcMbbLTwgCzJEYXaD3EWPBTNDoTIzGcK9zOQvmqwaD4K/pqNe5Qn9yC
         T2fWXvRbNTRJx/CRz2/vozQaMqU2JSqmNNYbsHGMhRAACl9IrK5+EBLqS22nyaUkfjZo
         OzljPrtjc7HbFij8An3r1d5lWfEawxT1F/WUGCCLT5QouH5QtcyMtbyxQwfLYF263SX7
         CiUZz403MJPvzJEMqPQArRnKcXZBy47zn/J7MuCt1c+YO7JEuRA9jMYmalM2x+/5pabi
         idMsSIKrBUjFlb78VOGLuLqrDdQQNXdpikwVYni+cdhkLU9TwQGzvkx5HY5iCaImYt/u
         s8VA==
X-Gm-Message-State: AOAM532AW3oi3oGyonpJP1wI7TS2utMmQM4iN9IlI7Af7SZ5f6y0R5Jk
        0JbSun22Pnz9Uh6GTzXpHJPi6VDF
X-Google-Smtp-Source: ABdhPJw3B2rMNk/DR5I6qjhCKexLix74eE5PGlG5zIl9//yDFNfM9XmhobXQiyiCyYNlyPe39SpAlw==
X-Received: by 2002:a17:906:6959:: with SMTP id c25mr24373759ejs.375.1593638913724;
        Wed, 01 Jul 2020 14:28:33 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:9c13:a547:3fe2:ec95? ([2a01:110f:b59:fd00:9c13:a547:3fe2:ec95])
        by smtp.gmail.com with ESMTPSA id j89sm7698816edb.20.2020.07.01.14.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 14:28:33 -0700 (PDT)
Subject: Re: [PATCH] leds: core: Use blocking op for system suspend
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, pavel@ucw.cz
Cc:     anthony.wong@canonical.com, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200701093541.14191-1-kai.heng.feng@canonical.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <38622f5a-4518-cdb4-d1ca-581f470ce797@gmail.com>
Date:   Wed, 1 Jul 2020 23:28:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701093541.14191-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kai-Heng,

Thank you for the patch.

On 7/1/20 11:35 AM, Kai-Heng Feng wrote:
> Sometimes LED won't be turned off by LED_CORE_SUSPENDRESUME flag upon
> system suspend.

Just out of curiosity - are you experiencing that on some hardware?

> led_set_brightness_nopm() uses schedule_work() to set LED brightness.
> However, there's no guarantee that the scheduled work gets executed
> because no one calls flush_scheduled_work().
> 
> As flush_scheduled_work() may affect other drivers' suspend routines,
> take a more contained approach which uses blocking op to make sure the
> LED gets turned off.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>   drivers/leds/led-core.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index f1f718dbe0f8..9a5bfcd7a704 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -269,6 +269,11 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
>   void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   			      enum led_brightness value)
>   {
> +
> +	if (led_cdev->flags & LED_SUSPENDED &&
> +	    !__led_set_brightness_blocking(led_cdev, value))
> +		return;
> +

This function is "nopm" for a reason - we do not make here any
pm management related operations.

Instead of that, please just add

flush_work(&led_cdev->set_brightness_work);

at the end of led_classdev_suspend()

in drivers/leds/led-class.c.

-- 
Best regards,
Jacek Anaszewski
