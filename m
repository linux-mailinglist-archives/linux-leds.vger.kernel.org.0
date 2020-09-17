Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD2B26D038
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 02:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgIQAxB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 20:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgIQAxA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 20:53:00 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7FAC061354
        for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2020 17:46:30 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id z26so432555oih.12
        for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2020 17:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xPfF/+vHZ8xULDak5kE3Di70hl+PzaH5PBbg6iuyFFM=;
        b=Zbt3vPlHy3YASoVcQRtmExxjDK9LYi8zfmrC+8SVKZwsmZrRDgo3laAVlvKH/05dNd
         zXIr/6NLQ52gEsE5syvHRvxlZkUCJ1v4YyHIeRV7jXyGvxzNWzDlaSQMeKklDyLAxOYc
         v40p05Y/X8G/EhRRP0LgSWLb//JPsAgaaSvokwHYCMiAS7/y7PVrTVmsjd+bIVuum/FC
         yLC3Sx4RRtIyvKNkNqQby4x9ii2xJbaQuVM+FS7If4XInO7mbscnYZVRZH7j7gGxKFO9
         2BszYiF9xEN3nz+IhfoOShY4FTKBy1UIAdthCZP8p2sMkwkgNvESkXGkstd1V2UmHEpo
         tKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xPfF/+vHZ8xULDak5kE3Di70hl+PzaH5PBbg6iuyFFM=;
        b=aw997hQK8fCkyG6/5DIsI15EZymhGkwKBmqCFOQPwufTlKuET78Ip9ibqirof1UCAI
         qZiY97L++pWG3Fh8+q2eII2PFnXYaC8NCGo+i6tccnn4CyaRGAPYW3BQ4UX5NTKoCsJw
         hIBrAucj3C2LZdTSkrdw4QRz0VqS/d/Tg1RP5bkuvliuD2rt3ELXIFJHRe+ZVADL+r+U
         66gXheiwFoOj2ohlG16jSZwsYpHZjPFlS8hOZBYEo16LpDWIw7WyO8lkY4QUZfwUq7b2
         SbZQdJW60AG+LgX4h5210w3yxwTJ61ytNgp+WBen1AD95mcl9VIwXyIuTId0UjS3XJQ4
         3hsA==
X-Gm-Message-State: AOAM533rghEoSDn8uaQxqGycTpQKYa1JTIMmdBVfDXh2tZugQMHmJ+/z
        hDF/Qi4uJ1wgrUwmwXzlbdvEcQ==
X-Google-Smtp-Source: ABdhPJyvdeAESwOnVofeOkEEXJbZoFus3jAmQOAYorS8U5WznmT9jpjEZek/Y/mXG1+xL43TucnVqg==
X-Received: by 2002:aca:2301:: with SMTP id e1mr5001999oie.177.1600303590034;
        Wed, 16 Sep 2020 17:46:30 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:7cad:6eff:fec8:37e4])
        by smtp.gmail.com with ESMTPSA id j34sm262867otc.15.2020.09.16.17.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 17:46:29 -0700 (PDT)
Date:   Wed, 16 Sep 2020 19:46:25 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marek Beh?n <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        Ond??ej Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds v1 06/10] leds: pm8058: use struct led_init_data
 when registering
Message-ID: <20200917004625.GJ1893@yoga>
References: <20200916231650.11484-1-marek.behun@nic.cz>
 <20200916231650.11484-7-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200916231650.11484-7-marek.behun@nic.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed 16 Sep 18:16 CDT 2020, Marek Beh?n wrote:

> By using struct led_init_data when registering we do not need to parse
> `label` DT property nor `linux,default-trigger` property.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/leds/leds-pm8058.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> index 7869ccdf70ce6..f6190e4af60fe 100644
> --- a/drivers/leds/leds-pm8058.c
> +++ b/drivers/leds/leds-pm8058.c
> @@ -87,36 +87,37 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
>  
>  static int pm8058_led_probe(struct platform_device *pdev)
>  {
> +	struct led_init_data init_data = {};
> +	struct device *dev = &pdev->dev;
> +	enum led_brightness maxbright;
> +	struct device_node *np;
>  	struct pm8058_led *led;
> -	struct device_node *np = pdev->dev.of_node;
> -	int ret;
>  	struct regmap *map;
>  	const char *state;
> -	enum led_brightness maxbright;
> +	int ret;
>  
> -	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);

The pdev->dev -> dev and of_node changes are reasonable, but shouldn't
be part of this patch. It simply makes it hard to reason about he actual
change.

Please respin this with only the introduction of led_init_data.

Thanks,
Bjorn

>  	if (!led)
>  		return -ENOMEM;
>  
> -	led->ledtype = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);
> +	led->ledtype = (u32)(unsigned long)device_get_match_data(dev);
>  
> -	map = dev_get_regmap(pdev->dev.parent, NULL);
> +	map = dev_get_regmap(dev->parent, NULL);
>  	if (!map) {
> -		dev_err(&pdev->dev, "Parent regmap unavailable.\n");
> +		dev_err(dev, "Parent regmap unavailable.\n");
>  		return -ENXIO;
>  	}
>  	led->map = map;
>  
> +	np = dev_of_node(dev);
> +
>  	ret = of_property_read_u32(np, "reg", &led->reg);
>  	if (ret) {
> -		dev_err(&pdev->dev, "no register offset specified\n");
> +		dev_err(dev, "no register offset specified\n");
>  		return -EINVAL;
>  	}
>  
>  	/* Use label else node name */
> -	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
> -	led->cdev.default_trigger =
> -		of_get_property(np, "linux,default-trigger", NULL);
>  	led->cdev.brightness_set = pm8058_led_set;
>  	led->cdev.brightness_get = pm8058_led_get;
>  	if (led->ledtype == PM8058_LED_TYPE_COMMON)
> @@ -142,14 +143,13 @@ static int pm8058_led_probe(struct platform_device *pdev)
>  	    led->ledtype == PM8058_LED_TYPE_FLASH)
>  		led->cdev.flags	= LED_CORE_SUSPENDRESUME;
>  
> -	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "unable to register led \"%s\"\n",
> -			led->cdev.name);
> -		return ret;
> -	}
> +	init_data.fwnode = of_fwnode_handle(np);
> +
> +	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
> +	if (ret)
> +		dev_err(dev, "Failed to register LED for node %pOF\n", np);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct of_device_id pm8058_leds_id_table[] = {
> @@ -173,7 +173,7 @@ static struct platform_driver pm8058_led_driver = {
>  	.probe		= pm8058_led_probe,
>  	.driver		= {
>  		.name	= "pm8058-leds",
> -		.of_match_table = pm8058_leds_id_table,
> +		.of_match_table = of_match_ptr(pm8058_leds_id_table),
>  	},
>  };
>  module_platform_driver(pm8058_led_driver);
> -- 
> 2.26.2
> 
