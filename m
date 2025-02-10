Return-Path: <linux-leds+bounces-3913-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFBA2F57B
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 18:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B28A3A20C3
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA762500DA;
	Mon, 10 Feb 2025 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5nT1Fzp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC52500BA
	for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2025 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209385; cv=none; b=DtYxzJx8L34XiHOC1xIZMl2H4bEGZ57FJBNf4wcGg7UHzay/1pqhcygoC3JYZWY7CW4VcVoPB/d/RUa/JsfDswOJak/aGyKP040ZRNbFxkhDCyCld+AJUaVUrnbbPl5ca6YcR7P+z5v6vba5chZWXyaIjdxo8Gks0qB8BqV4u4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209385; c=relaxed/simple;
	bh=HH4XCexv+kI7P+JsZyfiHPEoAacfd9ubqQLxj43+H4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDUCqdHHC7ld51c0XhjkA/GepZVFxNghpCf+V3khqHx4jK/17u4O0CeitxN5r2IMF7z35KOdJTSS8JflNTjLJyeiNIsjkzbwIETNwR/blcdphwJa18bWIAdIkCsMr7uEtbfQcHCs9y1MAz36BRk2UdOCA6CWGoBXvNJnKBdBuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5nT1Fzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937CBC4CED1;
	Mon, 10 Feb 2025 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739209384;
	bh=HH4XCexv+kI7P+JsZyfiHPEoAacfd9ubqQLxj43+H4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5nT1Fzp/bDJyUuX1DYkZku7on2qpeOiRIQn+B1Icf7JQ+DXpGAiLUWrRljn2S7LX
	 AYWMSqG6y7gSZAwZ7qmRBdfUnSvl0tGFjSFhDjdSvYAVnPjBTzZbnuZsDvl3oYrvnM
	 8jzTon5aFl5ociJTRyPAh4IbqpFDBdgvTPovrSa4UPym8ru5szVfMQoyhFrnx0xd9t
	 AaAyqT1/hlPDOWhzfa02BYmjyGOlbbjlz4iOSBCAEFC7yvukzP8fRa5SHM6RExMC5N
	 cDwnjzW5/qU4HMXejazSVUPOJ0nLFwERxvl1/sVT3ZlWxd/GZr6dSPC+YsiOvMe6MP
	 Dn0iJs87fnbDA==
Date: Mon, 10 Feb 2025 17:43:00 +0000
From: Lee Jones <lee@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz, andy.shevchenko@gmail.com
Subject: Re: [PATCH v7 RESEND 3/4] leds: pca955x: Optimize probe led selection
Message-ID: <20250210174300.GJ1868108@google.com>
References: <20250130201246.292079-1-eajames@linux.ibm.com>
 <20250130201246.292079-4-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130201246.292079-4-eajames@linux.ibm.com>

On Thu, 30 Jan 2025, Eddie James wrote:

> Previously, the probe function might do up to 32 reads and writes
> to the same 4 registers to program the led selection. Reduce this to
> a maximum of 5 operations by accumulating the changes to the led
> selection and comparing with the previous value to write the
> selection if different.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/leds/leds-pca955x.c | 38 +++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 4990f8aff6d16..8bdebc14ea2e6 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -446,7 +446,9 @@ static int pca955x_probe(struct i2c_client *client)
>  	struct led_classdev *led;
>  	struct led_init_data init_data;
>  	struct i2c_adapter *adapter;
> -	int i, err;
> +	int i, bit, err, nls, reg;
> +	u8 ls1[4];
> +	u8 ls2[4];
>  	struct pca955x_platform_data *pdata;
>  	bool set_default_label = false;
>  	bool keep_pwm = false;
> @@ -504,6 +506,17 @@ static int pca955x_probe(struct i2c_client *client)
>  	init_data.devname_mandatory = false;
>  	init_data.devicename = "pca955x";
>  
> +	nls = pca955x_num_led_regs(chip->bits);
> +	/* use auto-increment feature to read all the led selectors at once */

Sentences / comment should start with an upper-case char.

And acronyms should be capitalised too, so it's "LED".

> +	err = i2c_smbus_read_i2c_block_data(client,
> +					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
> +					    ls1);
> +	if (err < 0)
> +		return err;
> +
> +	for (i = 0; i < nls; ++i)

Why the need to pre-increment?  Can you rejig this to be more consistent
with the way we usually format for loops please?

> +		ls2[i] = ls1[i];
> +
>  	for (i = 0; i < chip->bits; i++) {
>  		pca955x_led = &pca955x->leds[i];
>  		pca955x_led->led_num = i;
> @@ -515,19 +528,16 @@ static int pca955x_probe(struct i2c_client *client)
>  		case PCA955X_TYPE_GPIO:
>  			break;
>  		case PCA955X_TYPE_LED:
> +			bit = i % 4;
> +			reg = i / 4;
>  			led = &pca955x_led->led_cdev;
>  			led->brightness_set_blocking = pca955x_led_set;
>  			led->brightness_get = pca955x_led_get;
>  
> -			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF) {
> -				err = pca955x_led_set(led, LED_OFF);
> -				if (err)
> -					return err;
> -			} else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON) {
> -				err = pca955x_led_set(led, LED_FULL);
> -				if (err)
> -					return err;
> -			}
> +			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
> +				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
> +			else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
> +				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
>  
>  			init_data.fwnode = pdata->leds[i].fwnode;
>  
> @@ -571,6 +581,14 @@ static int pca955x_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	for (i = 0; i < nls; ++i) {

As above.

> +		if (ls1[i] != ls2[i]) {
> +			err = pca955x_write_ls(pca955x, i, ls2[i]);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
>  	/* PWM0 is used for half brightness or 50% duty cycle */
>  	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
>  	if (err)
> -- 
> 2.43.5
> 

-- 
Lee Jones [李琼斯]

