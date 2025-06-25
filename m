Return-Path: <linux-leds+bounces-4878-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD13AE7CCD
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 11:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC168172B5D
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A909329C33C;
	Wed, 25 Jun 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1v3gKvl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AA29A323
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843180; cv=none; b=tsc9oro5SkGQFw2OTPpInZS7JD26P7b+CbNJXzlS31Ms8nqNRTL8wCnxivF/AMXeJ4DSMKfnTablep/Aa+kpuZ6jvViNXosh0LlWqmaAGyvuRPhnOQvzumFogEufxw+YN2v5lMOE3IXnqZF7JE9MTfdufsmIJhwX/UA+holwXOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843180; c=relaxed/simple;
	bh=2uwflOVUoGvEOCz/aeWN66HNAdDT7T9GtO4qIXw+pjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orwHiJxzNACUUK3GCtikJkYBhA7gfFsvIkojDo4S741XqmOEovctmbCJJpNp6RhpaPUxKfICil+Wa3CIlZJrZe8FpzVpBqmjt+M7vkq6Wu1ljLpFpaxi/epck7ifhppxeQCU0z4dh+JylVuNcJP3posfIGkqBxvya/tpDFX4Efw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1v3gKvl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB0BC4CEEA;
	Wed, 25 Jun 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750843179;
	bh=2uwflOVUoGvEOCz/aeWN66HNAdDT7T9GtO4qIXw+pjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1v3gKvl/cNL8a9i8Teshx/fk61UqOxAnhJF+29ShI0t/n3kih6/Wnq6aJsN1uLJZ
	 XengDX8aRHGf8VRh9xs8SUKQcGotBJuFFjFEdIHF3vQWfxPfsQ4v6b18c4adIdnGDp
	 7iEyhWPlS2fsezNXEtYXbALO76ZDzugDlAHMVGOWGGy5315g1LkQZQFJ7GFeY98knD
	 NWdi7RfO8OxBk6Z8o37gqBdyuz3vBmVUZhHsTXVKQnhe2FYLCSJ04MgQ021V9dTI96
	 fGxNZB/KlnLLooX64Y/65sZEoul8E6XWdvM25qAFwsrc7Tob/SmhQGeKaGL9Jl4OZv
	 50ZS80SwHDLsw==
Date: Wed, 25 Jun 2025 10:19:35 +0100
From: Lee Jones <lee@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] leds/leds-is31fl32xx: add support for is31fl3236a
Message-ID: <20250625091935.GS795775@google.com>
References: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk>

On Thu, 19 Jun 2025, Pawel Zalewski wrote:

> This commit is adding an additional and optional control
> register for setting the output PWM frequency to 22kHz.
> The default is 3kHz and this option puts the operational
> frequency outside of the audible range. The control over this
> parameter was added via the device tree parser function,
> as really whether to use this functionality or not would
> depend on the board.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/leds/leds-is31fl32xx.c | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 8793330dd414..d23260f3f6ce 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -32,6 +32,8 @@
>  #define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
>  #define IS31FL3216_CONFIG_SSD_DISABLE 0
>  
> +#define IS31FL32XX_PWM_FREQUENCY_22kHz  0x01
> +
>  struct is31fl32xx_priv;
>  struct is31fl32xx_led_data {
>  	struct led_classdev cdev;
> @@ -57,6 +59,7 @@ struct is31fl32xx_priv {
>   * @pwm_registers_reversed: : true if PWM registers count down instead of up
>   * @led_control_register_base : address of first LED control register (optional)
>   * @enable_bits_per_led_control_register: number of LEDs enable bits in each
> + * @output_frequency_setting_register: address of outupt frequency register (optional)
>   * @reset_func          : pointer to reset function
>   * @sw_shutdown_func    : pointer to software shutdown function
>   *
> @@ -80,6 +83,7 @@ struct is31fl32xx_chipdef {
>  	bool	pwm_registers_reversed;
>  	u8	led_control_register_base;
>  	u8	enable_bits_per_led_control_register;
> +	u8	output_frequency_setting_register;
>  	int (*reset_func)(struct is31fl32xx_priv *priv);
>  	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
>  };
> @@ -93,6 +97,19 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
>  	.pwm_register_base			= 0x01,
>  	.led_control_register_base		= 0x26,
>  	.enable_bits_per_led_control_register	= 1,
> +	.output_frequency_setting_register = IS31FL32XX_REG_NONE,

Line up with the others please </ocd_voice>

> +};
> +
> +static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
> +	.channels				= 36,
> +	.shutdown_reg				= 0x00,
> +	.pwm_update_reg				= 0x25,
> +	.global_control_reg			= 0x4a,
> +	.reset_reg				= 0x4f,
> +	.pwm_register_base			= 0x01,
> +	.led_control_register_base		= 0x26,
> +	.enable_bits_per_led_control_register	= 1,
> +	.output_frequency_setting_register = 0x4b,

As above.

>  };
>  
>  static const struct is31fl32xx_chipdef is31fl3235_cdef = {
> @@ -104,6 +121,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
>  	.pwm_register_base			= 0x05,
>  	.led_control_register_base		= 0x2a,
>  	.enable_bits_per_led_control_register	= 1,
> +	.output_frequency_setting_register = IS31FL32XX_REG_NONE,

Here too - and everywhere.

>  };
>  
>  static const struct is31fl32xx_chipdef is31fl3218_cdef = {
> @@ -115,6 +133,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
>  	.pwm_register_base			= 0x01,
>  	.led_control_register_base		= 0x13,
>  	.enable_bits_per_led_control_register	= 6,
> +	.output_frequency_setting_register = IS31FL32XX_REG_NONE,
>  };
>  
>  static int is31fl3216_reset(struct is31fl32xx_priv *priv);
> @@ -130,6 +149,7 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
>  	.pwm_registers_reversed			= true,
>  	.led_control_register_base		= 0x01,
>  	.enable_bits_per_led_control_register	= 8,
> +	.output_frequency_setting_register = IS31FL32XX_REG_NONE,

How do you sleep at night!   =;-)

>  	.reset_func				= is31fl3216_reset,
>  	.sw_shutdown_func			= is31fl3216_software_shutdown,
>  };
> @@ -363,8 +383,21 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
>  static int is31fl32xx_parse_dt(struct device *dev,
>  			       struct is31fl32xx_priv *priv)
>  {
> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
> +	if (of_property_read_bool(dev_of_node(dev), "is31fl32xx,22kHz-pwm")
> +	&& (cdef->output_frequency_setting_register != IS31FL32XX_REG_NONE)) {

Please the '&&' and the end of the previous line, then indent this one.

> +
> +		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_register,
> +							IS31FL32XX_PWM_FREQUENCY_22kHz);

Line-up with the '('.

> +
> +		if (ret) {
> +			dev_err(dev, "Failed to write output pwm frequency register\n");

"PWM"

> +			return ret;
> +		}
> +	}
> +
>  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
>  		struct led_init_data init_data = {};
>  		struct is31fl32xx_led_data *led_data =
> @@ -405,6 +438,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  
>  static const struct of_device_id of_is31fl32xx_match[] = {
>  	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
> +	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
>  	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
>  	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
>  	{ .compatible = "si-en,sn3218",    .data = &is31fl3218_cdef, },
> @@ -466,6 +500,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
>   */
>  static const struct i2c_device_id is31fl32xx_id[] = {
>  	{ "is31fl3236" },
> +	{ "is31fl3236a" },
>  	{ "is31fl3235" },
>  	{ "is31fl3218" },
>  	{ "sn3218" },
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]

