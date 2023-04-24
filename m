Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7736ED023
	for <lists+linux-leds@lfdr.de>; Mon, 24 Apr 2023 16:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjDXOQi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Apr 2023 10:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXOQd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2023 10:16:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246DD7AB5
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 07:16:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3B2761DC0
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 14:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A85C4339E;
        Mon, 24 Apr 2023 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682345791;
        bh=4lmPcIMAYU4pQOhY3s3c2Um/05DaS2dGI7bxDaMS6Tg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lvsff4oBsu5/TyJRa4xlhGzKP9hUK0xxlHTJMcMbjMxOGUKaJ/2N2Nup5FOii9khT
         RBmcmf+w71Diya5hcEIMx/WQcOKFih/SXd56HmwIurTSwBmqqS/usjcy2pxoG9WL3y
         JPrjLfNPNAylMLOMycTzQMYtYCjfefkSU35F6r7yGYeFRtaPDTtva1nIAJYmaRXpax
         h3Asd27e08CNNFDtGqvxIc/W/C5Lf7AKmlFO0jZWK2Uk1qgAHSRhX5U5HbqH6HGKnG
         3K0abbqp/m1Tj5WmbBTcFOJcBB3PMuwSVMm0V8lUa7BhbULuD5rvwTzqAW6BQ71m1C
         AhfmJC7GcHKqQ==
Date:   Mon, 24 Apr 2023 15:16:26 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 3/5] leds: cht-wcove: Add support for breathing mode
 use hw_pattern sysfs API
Message-ID: <20230424141626.GM50521@google.com>
References: <20230420123741.57160-1-hdegoede@redhat.com>
 <20230420123741.57160-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420123741.57160-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek,

On Thu, 20 Apr 2023, Hans de Goede wrote:

> The hw-blinking of the LED controller in the Whiskey Cove PMIC can also
> be used for a hw-breathing effect.
> 
> As discussed during review of v2 of the submission of the new
> leds-cht-wcove driver, the LED subsystem already supports breathing mode
> on several other LED controllers using the hw_pattern interface.
> 
> Implement a pattern_set callback to implement breathing mode modelled
> after the breathing mode supported by the SC27xx breathing light and
> Crane EL15203000 LED drivers. The Whiskey Cove PMIC's breathing mode
> is closer to the EL15203000 one then to the SC27xx one since it does
> not support staying high / low for a specific time, it only supports
> rise and fall times.
> 
> As such the supported hw_pattern and the documentation for this is almost
> a 1:1 copy of the pattern/docs for the EL15203000 breathing mode.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Is this what you were after?

