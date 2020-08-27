Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF4A255090
	for <lists+linux-leds@lfdr.de>; Thu, 27 Aug 2020 23:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgH0V2v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Aug 2020 17:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0V2u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Aug 2020 17:28:50 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F5EC061264;
        Thu, 27 Aug 2020 14:28:50 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id j25so9601910ejk.9;
        Thu, 27 Aug 2020 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MudIXoKUDqSknmPj/caKgZlvDH12bbOJiw81zZd1bYI=;
        b=SauBhEq5qA71mmA7JQu8/eckKealUKb30ggwypDgyDeVOgFDJLM/FdzAKYe6H9yhTI
         fWHNLJ/GUUt/KA7bMd9yNLil1xo85K2E4AOtLX9CEgUSW3gPhQLl4JgmSZOb3scnVusd
         WZsqlgkaAto7kpwWLiIlBlBvgVhwlkjxzKmesDBJ5r6R9ZUVjJFD4/ugo61Mh+/YPy8x
         pE9HySyyuwrdJHY+oNrF5TUcR4mhDJ2co8wh1CgFSg2PgPQm0S4ung9cxlE313GG6H25
         9rC9Xi3p6burgSHmj1tAaP1Rsh8NsdkmKvVV3SQboGoudkj4bpAa9Nck1r6xozOiSR77
         or0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MudIXoKUDqSknmPj/caKgZlvDH12bbOJiw81zZd1bYI=;
        b=tgdG4f8XIRga3EoxVeySWo/sd7m71EAvsyrRhD+gLy1oK+tXqqBCV3lAFiARc0MXtl
         dqoI9gZoliD663fxMLoYwORhUJ2DR+ci5oEmXWSaMHV5bnGn3TkSM2r3yZ4bLEyjPxS4
         fsi+rlZDSo6GhOup2GD4uDY8mWM+HB5f7u8E4hvYPCmdLNtPr2EfkHVWLD8BURWLILeu
         V6+X5Q8Z4sapokgodIeOdwHbohf9Na2BCC3oHXyjxp+kTRUTIySd5ccwdiADkfT1HSkv
         Wagbow+o37sE3tCHnVe1sSGciI7b0BNrmOE23eTMCy+FuffPTQ1xnWXtuQiDrs9AZ8Nd
         uWFg==
X-Gm-Message-State: AOAM531hRsI9l2KMia+Fs/BXbvlUnz8BhmhgOGxJlvqK2ZsYZcz6rsXi
        iplZPh9mET/F6iMERLl9Hlo=
X-Google-Smtp-Source: ABdhPJz9ug63cUy1fjH28bqnvS728TAER2TxeKFJgBiUWcyCyO6a5pdFwGsSikdmvt1Z3z8yBS9xAA==
X-Received: by 2002:a17:906:656:: with SMTP id t22mr13692846ejb.392.1598563728933;
        Thu, 27 Aug 2020 14:28:48 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a137:4925:7b50:2e1c? ([2a01:110f:b59:fd00:a137:4925:7b50:2e1c])
        by smtp.gmail.com with ESMTPSA id t21sm2510721ejr.62.2020.08.27.14.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 14:28:48 -0700 (PDT)
Subject: Re: [PATCH] leds: pwm: Allow automatic labels for DT based devices
To:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>
References: <20200826093737.29008-1-ada@thorsis.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d6f69d4a-3e46-cad4-5756-4d15e5ef95ba@gmail.com>
Date:   Thu, 27 Aug 2020 23:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826093737.29008-1-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On 8/26/20 11:37 AM, Alexander Dahl wrote:
> From: Alexander Dahl <post@lespocky.de>
> 
> If LEDs are configured through device tree and the property 'label' is
> omitted, the label is supposed to be generated from the properties
> 'function' and 'color' if present.  While this works fine for e.g. the
> 'leds-gpio' driver, it did not for 'leds-pwm'.
> 
> The reason is, you get this label naming magic only if you add a LED
> device through 'devm_led_classdev_register_ext()' and pass a pointer to
> the current device tree node.  The approach to fix this was adopted from
> the 'leds-gpio' driver.
> 
> For the following node from dts the LED appeared as 'led5' in sysfs
> before and as 'red:debug' after this change.
> 
>          pwm_leds {
>                  compatible = "pwm-leds";
> 
>                  led5 {
>                          function = LED_FUNCTION_DEBUG;
>                          color = <LED_COLOR_ID_RED>;
>                          pwms = <&pwm0 2 10000000 0>;
>                          max-brightness = <127>;
> 
>                          linux,default-trigger = "heartbeat";
>                          panic-indicator;
>                  };
>          };
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>      v1: based on v5.9-rc2, backport on v5.4.59 also works
> 
>   drivers/leds/leds-pwm.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index ef7b91bd2064..a27a1d75a3e9 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -65,6 +65,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>   		       struct led_pwm *led, struct fwnode_handle *fwnode)
>   {
>   	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
> +	struct led_init_data init_data = {};
>   	int ret;
>   
>   	led_data->active_low = led->active_low;
> @@ -90,7 +91,13 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>   
>   	pwm_init_state(led_data->pwm, &led_data->pwmstate);
>   
> -	ret = devm_led_classdev_register(dev, &led_data->cdev);
> +	if (fwnode) {
> +		init_data.fwnode = fwnode;
> +		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
> +						     &init_data);
> +	} else {
> +		ret = devm_led_classdev_register(dev, &led_data->cdev);
> +	}
>   	if (ret) {
>   		dev_err(dev, "failed to register PWM led for %s: %d\n",
>   			led->name, ret);
> 

This part looks good, but corresponding update of
Documentation/devicetree/bindings/leds/leds-pwm.txt is needed as well.
It would be good to switch to yaml by this occassion.

-- 
Best regards,
Jacek Anaszewski
