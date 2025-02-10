Return-Path: <linux-leds+bounces-3914-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95038A2F5E5
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 18:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7C63AAD35
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5B125B671;
	Mon, 10 Feb 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwBH/Msf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A425B666
	for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209822; cv=none; b=D/6Dmre2LyGiS1H1sBlGwsqhI4BLtufPw6WkA1CDhlr4ADPOfyypf8uzzubdwresqiyUann4/Pq+ZqBX53jDLciP2VU0eH3807lncAVixTGIvFbN/XnLqZmxde2BFJFQfYFmjmzM7MqGpA2Pb8WebWQJJZFXuTAqQrv1W5JBdZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209822; c=relaxed/simple;
	bh=wJ2SIaWlf+Vap8txo2rURVZVyWy/eL59Y8XB7zWBgis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hpgt8zx0+btL932VVnAuqHP8HQIaBYXaw4zyG+Jj+Nk0TK1E0dYIEqJ21AvPSERLMo2Mc/CUh9rqQk5YXfezg0QZcDUipXD3r7Zzr65kqn8N559cNYuAEKVP1QB+MQayU/5EyKtjOvrEiQZFyCjSPonE4ECuwzIAwBX3MBnWd48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwBH/Msf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF716C4CED1;
	Mon, 10 Feb 2025 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739209822;
	bh=wJ2SIaWlf+Vap8txo2rURVZVyWy/eL59Y8XB7zWBgis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwBH/Msf2XJoe2mfARNhj8H2DQ3KK2meGDbL1Q4/SxdKKoZ8oJEWOP8kV5Fh8qFdg
	 h7Zm1ePa3H4RD4QAXV9kcqCyhH8eAq+MIKYOOsc4h4ODzZnAl2PRwzKIzdAmio9q5a
	 nvMQFAZaETpMGOAPolHGBKpqCVYyY+dRFKGYZbyy/gmo0w5c7QBF1ywklOc7/F+fOp
	 4VckV/JGdmVpHxESK7u0ekNcG7qByrp31w8SR3FszdpdxJdvHu4oelG/vA8f4FddUh
	 6hrRgCuYr3VkHmRCNP+FBiZ3E3OjhfU/SPqO49xcAW+lXDAOz9ZjbGgV/zm4KB5cQ3
	 9fkgrOZO1iPWw==
Date: Mon, 10 Feb 2025 17:50:19 +0000
From: Lee Jones <lee@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz, andy.shevchenko@gmail.com
Subject: Re: [PATCH v7 RESEND 4/4] leds: pca955x: Add HW blink support
Message-ID: <20250210175019.GK1868108@google.com>
References: <20250130201246.292079-1-eajames@linux.ibm.com>
 <20250130201246.292079-5-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130201246.292079-5-eajames@linux.ibm.com>

On Thu, 30 Jan 2025, Eddie James wrote:

> Support blinking using the PCA955x chip. Use PWM0 for blinking
> instead of LED_HALF brightness. Since there is only one frequency
> and brightness register for any blinking LED, track the blink state
> of each LED and only support one HW blinking frequency. If another
> frequency is requested, fallback to software blinking. In addition,
> blinked LEDs can only use full brightness in order to maintain 50%
> duty cycle, which is required for the specified blink rate.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/leds/leds-pca955x.c | 221 +++++++++++++++++++++++++++---------
>  1 file changed, 169 insertions(+), 52 deletions(-)

Just a couple of nits.

> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 8bdebc14ea2e6..6e0e9deecb4a6 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -62,6 +62,8 @@
>  #define PCA955X_GPIO_HIGH	LED_OFF
>  #define PCA955X_GPIO_LOW	LED_FULL
>  
> +#define PCA955X_BLINK_DEFAULT_MS	1000
> +
>  enum pca955x_type {
>  	pca9550,
>  	pca9551,
> @@ -74,6 +76,7 @@ struct pca955x_chipdef {
>  	int			bits;
>  	u8			slv_addr;	/* 7-bit slave address mask */
>  	int			slv_addr_shift;	/* Number of bits to ignore */
> +	int			blink_div;	/* PSC divider */
>  };
>  
>  static const struct pca955x_chipdef pca955x_chipdefs[] = {
> @@ -81,26 +84,31 @@ static const struct pca955x_chipdef pca955x_chipdefs[] = {
>  		.bits		= 2,
>  		.slv_addr	= /* 110000x */ 0x60,
>  		.slv_addr_shift	= 1,
> +		.blink_div	= 44,
>  	},
>  	[pca9551] = {
>  		.bits		= 8,
>  		.slv_addr	= /* 1100xxx */ 0x60,
>  		.slv_addr_shift	= 3,
> +		.blink_div	= 38,
>  	},
>  	[pca9552] = {
>  		.bits		= 16,
>  		.slv_addr	= /* 1100xxx */ 0x60,
>  		.slv_addr_shift	= 3,
> +		.blink_div	= 44,
>  	},
>  	[ibm_pca9552] = {
>  		.bits		= 16,
>  		.slv_addr	= /* 0110xxx */ 0x30,
>  		.slv_addr_shift	= 3,
> +		.blink_div	= 44,
>  	},
>  	[pca9553] = {
>  		.bits		= 4,
>  		.slv_addr	= /* 110001x */ 0x62,
>  		.slv_addr_shift	= 1,
> +		.blink_div	= 44,
>  	},
>  };
>  
> @@ -109,7 +117,9 @@ struct pca955x {
>  	struct pca955x_led *leds;
>  	const struct pca955x_chipdef	*chipdef;
>  	struct i2c_client	*client;
> +	unsigned long active_blink;
>  	unsigned long active_pins;
> +	unsigned long blink_period;
>  #ifdef CONFIG_LEDS_PCA955X_GPIO
>  	struct gpio_chip gpio;
>  #endif
> @@ -154,7 +164,8 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
>  
>  /*
>   * Write to frequency prescaler register, used to program the
> - * period of the PWM output.  period = (PSCx + 1) / 38
> + * period of the PWM output.  period = (PSCx + 1) / coeff
> + * Where for pca9551 chips coeff = 38 and for all other chips coeff = 44
>   */
>  static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
>  {
> @@ -235,6 +246,20 @@ static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
>  	return 0;
>  }
>  
> +static int pca955x_read_psc(struct pca955x *pca955x, int n, u8 *val)
> +{
> +	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);

I'd rather you didn't initialise with a complex function call like this.

Please call that function after the allocation block in this case.

> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
> +	if (ret < 0) {
> +		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
> +		return ret;
> +	}
> +	*val = (u8)ret;
> +	return 0;
> +}
> +
>  static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>  {
>  	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
> @@ -248,14 +273,12 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>  
>  	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
>  	case PCA955X_LS_LED_ON:
> +	case PCA955X_LS_BLINK0:
>  		ret = LED_FULL;
>  		break;
>  	case PCA955X_LS_LED_OFF:
>  		ret = LED_OFF;
>  		break;
> -	case PCA955X_LS_BLINK0:
> -		ret = LED_HALF;
> -		break;
>  	case PCA955X_LS_BLINK1:
>  		ret = pca955x_read_pwm(pca955x, 1, &pwm);
>  		if (ret)
> @@ -283,29 +306,36 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  	if (ret)
>  		goto out;
>  
> -	switch (value) {
> -	case LED_FULL:
> -		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
> -		break;
> -	case LED_OFF:
> -		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
> -		break;
> -	case LED_HALF:
> -		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
> -		break;
> -	default:
> -		/*
> -		 * Use PWM1 for all other values.  This has the unwanted
> -		 * side effect of making all LEDs on the chip share the
> -		 * same brightness level if set to a value other than
> -		 * OFF, HALF, or FULL.  But, this is probably better than
> -		 * just turning off for all other values.
> -		 */
> -		ret = pca955x_write_pwm(pca955x, 1, 255 - value);
> -		if (ret)
> +	if (test_bit(pca955x_led->led_num, &pca955x->active_blink)) {
> +		if (value == LED_OFF) {
> +			clear_bit(pca955x_led->led_num, &pca955x->active_blink);
> +			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
> +		} else {
> +			/* No variable brightness for blinking LEDs */
>  			goto out;
> -		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
> -		break;
> +		}
> +	} else {
> +		switch (value) {
> +		case LED_FULL:
> +			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
> +			break;
> +		case LED_OFF:
> +			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
> +			break;
> +		default:
> +			/*
> +			 * Use PWM1 for all other values. This has the unwanted
> +			 * side effect of making all LEDs on the chip share the
> +			 * same brightness level if set to a value other than
> +			 * OFF or FULL. But, this is probably better than just
> +			 * turning off for all other values.
> +			 */
> +			ret = pca955x_write_pwm(pca955x, 1, 255 - value);
> +			if (ret)
> +				goto out;
> +			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
> +			break;
> +		}
>  	}
>  
>  	ret = pca955x_write_ls(pca955x, reg, ls);
> @@ -316,6 +346,102 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  	return ret;
>  }
>  
> +static u8 pca955x_period_to_psc(struct pca955x *pca955x, unsigned long p)
> +{
> +	p *= pca955x->chipdef->blink_div;
> +	p /= MSEC_PER_SEC;
> +	p -= 1;

These functions could do with a comment or two.

> +
> +	return p;
> +}
> +
> +static unsigned long pca955x_psc_to_period(struct pca955x *pca955x, u8 psc)
> +{
> +	unsigned long p = psc;
> +
> +	p += 1;
> +	p *= MSEC_PER_SEC;
> +	p /= pca955x->chipdef->blink_div;
> +
> +	return p;
> +}
> +
> +static int pca955x_led_blink(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
> +	struct pca955x *pca955x = pca955x_led->pca955x;
> +	unsigned long p = *delay_on + *delay_off;

'p' is not a good name for a variable.

If this is 'period' please call it that instead.

> +	int ret = 0;
> +
> +	mutex_lock(&pca955x->lock);
> +
> +	if (p) {
> +		if (*delay_on != *delay_off) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (p < pca955x_psc_to_period(pca955x, 0) ||
> +		    p > pca955x_psc_to_period(pca955x, 0xff)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +	} else {
> +		p = pca955x->active_blink ? pca955x->blink_period :
> +			PCA955X_BLINK_DEFAULT_MS;
> +	}
> +
> +	if (!pca955x->active_blink ||
> +	    pca955x->active_blink == BIT(pca955x_led->led_num) ||
> +	    pca955x->blink_period == p) {
> +		u8 psc = pca955x_period_to_psc(pca955x, p);
> +
> +		if (!test_and_set_bit(pca955x_led->led_num,
> +				      &pca955x->active_blink)) {
> +			u8 ls;
> +			int reg = pca955x_led->led_num / 4;
> +			int bit = pca955x_led->led_num % 4;
> +
> +			ret = pca955x_read_ls(pca955x, reg, &ls);
> +			if (ret)
> +				goto out;
> +
> +			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
> +			ret = pca955x_write_ls(pca955x, reg, ls);
> +			if (ret)
> +				goto out;
> +
> +			/*
> +			 * Force 50% duty cycle to maintain the specified
> +			 * blink rate.
> +			 */
> +			ret = pca955x_write_pwm(pca955x, 0, 128);
> +			if (ret)
> +				goto out;
> +		}
> +
> +		if (pca955x->blink_period != p) {
> +			pca955x->blink_period = p;
> +			ret = pca955x_write_psc(pca955x, 0, psc);
> +			if (ret)
> +				goto out;
> +		}
> +
> +		p = pca955x_psc_to_period(pca955x, psc);
> +		p /= 2;
> +		*delay_on = p;
> +		*delay_off = p;
> +	} else {
> +		ret = -EBUSY;
> +	}
> +
> +out:
> +	mutex_unlock(&pca955x->lock);
> +
> +	return ret;
> +}
> +
>  #ifdef CONFIG_LEDS_PCA955X_GPIO
>  /*
>   * Read the INPUT register, which contains the state of LEDs.
> @@ -450,8 +576,9 @@ static int pca955x_probe(struct i2c_client *client)
>  	u8 ls1[4];
>  	u8 ls2[4];
>  	struct pca955x_platform_data *pdata;
> +	u8 psc0;
> +	bool keep_psc0 = false;
>  	bool set_default_label = false;
> -	bool keep_pwm = false;
>  	char default_label[8];
>  
>  	chip = i2c_get_match_data(client);
> @@ -502,6 +629,7 @@ static int pca955x_probe(struct i2c_client *client)
>  	mutex_init(&pca955x->lock);
>  	pca955x->client = client;
>  	pca955x->chipdef = chip;
> +	pca955x->blink_period = PCA955X_BLINK_DEFAULT_MS;
>  
>  	init_data.devname_mandatory = false;
>  	init_data.devicename = "pca955x";
> @@ -533,11 +661,16 @@ static int pca955x_probe(struct i2c_client *client)
>  			led = &pca955x_led->led_cdev;
>  			led->brightness_set_blocking = pca955x_led_set;
>  			led->brightness_get = pca955x_led_get;
> +			led->blink_set = pca955x_led_blink;
>  
>  			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
>  				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
>  			else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
>  				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
> +			else if (pca955x_ledstate(ls2[reg], bit) == PCA955X_LS_BLINK0) {
> +				keep_psc0 = true;
> +				set_bit(i, &pca955x->active_blink);
> +			}
>  
>  			init_data.fwnode = pdata->leds[i].fwnode;
>  
> @@ -565,19 +698,6 @@ static int pca955x_probe(struct i2c_client *client)
>  				return err;
>  
>  			set_bit(i, &pca955x->active_pins);
> -
> -			/*
> -			 * For default-state == "keep", let the core update the
> -			 * brightness from the hardware, then check the
> -			 * brightness to see if it's using PWM1. If so, PWM1
> -			 * should not be written below.
> -			 */
> -			if (pdata->leds[i].default_state == LEDS_DEFSTATE_KEEP) {
> -				if (led->brightness != LED_FULL &&
> -				    led->brightness != LED_OFF &&
> -				    led->brightness != LED_HALF)
> -					keep_pwm = true;
> -			}
>  		}
>  	}
>  
> @@ -589,22 +709,19 @@ static int pca955x_probe(struct i2c_client *client)
>  		}
>  	}
>  
> -	/* PWM0 is used for half brightness or 50% duty cycle */
> -	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
> -	if (err)
> -		return err;
> -
> -	if (!keep_pwm) {
> -		/* PWM1 is used for variable brightness, default to OFF */
> -		err = pca955x_write_pwm(pca955x, 1, 0);
> -		if (err)
> -			return err;
> +	if (keep_psc0) {
> +		err = pca955x_read_psc(pca955x, 0, &psc0);
> +	} else {
> +		psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
> +		err = pca955x_write_psc(pca955x, 0, psc0);
>  	}
>  
> -	/* Set to fast frequency so we do not see flashing */
> -	err = pca955x_write_psc(pca955x, 0, 0);
>  	if (err)
>  		return err;
> +
> +	pca955x->blink_period = pca955x_psc_to_period(pca955x, psc0);
> +
> +	/* Set PWM1 to fast frequency so we do not see flashing */
>  	err = pca955x_write_psc(pca955x, 1, 0);
>  	if (err)
>  		return err;
> -- 
> 2.43.5
> 

-- 
Lee Jones [李琼斯]

