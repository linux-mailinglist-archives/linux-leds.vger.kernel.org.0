Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC93187271
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2020 19:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbgCPSgS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Mar 2020 14:36:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42548 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732352AbgCPSgS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Mar 2020 14:36:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id v11so22581667wrm.9;
        Mon, 16 Mar 2020 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7lQB6wlaubvH8er670BlOGAtKZd5K8M7/RFgJn2RRsI=;
        b=RjiJVMdYSpn/mOBVFkY7sfHUf59hBKS1NHVDvCUOGM/Z2BtnSId+ILjYYi1NG57ZF9
         v37aTx1oMIyZ2QTQBAQcrVJFKW4X76tG9U27JN5iM0P4fB+GWXiDLyQ40RDOrieyXTlA
         M0XsgBUAWX0A1WllmPP6pgjJOBQKvxQLGlsYdbByWt5PRcgjYEJcqGvfn6DxN4Mu43fw
         5Uaz+QbeUvB3EForZG54e4TQxZhgH7ogwHUskWFfvcWkV4LLWnZoT0t2k9ZiqbH8yjkY
         ZOGj/+3SQLjp397gklGrcqtCjQqNEGt4IjfeVSTWzPTulHBSCPhV9vzn1z0r2t5EBU49
         bhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7lQB6wlaubvH8er670BlOGAtKZd5K8M7/RFgJn2RRsI=;
        b=sEDAA3spHh2wced00YtUICZgrGf/f4SJ3dkfCl4N3KTAsHWCubqQxU5AHZPEJMNJkG
         zFpKwqznrq0UwDkKJCeSthXe2PxOn10oAsdXNq1ykxrRIweRD0+KIihNkKmJ5pzJOVOi
         DM4abbCMVHw/ZvFnIw9u9xRgu9XEWG1MPj3e5boQK/0SAwm637uVLtm+WwuRslYXznKj
         jhPxPQEHLq3aXxdTvy1Sh2g3RR03rCuRK45lGUk13JkDxnLt+DPQCd7Y2wf6it7+dUF8
         /KAtF2e3i3wutqJHNsUYmvsWhCrwhZZXGeBvYU5vWP2Y2S8e1B5nkFXRVE0VtnpmE476
         0U5w==
X-Gm-Message-State: ANhLgQ09RtqU1mItwRdC60cy+SfXTQ/g8DQUtXEvh8OdusUL0AaNj0a/
        mHxJsYNC6jYHolZAXWCuQmE9RgFv
X-Google-Smtp-Source: ADFU+vv4CMz8qJXj/rZhte7/jbYyuyB8K0G9PFxaBRncASD067lLXRBWHh5rkk5Z9dPls3e6DV35+w==
X-Received: by 2002:adf:904a:: with SMTP id h68mr630046wrh.291.1584383775118;
        Mon, 16 Mar 2020 11:36:15 -0700 (PDT)
Received: from [192.168.1.23] (acek158.neoplus.adsl.tpnet.pl. [83.9.186.158])
        by smtp.gmail.com with ESMTPSA id f17sm1088889wrj.28.2020.03.16.11.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 11:36:14 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
To:     Denis Osterland-Heim <denis.osterland@diehl.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200316124851.6303-1-Denis.Osterland@diehl.com>
 <20200316124851.6303-3-Denis.Osterland@diehl.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bee4d31f-1f00-c621-f93c-f49207e406d6@gmail.com>
Date:   Mon, 16 Mar 2020 19:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316124851.6303-3-Denis.Osterland@diehl.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Denis,

On 3/16/20 1:53 PM, Denis Osterland-Heim wrote:
> This patch adds support for "default-state" devicetree property, which
> allows to defer pwm init to first use of led.
> 
> This allows to configure the PWM early in bootloader to let the LED
> blink until an application in Linux userspace sets something different.
> 
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
> ---
>  drivers/leds/leds-pwm.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 5f69b6571595..fce7969e7918 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -18,11 +18,16 @@
>  #include <linux/pwm.h>
>  #include <linux/slab.h>
>  
> +#define LEDS_PWM_DEFSTATE_OFF	0
> +#define LEDS_PWM_DEFSTATE_ON	1
> +#define LEDS_PWM_DEFSTATE_KEEP	2
> +
>  struct led_pwm {
>  	const char	*name;
>  	const char	*default_trigger;
>  	unsigned int	pwm_id __deprecated;
>  	u8		active_low;
> +	u8		default_state;
>  	unsigned int	max_brightness;
>  	unsigned int	pwm_period_ns;
>  };
> @@ -72,7 +77,6 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  	led_data->active_low = led->active_low;
>  	led_data->cdev.name = led->name;
>  	led_data->cdev.default_trigger = led->default_trigger;
> -	led_data->cdev.brightness = LED_OFF;
>  	led_data->cdev.max_brightness = led->max_brightness;
>  	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
>  
> @@ -92,13 +96,27 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  
>  	pwm_init_state(led_data->pwm, &led_data->pwmstate);
>  
> +	if (led->default_state == LEDS_PWM_DEFSTATE_ON)
> +		led_data->cdev.brightness = led->max_brightness;
> +	else if (led->default_state == LEDS_PWM_DEFSTATE_KEEP) {
> +		uint64_t brightness;
> +
> +		pwm_get_state(led_data->pwm, &led_data->pwmstate);

This seems to not be reading the device state, i.e. what you tried
to address by direct call to pwm->chip->ops->get_state() before.

Am I missing something?

-- 
Best regards,
Jacek Anaszewski
