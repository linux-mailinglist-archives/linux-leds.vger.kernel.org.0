Return-Path: <linux-leds+bounces-4965-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD38AF5E76
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 18:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 555AD7A24F2
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 16:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7402F85E6;
	Wed,  2 Jul 2025 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzXyF+ug"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9B12F4A03;
	Wed,  2 Jul 2025 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473355; cv=none; b=gDa6fwVAix4p/8MVBMjw/KyCAu87d4RpefI/QE77TjozCJv7B/1O9ET1weeV3leqT3RlkCoAM7wfzhrXILsph+zlXFDjVtHDhHd3ZP9VnZJoO9U06o2zfWV0LyqKOjX/4r8cjsOJzHdm2FaihOY1ATRiqagYR9tZda9BEgqFVOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473355; c=relaxed/simple;
	bh=Yn6tir8J9XvdPDtl4xNqq+XlLxtvPSFNpo4nddNGvYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egjGdCBNiJ1p4445bv6OVkLvdWJXEcUovewfV0YdELfynAYgNDqPVW7ZWV/YkIeOXkujHawTajv0TG91htqj15eUon3Z4IaLXFa5JbUuRtBpsIOEYPUSc+WgXhPSyoivc9XuM1PephKZMsFCMF+qoAEGSOkfFxJJ1DF2SPC3bIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzXyF+ug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282D7C4CEE7;
	Wed,  2 Jul 2025 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473355;
	bh=Yn6tir8J9XvdPDtl4xNqq+XlLxtvPSFNpo4nddNGvYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzXyF+ugjPx2nYeN+BwSQa3NpYp2WN6+OZ3AKCcVoCnn7bS942egTZ1DkKrm8liYk
	 lnQ/FKwlLS2xZL76MRjv4YeRp44hCa1fBaZRYzbdu/RNUnR/QSKBlEtQr44JmMb9yg
	 g7gXc8shcTMPbnzTuBhpMr9/tK3PslEoZd18AjK083S/6F/j4EeIZPLIKp6ouHfbx9
	 +rjuxrnCqRLebBvUiMrjxJu/sto3JnucLMw85e8hMtLdCcnWnAGQKXNxp1tU5H1tz7
	 c27RJjR0s/7mgMVgZEADNj34xiOCpmYThxgGlHYwcdtS1eiLUB9MgZ7O3K6FhK6jJ3
	 iwGEQNWSDYONg==
Date: Wed, 2 Jul 2025 17:22:30 +0100
From: Lee Jones <lee@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
Message-ID: <20250702162230.GY10134@google.com>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
 <20250627-leds-is31fl3236a-v2-1-f6ef7495ce65@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627-leds-is31fl3236a-v2-1-f6ef7495ce65@thegoodpenguin.co.uk>

On Fri, 27 Jun 2025, Pawel Zalewski wrote:

> Add an additional and optional control register for setting
> the output PWM frequency to 22kHz. The default is 3kHz and
> this option puts the operational frequency outside of the
> audible range.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/leds/leds-is31fl32xx.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

So close!

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 8793330dd4142f49f15d6ee9d87468c08509859f..b3f25854f97eac0f87c5be762b1d8e3afaaecc21 100644
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
> @@ -53,6 +55,7 @@ struct is31fl32xx_priv {
>   * @pwm_update_reg      : address of PWM Update register
>   * @global_control_reg  : address of Global Control register (optional)
>   * @reset_reg           : address of Reset register (optional)
> + * @output_frequency_setting_reg: address of output frequency register (optional)
>   * @pwm_register_base   : address of first PWM register
>   * @pwm_registers_reversed: : true if PWM registers count down instead of up
>   * @led_control_register_base : address of first LED control register (optional)
> @@ -76,6 +79,7 @@ struct is31fl32xx_chipdef {
>  	u8	pwm_update_reg;
>  	u8	global_control_reg;
>  	u8	reset_reg;
> +	u8	output_frequency_setting_reg;
>  	u8	pwm_register_base;
>  	bool	pwm_registers_reversed;
>  	u8	led_control_register_base;
> @@ -90,6 +94,19 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
>  	.pwm_update_reg				= 0x25,
>  	.global_control_reg			= 0x4a,
>  	.reset_reg				= 0x4f,
> +	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
> +	.pwm_register_base			= 0x01,
> +	.led_control_register_base		= 0x26,
> +	.enable_bits_per_led_control_register	= 1,
> +};
> +
> +static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
> +	.channels				= 36,
> +	.shutdown_reg				= 0x00,
> +	.pwm_update_reg				= 0x25,
> +	.global_control_reg			= 0x4a,
> +	.reset_reg				= 0x4f,
> +	.output_frequency_setting_reg		= 0x4b,
>  	.pwm_register_base			= 0x01,
>  	.led_control_register_base		= 0x26,
>  	.enable_bits_per_led_control_register	= 1,
> @@ -101,6 +118,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
>  	.pwm_update_reg				= 0x25,
>  	.global_control_reg			= 0x4a,
>  	.reset_reg				= 0x4f,
> +	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
>  	.pwm_register_base			= 0x05,
>  	.led_control_register_base		= 0x2a,
>  	.enable_bits_per_led_control_register	= 1,
> @@ -112,6 +130,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
>  	.pwm_update_reg				= 0x16,
>  	.global_control_reg			= IS31FL32XX_REG_NONE,
>  	.reset_reg				= 0x17,
> +	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
>  	.pwm_register_base			= 0x01,
>  	.led_control_register_base		= 0x13,
>  	.enable_bits_per_led_control_register	= 6,
> @@ -126,6 +145,7 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
>  	.pwm_update_reg				= 0xB0,
>  	.global_control_reg			= IS31FL32XX_REG_NONE,
>  	.reset_reg				= IS31FL32XX_REG_NONE,
> +	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
>  	.pwm_register_base			= 0x10,
>  	.pwm_registers_reversed			= true,
>  	.led_control_register_base		= 0x01,
> @@ -363,8 +383,21 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
>  static int is31fl32xx_parse_dt(struct device *dev,
>  			       struct is31fl32xx_priv *priv)
>  {
> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
> +	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> +	of_property_read_bool(dev_of_node(dev), "issi,22kHz-pwm")) {

This needs tabbing in.

> +
> +		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> +					IS31FL32XX_PWM_FREQUENCY_22kHz);
> +

This should line-up with the '(.

> +		if (ret) {
> +			dev_err(dev, "Failed to write output PWM frequency register\n");
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
> 
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

