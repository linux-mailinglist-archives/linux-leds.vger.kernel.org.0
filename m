Return-Path: <linux-leds+bounces-1427-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 338A889C8C3
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 17:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37EF11C242BF
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 15:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11A11420D0;
	Mon,  8 Apr 2024 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e7IeOhY7"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587481422BA
	for <linux-leds@vger.kernel.org>; Mon,  8 Apr 2024 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712591418; cv=none; b=LWG+2szzZ0LmYBS6c2m3QsdShvPWliDfCrwPTXNee6OAyjFB6xSRQ/s2B/DMj9bEXN5NdUfjBF8XN444XsY2TCrVp5s87QZ9DQxCWYO+d5M0OhgU4A0lcl6PajmPbA8U/ab6e3g8GyqSQnxAWb0LNfKEmKFFBo2WRT0w/IzcaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712591418; c=relaxed/simple;
	bh=3Z6bTfTeasnPoF9Luawsk4mrxYU2wFdWwr2JD3YJ0K4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRoHQDBPs56QCEudJpT6jVWRjfpTPw0qi6vdZxNwA/4Lmc70UlkcLXOYlotEENJfeiKie4dYJxhHtGL10sH30udsGCpAFYNrc/qvhFWztgObbFfv3rdKGSKzwLfVoqJahZOCcjZEf9wekf2wHQtkEPDNTJxPD6KcVAAcwT0BU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e7IeOhY7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712591414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2A6n80q+V1SSRb/j/jQsIRPrVo01n33p646cRCY42U=;
	b=e7IeOhY7pLifWcVhPcRHnMcoucqpncO9EMrXASrpWLrPGTIilIfq+IcLg3RClpsNmDxJOn
	IxQb25Se+/xS/wJjzntkkDZPW/IqTtu8JWqd/yWiWU52wNgID0pmfd9Xkjht1sAKzgC3k7
	RpH/Zng7uqpUE4sANYA44k5qe2BpFTQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-L3rmULyiOV6QG9nocNuJ-w-1; Mon, 08 Apr 2024 11:50:10 -0400
X-MC-Unique: L3rmULyiOV6QG9nocNuJ-w-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-516d3735d3cso2890147e87.3
        for <linux-leds@vger.kernel.org>; Mon, 08 Apr 2024 08:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591408; x=1713196208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2A6n80q+V1SSRb/j/jQsIRPrVo01n33p646cRCY42U=;
        b=W7bx8Q+Ab03IffSyPGRSYCJiVJz9Gjl+wBnJ1cogv8jOyY29Rg2xG2RnFCl1LbNoRt
         6aGG+gC2jkwl87QFcHOOAvLj6OR2frj88EtlRVCjj7zvZxaoBaLmTAAlj3bZHIswT+em
         cF70a1xYDfupq6p3PPuAUq8m2l/x+H1RBSoYw7Kl4npynWiDDbnWvpzr4N6F8Rr8xATA
         LMdrfx45ti+euI8IKqsp+gwA6Yp5o/tJgNYjOalwhJKTGw27mSodH5l8KwLG9I8n7rlL
         eD5U4HSChQSviWP5koQroJZEXlCCxBQuiAVsFa1jleX0Ujl4vPbkOzE5OMDTviV4O5tx
         rrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2bJSHjgap9jsC4GX3JReWzNFJHuhjOZ+yLH7Y73mFJomjL2iUq8sxnhUYlgs4HGONJYEiHdZKyyp4WMVXfyTvzSm5ZFEqS9VHJw==
X-Gm-Message-State: AOJu0YzBRE06BVpP0YsZnufwtEkxN8SsRsXdeOWc1G7S8OgL4Aah8apO
	dylJGXc727SEZnje5vulFzBdjpKR04xIgsuLJOoc7OV6k3V+We+WKsVPt5FwLeHk9SOcqFuWLxl
	GsyGbWjZIlXjktSh83f7TMkDWVjW1fjNcq8FOaFcs5fv3nHu50Nh4QppIldg=
X-Received: by 2002:a19:435e:0:b0:516:a30e:765c with SMTP id m30-20020a19435e000000b00516a30e765cmr5655297lfj.32.1712591408213;
        Mon, 08 Apr 2024 08:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmnV9+ncXweVmaBW798w77wBDNjpB5OBybkHkCHomB6jjFWfizq1xhR6SBvR/+xGiXmqwbow==
X-Received: by 2002:a19:435e:0:b0:516:a30e:765c with SMTP id m30-20020a19435e000000b00516a30e765cmr5655282lfj.32.1712591407941;
        Mon, 08 Apr 2024 08:50:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bf20-20020a0564021a5400b0056dd3626035sm4166086edb.91.2024.04.08.08.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:50:07 -0700 (PDT)
Message-ID: <d0570f16-3473-44dc-91b4-19d41841d6e1@redhat.com>
Date: Mon, 8 Apr 2024 17:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: ideapad-laptop: add FnLock LED class
 device
