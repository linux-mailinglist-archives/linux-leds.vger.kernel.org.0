Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41227808D7
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 11:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353019AbjHRJnU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 05:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351492AbjHRJnC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 05:43:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5193C121
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 02:43:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C70B866EE6
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 09:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428AFC433C7;
        Fri, 18 Aug 2023 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692351779;
        bh=pyhwrkVhOKHUudWPzqnQwR32hSMDtSdohkg8g8i0u78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BfsYemeScy95+YQaFjMUxjeXya6hswZiGGuT4RiM/bYcCPAX7sOchRNjebkdqZAJQ
         f8Vf6jTID5NpVrxfkf1wuMagFC8kv6oh6fOnD3vxZIqGR5IvzmmU7hBbIUl5gezmHk
         NM7wL61v26iYmWzX1ZFL5q2NsAg+kJj3y3RRoTU/10We7fZow6wUAx5/cQUoiHwSty
         IvmPHzgT+QnoJSt9MoNGS9PuCMf6TyIyHEkgcPiq9O9ExQKRmLZoGdZm6ygBuQRoIH
         1kw2tcKJQDOaTc954WIFabrR4veR30AF9XMCuXaZuuw4+J7IVrg5+vNbBnemoELtV0
         PVi6miijvfeSg==
Date:   Fri, 18 Aug 2023 10:42:55 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/6] leds: turris-omnia: make set_brightness() more
 efficient
Message-ID: <20230818094255.GR986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-5-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230802160748.11208-5-kabel@kernel.org>
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

> Implement caching of the LED color and state values that are sent to MCU
> in order to make the set_brightness() operation more efficient by
> avoiding I2C transactions which are not needed.

How many transactions does all of this extra code actually save?

> On Turris Omnia's MCU, which acts as the RGB LED controller, each LED
> has a RGB color, and a ON/OFF state, which are configurable via I2C
> commands CMD_LED_COLOR and CMD_LED_STATE.
> 
> The CMD_LED_COLOR command sends 5 bytes and the CMD_LED_STATE command 2
> bytes over the I2C bus, which operates at 100 kHz. With I2C overhead
> this allows only ~1670 color changing commands and ~3200 state changing
> commands per second.

Only?  Seems like quite a lot.

> Currently, every time LED brightness or LED multi intensity is changed,
> we send a CMD_LED_STATE command, and if the computed color (brightness
> adjusted multi_intensity) is non-zero, we also send a CMD_LED_COLOR
> command.
> 
> Consider for example the situation when we have a netdev trigger enabled
> for a LED. The netdev trigger does not change the LED color, only the
> brightness (either to 0 or to currently configured brightness), and so
> there is no need to send the CMD_LED_COLOR command. But each change of
> brightness to 0 sends one CMD_LED_STATE command, and each change of
> brightness to max_brightness sends one CMD_LED_STATE command and one
> CMD_LED_COLOR command:
>     set_brightness(0)   ->  CMD_LED_STATE
>     set_brightness(255) ->  CMD_LED_STATE + CMD_LED_COLOR
>                                             (unnecessary)
> 
> We can avoid the unnecessary I2C transactions if we cache the values of
> state and color that are sent to the controller. If the color does not
> change from the one previously sent, there is no need to do the
> CMD_LED_COLOR I2C transaction, and if the state does not change, there
> is no need to do the CMD_LED_STATE transaction.
> 
> Because we need to make sure that out cached values are consistent with

Nit: "our"

> the controller state, add explicit setting of the LED color to white at
> probe time (this is the default setting when MCU resets, but does not
> necessarily need to be the case, for example if U-Boot played with the
> LED colors).
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/leds/leds-turris-omnia.c | 96 ++++++++++++++++++++++++++------
>  1 file changed, 78 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 9fca0acb2270..636c6f802bcf 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -30,6 +30,8 @@
>  struct omnia_led {
>  	struct led_classdev_mc mc_cdev;
>  	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
> +	u8 cached_channels[OMNIA_LED_NUM_CHANNELS];
> +	bool on;
>  	int reg;
>  };
>  
> @@ -75,36 +77,82 @@ static int omnia_cmd_read(const struct i2c_client *client, u8 cmd)
>  		return -EIO;
>  }
>  
> +static int omnia_led_send_color_cmd(const struct i2c_client *client,
> +				    struct omnia_led *led)
> +{
> +	char cmd[5];
> +	int ret;
> +
> +	cmd[0] = CMD_LED_COLOR;
> +	cmd[1] = led->reg;
> +	cmd[2] = led->subled_info[0].brightness;
> +	cmd[3] = led->subled_info[1].brightness;
> +	cmd[4] = led->subled_info[2].brightness;
> +
> +	/* send the color change command */

Nit: Please start comments with an upper case char.

> +	ret = i2c_master_send(client, cmd, 5);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* cache the RGB channel brightnesses */
> +	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i)

