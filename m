Return-Path: <linux-leds+bounces-2047-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD9910A13
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 17:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B089D1C23095
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 15:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB581AF6B7;
	Thu, 20 Jun 2024 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5lC8AtR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA641ACE94;
	Thu, 20 Jun 2024 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718897931; cv=none; b=aN+L5dAaXrr+9J+i8QUmee18hyy0c5c8dPQIWYCLIV2SqHUmnjY4rO7a8NJ1TOb8P8A5dWKss5AhWmdwO8gvSXh2SOJMigwsoRfTyEnlFtEYJ1OMd4O+kvNtucIWq0AjPeaz25YRZqqGUXMkTqPApsAKRVjJ1XfVPGJYG/7577M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718897931; c=relaxed/simple;
	bh=gIGt6nQrz3liDlRiYwAFDqmb/cxCjQJDPRDrDirgIIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+FZYLg5R106zMZH6asYZgYPT0OQPz/LUEXeullMSmkUeS/dCFxFgrdirGoDLleJWVqZXwHAUu7uYgZFVJqsrOgtafQ0F9iwnFzLrHQFsC3QcDlhOM+40/TNlzKXz7qVkadN2mbXV96o5mx6b4qABI3ww+DHE6bL9ltpX2kughA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5lC8AtR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AE2C2BD10;
	Thu, 20 Jun 2024 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718897931;
	bh=gIGt6nQrz3liDlRiYwAFDqmb/cxCjQJDPRDrDirgIIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5lC8AtRacT76ZEG4zMfuEZUKEKTpekECOHpU5MY2I/EZO1QL2vUnvXBcqGV/n1Ac
	 WvclRPE1115f0kXPVsOy0KRv07fTVLr3ptVLBSoaeW2WtfWMz3wAJippdXgvsyQ318
	 kML1endfmYR5n7zy2ZTCutzmR637HsCeGr8T9sJpAeo4FsL+DzgyGTiSB2RZtECxf4
	 8NTZj383zMt/xV0LgbVvnPIX4Y+2LObBFCatwHSLZpoL/D0UHiyN+z9VCOnZ1JjSqy
	 qNVsO3HY+6apV1zIP1hyzPaViP5XdIK4YbuWhjqlUQ4WszJuGpnzPSwJDQK8YgCTDy
	 ycyS48jIwgzJQ==
Date: Thu, 20 Jun 2024 16:38:46 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/20] leds: leds-lp55xx: generalize probe/remove
 functions
Message-ID: <20240620153846.GN3029315@google.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
 <20240616215226.2112-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240616215226.2112-5-ansuelsmth@gmail.com>

On Sun, 16 Jun 2024, Christian Marangi wrote:

> Now that stop_all_engine is generalized, probe and remove function are
> the same across every lp55xx based LED driver and can be generalized.
> 
> To permit to use a common probe, make use of the OF match_data and i2c
> driver_data value to store the device_config struct specific for the
> LED.
> 
> Also drop the now unused exported symbol in lp55xx-common and make them
> static.
> 
> Update any lp55xx based LED driver to use the new generic probe/remove.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/leds/leds-lp5521.c        |  81 +-------------------
>  drivers/leds/leds-lp5523.c        |  85 ++-------------------
>  drivers/leds/leds-lp5562.c        |  80 +------------------
>  drivers/leds/leds-lp55xx-common.c | 123 +++++++++++++++++++++++-------
>  drivers/leds/leds-lp55xx-common.h |  21 +----
>  drivers/leds/leds-lp8501.c        |  81 +-------------------
>  6 files changed, 119 insertions(+), 352 deletions(-)

[...]

> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 2cbc5b302fd4..7e623e4e565c 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -32,6 +32,8 @@
>  /* External clock rate */
>  #define LP55XX_CLK_32K			32768
>  
> +static void lp55xx_deinit_device(struct lp55xx_chip *chip);

