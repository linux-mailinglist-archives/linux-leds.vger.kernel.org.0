Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC75D3ECFD2
	for <lists+linux-leds@lfdr.de>; Mon, 16 Aug 2021 09:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbhHPH6K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Aug 2021 03:58:10 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:57824
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234572AbhHPH4k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Aug 2021 03:56:40 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9A4EB3F04E;
        Mon, 16 Aug 2021 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629100554;
        bh=W1ishUz8mHqehwd2h6l+5o4J0QmpazRWbS0Pi/fqFb4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GiLnTMNy3wdzNYHXYh5Tmcp5wib5D4B8WNvXehZfm7TRXOlYuzY0MiiRXfSlybf3I
         MoMcxZIsalRbbWp+bFmdY7YMPpFz4g4t7rWWdrgDymaDe+zCiCfK3zjlUGmSqKHVFB
         XmTLY/v1F7r7f2fWWrWE5FyBOuXV/1NbO10kc+V3/xHDmtf7fLSHRCUG0YiQKMCHHL
         TBs8Y2jJoYsogkqUPe6SomO8HOZRxBqJFAj5sI16rx5mts9pTXlsa/76oM/DC2RAYM
         gWxlh1sBeLrlJjO1BYe5aWfvXelJdj5uoEGtNmwCm2hMX9g7KDg8/ZGx115m2gK2AI
         LXt14C4g8cxug==
Subject: Re: [PATCH] leds: flash: Remove redundant initialization of variable
 ret
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210612132547.58727-1-colin.king@canonical.com>
 <20210816065110.GA7500@duo.ucw.cz>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <1864790c-4547-9e19-e6ed-c9b342e0c6aa@canonical.com>
Date:   Mon, 16 Aug 2021 08:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816065110.GA7500@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 16/08/2021 07:51, Pavel Machek wrote:
> Hi!
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable ret is being initialized with a value that is never read,
>> it is being updated later on. The assignment is redundant and can be
>> removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> I did this instead; hopefully that's okay with everyone.
> 
> Best regards,
> 							Pavel

Thanks, looks good to me.

Colin

> 
> commit 654933ae7d32f278eecd0bb0f175785574ac4775
> Author: Pavel Machek <pavel@ucw.cz>
> Date:   Mon Aug 16 08:47:08 2021 +0200
> 
>     leds: flash: Remove redundant initialization of variable ret
>     
>     Adjust initialization not to trigger Coverity warnings.
>     
>     Reported-by: Colin Ian King <colin.king@canonical.com>
>     Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 6eeb9effcf65..185e17055317 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -92,14 +92,12 @@ static ssize_t flash_strobe_store(struct device *dev,
>  	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
>  	unsigned long state;
> -	ssize_t ret = -EINVAL;
> +	ssize_t ret = -EBUSY;
>  
>  	mutex_lock(&led_cdev->led_access);
>  
> -	if (led_sysfs_is_disabled(led_cdev)) {
> -		ret = -EBUSY;
> +	if (led_sysfs_is_disabled(led_cdev))
>  		goto unlock;
> -	}
>  
>  	ret = kstrtoul(buf, 10, &state);
>  	if (ret)
> 
> 

