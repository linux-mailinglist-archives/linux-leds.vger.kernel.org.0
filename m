Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524F0BD238
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 20:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441795AbfIXS6H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 14:58:07 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53793 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391875AbfIXS6G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 14:58:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id i16so1392065wmd.3;
        Tue, 24 Sep 2019 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AMi3E+OEgwheN9xQpUXRfzmR42ph0xuy5svWzO8+71Y=;
        b=c5shH1baewK3gIklEDxW5nXI2tx9hycATC6g4mRG6VOpuBjPKGxFqDsGXdgZkMoM2f
         +8IIWjaFHQtfPOLFSMkHVI69OHprGh83TEtWxvq3CKFyLL1hUqtO0CxkQ2lW61Y0MpQx
         K5CPxIaM7EyMej8wHyrMtVSDCLeC9uaixh1nxKLH3bbv7WyKfB2cjWQJG5twQ6zkTxaR
         l9ALZoGHyERxpspmLqnk9rkVOrJTeAsL77kMYvqB5ZILF3trvcwjzClAq0DfSnUNgcj2
         7/usFP8+9ALIjOu/qViivFwJB2conq5Mz8DjsWiPCiAMlO/lWFwwO54IUKRZln0U4wBr
         tZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AMi3E+OEgwheN9xQpUXRfzmR42ph0xuy5svWzO8+71Y=;
        b=fSqIDbyP+EnkvlKp0Pv1K2TmD5FOCXoU3rbEWlKGBK08cR9zgS5GdrjpX8aSd6Qyt7
         IxoVFI8fTIxS+sB1cHbGsvGu24i9zIl+c+EypuKQOQvw936naoxPJ+d2+LapvBKvJ25y
         ncI42NBoWK9u6MreEuI5wU6STG+dQleuGrXuVl9enYE7lHrvC3UH6atPGXZryK1/cfaV
         zaB/DFgaIg4BpIM/NNbS5XbH1OhBxlCFuoUlaX7RJ6oxXECrYWdn3PTnyGWIYQ4lyvIg
         WGiN/3/oMIi6ByI2jJxQTN4devqydcZhM+xxnXituo1rDquyXmwAa9X5ACDW/bGDSnYA
         To6g==
X-Gm-Message-State: APjAAAXhwDaTmlarqDtcayccvieXkg3ylFUT/Yi9qUGyzZFo+MhDH6Y/
        4nQatg26pc16iIRpyEqt6xMOtlsQ
X-Google-Smtp-Source: APXvYqzgR4Tk/9LblbhD/sYruH0z+iBxa4xJ9MfnvaqTsK/UrKU+61ThfI3ysIGHx2Ir7j/JvHW1pg==
X-Received: by 2002:a1c:1a4b:: with SMTP id a72mr1818406wma.44.1569351483703;
        Tue, 24 Sep 2019 11:58:03 -0700 (PDT)
Received: from [192.168.1.19] (bfw157.neoplus.adsl.tpnet.pl. [83.28.60.157])
        by smtp.gmail.com with ESMTPSA id k9sm4461578wrd.7.2019.09.24.11.58.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 11:58:03 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        daniel.thompson@linaro.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmurphy@ti.com, tomi.valkeinen@ti.com
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com>
Date:   Tue, 24 Sep 2019 20:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923102059.17818-4-jjhiblot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

Thank you for the patch.

I must say I'm not a big fan of this change.
It adds a bunch of code to the LED core and gives small
functionality in a reward. It may also influence maximum
software blinking rate, so I'd rather avoid calling
regulator_enable/disable when timer trigger is set.

It will of course require more code.

Since AFAIR Pavel was original proponent of this change then
I'd like to see his opinion before we move on to discussing
possible improvements to this patch.

Best regards,
Jacek Anaszewski