Why the pre-increment?

It's non-standard and doesn't appear to have any affect.

> +		led->cached_channels[i] = led->subled_info[i].brightness;
> +
> +	return 0;
> +}
> +
> +/* determine if the computed RGB channels are different from the cached ones */
> +static bool omnia_led_channels_changed(struct omnia_led *led)
> +{
> +	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i)
> +		if (led->subled_info[i].brightness != led->cached_channels[i])
> +			return true;
> +
> +	return false;
> +}
> +
>  static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
>  					     enum led_brightness brightness)
>  {
>  	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
>  	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
>  	struct omnia_led *led = to_omnia_led(mc_cdev);
> -	u8 buf[5], state;
> -	int ret;
> +	int err = 0;
>  
>  	mutex_lock(&leds->lock);
>  
> -	led_mc_calc_color_components(&led->mc_cdev, brightness);
> +	/*
> +	 * Only recalculate RGB brightnesses from intensities if brightness is
> +	 * non-zero. Otherwise we won't be using them and we can save ourselves
> +	 * some software divisions (Omnia's CPU does not implement the division
> +	 * instruction).
> +	 */
> +	if (brightness) {
> +		led_mc_calc_color_components(mc_cdev, brightness);
> +
> +		/*
> +		 * Send color command only if brightness is non-zero and the RGB
> +		 * channel brightnesses changed.
> +		 */
> +		if (omnia_led_channels_changed(led))
> +			err = omnia_led_send_color_cmd(leds->client, led);
> +	}
>  
> -	buf[0] = CMD_LED_COLOR;
> -	buf[1] = led->reg;
> -	buf[2] = mc_cdev->subled_info[0].brightness;
> -	buf[3] = mc_cdev->subled_info[1].brightness;
> -	buf[4] = mc_cdev->subled_info[2].brightness;
> +	/* send on/off state change only if (bool)brightness changed */
> +	if (!err && !brightness != !led->on) {
> +		u8 state = CMD_LED_STATE_LED(led->reg);
>  
> -	state = CMD_LED_STATE_LED(led->reg);
> -	if (buf[2] || buf[3] || buf[4])
> -		state |= CMD_LED_STATE_ON;
> +		if (brightness)
> +			state |= CMD_LED_STATE_ON;
>  
> -	ret = omnia_cmd_write(leds->client, CMD_LED_STATE, state);
> -	if (ret >= 0 && (state & CMD_LED_STATE_ON))
> -		ret = i2c_master_send(leds->client, buf, 5);
> +		err = omnia_cmd_write(leds->client, CMD_LED_STATE, state);
> +		if (!err)
> +			led->on = !!brightness;
> +	}
>  
>  	mutex_unlock(&leds->lock);
>  
> -	return ret;
> +	return err;
>  }
>  
>  static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
> @@ -132,11 +180,15 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  	}
>  
>  	led->subled_info[0].color_index = LED_COLOR_ID_RED;
> -	led->subled_info[0].channel = 0;
>  	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> -	led->subled_info[1].channel = 1;
>  	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> -	led->subled_info[2].channel = 2;
> +
> +	/* initial color is white */
> +	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i) {
> +		led->subled_info[i].intensity = 255;
> +		led->subled_info[i].brightness = 255;
> +		led->subled_info[i].channel = i;
> +	}
>  
>  	led->mc_cdev.subled_info = led->subled_info;
>  	led->mc_cdev.num_colors = OMNIA_LED_NUM_CHANNELS;
> @@ -164,6 +216,14 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  		return ret;
>  	}
>  
> +	/* set initial color and cache it */
> +	ret = omnia_led_send_color_cmd(client, led);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot set LED %pOF initial color: %i\n", np,
> +			ret);
> +		return ret;
> +	}
> +
>  	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
>  							&init_data);
>  	if (ret < 0) {
> -- 
> 2.41.0
> 

-- 
Lee Jones [李琼斯]
