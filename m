Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F15F10B79
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 18:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfEAQl7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 12:41:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39915 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfEAQl7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 12:41:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id d12so13478357lfk.6;
        Wed, 01 May 2019 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fbidAVxL/+C4GnRDyVRJm+aDWDujR0UHb3nSwPjAKeo=;
        b=MWs7o6Ttgnwr1GZIiAzhbdZ/qLGLO+UrmWkbxIi6232ENCO1811NJ03l5PmupkOcgJ
         YNXgM/Z1dgGCAJ4iIukJJdeCaKLgmrg1b4RuDDH000okQxoVXUdiis9E25w6loiM3XvM
         KNr85cFly+uh5VDBOm+9IBNMKWk+/ly1skutHbvWE5dATIh2N/OcCSWXO29C9YDEpHTC
         IeNx6hCgZ2pgWqHK4xiQ1Q9SfverKufumJ6fFphQE0yX9IQNzlzKJwiMdIzX71dKtHZ7
         MQoV6VhjT2Ob3JfB2vctYYQj/D3AJlxPTJSvtkivmkeRkVhqUBXgZVXr+It+nKOOw+OI
         1SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fbidAVxL/+C4GnRDyVRJm+aDWDujR0UHb3nSwPjAKeo=;
        b=DZYxMygZ7U6yzVmClXl6e1E5klwzrmCMRK2xwivUMzod8+0ElxHE5zWvwZMLuiWi0X
         //nrdkBAFXyW0uzj7fZNPN8WB5NLVNnSJ5XAxtMBRJ7YVYIqN2PwVM4xROfvdrH+/v2X
         RiLlRcpHzt43FgnFM5MnhduSntvUu0ei2Alj4AK+iW1VZQGcrDqWnICb5YPJLWwq2pgJ
         HKOq97DW5l9uIv+KnzGTXBq+k/HBGdmztDpFmJtRnWFED57OIMu71Q0Fr44PtT05vhSL
         cxoBHnci88SiJ4IalHKLNuu5J97VTM8L7izSrHLDdrcVmO9fYd7C4sOOyNTsCxEfqZrv
         SExg==
X-Gm-Message-State: APjAAAVSkYMo3ivxQtl4kuC3Ikdqn6eDKjMCYM0QjDu50CpLb8TkRm1E
        b4bHFlJxVTCZ5WDMMjST9sXCOIeC
X-Google-Smtp-Source: APXvYqz5aoaZCl6Q5QjICMVZ/B2HZtiGCrfohHd2xQNBQDH2lYOM9goOD4xG90g/9pZVtg8x6S5OIQ==
X-Received: by 2002:ac2:4192:: with SMTP id z18mr3293987lfh.96.1556728916891;
        Wed, 01 May 2019 09:41:56 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id 39sm1063178lja.11.2019.05.01.09.41.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 09:41:56 -0700 (PDT)
Subject: Re: [PATCH] leds: avoid races with workqueue
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152259.GB10501@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
Date:   Wed, 1 May 2019 18:41:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152259.GB10501@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Thank you for the patch.

On 4/29/19 5:22 PM, Pavel Machek wrote:
> 
> There are races between "main" thread and workqueue. They manifest
> themselves on Thinkpad X60:
>      
> This should result in LED blinking, but it turns it off instead:
>      
>      root@amd:/data/pavel# cd /sys/class/leds/tpacpi\:\:power
>      root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>      root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>      root@amd:/sys/class/leds/tpacpi::power#
>      
> It should be possible to transition from blinking to solid on by echo
> 0 > brightness; echo 1 > brightness... but that does not work, either,
> if done too quickly.
>      
> Synchronization of the workqueue fixes both.
>      
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 68aa923..dcb59c8 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
>   	if (state == LED_OFF)
>   		led_trigger_remove(led_cdev);
>   	led_set_brightness(led_cdev, state);
> +	flush_work(&led_cdev->set_brightness_work);

Is this really required here? It creates non-uniform brightness
setting behavior depending on whether it is set from sysfs or
by in-kernel call to led_set_brightness().

>   	ret = size;
>   unlock:
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 9f8da39..aefac4d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -166,6 +166,11 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>   		     unsigned long *delay_on,
>   		     unsigned long *delay_off)
>   {
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>   	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>   	    led_cdev->blink_set &&
>   	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> 

-- 
Best regards,
Jacek Anaszewski