No forward declarations please.  Move the function.
> +
>  static struct lp55xx_led *cdev_to_lp55xx_led(struct led_classdev *cdev)
>  {
>  	return container_of(cdev, struct lp55xx_led, cdev);
> @@ -49,7 +51,7 @@ static struct lp55xx_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
>  
>  static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
>  {
> -	struct lp55xx_device_config *cfg = chip->cfg;
> +	const struct lp55xx_device_config *cfg = chip->cfg;
>  	int __always_unused ret;
>  	u8 val;
>  
> @@ -69,7 +71,7 @@ static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
>  
>  void lp55xx_stop_all_engine(struct lp55xx_chip *chip)
>  {
> -	struct lp55xx_device_config *cfg = chip->cfg;
> +	const struct lp55xx_device_config *cfg = chip->cfg;
>  
>  	lp55xx_write(chip, cfg->reg_op_mode.addr, LP55xx_MODE_DISABLE_ALL_ENG);
>  	lp55xx_wait_opmode_done(chip);
> @@ -78,7 +80,7 @@ EXPORT_SYMBOL_GPL(lp55xx_stop_all_engine);
>  
>  static void lp55xx_reset_device(struct lp55xx_chip *chip)
>  {
> -	struct lp55xx_device_config *cfg = chip->cfg;
> +	const struct lp55xx_device_config *cfg = chip->cfg;
>  	u8 addr = cfg->reset.addr;
>  	u8 val  = cfg->reset.val;
>  
> @@ -88,7 +90,7 @@ static void lp55xx_reset_device(struct lp55xx_chip *chip)
>  
>  static int lp55xx_detect_device(struct lp55xx_chip *chip)
>  {
> -	struct lp55xx_device_config *cfg = chip->cfg;
> +	const struct lp55xx_device_config *cfg = chip->cfg;
>  	u8 addr = cfg->enable.addr;
>  	u8 val  = cfg->enable.val;
>  	int ret;
> @@ -111,7 +113,7 @@ static int lp55xx_detect_device(struct lp55xx_chip *chip)
>  
>  static int lp55xx_post_init_device(struct lp55xx_chip *chip)
>  {
> -	struct lp55xx_device_config *cfg = chip->cfg;
> +	const struct lp55xx_device_config *cfg = chip->cfg;
>  
>  	if (!cfg->post_init_device)
>  		return 0;
> @@ -176,7 +178,7 @@ static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
>  {
>  	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
>  	struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
> -	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	const struct lp55xx_device_config *cfg = led->chip->cfg;
>  
>  	led_mc_calc_color_components(&led->mc_cdev, brightness);
>  	return cfg->multicolor_brightness_fn(led);
> @@ -187,7 +189,7 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
>  			     enum led_brightness brightness)
>  {
>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
> -	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	const struct lp55xx_device_config *cfg = led->chip->cfg;
>  
>  	led->brightness = (u8)brightness;
>  	return cfg->brightness_fn(led);
> @@ -197,7 +199,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>  			struct lp55xx_chip *chip, int chan)
>  {
>  	struct lp55xx_platform_data *pdata = chip->pdata;
> -	struct lp55xx_device_config *cfg = chip->cfg;
> +	const struct lp55xx_device_config *cfg = chip->cfg;
>  	struct device *dev = &chip->cl->dev;
>  	int max_channel = cfg->max_channel;
>  	struct mc_subled *mc_led_info;
> @@ -459,10 +461,10 @@ bool lp55xx_is_extclk_used(struct lp55xx_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_is_extclk_used);
>  
> -int lp55xx_init_device(struct lp55xx_chip *chip)
> +static int lp55xx_init_device(struct lp55xx_chip *chip)
>  {
>  	struct lp55xx_platform_data *pdata;
> -	struct lp55xx_device_config *cfg;
> +	const struct lp55xx_device_config *cfg;
>  	struct device *dev = &chip->cl->dev;
>  	int ret = 0;
>  
> @@ -512,9 +514,8 @@ int lp55xx_init_device(struct lp55xx_chip *chip)
>  err:
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(lp55xx_init_device);
>  
> -void lp55xx_deinit_device(struct lp55xx_chip *chip)
> +static void lp55xx_deinit_device(struct lp55xx_chip *chip)
>  {
>  	struct lp55xx_platform_data *pdata = chip->pdata;
>  
> @@ -524,12 +525,11 @@ void lp55xx_deinit_device(struct lp55xx_chip *chip)
>  	if (pdata->enable_gpiod)
>  		gpiod_set_value(pdata->enable_gpiod, 0);
>  }
> -EXPORT_SYMBOL_GPL(lp55xx_deinit_device);

-- 
Lee Jones [李琼斯]

