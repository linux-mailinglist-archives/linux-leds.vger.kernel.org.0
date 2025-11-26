Return-Path: <linux-leds+bounces-6320-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB7C8A92F
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 16:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 197873581CB
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B11530F942;
	Wed, 26 Nov 2025 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rpjo/HEO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C730BB84
	for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170048; cv=none; b=Qw4mizFEgljwRQ62EbZjisPy+FkTCMypsqhC8QaLhoL0/NloGfzzXslmyvNy/kowsgfWA4L36LiTgcCMoDqH3E3ibdDL2tJfJYyHZRH8dAcGPkq17U/A75pAYHiHe3I1kb/ggKMeXoX/TnpfI1lC9JPMpyJwjXAFE+hST61axp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170048; c=relaxed/simple;
	bh=PZYdF6QIQdSMI1swSdioBoMdBJTarR2Qx3nBbSVSHMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEHEjdZ1B4/0vqaPafw6Bsa/Qy+n4cXKHbClcebPPL0mOrR29JhZ7Z+I6niuXCPPv+FF/D4FCmD1PBtPcZbu3YfZWWSQjipxKGyXAPQ16gOjqyqrVginIFNWD4BvBkOW3Dy5WhlE5SG1iE/vcKlP5ZXUDfrLLmJiU7RSlNzB0XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rpjo/HEO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3021C4CEF8;
	Wed, 26 Nov 2025 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170047;
	bh=PZYdF6QIQdSMI1swSdioBoMdBJTarR2Qx3nBbSVSHMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rpjo/HEOF2UoBtElrb7NMQYec0ZwSDboECkSGgqNFEsJYms5xCvv7FnPIW2G2KUDV
	 V7QwBe7VqcDZwLQklPtKz4GJN2zz8wjHLrrRlO91IkK6u/Fw6nHpBBr7BzXTcxIORU
	 +uITOx3iFTRcESSO4cILfQrDtWNaVeXuWn3c1vo2HW8n8wosp9VbhF1ZDcu93vwufc
	 7WsM+Bg1cs8qu4bMYCRoq4hqqnTj/obKC/4VQFnHWLfemctpTij7reyk7wZTXruuqh
	 hA67Z7dN9jE/LoseOsa8DU9RDl9UxhxI+7FGX7pyplJQKvyJ3LT+s40/LGwHBw0mmS
	 UC7mgSogYxHuw==
Date: Wed, 26 Nov 2025 15:14:04 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Mack <daniel.mack@holoplot.com>
Cc: linux-leds@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v3 3/3] leds: is31f132xx: add support for is31fl3293
Message-ID: <20251126151404.GG3070764@google.com>
References: <20251121113557.77418-1-daniel.mack@holoplot.com>
 <20251121113557.77418-4-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121113557.77418-4-daniel.mack@holoplot.com>

On Fri, 21 Nov 2025, Daniel Mack wrote:

> From: Daniel Mack <daniel@zonque.org>
> 
> This chip supports 3 LED channels with 4096 possible PWM values.
> 
> Extend the driver to support this variant:
> 
>  * Make brightness steps configurable per device type
>  * Handle dual-register brightness updates
>  * Allow to specify values to write into the PWM update register
>  * Add custom init and shutdown function for 3293 variant
>  * Init registers after parsing DT properties
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
> v1 -> v2: address styling issues
> 
>  drivers/leds/leds-is31fl32xx.c | 137 +++++++++++++++++++++++++++++++--
>  1 file changed, 129 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 388d6a0b6932..05e28257ca4b 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -32,10 +32,25 @@
>  #define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
>  #define IS31FL3216_CONFIG_SSD_DISABLE 0
>  
> +/* Registers for IS31FL3293 */
> +#define IS31FL3293_SHUTDOWN_REG 0x01
> +#define IS31FL3293_SHUTDOWN_SSD_DISABLE  BIT(0)
> +#define IS31FL3293_SHUTDOWN_EN1 BIT(4)
> +#define IS31FL3293_SHUTDOWN_EN2 BIT(5)
> +#define IS31FL3293_SHUTDOWN_EN3 BIT(6)
> +#define IS31FL3293_GCC_REG 0x03
> +#define IS31FL3293_GCC_LEVEL_MAX 0x3f
> +#define IS31FL3293_CL_REG 0x10
> +#define IS31FL3293_COLOR_UPDATE_REG 0x27
> +#define IS31FL3293_COLOR_UPDATE_MAGIC 0xc5
> +#define IS31FL3293_RESET_REG 0x3c
> +#define IS31FL3293_RESET_MAGIC 0xc5
> +
>  struct is31fl32xx_priv;
>  struct is31fl32xx_led_data {
>  	struct led_classdev cdev;
>  	u8 channel; /* 1-based, max priv->cdef->channels */
> +	u32 max_microamp;
>  	struct is31fl32xx_priv *priv;
>  };
>  
> @@ -51,12 +66,14 @@ struct is31fl32xx_priv {
>   * @channels            : Number of LED channels
>   * @shutdown_reg        : address of Shutdown register (optional)
>   * @pwm_update_reg      : address of PWM Update register
> + * @pwm_update_value    : value to write to PWM Update register
>   * @global_control_reg  : address of Global Control register (optional)
>   * @reset_reg           : address of Reset register (optional)
>   * @pwm_register_base   : address of first PWM register
>   * @pwm_registers_reversed: : true if PWM registers count down instead of up
>   * @led_control_register_base : address of first LED control register (optional)
>   * @enable_bits_per_led_control_register: number of LEDs enable bits in each
> + * @brightness_steps    : number of brightness steps supported by the chip
>   * @reset_func          : pointer to reset function
>   * @sw_shutdown_func    : pointer to software shutdown function
>   *
> @@ -74,12 +91,14 @@ struct is31fl32xx_chipdef {
>  	u8	channels;
>  	u8	shutdown_reg;
>  	u8	pwm_update_reg;
> +	u8	pwm_update_value;
>  	u8	global_control_reg;
>  	u8	reset_reg;
>  	u8	pwm_register_base;
>  	bool	pwm_registers_reversed;
>  	u8	led_control_register_base;
>  	u8	enable_bits_per_led_control_register;
> +	u16	brightness_steps;
>  	int (*reset_func)(struct is31fl32xx_priv *priv);
>  	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
>  };
> @@ -148,6 +167,62 @@ static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
>  	return is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, value);
>  }
>  
> +/*
> + * Custom Reset function for IS31FL3293. We need to set the global current limit
> + * and write to the color update register once.
> + */
> +static int is31fl3293_reset(struct is31fl32xx_priv *priv)
> +{
> +	int i, ret;
> +
> +	ret = is31fl32xx_write(priv, IS31FL3293_RESET_REG,
> +			       IS31FL3293_RESET_MAGIC);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the global current limit to maximum */
> +	ret = is31fl32xx_write(priv, IS31FL3293_GCC_REG,
> +			       IS31FL3293_GCC_LEVEL_MAX);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < priv->num_leds; i++) {
> +		struct is31fl32xx_led_data *led_data = &priv->leds[i];
> +		int current_level_reg = IS31FL3293_CL_REG + led_data->channel - 1;
> +		int microamp = max(led_data->max_microamp, 20000);
> +		int current_level = (microamp * 0xff) / 20000;

Nit: Why 20000?  Please define it instead of using magic numbers for things.

-- 
Lee Jones [李琼斯]