To: Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <2db08c948568a8d5352780864956c3271b4e42ce.1712063200.git.soyer@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2db08c948568a8d5352780864956c3271b4e42ce.1712063200.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/2/24 3:21 PM, Gergo Koteles wrote:
> Some Ideapad/Yoga Laptops have an FnLock LED in the Esc key.
> 
> Expose Fnlock as an LED class device for easier OSD support.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/ideapad-laptop.c | 97 ++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 529df08af548..8a5bef4eedfe 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -152,6 +152,11 @@ struct ideapad_private {
>  		struct led_classdev led;
>  		unsigned int last_brightness;
>  	} kbd_bl;
> +	struct {
> +		bool initialized;
> +		struct led_classdev led;
> +		unsigned int last_brightness;
> +	} fn_lock;
>  };
>  
>  static bool no_bt_rfkill;
> @@ -531,6 +536,19 @@ static int ideapad_fn_lock_set(struct ideapad_private *priv, bool state)
>  		state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
>  }
>  
> +static void ideapad_fn_lock_led_notify(struct ideapad_private *priv, int brightness)
> +{
> +	if (!priv->fn_lock.initialized)
> +		return;
> +
> +	if (brightness == priv->fn_lock.last_brightness)
> +		return;
> +
> +	priv->fn_lock.last_brightness = brightness;
> +
> +	led_classdev_notify_brightness_hw_changed(&priv->fn_lock.led, brightness);
> +}
> +
>  static ssize_t fn_lock_show(struct device *dev,
>  			    struct device_attribute *attr,
>  			    char *buf)
> @@ -561,6 +579,8 @@ static ssize_t fn_lock_store(struct device *dev,
>  	if (err)
>  		return err;
>  
> +	ideapad_fn_lock_led_notify(priv, state);
> +
>  	return count;
>  }
>  
> @@ -1479,6 +1499,65 @@ static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
>  	led_classdev_unregister(&priv->kbd_bl.led);
>  }
>  
> +/*
> + * FnLock LED
> + */
> +static enum led_brightness ideapad_fn_lock_led_cdev_get(struct led_classdev *led_cdev)
> +{
> +	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, fn_lock.led);
> +
> +	return ideapad_fn_lock_get(priv);
> +}
> +
> +static int ideapad_fn_lock_led_cdev_set(struct led_classdev *led_cdev,
> +	enum led_brightness brightness)
> +{
> +	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, fn_lock.led);
> +
> +	return ideapad_fn_lock_set(priv, brightness);
> +}
> +
> +static int ideapad_fn_lock_led_init(struct ideapad_private *priv)
> +{
> +	int brightness, err;
> +
> +	if (!priv->features.fn_lock)
> +		return -ENODEV;
> +
> +	if (WARN_ON(priv->fn_lock.initialized))
> +		return -EEXIST;
> +
> +	priv->fn_lock.led.max_brightness = 1;
> +
> +	brightness = ideapad_fn_lock_get(priv);
> +	if (brightness < 0)
> +		return brightness;
> +
> +	priv->fn_lock.last_brightness = brightness;
> +	priv->fn_lock.led.name                    = "platform::" LED_FUNCTION_FNLOCK;
> +	priv->fn_lock.led.brightness_get          = ideapad_fn_lock_led_cdev_get;
> +	priv->fn_lock.led.brightness_set_blocking = ideapad_fn_lock_led_cdev_set;
> +	priv->fn_lock.led.flags                   = LED_BRIGHT_HW_CHANGED;
> +
> +	err = led_classdev_register(&priv->platform_device->dev, &priv->fn_lock.led);
> +	if (err)
> +		return err;
> +
> +	priv->fn_lock.initialized = true;
> +
> +	return 0;
> +}
> +
> +static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
> +{
> +	if (!priv->fn_lock.initialized)
> +		return;
> +
> +	priv->fn_lock.initialized = false;
> +
> +	led_classdev_unregister(&priv->fn_lock.led);
> +}
> +
>  /*
>   * module init/exit
>   */
> @@ -1741,8 +1820,10 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  		if (priv->features.set_fn_lock_led) {
>  			int brightness = ideapad_fn_lock_get(priv);
>  
> -			if (brightness >= 0)
> +			if (brightness >= 0) {
>  				ideapad_fn_lock_set(priv, brightness);
> +				ideapad_fn_lock_led_notify(priv, brightness);
> +			}
>  		}
>  
>  		if (data->type != ACPI_TYPE_INTEGER) {
> @@ -1754,6 +1835,10 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>  			data->integer.value);
>  
> +		/* 0x02 FnLock, 0x03 Esc */
> +		if (data->integer.value == 0x02 || data->integer.value == 0x03)
> +			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);
> +
>  		ideapad_input_report(priv,
>  				     data->integer.value | IDEAPAD_WMI_KEY);
>  
> @@ -1847,6 +1932,14 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  			dev_info(&pdev->dev, "Keyboard backlight control not available\n");
>  	}
>  
> +	err = ideapad_fn_lock_led_init(priv);
> +	if (err) {
> +		if (err != -ENODEV)
> +			dev_warn(&pdev->dev, "Could not set up FnLock LED: %d\n", err);
> +		else
> +			dev_info(&pdev->dev, "FnLock control not available\n");
> +	}
> +
>  	/*
>  	 * On some models without a hw-switch (the yoga 2 13 at least)
>  	 * VPCCMD_W_RF must be explicitly set to 1 for the wifi to work.
> @@ -1903,6 +1996,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
>  
> +	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
>  	ideapad_input_exit(priv);
>  
> @@ -1930,6 +2024,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
>  
> +	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);


