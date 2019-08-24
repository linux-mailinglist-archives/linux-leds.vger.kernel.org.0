Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FB29BEE3
	for <lists+linux-leds@lfdr.de>; Sat, 24 Aug 2019 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfHXQr7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Aug 2019 12:47:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41635 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfHXQr7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Aug 2019 12:47:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id j16so11376665wrr.8
        for <linux-leds@vger.kernel.org>; Sat, 24 Aug 2019 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wRbNQw4PA8ce36N65sszJ+TyFhEpil8YGhUmGKH0V3k=;
        b=CEG03SBBqLJ2XWdKaP90hBFDsbNknTCnYFI2nlja2Yo5wKrowOG73KJMmo7jaFJKp0
         drqm13o6+s7uIhnQ3nBP53XFcyv+88t7qtZvA4SYzqB05W1hY86dg2lxSh1I4MdLq5F/
         pe8mtBxI84vaKcsZUzg0UiCokQFhkd8vqF3bKhSiFEAR3ia4qyA4vfT0h/p9HciWaDm5
         oxrNmU8nH8NAuA+MYUokq3iKj+JmjCXTCtnhxIpByhQwXU3OBANh34U+wHeNMCkCwHFT
         uTzcBHIltJeZ79TZ4EM2TNh6RHTQ5MevrH3EwcXiAXSGuz6rHeiQrMVk2VjKM6s8Rlik
         WnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wRbNQw4PA8ce36N65sszJ+TyFhEpil8YGhUmGKH0V3k=;
        b=gz0tqQvTh0LDLVFrFeVC0Os++TFu4qwocTRFB1CG65qd16o8A1agp+o1SMyBsfk9c7
         +EmZmqiWzmFW+RRc00BwN97sr2Ihk8w7wEN6UefsAqGJG60zuwJM/5EIqis+jMn/9x+r
         YCdT4Fy8EzX/7AZhfLM3iO/hmecA+oT/WromR7xOFVE5WOBHxIQqI9Bu3cxrQmIaaSPe
         XOVuM+UoPxsFAgumgWUlcmHtS9RnFqSUyIW2VzFMKrqAveBlT/ViIf/Mtc4kSObvZqaG
         GsWp3BA249XYx1mlJ6WiC23zZEeFpLKtX4fWb0gq902EdPYlUzCzkzXOwMFTJ5+lv51e
         IomA==
X-Gm-Message-State: APjAAAVz2+IB1XvwQEFUVjkva+/s9iq13T7HAP1w8+jsCmD4uRswhY1p
        sYGZBRSkxAn/SD7jzjVWZv3gqc6P
X-Google-Smtp-Source: APXvYqxU8SEuSkWRgc+XOT6HaBTKcRlH/0+DP31BJgW1dDU3XePbRoMY90qeBLbxz1zSN2L9TBo3Hg==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr7226323wrs.36.1566665276380;
        Sat, 24 Aug 2019 09:47:56 -0700 (PDT)
Received: from [192.168.1.19] (bkw182.neoplus.adsl.tpnet.pl. [83.28.190.182])
        by smtp.gmail.com with ESMTPSA id c12sm5410370wrx.46.2019.08.24.09.47.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 09:47:55 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] leds: trigger: gpio: GPIO 0 is valid
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
References: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c06873f2-7472-8013-7909-e5eb50def993@gmail.com>
Date:   Sat, 24 Aug 2019 18:47:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andy,

Thank you for the patch.

On 8/21/19 7:17 PM, Andy Shevchenko wrote:
> Allow all valid GPIOs to be used in the driver.
> 
> Fixes: 17354bfe8527 ("leds: Add gpio-led trigger")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/trigger/ledtrig-gpio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
> index 33cc99a1a16a..31f456dd4417 100644
> --- a/drivers/leds/trigger/ledtrig-gpio.c
> +++ b/drivers/leds/trigger/ledtrig-gpio.c
> @@ -131,10 +131,10 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
>  	if (gpio_data->gpio == gpio)
>  		return n;
>  
> -	if (!gpio) {
> -		if (gpio_data->gpio != 0)
> +	if (!gpio_is_valid(gpio)) {
> +		if (gpio_is_valid(gpio_data->gpio))
>  			free_irq(gpio_to_irq(gpio_data->gpio), led);
> -		gpio_data->gpio = 0;
> +		gpio_data->gpio = gpio;

It looks odd to me. I'd just assign invalid constant gpio number
e.g. -1.

Note that we should also do that in gpio_trig_activate(), where
gpio_data->gpio is initialized to 0 by kzalloc(). That later can
have nasty side effect in gpio_trig_gpio_store() when gpio to set
is 0. Then the condition "if (gpio_data->gpio == gpio)" will evaluate
to true and gpio_trig_irq() handler will not be registered.

>  		return n;
>  	}
>  
> @@ -144,7 +144,7 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
>  	if (ret) {
>  		dev_err(dev, "request_irq failed with error %d\n", ret);
>  	} else {
> -		if (gpio_data->gpio != 0)
> +		if (gpio_is_valid(gpio_data->gpio))
>  			free_irq(gpio_to_irq(gpio_data->gpio), led);
>  		gpio_data->gpio = gpio;
>  		/* After changing the GPIO, we need to update the LED. */
> @@ -181,7 +181,7 @@ static void gpio_trig_deactivate(struct led_classdev *led)
>  {
>  	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
>  
> -	if (gpio_data->gpio != 0)
> +	if (gpio_is_valid(gpio_data->gpio))
>  		free_irq(gpio_to_irq(gpio_data->gpio), led);
>  	kfree(gpio_data);
>  }
> 

-- 
Best regards,
Jacek Anaszewski
