Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC1B3BE7F8
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 00:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfIYWBt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 18:01:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43822 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbfIYWAT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 18:00:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id q17so84827wrx.10;
        Wed, 25 Sep 2019 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y58n22AehKpICGg7pp3UrxHJ2uXYXc6EGOkvrwA6HO8=;
        b=Lw8M/6OPBaRs7BUKWe84Lhr+tS78mYzMADTYKDSwFWmJlt9z1m6QVlWpx0AVr4g6Wn
         QNB5l6hp3VVfKmmTimqAdwdIHkqEGWTJcdsxnWbsGZcDI8i+VzOALEoXZzPxV6QH4uss
         T6Zisk6GOL9jItOND5rodsvjHjPNx/CWSMvETUEvp2TvF85oxjQKzAcymRplx7hprgME
         PmOM4r72tepI7IysJp5hEQ0op7WUThrsgoAZuCw4V3QLeMbfpSOvJksSIzAkM4fdowpc
         uSKicTcKuCTYI23e52v8PH+JTH70R6EolnH4OT87zkiwpCsi4pD66DsltD0h+f/u4oJP
         VPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=y58n22AehKpICGg7pp3UrxHJ2uXYXc6EGOkvrwA6HO8=;
        b=FSaSQcnxlbumnHvyeHw0HPfppLIgsz8wk76OzOHWeYzNTFb6ZEMlk8SOPMfsB7axcr
         PnosQ3w6JOqQ38LI2dlBb++DP+KI1Crg8avESgzQM9hKxQ5bvKO90Ld4gkDBiV3YOLIh
         iP/H5UmW3xbnolGTj/oC1StPLnB/mVrol7GnaKmnd4sZngMHDU2SNpRvcGe2ov/YGcjX
         eN04Np+g6a5G+ggUb/al5/ZbUCkaJB6wNGxKDArTQTwH9X9FkwkessfWF1Np+mr9gQ7q
         y1q/0hdGFQmD6zq6vOpGYE2vdLZ+Oyf23zPWkqAqCrL4ShQozV2uu2aEV1sgFFig5GwB
         tqQQ==
X-Gm-Message-State: APjAAAUhYHNu8c+WkE31tJmQoQg4ImYTXrxShs+ZCnTMFN08gIv7saLv
        VLqWRGbfYt4RyPNS5qns9OWJTwse
X-Google-Smtp-Source: APXvYqzjbFzUDF/Vb7xtEn+hZQ6NLT5vQFIl+2w2PRqRUMyLc/pRQiF1L5l7qj6XnMl98jHDrikISQ==
X-Received: by 2002:adf:fe4a:: with SMTP id m10mr319209wrs.209.1569448817090;
        Wed, 25 Sep 2019 15:00:17 -0700 (PDT)
Received: from [192.168.1.19] (bfw9.neoplus.adsl.tpnet.pl. [83.28.60.9])
        by smtp.gmail.com with ESMTPSA id t203sm236626wmf.42.2019.09.25.15.00.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:00:16 -0700 (PDT)
Subject: Re: [PATCH v9 13/15] leds: lp55xx: Update the lp55xx to use the multi
 color framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-14-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <59e58ccf-84fb-5db7-5008-20afc7436d35@gmail.com>
Date:   Thu, 26 Sep 2019 00:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925174616.3714-14-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/25/19 7:46 PM, Dan Murphy wrote:
> Update the lp5523 to allow the use of the multi color framework.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                      |   1 +
>  drivers/leds/leds-lp5523.c                |  13 ++
>  drivers/leds/leds-lp55xx-common.c         | 150 ++++++++++++++++++----
>  drivers/leds/leds-lp55xx-common.h         |  11 ++
>  include/linux/platform_data/leds-lp55xx.h |   6 +
>  5 files changed, 157 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 84f60e35c5ee..dc3d9f2194cd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>  config LEDS_LP55XX_COMMON
>  	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>  	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
> +	depends on LEDS_CLASS_MULTI_COLOR && OF
>  	select FW_LOADER
>  	select FW_LOADER_USER_HELPER
>  	help
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index d0b931a136b9..8b2cdb98fed6 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
>  	return ret;
>  }
>  
> +static int lp5523_led_intensity(struct lp55xx_led *led, int chan_num)

Why do we need this function? brightness op will not suffice?

> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
> +		     led->brightness);
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
>  static int lp5523_led_brightness(struct lp55xx_led *led)
>  {
>  	struct lp55xx_chip *chip = led->chip;
> @@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
>  	.max_channel  = LP5523_MAX_LEDS,
>  	.post_init_device   = lp5523_post_init_device,
>  	.brightness_fn      = lp5523_led_brightness,
> +	.color_intensity_fn = lp5523_led_intensity,
>  	.set_led_current    = lp5523_set_led_current,
>  	.firmware_cb        = lp5523_firmware_loaded,
>  	.run_engine         = lp5523_run_engine,
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 44ced02b49f9..0e4b3a9d3047 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
>  {
>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>  	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	int brightness_val[LP55XX_MAX_GROUPED_CHAN];
> +	int ret;
> +	int i;
> +
> +	if (led->mc_cdev.num_leds > 1) {
> +		led_mc_calc_brightness(&led->mc_cdev,
> +				       brightness, brightness_val);
> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +			led->brightness = brightness_val[i];
> +			ret = cfg->color_intensity_fn(led,
> +						      led->grouped_channels[i]);

Now we will have three separate calls for each color component
(and possibly sleeping on mutex on contention).

Probably LED mc class use case will need a bit different design.

Also, instead of grouped_channels we could possibly have

led_mc_get_color_id(&led->mc_dev, i)

which would map entry position index to color_id.

I will stop reviewing here and will continue after taking
deeper look at this lp55xx design.

-- 
Best regards,
Jacek Anaszewski
