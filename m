Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CBE212E32
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2020 22:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgGBUvD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Jul 2020 16:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgGBUvB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Jul 2020 16:51:01 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4A9C08C5C1;
        Thu,  2 Jul 2020 13:51:01 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a8so24188338edy.1;
        Thu, 02 Jul 2020 13:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ufie2CDrhQ/r4KkbF9WWsSi4czhI/yseQTh/49H/EYA=;
        b=dGfKjGqOosSamvdrgWcRCV0ymB4gV9kROaMvgyKQsEZVq2gwsQeWvHGIfTyUSjhzQw
         P+gEUd3QePrewPSAwY7CQjZ3yfh0hrB03KxI4xvnnspX8T/4dgV6qxLE6G4Zlqc+bf0J
         uDIoTxVtqi9Jaf24z4Hlw+o/KIgSyIRTuESdGYsM/V+SgptlFPDJ27YhaPerjHw4r0cr
         XMxLdmS+4qu+foLql6mUAlb8qJmebfvdFJohbaiVbrkHnWjMvQrD3dZ1iSe6vviu7T0D
         z5EA+YAe53qh3orxBuZaMk8gKk+BdmzBCxGtBoRVMu3KHkjr38KpOFJbpvS/pJvq5YeZ
         vcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ufie2CDrhQ/r4KkbF9WWsSi4czhI/yseQTh/49H/EYA=;
        b=CzZeMnzm35aCDQkfY13NLSgbIa8uFPGKjMk6d9DvVPcp+0a9jw2skGqe58QJC+fOVw
         HemH+VYf1Zj++h+CmFAU5bc/zskfGaDAwtpWO9rtTFA2wkFyLzyMWf/S3WIAcOjX/eqF
         Ju9ODQdqFU3yakNtNzXJi0U86hTcmFjHwx60UtPCH4QUVgXBM9rI/1W4hsk8JU/8w+yZ
         TlZBLUCcahYmm8hbcizfr1LZHxSgJmKu1sUIDwDJEcEBF2XfJSQZmLssfh5X+yv/NpxM
         fdSeDGNC1+HrwVab5vbS7JvHBGm3yhVOdFKWBf0QPmcO+6sdZUucdDmwsPlF5TdVk0Dj
         yKGg==
X-Gm-Message-State: AOAM533d66BY6zcON/kpEOGDW1F1HE4iO/JpynD3XNJjoDg+0n0LCtwU
        AtO6OwOh67RpJLDTmLzkLOSGblIv
X-Google-Smtp-Source: ABdhPJycjQwX4+oNVImACY03PvV89lnvZCJAQc0HM4ZfEg1DbOqvUmAaCyQb4XoSPsVXewoYViDVAQ==
X-Received: by 2002:aa7:c2cf:: with SMTP id m15mr12345977edp.27.1593723060101;
        Thu, 02 Jul 2020 13:51:00 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:55bc:8b0a:d3af:949c? ([2a01:110f:b59:fd00:55bc:8b0a:d3af:949c])
        by smtp.gmail.com with ESMTPSA id da20sm10014362edb.27.2020.07.02.13.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 13:50:59 -0700 (PDT)
Subject: Re: [PATCH v2] leds: core: Flush scheduled work for system suspend
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, pavel@ucw.cz
Cc:     anthony.wong@canonical.com, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200702054500.11251-1-kai.heng.feng@canonical.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a5a931e5-771d-3356-89c2-b0e49f74161c@gmail.com>
Date:   Thu, 2 Jul 2020 22:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702054500.11251-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kai-Heng,

Thank you for the update.

On 7/2/20 7:45 AM, Kai-Heng Feng wrote:
> Sometimes LED won't be turned off by LED_CORE_SUSPENDRESUME flag upon
> system suspend.
> 
> led_set_brightness_nopm() uses schedule_work() to set LED brightness.
> However, there's no guarantee that the scheduled work gets executed
> because no one flushes the work.
> 
> So flush the scheduled work to make sure LED gets turned off.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
>   - Use flush_work() instead.
> 
>   drivers/leds/led-class.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 3363a6551a70..cc3929f858b6 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -173,6 +173,7 @@ void led_classdev_suspend(struct led_classdev *led_cdev)
>   {
>   	led_cdev->flags |= LED_SUSPENDED;
>   	led_set_brightness_nopm(led_cdev, 0);
> +	flush_work(&led_cdev->set_brightness_work);
>   }
>   EXPORT_SYMBOL_GPL(led_classdev_suspend);
>   
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Pavel, this needs to go to stable as well, so let's add the tag:

Fixes: 81fe8e5b73e3 ("leds: core: Add led_set_brightness_nosleep{nopm} 
functions")

-- 
Best regards,
Jacek Anaszewski
