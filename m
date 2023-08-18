Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165D0780803
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 11:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346376AbjHRJJw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 05:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358934AbjHRJJd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 05:09:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45058E
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 02:09:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 58F16677CA
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 09:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41266C433C9;
        Fri, 18 Aug 2023 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692349770;
        bh=M38Jgh/HvoABirP9e2vAzVOWPv3b/Pg7CK6+hvMoSdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PFjHEBhjqcjvXBXLGl3i1ZYyTtHVHQGirH7bOF1AMQvYnRCIlcGBIUZIiIlpJhjhg
         KZcOfxEuh3KU1NXbBNox067hmQTlKbDO1UDXycfLmldDARtNkoNM4Okv3vJyogI1eC
         dQFQtr1gSeXYddhelRUSzL+IiNCDeJ7hXYuWHo8BKq3HBSptkmbISVX/CFveyukW3g
         uox+N12j+V6ETDJlq35G37hsXQdO1AImlHJBi/oTqvC0Vod83XP4sKw4eNKiyKAgNY
         p+hP/qF5QoB7VElHTEHKuxcMIkGEqPo7K0BKkE0KqHgCueSOjLvkczfmo+voh6xLFy
         bUXZiROvtS/cw==
Date:   Fri, 18 Aug 2023 10:09:21 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode
 via private trigger
Message-ID: <20230818090921.GQ986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-6-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230802160748.11208-6-kabel@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023, Marek Behún wrote:

