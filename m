Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7752780E0
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 08:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgIYGts (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 02:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgIYGts (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 02:49:48 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F99BC0613CE
        for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2020 23:49:48 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id j11so2185827ejk.0
        for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2020 23:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vk6LrZ2aYcuTVuKlCvS//9DMP+dveeXEr+c/mumMH+g=;
        b=R0lDdKvHCIkVzXelQsErMA3SsB57rq6i5kGvQiK0nP6qINqlLlUXEMWqhFfWtS7YGO
         QovQiWsrQU7RoTKGFKTBvTEiR6ulWVbX3UFM11t9Zeph7yUq4XcJsQ6DyWV1nrDv1FM0
         8M3HxiKmIwq5EemVC0h5jx5cMZ6WPHaYk1RogicB8pDHDhNMG5Bn4IquNOqZEiDgM6Ds
         kQxyFfUbXLnASYG6mvlQitBXOWwRE6jwFRWe3KWvSoif/wPA4n0kVQOgJ8Sx0X95GH9Y
         To5QJkBoCinqiYuyK6AVKrL2L1Rycwv38XtjZENcA75hnbarVdItWGEzc/40XjTnKONN
         YmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vk6LrZ2aYcuTVuKlCvS//9DMP+dveeXEr+c/mumMH+g=;
        b=qKfHrEAoCUHEOLn+zEmdoFAgypDM2J9dY/5iNWGrXr4UBCYZRshj5Xb81/0rbUS3aG
         RUIBKJaADES/LFnGysbqhIISSWpzKww64zQP0JzcTqakcGkuEYRZu3BsEQzDye9o6Oe2
         wNkqo3z8A21eX6D/KcbOsBOtJ7A6xk0VTTjTYpywpMt3GfvfCqbk3/7F/UCvke50so+1
         xsNMsTPwl3K739cIHhFWzQBPwyMgH3s7HS7HrlLmXSzGdgMovFElfZ84lLbWIGRjnMxC
         ig1X8gcRImV/DOCQIU4B4jdrfYsDZE8O0MKNlzRJe/W+RhQitteLsBFWAYokbUBLQSmj
         2dtQ==
X-Gm-Message-State: AOAM5303BEtPFHJAZVRZAsNPknOZL4/kehcgTWUoUwYNNdQ4wZ6gxdAz
        E+wyp03pWG/BWriGQeLE9Pg=
X-Google-Smtp-Source: ABdhPJzr3sP7UZmyFA2+KBORtwi2p9M70qnJth8iCiQ6XuwGHnlpQOZC/a2daSpFHbTot0oXKOIdSg==
X-Received: by 2002:a17:906:29ca:: with SMTP id y10mr1233738eje.327.1601016586975;
        Thu, 24 Sep 2020 23:49:46 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d922:8747:4a19:cf92? ([2a01:110f:b59:fd00:d922:8747:4a19:cf92])
        by smtp.gmail.com with ESMTPSA id t3sm1139209edv.59.2020.09.24.23.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 23:49:46 -0700 (PDT)
Subject: Re: [PATCH leds + devicetree 13/13] leds: tca6507: use struct
 led_init_data when registering
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-14-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <48197a65-a17f-8e5e-98a7-633db1e1b791@gmail.com>
Date:   Fri, 25 Sep 2020 08:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200919221548.29984-14-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 9/20/20 12:15 AM, Marek Behún wrote:
> By using struct led_init_data when registering we do not need to parse
> `label` nor `linux,default-trigger` DT property. Moreover `label` is
> deprecated and if it is not present but `color` and `function` are, LED
> core will compose a name from these properties instead.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: NeilBrown <neilb@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/leds/leds-tca6507.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index ad4af6b6e94c7..362dc9b3d97d0 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -654,6 +654,7 @@ static int tca6507_register_leds_and_gpios(struct device *dev,
>   		return -EINVAL;
>   
>   	device_for_each_child_node(dev, child) {
> +		struct led_init_data init_data = {};
>   		struct tca6507_led *led;
>   		u32 reg;
>   
> @@ -679,18 +680,14 @@ static int tca6507_register_leds_and_gpios(struct device *dev,
>   		led = &tca->leds[reg];
>   		led->chip = tca;
>   		led->num = reg;
> -
> -		if (fwnode_property_read_string(child, "label",
> -						&led->led_cdev.name))
> -			led->led_cdev.name = fwnode_get_name(child);
> -
> -		fwnode_property_read_string(child, "linux,default-trigger",
> -					    &led->led_cdev.default_trigger);
> -
> +		led->bank = -1;
>   		led->led_cdev.brightness_set = tca6507_brightness_set;
>   		led->led_cdev.blink_set = tca6507_blink_set;
> -		led->bank = -1;
> -		ret = devm_led_classdev_register(dev, &led->led_cdev);
> +
> +		init_data.fwnode = child;
> +
> +		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
> +						     &init_data);
>   		if (ret) {
>   			dev_err(dev, "Failed to register LED for node %pfw\n",
>   				child);
> 

For all drivers you switch to using *ext() API DT bindings should be
updated as well to let people know that they can now use 'function'
and 'color' properties.

-- 
Best regards,
Jacek Anaszewski
