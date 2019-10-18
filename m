Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEEEFDD178
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2019 00:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfJRWCX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 18:02:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37645 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfJRWCW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 18:02:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id p14so7732107wro.4;
        Fri, 18 Oct 2019 15:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6dQAFshhL48PZ+aODCJDOIXc/B1ygVRm2PcTJmwhQZ8=;
        b=cwydHiem7kl9J2qd7uKTtF7J3wM7jjKn7b3x/mJriNM9J7l5wBiO2EME5a9xo6R+7f
         j1IH2FdosiljJjZcC7LIwbBEPKqXoVeiJfUeGFen/vpQgwZnxvZq2g5Y87xVgkx2UCmQ
         1ssjdMs7qVaKw2xQlNOL9P1trEyCwiZi77iGdNlVylEYSyop/oRQTK4MUsOqR6C5Qzmw
         QHOYhTfg875nJNw7AsJsaS+y7Fx5/h0GfIUeoufMY5iZNyWB3yVos/+nvOzXgdB2SwjO
         kCxKviBAwsb6UgQudRgt6mZYw28n3STyfBZ1pb9mKH3sAfYzAKKqFoGQk/60EZOqF3dj
         GrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6dQAFshhL48PZ+aODCJDOIXc/B1ygVRm2PcTJmwhQZ8=;
        b=RHnPDPBkQrmjbkLrXjj3Q+G52ttqFMWHnJQojVbJe3nDqNwayK1sp43vdBcfk7ST69
         /aA2OOop75qeG/wI1LuiWKqvu1T3ksc/y+129ne3q2R+9ahRwjQ2umR/ucM/nx6cIu2S
         8aTahWjbhzESAX/jg/QhHpsb9ml86hCSOC4OVBN6o97pjJso5voRaLRDY2YtJfuNK01g
         N8x3SAIP+2Tt7EPtJwlFzeoEXmeDQ3aOO1Orzk/eNqGLh6ZY1MQA40MzweQu7QyMhLzc
         hk3vFfA+GKuI95rAajsfG3NkLd8CjB9FhHA6CxLsuWbGyVLeuJbHvza9w9GnntE03D/E
         QklA==
X-Gm-Message-State: APjAAAWPmbQ3tDvg8Elx5JYgw5ulXg4zdBdxIxE2nJD/uj9rd+l3FL44
        Y1NxcMvHkjcOIEg8vdmaIi+h83rK
X-Google-Smtp-Source: APXvYqyJamAIE/iZ1SsNp2IPEgLxsZddLjBtyTAv6MDoLxl2+xd7ipsQNJY8QGlXN/dHP2ffTpKgbw==
X-Received: by 2002:adf:a157:: with SMTP id r23mr9149541wrr.51.1571436139336;
        Fri, 18 Oct 2019 15:02:19 -0700 (PDT)
Received: from [192.168.1.19] (chp168.neoplus.adsl.tpnet.pl. [83.31.13.168])
        by smtp.gmail.com with ESMTPSA id q19sm8985483wra.89.2019.10.18.15.02.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 15:02:18 -0700 (PDT)
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2da123af-8cbe-e143-73f2-ca741e0923d2@gmail.com>
Date:   Sat, 19 Oct 2019 00:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018122521.6757-14-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

I forgot to mention one thing below.

On 10/18/19 2:25 PM, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
[...]

> -	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
>  
>  	if (led->chan_nr >= max_channel) {
>  		dev_err(dev, "Use channel numbers between 0 and %d\n",
> @@ -170,18 +242,13 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>  		return -EINVAL;
>  	}
>  
> -	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
> -	led->cdev.groups = lp55xx_led_groups;
> -
> -	if (pdata->led_config[chan].name) {
> -		led->cdev.name = pdata->led_config[chan].name;
> -	} else {
> -		snprintf(name, sizeof(name), "%s:channel%d",
> -			pdata->label ? : chip->cl->name, chan);
> -		led->cdev.name = name;
> -	}
> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
> +	if (pdata->led_config[chan].num_colors > 1)
> +		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
> +	else
> +#endif

This looks odd. I think that no-ops from previous version were OK.

> +		ret = devm_led_classdev_register(dev, &led->cdev);
>  
> -	ret = devm_led_classdev_register(dev, &led->cdev);
>  	if (ret) {
>  		dev_err(dev, "led register err: %d\n", ret);
>  		return ret;
> @@ -525,6 +592,82 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>  


-- 
Best regards,
Jacek Anaszewski