> Link: https://lore.kernel.org/all/6beed61c-1fc6-6525-e873-a8978f5fbffb@gmail.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2
> - Improve/extend Documentation/leds/leds-cht-wcove.rst a bit
> ---
>  Documentation/leds/index.rst          |  1 +
>  Documentation/leds/leds-cht-wcove.rst | 38 ++++++++++++++++++++++++
>  drivers/leds/leds-cht-wcove.c         | 42 ++++++++++++++++++++++++---
>  3 files changed, 77 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/leds/leds-cht-wcove.rst
> 
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index b9ca081fac71..c92612271e25 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -17,6 +17,7 @@ LEDs
>     uleds
>  
>     leds-blinkm
> +   leds-cht-wcove
>     leds-el15203000
>     leds-lm3556
>     leds-lp3944
> diff --git a/Documentation/leds/leds-cht-wcove.rst b/Documentation/leds/leds-cht-wcove.rst
> new file mode 100644
> index 000000000000..5ec7cb60c4aa
> --- /dev/null
> +++ b/Documentation/leds/leds-cht-wcove.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================================================
> +Kernel driver for Intel Cherry Trail Whiskey Cove PMIC LEDs
> +===========================================================
> +
> +/sys/class/leds/<led>/hw_pattern
> +--------------------------------
> +
> +Specify a hardware pattern for the Whiskey Cove PMIC LEDs.
> +
> +The only supported pattern is hardware breathing mode::
> +
> +    "0 2000 1 2000"
> +
> +	^
> +	|
> +    Max-|     ---
> +	|    /   \
> +	|   /     \
> +	|  /       \     /
> +	| /         \   /
> +    Min-|-           ---
> +	|
> +	0------2------4--> time (sec)
> +
> +The rise and fall times must be the same value.
> +Supported values are 2000, 1000, 500 and 250 for
> +breathing frequencies of 1/4, 1/2, 1 and 2 Hz.
> +
> +The set pattern only controls the timing. For max brightness the last
> +set brightness is used and the max brightness can be changed
> +while breathing by writing the brightness attribute.
> +
> +This is just like how blinking works in the LED subsystem,
> +for both sw and hw blinking the brightness can also be changed
> +while blinking. Breathing on this hw really is just a variant
> +mode of blinking.
> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
> index 166c6f010492..23e97b08f6ea 100644
> --- a/drivers/leds/leds-cht-wcove.c
> +++ b/drivers/leds/leds-cht-wcove.c
> @@ -218,9 +218,10 @@ static int cht_wc_leds_find_freq(unsigned long period)
>  		return -1;
>  }
>  
> -static int cht_wc_leds_blink_set(struct led_classdev *cdev,
> -				 unsigned long *delay_on,
> -				 unsigned long *delay_off)
> +static int cht_wc_leds_set_effect(struct led_classdev *cdev,
> +				  unsigned long *delay_on,
> +				  unsigned long *delay_off,
> +				  u8 effect)
>  {
>  	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
>  	unsigned int ctrl;
> @@ -247,7 +248,7 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
>  	}
>  
>  	ret = regmap_update_bits(led->regmap, led->regs->fsm,
> -				 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_BLINKING);
> +				 CHT_WC_LED_EFF_MASK, effect);
>  	if (ret < 0)
>  		dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
>  
> @@ -266,6 +267,37 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
>  	return ret;
>  }
>  
> +static int cht_wc_leds_blink_set(struct led_classdev *cdev,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{
> +	return cht_wc_leds_set_effect(cdev, delay_on, delay_off, CHT_WC_LED_EFF_BLINKING);
> +}
> +
> +static int cht_wc_leds_pattern_set(struct led_classdev *cdev,
> +				   struct led_pattern *pattern,
> +				   u32 len, int repeat)
> +{
> +	unsigned long delay_off, delay_on;
> +
> +	if (repeat > 0 || len != 2 ||
> +	    pattern[0].brightness != LED_OFF || pattern[1].brightness != LED_ON ||
> +	    pattern[0].delta_t != pattern[1].delta_t ||
> +	    (pattern[0].delta_t != 250 && pattern[0].delta_t != 500 &&
> +	     pattern[0].delta_t != 1000 && pattern[0].delta_t != 2000))
> +		return -EINVAL;
> +
> +	delay_off = pattern[0].delta_t;
> +	delay_on  = pattern[1].delta_t;
> +
> +	return cht_wc_leds_set_effect(cdev, &delay_on, &delay_off, CHT_WC_LED_EFF_BREATHING);
> +}
> +
> +static int cht_wc_leds_pattern_clear(struct led_classdev *cdev)
> +{
> +	return cht_wc_leds_brightness_set(cdev, LED_OFF);
> +}
> +
>  static int cht_wc_led_save_regs(struct cht_wc_led *led,
>  				struct cht_wc_led_saved_regs *saved_regs)
>  {
> @@ -322,6 +354,8 @@ static int cht_wc_leds_probe(struct platform_device *pdev)
>  		led->cdev.brightness_set_blocking = cht_wc_leds_brightness_set;
>  		led->cdev.brightness_get = cht_wc_leds_brightness_get;
>  		led->cdev.blink_set = cht_wc_leds_blink_set;
> +		led->cdev.pattern_set = cht_wc_leds_pattern_set;
> +		led->cdev.pattern_clear = cht_wc_leds_pattern_clear;
>  		led->cdev.max_brightness = 255;
>  
>  		ret = led_classdev_register(&pdev->dev, &led->cdev);
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]
