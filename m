Return-Path: <linux-leds+bounces-2513-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97695B6F9
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72747286512
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E69A1CB30C;
	Thu, 22 Aug 2024 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWiJ850m"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695F21CB15A;
	Thu, 22 Aug 2024 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333904; cv=none; b=tnJWBgSB5+SJopFZouU35kDGGLezvjXSm0ec8QrxZc+z5OVI/9xwqU+XPqdkIthrLis6lX0qaKtFOwc3MRW1OoCTLR9/vvyYTrCR3D6+Myfj6UWs8YS2L9gCGc8GT3kgTAqxM8gawiAiGXoJPsjkvO1wZy9Y7/SBaIjnyrrhqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333904; c=relaxed/simple;
	bh=RUeicChpBMKYroLTLCUjAEttfLVrBE16zSByT/B59no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9ZaMFjGfOE21hPtQ2yc1NY/lQ3uh3skY9hdGkMdVub7zzrEb2nXNL1x427q5sZ67wC23+SbbqHKMOPF3sT65B0oRH11O7OL8/0Uc7aVToTuozMdslstHrHPiql9kBm3PGmbHmr0RbXajdFd0Vs+Mw5LnkhG0C5+RkiuTEJYVFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWiJ850m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6AFC32782;
	Thu, 22 Aug 2024 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333904;
	bh=RUeicChpBMKYroLTLCUjAEttfLVrBE16zSByT/B59no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWiJ850muKiCx+P43+wMJ4mP6rz6HLgoFwkU5J2yOBomm68cx4EUOoD0fRKTN94nz
	 9P6qtj9TfpKu0BGM8NUwqJnNv0ST8tA5aRtpkqeo3DGwtggyKOU+l3BtOcf7pIBtmt
	 /776IqmIZxjhVLoTnzYG57+RQV22+lI2+feh19qIFWvcGEGBhCB2PGC7ERtERU4vOC
	 81MVD+tlv0Cw78lo8COj86OL4CTNDfaSz8ksbrkjtl6aFdthJoZc/TMBh4X9Fibs8o
	 Jxj3ONLPJEXjh3Pytrts6TTtYnY8r0gTVMaUNIpeZRqBaMX+2xqVNzPWKxGMXeUUGb
	 ODoKebMl34j+g==
Date: Thu, 22 Aug 2024 14:38:19 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	kernel@salutedevices.com, rockosov@gmail.com,
	Alexey Romanov <avromanov@salutedevices.com>
Subject: ATTENTION USERS/TESTERS: Re: [PATCH v1] leds: introduce ordered
 workqueue for leds events instead of system_wq
Message-ID: <20240822133819.GJ6858@google.com>
References: <20240820155407.32729-1-ddrokosov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240820155407.32729-1-ddrokosov@salutedevices.com>

INTENTIONAL TOP POST:

This is going to need more time on the list and hopefully draws the
attention of some potentially affected users / to-be testers.

> This allows to setup ordered workqueue for leds events. This may be
> useful, because default 'system_wq' does not guarantee execution order
> of each work_struct, thus for several brightness update requests (for
> multiple leds), real brightness switch could be in random order.
> 
> Yes, for sysfs-based leds we have flush_work() call inside
> brightness_store() operation, but it's blocking call, so userspace
> caller can be blocked at a long time, which means leds animation stream
> can be broken.
> 
> Ordered workqueue has the same behaviour as system_wq + flush_work(),
> but all scheduled works are async and userspace caller is not blocked,
> which it better for userspace animation scheduling.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/leds/led-class.c | 12 +++++++++++-
>  drivers/leds/led-core.c  |  6 +++---
>  include/linux/leds.h     |  1 +
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index ba1be15cfd8e..fba12471cf1f 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -25,6 +25,8 @@
>  static DEFINE_MUTEX(leds_lookup_lock);
>  static LIST_HEAD(leds_lookup_list);
>  
> +static struct workqueue_struct *leds_wq;
> +
>  static ssize_t brightness_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> @@ -57,7 +59,6 @@ static ssize_t brightness_store(struct device *dev,
>  	if (state == LED_OFF)
>  		led_trigger_remove(led_cdev);
>  	led_set_brightness(led_cdev, state);
> -	flush_work(&led_cdev->set_brightness_work);
>  
>  	ret = size;
>  unlock:
> @@ -549,6 +550,8 @@ int led_classdev_register_ext(struct device *parent,
>  
>  	led_update_brightness(led_cdev);
>  
> +	led_cdev->wq = leds_wq;
> +
>  	led_init_core(led_cdev);
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
> @@ -667,12 +670,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
>  
>  static int __init leds_init(void)
>  {
> +	leds_wq = alloc_ordered_workqueue("leds", 0);
> +	if (!leds_wq) {
> +		pr_err("failed to create leds ordered workqueue\n");
> +		return -ENOMEM;
> +	}
> +
>  	return class_register(&leds_class);
>  }
>  
>  static void __exit leds_exit(void)
>  {
>  	class_unregister(&leds_class);
> +	destroy_workqueue(leds_wq);
>  }
>  
>  subsys_initcall(leds_init);
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 89c9806cc97f..9769ac49be20 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -266,7 +266,7 @@ void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on
>  		led_cdev->delayed_delay_on = delay_on;
>  		led_cdev->delayed_delay_off = delay_off;
>  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
> -		schedule_work(&led_cdev->set_brightness_work);
> +		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
>  		return;
>  	}
>  
> @@ -297,7 +297,7 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
>  		 */
>  		if (!brightness) {
>  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> -			schedule_work(&led_cdev->set_brightness_work);
> +			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
>  		} else {
>  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
>  				&led_cdev->work_flags);
> @@ -333,7 +333,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
>  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
>  	}
>  
> -	schedule_work(&led_cdev->set_brightness_work);
> +	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
>  }
>  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
>  
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 6300313c46b7..7c9f1cb12ab9 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -169,6 +169,7 @@ struct led_classdev {
>  	int			 new_blink_brightness;
>  	void			(*flash_resume)(struct led_classdev *led_cdev);
>  
> +	struct workqueue_struct *wq; /* LED workqueue */
>  	struct work_struct	set_brightness_work;
>  	int			delayed_set_value;
>  	unsigned long		delayed_delay_on;
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones [李琼斯]

