Return-Path: <linux-leds+bounces-3175-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A29B1E15
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2024 15:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D0E1C208BE
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2024 14:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3795B15CD78;
	Sun, 27 Oct 2024 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA0pMLta"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384B13B58D;
	Sun, 27 Oct 2024 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730038826; cv=none; b=hkosdo6yVdNrPVN1hR4sqpFYyodBr7EV2gzxpziOVdKSmVuzMfxmpHhQ8r+AT55zEDH7AETch5E8HPRr14jQcb+eO3G7u0VLlwemTyoVqEnEMQLiowJuHfqAezERFOvE7RBOhKKpGOS0FuSer2s9TYnp0wODMRB5P9zmXoGEnGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730038826; c=relaxed/simple;
	bh=NDOZeHgJDhz1x0WKXsH3eyenrwfggtRW1pSxw5wq0bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFCE4xj+X8recmdX83At0K1C5O2sMKusrwOEFvf5yzfP0y3NjNP5ab0uT7CHZH2lD/XtGxHwup8OtyX+K94n1KLhJKKvlJOkDAtu2j45zmwfEIgg53hBAtwS8iTu9CfnKva8aRS/r/1H3qVAm6oWwCn4O1lTRkQaSGhsYqBjZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA0pMLta; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9932aa108cso520687566b.2;
        Sun, 27 Oct 2024 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730038822; x=1730643622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCjosgH/2X5V7Dtzl2IFh9LpG+teZH6mwSbyFuC/g58=;
        b=iA0pMLtamRDxPDy+Ol3/I2cBQdy00b1eI5lsdrHuOWVJehoQRuN2hdx5eSi5dObrW+
         Y5TuAHuXHoroDFeZNCzb2i/+KdiWUxh7A7fbq6nnk9ijxfQBEUdxs3H544k4GT5FO5SK
         pZR57DO9kT6YZMJqZwt5/w2QNy9Hp+InBkjVE8C+NgWEfZkGM4W02Cv8hozloE9Hd+Wj
         KxjgBQ3xMe55J8j7wBxsswgW5A6wV1A9xi7w+lzs8hj5iONcldIkCCo2VBqwPIY11Q4n
         VTdzVd2ItguUKkRvoN/Pe7lZm+NLQUob/PIwojFEmXzyN6k/BD2fFI0m0h2GA47qn0RD
         t3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730038822; x=1730643622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCjosgH/2X5V7Dtzl2IFh9LpG+teZH6mwSbyFuC/g58=;
        b=tA+euoghjrqPhKZftWU03wZ4qxVuOazRwuchCDXRCcu/hiYKAKGyFM/HXs5Tw4YeY2
         3Qs6uU8UlxhdAVh9HtcY4vkMdd5LgE3u4fqBCBbDigAO8VyS2KwOBieVKsraNn8rMzV0
         FrIILnQPHSDSLY6pDdlDqJ2TufsxupQj6e+SXC3PULioJzlJl3IXGu36eN+6HrCBxECa
         /wnxTl7R69dgoKFZFd++h8NoGjxkZFakC+qbhB6ziE2Mz++Drutt+vqt6Q/uDQOOC4Xt
         B4BBdvIiKjfg1tOhkRHnCJCL3QeUFVm6UbSSLjz1ixqa068D/wMNaVZb66xc11k4L6k0
         +lmg==
X-Forwarded-Encrypted: i=1; AJvYcCUKkvzycVZo/4rWcUBIavXwPY1k8LRSyMOeq/M+NqJQU7vzxzOrSH9I9sYVsYUCmS5X3bQiEGB4YxFqsIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9iLZREYrl5K84fA1mp7OhFDZUIWQ1AM7/F716Z6Id1c0DXjKx
	VV6MbuDbvtaHsxvAGY9loJk0uC2NspEFrx1pkX44o2qdhdhs8Bie
X-Google-Smtp-Source: AGHT+IGvlLT4Ci+2Z4bDvhq+dV6H7mnuZ3Dx4zYx70hN764Tda0hkVp2SvSeIsirRYSQDsq/lngCbA==
X-Received: by 2002:a17:907:7f16:b0:a99:dde6:9f42 with SMTP id a640c23a62f3a-a9de619ed20mr375312166b.47.1730038821649;
        Sun, 27 Oct 2024 07:20:21 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a086b6csm282909266b.205.2024.10.27.07.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 07:20:21 -0700 (PDT)
Message-ID: <62b09eee-553a-a3d1-e2e0-59dee7289019@gmail.com>
Date: Sun, 27 Oct 2024 15:20:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
To: Mukesh Ojha <quic_mojha@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241025171128.1226045-1-quic_mojha@quicinc.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20241025171128.1226045-1-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mukesh,