> Add support for enabling MCU controlled mode of the Turris Omnia LEDs
> via a LED private trigger called "omnia-mcu". Recall that private LED
> triggers will only be listed in the sysfs trigger file for LEDs that
> support them (currently there is no user of this mechanism).
> 
> When in MCU controlled mode, the user can still set LED color, but the
> blinking is done by MCU, which does different things for different LEDs:
> - WAN LED is blinked according to the LED[0] pin of the WAN PHY
> - LAN LEDs are blinked according to the LED[0] output of the
>   corresponding port of the LAN switch
> - PCIe LEDs are blinked according to the logical OR of the MiniPCIe port
>   LED pins
> 
> In the future I want to make the netdev trigger to transparently offload
> the blinking to the HW if user sets compatible settings for the netdev
> trigger (for LEDs associated with network devices).
> There was some work on this already, and hopefully we will be able to
> complete it sometime, but for now there are still multiple blockers for
> this, and even if there weren't, we still would not be able to configure
> HW controlled mode for the LEDs associated with MiniPCIe ports.
> 
> In the meantime let's support HW controlled mode via the private LED
> trigger mechanism. If, in the future, we manage to complete the netdev
> trigger offloading, we can still keep this private trigger for backwards
> compatibility, if needed.
> 
> We also set "omnia-mcu" to cdev->default_trigger, so that the MCU keeps
> control until the user first wants to take over it. If a different
> default trigger is specified in device-tree via the
> 'linux,default-trigger' property, LED class will overwrite
> cdev->default_trigger, and so the DT property will be respected.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/leds/Kconfig             |  1 +
>  drivers/leds/leds-turris-omnia.c | 97 +++++++++++++++++++++++++++++---
>  2 files changed, 90 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6046dfeca16f..ebb3b84d7a4f 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -187,6 +187,7 @@ config LEDS_TURRIS_OMNIA
>  	depends on I2C
>  	depends on MACH_ARMADA_38X || COMPILE_TEST
>  	depends on OF
> +	select LEDS_TRIGGERS
>  	help
>  	  This option enables basic support for the LEDs found on the front
>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 636c6f802bcf..180b0cbeb92e 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -31,7 +31,7 @@ struct omnia_led {
>  	struct led_classdev_mc mc_cdev;
>  	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
>  	u8 cached_channels[OMNIA_LED_NUM_CHANNELS];
> -	bool on;
> +	bool on, hwtrig;
>  	int reg;
>  };
>  
> @@ -123,12 +123,14 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
>  
>  	/*
>  	 * Only recalculate RGB brightnesses from intensities if brightness is
> -	 * non-zero. Otherwise we won't be using them and we can save ourselves
> -	 * some software divisions (Omnia's CPU does not implement the division
> -	 * instruction).
> +	 * non-zero (if it is zero and the LED is in HW blinking mode, we use
> +	 * max_brightness as brightness). Otherwise we won't be using them and
> +	 * we can save ourselves some software divisions (Omnia's CPU does not
> +	 * implement the division instruction).
>  	 */
> -	if (brightness) {
> -		led_mc_calc_color_components(mc_cdev, brightness);
> +	if (brightness || led->hwtrig) {
> +		led_mc_calc_color_components(mc_cdev, brightness ?:
> +						      cdev->max_brightness);
>  
>  		/*
>  		 * Send color command only if brightness is non-zero and the RGB
> @@ -138,8 +140,11 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
>  			err = omnia_led_send_color_cmd(leds->client, led);
>  	}
>  
> -	/* send on/off state change only if (bool)brightness changed */
> -	if (!err && !brightness != !led->on) {
> +	/*
> +	 * Send on/off state change only if (bool)brightness changed and the LED
> +	 * is not being blinked by HW.
> +	 */
> +	if (!err && !led->hwtrig && !brightness != !led->on) {
>  		u8 state = CMD_LED_STATE_LED(led->reg);
>  
>  		if (brightness)
> @@ -155,6 +160,70 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
>  	return err;
>  }
>  
> +static struct led_hw_trigger_type omnia_hw_trigger_type;
> +
> +static int omnia_hwtrig_activate(struct led_classdev *cdev)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
> +	struct omnia_led *led = to_omnia_led(mc_cdev);
> +	int err = 0;
> +
> +	mutex_lock(&leds->lock);
> +
> +	if (!led->on) {
> +		/*
> +		 * If the LED is off (brightness was set to 0), the last
> +		 * configured color was not necessarily sent to the MCU.
> +		 * Recompute with max_brightness and send if needed.
> +		 */
> +		led_mc_calc_color_components(mc_cdev, cdev->max_brightness);
> +
> +		if (omnia_led_channels_changed(led))
> +			err = omnia_led_send_color_cmd(leds->client, led);
> +	}
> +
> +	if (!err) {
> +		/* put the LED into MCU controlled mode */

Nit: You improved the comment above to be more grammatically correct by
starting with an uppercase character.  Please continue with this
improvement for all comments there in.

> +		err = omnia_cmd_write(leds->client, CMD_LED_MODE,
> +				      CMD_LED_MODE_LED(led->reg));
> +		if (!err)
> +			led->hwtrig = true;
> +	}
> +
> +	mutex_unlock(&leds->lock);
> +
> +	return err;
> +}
> +
> +static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
> +{
> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
> +	struct omnia_led *led = to_omnia_led(lcdev_to_mccdev(cdev));
> +	int err;
> +
> +	mutex_lock(&leds->lock);
> +
> +	led->hwtrig = false;
> +
> +	/* put the LED into software mode */
> +	err = omnia_cmd_write(leds->client, CMD_LED_MODE,
> +			      CMD_LED_MODE_LED(led->reg) | CMD_LED_MODE_USER);
> +
> +	mutex_unlock(&leds->lock);
> +
> +	if (err < 0)
> +		dev_err(cdev->dev, "Cannot put LED to software mode: %i\n",
> +			err);
> +}
> +
> +static struct led_trigger omnia_hw_trigger = {
> +	.name		= "omnia-mcu",
> +	.activate	= omnia_hwtrig_activate,
> +	.deactivate	= omnia_hwtrig_deactivate,
> +	.trigger_type	= &omnia_hw_trigger_type,

Not sure I understand this interface.

Why not just set a bool instead of carrying around an empty struct?

> +};
> +
>  static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  			      struct device_node *np)
>  {
> @@ -198,6 +267,12 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  	cdev = &led->mc_cdev.led_cdev;
>  	cdev->max_brightness = 255;
>  	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
> +	cdev->trigger_type = &omnia_hw_trigger_type;
> +	/*
> +	 * Use the omnia-mcu trigger as the default trigger. It may be rewritten
> +	 * by LED class from the linux,default-trigger property.
> +	 */
> +	cdev->default_trigger = omnia_hw_trigger.name;
>  
>  	/* put the LED into software mode */
>  	ret = omnia_cmd_write(client, CMD_LED_MODE, CMD_LED_MODE_LED(led->reg) |
> @@ -310,6 +385,12 @@ static int omnia_leds_probe(struct i2c_client *client)
>  
>  	mutex_init(&leds->lock);
>  
> +	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot register private LED trigger: %d\n", ret);
> +		return ret;
> +	}
> +
>  	led = &leds->leds[0];
>  	for_each_available_child_of_node(np, child) {
>  		ret = omnia_led_register(client, led, child);
> -- 
> 2.41.0
> 

-- 
Lee Jones [李琼斯]
