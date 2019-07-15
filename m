Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A9269CF3
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 22:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbfGOUm7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 16:42:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40570 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729505AbfGOUm7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 16:42:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so16509794wmj.5;
        Mon, 15 Jul 2019 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GMZ3SZewevmADI672iQmV5vDJrQLuZ0c6mO3B4G0LK0=;
        b=q4KJGgGv99ytKHkdBQBb9xz11Bd+4S61duDz6SFCRdGTlWc/wobU91TaXpSGiAilOU
         nuQR4CrTGgxRWZd9PCHiHiaox/Up2GcReLer7/36HO2DWvGwaTFNWLhT4s0XxUhtn3CW
         /AXioVdVK8n44uM3CHIpX/lsewwO291cQoOoKdoXWGKLed+VAgpVylslwOPkh8s0BEpz
         tUHccjMjat7lXF4VuC8RaR5MMqbgrVOG27h1PVO48Ajfj7JRDNuC5h9Z959WhW+wxSGr
         uivYgUSsalpL2k9h519k2gn3ImeAmDmJeZOS9S14Xl/ISYXLbor780l7kQO6gkj2t40D
         QBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GMZ3SZewevmADI672iQmV5vDJrQLuZ0c6mO3B4G0LK0=;
        b=P/sZayTX7P7ProZCxEcBzoWSn/E73fkL7crgTZ9DRBe+EX6YhzJaoMCRXx3aWZCnoE
         yAD/4QQyu0Pf5YObn6w/8b70A3rhP9MHvJA9CIbDWl6BR8GFurnlnolkYtgA19Fl/PZ7
         ap46zOuS6uP84AEbILss/HWBnIzqOqzUdHQ/xIbuP1fRlQsnvQB673p0Bd14wi8Jc+kY
         W3qrsFCSMCA4FhOQcAqlPCUQBxaxH2ta+3HldzSH8GFsZbgfFmE8cMWL8erkNaOV/GLq
         sUT/V3vFF5P0yxUMvOObUcCNsboGXsgu4KJM7goUnlyo14Mw8AgWYJQWvRg+hS2l6/Dg
         yybQ==
X-Gm-Message-State: APjAAAV6EMsA0+De0NQdGRc8Nt323vxfB0OwyKBYU+7CpbVo7H/BxvUz
        ySmj9fscBd5lySnGENSPOSxAh8yKiu0=
X-Google-Smtp-Source: APXvYqzvhKi51JpAEkTj1EcFtVDo5UrLYRUwAm8+wT5ORqTrcIvPU0w/gWJMr1b1iM9vJ3MMAWsmhQ==
X-Received: by 2002:a1c:1d4f:: with SMTP id d76mr27375124wmd.127.1563223375220;
        Mon, 15 Jul 2019 13:42:55 -0700 (PDT)
Received: from [192.168.1.19] (chk118.neoplus.adsl.tpnet.pl. [83.31.8.118])
        by smtp.gmail.com with ESMTPSA id c3sm19874540wrx.19.2019.07.15.13.42.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 13:42:54 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com,
        daniel.thompson@linaro.org
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <4ae4d83b-8dee-72e4-3860-dd420a29115e@gmail.com>
Date:   Mon, 15 Jul 2019 22:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715155657.22976-3-jjhiblot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

Thank you for the patch.

I have one issue. Please refer below.