On 10/25/24 19:11, Mukesh Ojha wrote:
> There is NULL pointer issue observed if from Process A where hid device
> being added which results in adding a led_cdev addition and later a
> another call to access of led_cdev attribute from Process B can result
> in NULL pointer issue.
> 
> Use mutex led_cdev->led_access to protect access to led->cdev and its
> attribute inside brightness_show() and max_brightness_show() and also
> update the comment for mutex that it should be used to protect the led
> class device fields.
> 
> 	Process A 				Process B
> 
>   kthread+0x114
>   worker_thread+0x244
>   process_scheduled_works+0x248
>   uhid_device_add_worker+0x24
>   hid_add_device+0x120
>   device_add+0x268
>   bus_probe_device+0x94
>   device_initial_probe+0x14
>   __device_attach+0xfc
>   bus_for_each_drv+0x10c
>   __device_attach_driver+0x14c
>   driver_probe_device+0x3c
>   __driver_probe_device+0xa0
>   really_probe+0x190
>   hid_device_probe+0x130
>   ps_probe+0x990
>   ps_led_register+0x94
>   devm_led_classdev_register_ext+0x58
>   led_classdev_register_ext+0x1f8
>   device_create_with_groups+0x48
>   device_create_groups_vargs+0xc8
>   device_add+0x244
>   kobject_uevent+0x14
>   kobject_uevent_env[jt]+0x224
>   mutex_unlock[jt]+0xc4
>   __mutex_unlock_slowpath+0xd4
>   wake_up_q+0x70
>   try_to_wake_up[jt]+0x48c
>   preempt_schedule_common+0x28
>   __schedule+0x628
>   __switch_to+0x174
> 						el0t_64_sync+0x1a8/0x1ac
> 						el0t_64_sync_handler+0x68/0xbc
> 						el0_svc+0x38/0x68
> 						do_el0_svc+0x1c/0x28
> 						el0_svc_common+0x80/0xe0
> 						invoke_syscall+0x58/0x114
> 						__arm64_sys_read+0x1c/0x2c
> 						ksys_read+0x78/0xe8
> 						vfs_read+0x1e0/0x2c8
> 						kernfs_fop_read_iter+0x68/0x1b4
> 						seq_read_iter+0x158/0x4ec
> 						kernfs_seq_show+0x44/0x54
> 						sysfs_kf_seq_show+0xb4/0x130
> 						dev_attr_show+0x38/0x74
> 						brightness_show+0x20/0x4c
> 						dualshock4_led_get_brightness+0xc/0x74
> 
> [ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
> [ 3313.874301][ T4013] Mem abort info:
> [ 3313.874303][ T4013]   ESR = 0x0000000096000006
> [ 3313.874305][ T4013]   EC = 0x25: DABT (current EL), IL = 32 bits
> [ 3313.874307][ T4013]   SET = 0, FnV = 0
> [ 3313.874309][ T4013]   EA = 0, S1PTW = 0
> [ 3313.874311][ T4013]   FSC = 0x06: level 2 translation fault
> [ 3313.874313][ T4013] Data abort info:
> [ 3313.874314][ T4013]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> [ 3313.874316][ T4013]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [ 3313.874318][ T4013]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=00000008f2b0a000
> ..
> 
> [ 3313.874332][ T4013] Dumping ftrace buffer:
> [ 3313.874334][ T4013]    (ftrace buffer empty)
> ..
> ..
> [ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
> [ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
> [ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
> [ 3313.874656][ T4013] sp : ffffffc0b910bbd0
> ..
> ..
> [ 3313.874685][ T4013] Call trace:
> [ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
> [ 3313.874690][ T4013]  brightness_show+0x20/0x4c
> [ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
> [ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
> [ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
> [ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
> [ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
> [ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
> [ 3313.874711][ T4013]  ksys_read+0x78/0xe8
> [ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
> [ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
> [ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
> [ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
> [ 3313.874727][ T4013]  el0_svc+0x38/0x68
> [ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
> [ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>   - Updated the comment for led_access mutex lock.
>   - Also added mutex protection for max_brightness_show().
> 
>   drivers/leds/led-class.c | 14 +++++++++++---
>   include/linux/leds.h     |  2 +-
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 06b97fd49ad9..f69f4e928d61 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -29,11 +29,14 @@ static ssize_t brightness_show(struct device *dev,
>   		struct device_attribute *attr, char *buf)
>   {
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	unsigned int brightness;
>   
> -	/* no lock needed for this */
> +	mutex_lock(&led_cdev->led_access);
>   	led_update_brightness(led_cdev);
> +	brightness = led_cdev->brightness;
> +	mutex_unlock(&led_cdev->led_access);
>   
> -	return sprintf(buf, "%u\n", led_cdev->brightness);
> +	return sprintf(buf, "%u\n", brightness);
>   }
>   
>   static ssize_t brightness_store(struct device *dev,
> @@ -70,8 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
>   		struct device_attribute *attr, char *buf)
>   {
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	unsigned int max_brightness;
> +
> +	mutex_lock(&led_cdev->led_access);
> +	max_brightness = led_cdev->max_brightness;
> +	mutex_unlock(&led_cdev->led_access);
>   
> -	return sprintf(buf, "%u\n", led_cdev->max_brightness);
> +	return sprintf(buf, "%u\n", max_brightness);
>   }
>   static DEVICE_ATTR_RO(max_brightness);
>   
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index e5968c3ed4ae..3524634fcc47 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -238,7 +238,7 @@ struct led_classdev {
>   	struct kernfs_node	*brightness_hw_changed_kn;
>   #endif
>   
> -	/* Ensures consistent access to the LED Flash Class device */
> +	/* Ensures consistent access to the LED Class device */

Nit: It was improper in the original comment as well:

s/Class/class/

>   	struct mutex		led_access;
>   };
>   
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