On 9/23/19 12:20 PM, Jean-Jacques Hiblot wrote:
> A LED is usually powered by a voltage/current regulator. Let the LED core
> know about it. This allows the LED core to turn on or off the power supply
> as needed.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  drivers/leds/led-class.c | 17 +++++++++++
>  drivers/leds/led-core.c  | 65 ++++++++++++++++++++++++++++++++++++++--
>  drivers/leds/leds.h      |  3 ++
>  include/linux/leds.h     |  5 ++++
>  4 files changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index e11177d77b4c..d122b6982efd 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -352,6 +352,7 @@ int led_classdev_register_ext(struct device *parent,
>  	char final_name[LED_MAX_NAME_SIZE];
>  	const char *proposed_name = composed_name;
>  	int ret;
> +	struct regulator *regulator;
>  
>  	if (init_data) {
>  		if (init_data->devname_mandatory && !init_data->devicename) {
> @@ -387,6 +388,22 @@ int led_classdev_register_ext(struct device *parent,
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
>  				led_cdev->name, dev_name(led_cdev->dev));
>  
> +	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
> +	if (IS_ERR(regulator)) {
> +		if (regulator != ERR_PTR(-ENODEV)) {
> +			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> +				led_cdev->name);
> +			device_unregister(led_cdev->dev);
> +			mutex_unlock(&led_cdev->led_access);
> +			return PTR_ERR(regulator);
> +		}
> +		led_cdev->regulator = NULL;
> +	} else {
> +		led_cdev->regulator = regulator;
> +		led_cdev->regulator_state = REG_OFF;
> +		atomic_set(&led_cdev->target_regulator_state, REG_UNKNOWN);
> +	}
> +
>  	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>  		ret = led_add_brightness_hw_changed(led_cdev);
>  		if (ret) {
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index d318f9b0382d..155a158c7b8d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -37,6 +37,43 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>  };
>  EXPORT_SYMBOL_GPL(led_colors);
>  
> +static int __led_handle_regulator(struct led_classdev *led_cdev)
> +{
> +	int rc;
> +	int target_state = led_cdev->delayed_set_value ?  REG_ON : REG_OFF;
> +
> +	if (!led_cdev->regulator)
> +		return 0;
> +
> +	/*
> +	 * if the current regulator state is not the target state, we
> +	 * need to update it.
> +	 * note: No need for spinlock or atomic here because
> +	 * led_cdev->regulator_state is modified only in the context of
> +	 * the worqueue
> +	 */
> +	if (led_cdev->regulator_state != target_state) {
> +
> +		if (target_state == REG_ON)
> +			rc = regulator_enable(led_cdev->regulator);
> +		else
> +			rc = regulator_disable(led_cdev->regulator);
> +		if (rc) {
> +			/*
> +			 * If something went wrong with the regulator update,
> +			 * Make sure that led_set_brightness_nosleep() assume
> +			 * that the regultor is in the right state.
> +			 */
> +			atomic_set(&led_cdev->target_regulator_state,
> +				   REG_UNKNOWN);
> +			return rc;
> +		}
> +
> +		led_cdev->regulator_state = target_state;
> +	}
> +	return 0;
> +}
> +
>  static int __led_set_brightness(struct led_classdev *led_cdev,
>  				enum led_brightness value)
>  {
> @@ -135,6 +172,11 @@ static void set_brightness_delayed(struct work_struct *ws)
>  	    (led_cdev->flags & LED_HW_PLUGGABLE)))
>  		dev_err(led_cdev->dev,
>  			"Setting an LED's brightness failed (%d)\n", ret);
> +
> +	ret = __led_handle_regulator(led_cdev);
> +	if (ret)
> +		dev_err(led_cdev->dev,
> +			"Updating regulator state failed (%d)\n", ret);
>  }
>  
>  static void led_set_software_blink(struct led_classdev *led_cdev,
> @@ -269,8 +311,27 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
>  void led_set_brightness_nopm(struct led_classdev *led_cdev,
>  			      enum led_brightness value)
>  {
> -	/* Use brightness_set op if available, it is guaranteed not to sleep */
> -	if (!__led_set_brightness(led_cdev, value))
> +	bool update_regulator = false;
> +	int old, new;
> +
> +	if (led_cdev->regulator) {
> +		/*
> +		 * Check if the regulator need to be updated.
> +		 * We use an atomic here because multiple threads could
> +		 * be calling this function at the same time. Using
> +		 * atomic_xchg() ensures the consistency between
> +		 * target_regulator_state, value and update_regulator
> +		 */
> +		new = !!value;
> +		old = atomic_xchg(&led_cdev->target_regulator_state, new);
> +		update_regulator = (old != new);
> +	}
> +
> +	/*
> +	 * If regulator state doesn't need to be changed, use brightness_set
> +	 * op if available, it is guaranteed not to sleep
> +	 */
> +	if (!update_regulator && !__led_set_brightness(led_cdev, value))
>  		return;
>  
>  	/* If brightness setting can sleep, delegate it to a work queue task */
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 0b577cece8f7..02f261ce77f2 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -11,6 +11,9 @@
>  
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
> +#include <linux/regulator/consumer.h>
> +
> +enum { REG_OFF = 0, REG_ON, REG_UNKNOWN };
>  
>  static inline int led_get_brightness(struct led_classdev *led_cdev)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 88bf2ceaabe6..8ce7cf937192 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -149,6 +149,11 @@ struct led_classdev {
>  
>  	/* Ensures consistent access to the LED Flash Class device */
>  	struct mutex		led_access;
> +
> +	/* regulator */
> +	struct regulator	*regulator;
> +	int			regulator_state;
> +	atomic_t		target_regulator_state;
>  };
>  
>  /**
> 