On 7/15/19 5:56 PM, Jean-Jacques Hiblot wrote:
> A LED is usually powered by a voltage/current regulator. Let the LED core
> know about it. This allows the LED core to turn on or off the power supply
> as needed.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  drivers/leds/led-class.c | 15 ++++++++++++
>  drivers/leds/led-core.c  | 50 +++++++++++++++++++++++++++++++++++++---
>  drivers/leds/leds.h      |  1 +
>  include/linux/leds.h     |  4 ++++
>  4 files changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4793e77808e2..cadd43c30d50 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -253,6 +253,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
>  {
>  	char name[LED_MAX_NAME_SIZE];
>  	int ret;
> +	struct regulator *regulator;
>  
>  	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>  	if (ret < 0)
> @@ -272,6 +273,20 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
>  				led_cdev->name, dev_name(led_cdev->dev));
>  
> +	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
> +	if (IS_ERR(regulator)) {
> +		if (PTR_ERR(regulator) != -ENODEV) {
> +			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> +				led_cdev->name);
> +			device_unregister(led_cdev->dev);
> +			mutex_unlock(&led_cdev->led_access);
> +			return PTR_ERR(regulator);
> +		}
> +		led_cdev->regulator = NULL;
> +	} else {
> +		led_cdev->regulator = regulator;
> +	}
> +
>  	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>  		ret = led_add_brightness_hw_changed(led_cdev);
>  		if (ret) {
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 7107cd7e87cf..a12b880b0a2f 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -23,6 +23,33 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>  LIST_HEAD(leds_list);
>  EXPORT_SYMBOL_GPL(leds_list);
>  
> +static bool __led_need_regulator_update(struct led_classdev *led_cdev,
> +					int brightness)
> +{
> +	bool new_state = (brightness != LED_OFF);
> +
> +	return led_cdev->regulator && led_cdev->regulator_state != new_state;
> +}
> +
> +static int __led_handle_regulator(struct led_classdev *led_cdev,
> +				int brightness)
> +{
> +	int rc;
> +
> +	if (__led_need_regulator_update(led_cdev, brightness)) {
> +
> +		if (brightness != LED_OFF)
> +			rc = regulator_enable(led_cdev->regulator);
> +		else
> +			rc = regulator_disable(led_cdev->regulator);
> +		if (rc)
> +			return rc;
> +
> +		led_cdev->regulator_state = (brightness != LED_OFF);
> +	}
> +	return 0;
> +}
> +
>  static int __led_set_brightness(struct led_classdev *led_cdev,
>  				enum led_brightness value)
>  {
> @@ -80,6 +107,7 @@ static void led_timer_function(struct timer_list *t)
>  	}
>  
>  	led_set_brightness_nosleep(led_cdev, brightness);
> +	__led_handle_regulator(led_cdev, brightness);

This cannot be called from atomic context since regulator_enable/disable
use mutex beneath, that can sleep on contention. Therefore this call
has to be made in two places instead:

__led_set_brightness()
__led_set_brightness_blocking()

>  
>  	/* Return in next iteration if led is in one-shot mode and we are in
>  	 * the final blink state so that the led is toggled each delay_on +
> @@ -115,6 +143,8 @@ static void set_brightness_delayed(struct work_struct *ws)
>  	if (ret == -ENOTSUPP)
>  		ret = __led_set_brightness_blocking(led_cdev,
>  					led_cdev->delayed_set_value);
> +	__led_handle_regulator(led_cdev, led_cdev->delayed_set_value);
> +
>  	if (ret < 0 &&
>  	    /* LED HW might have been unplugged, therefore don't warn */
>  	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> @@ -141,6 +171,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>  	/* never on - just set to off */
>  	if (!delay_on) {
>  		led_set_brightness_nosleep(led_cdev, LED_OFF);
> +		__led_handle_regulator(led_cdev, LED_OFF);
>  		return;
>  	}
>  
> @@ -148,6 +179,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>  	if (!delay_off) {
>  		led_set_brightness_nosleep(led_cdev,
>  					   led_cdev->blink_brightness);
> +		__led_handle_regulator(led_cdev, led_cdev->blink_brightness);
>  		return;
>  	}
>  
> @@ -256,8 +288,14 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>  			      enum led_brightness value)
>  {
>  	/* Use brightness_set op if available, it is guaranteed not to sleep */
> -	if (!__led_set_brightness(led_cdev, value))
> -		return;
> +	if (!__led_set_brightness(led_cdev, value)) {
> +		/*
> +		 * if regulator state doesn't need to be changed, that is all/
> +		 * Otherwise delegate the change to a work queue
> +		 */
> +		if (!__led_need_regulator_update(led_cdev, value))
> +			return;
> +	}
>  
>  	/* If brightness setting can sleep, delegate it to a work queue task */
>  	led_cdev->delayed_set_value = value;
> @@ -280,6 +318,8 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
>  int led_set_brightness_sync(struct led_classdev *led_cdev,
>  			    enum led_brightness value)
>  {
> +	int ret;
> +
>  	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>  		return -EBUSY;
>  
> @@ -288,7 +328,11 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
>  	if (led_cdev->flags & LED_SUSPENDED)
>  		return 0;
>  
> -	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
> +	ret = __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
> +	if (ret)
> +		return ret;
> +
> +	return __led_handle_regulator(led_cdev, led_cdev->brightness);
>  }
>  EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>  
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 47b229469069..5aa5c038bd38 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -11,6 +11,7 @@
>  
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
> +#include <linux/regulator/consumer.h>
>  
>  static inline int led_get_brightness(struct led_classdev *led_cdev)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 9b2bf574a17a..bee8e3f8dddd 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -123,6 +123,10 @@ struct led_classdev {
>  
>  	/* Ensures consistent access to the LED Flash Class device */
>  	struct mutex		led_access;
> +
> +	/* regulator */
> +	struct regulator	*regulator;
> +	bool			regulator_state;
>  };
>  
>  extern int of_led_classdev_register(struct device *parent,
> 

-- 
Best regards,
Jacek Anaszewski
