Return-Path: <linux-leds+bounces-4119-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C1A4874A
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 19:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7033AC900
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 18:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4091E5212;
	Thu, 27 Feb 2025 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu/pWpvj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62301199239;
	Thu, 27 Feb 2025 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679702; cv=none; b=fX9OWAQWt7uVg1dKlM2W2YGErKnoKP8PSAIZnz15oGYgrDZQtsn4zPqZhi8b541FD2a2FaCtIKopyGS/xP4uywH0eRpr5588Y6FKmAzZDxuv1TJhxYIGFDc7tNu68542V4JIS9ZUMrfZfjF4alDOKQYOn3gGPMbEWCcnLm0Kzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679702; c=relaxed/simple;
	bh=zn6+kaT0qr+KrKSEqCpSvIrTzLNZuK1KwZiw0gaP4cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDeSiM4892wfYfwrDgNepwpRZOBtUK4ydkH4pBUZJdJlQJT4rb/n1nIvzrCg/rEhJZ5BNaKZ+A3kJrkCejL+ew6Ah/oumMmMlqHnVYzZG1/RYKgvXSiw3z5DTMv1+geTBXxG3i5xZxeyPg7QPZsqnCzYc+e4CYMwqcVQcIQSXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu/pWpvj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7B4C4CEDD;
	Thu, 27 Feb 2025 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740679701;
	bh=zn6+kaT0qr+KrKSEqCpSvIrTzLNZuK1KwZiw0gaP4cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fu/pWpvjmYTZmmZWK2jGjOJqhdpINd/1icsNwK7DdUhvJ2Q/z9xwHQXQ76ukgx+KO
	 XGq6Qz3LaQFrabwKM83cfFc7VVsS807sGk+fCIWmLi75tFHab1aH38jvygo57yTUYY
	 3vRaZf7uEesdSIC2hSS3qhm2A18+a/6tA3QzmSv98u2sTC1QlOQ9E1XBDtKeis5faY
	 dB/jXeunjQ6TjYQES0ggZ/JQFOehvph+Qt17+hdi5xtiudHYB3aYPoap4UEXzm08pp
	 OPSXtOLfGm+QngYasUrbYbKL2zLVgcXkfbb5OnfPrOxEpnPWTZEQ0VD42lEL8Rd23N
	 8GPSBW5ZjVbAw==
Date: Thu, 27 Feb 2025 18:08:17 +0000
From: Lee Jones <lee@kernel.org>
To: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
Cc: patrick@stwcx.xyz, Pavel Machek <pavel@kernel.org>,
	MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: cat9532: support cat9532 in pca955x
Message-ID: <20250227180817.GK824852@google.com>
References: <20250224082815.1827487-1-delphine_cc_chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224082815.1827487-1-delphine_cc_chiu@wiwynn.com>

On Mon, 24 Feb 2025, Delphine CC Chiu wrote:

> From: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>
> 
> The CAT9532 chips are almost 100% compatible with PCA9552, except that
> the CAT9532 uses the opposite polarity in register that sets on/off.
> 
> Compare the state at INPUT with the state of LSn and dynamically
> adjust how you program LSn
> 
> Signed-off-by: MarshallZhan <marshall_zhan@wiwynn.com>
> Signed-off-by: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
> ---
>  drivers/leds/leds-pca955x.c | 41 +++++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 94a9f8a54b35..447da4a2d089 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -4,7 +4,7 @@
>   *
>   * Author: Nate Case <ncase@xes-inc.com>
>   *
> - * LED driver for various PCA955x I2C LED drivers
> + * LED driver for various PCA955x and CAT9532 I2C LED drivers
>   *
>   * Supported devices:

You not adding this device to the list of supported devices now?

>   *
> @@ -145,6 +145,11 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
>  		((state & 0x3) << (led_num << 1));
>  }
>  
> +static inline int pca955x_ledstate(u8 ls, int led_num)
> +{
> +	return (ls >> (led_num << 1)) & 0x3;

Please describe what it is you're doing here.

Maybe renaming 'ls' would help.

> +}
> +
>  /*
>   * Write to frequency prescaler register, used to program the
>   * period of the PWM output.  period = (PSCx + 1) / 38
> @@ -235,6 +240,21 @@ static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
>  	return 0;
>  }
>  
> +static int pca955x_read_input_bit(struct pca955x *pca955x, int led_num)
> +{
> +	u8 cmd = led_num / 8;
> +	int input_state;
> +

Comment here.  What information does 'input state' provide?

Why was the 'input state' not required for the PCA9552?

> +	input_state= i2c_smbus_read_byte_data(pca955x->client, cmd);

' ' after input_state.

Doesn't checkpatch.pl usually catch these issues?  Did you run it?

Maybe a function header comment would be better to describe what's
happening here?

> +	if (input_state < 0) {
> +		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", 
> +				__func__, led_num, input_state);
> +		return input_state;
> +	}
> +	return (input_state >> (led_num % 8)) & 1;
> +
> +}
> +
>  static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>  {
>  	struct pca955x_led *pca955x_led = container_of(led_cdev,
> @@ -251,10 +271,11 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>  	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;

Changing all of these magic MOD and AND values to shift / mask defines
would help readability greatly.

>  	switch (ls) {
>  	case PCA955X_LS_LED_ON:
> -		ret = LED_FULL;
> -		break;
>  	case PCA955X_LS_LED_OFF:
> -		ret = LED_OFF;

I requested a comment here in the last version.

> +		if (pca955x_read_input_bit(pca955x, pca955x_led->led_num))
> +			ret = LED_FULL;
> +		else
> +			ret = LED_OFF;
>  		break;
>  	case PCA955X_LS_BLINK0:
>  		ret = LED_HALF;
> @@ -276,6 +297,8 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  	struct pca955x_led *pca955x_led;
>  	struct pca955x *pca955x;
>  	u8 ls;
> +	u8 ls_last_state;
> +	int input_bit;
>  	int chip_ls;	/* which LSx to use (0-3 potentially) */
>  	int ls_led;	/* which set of bits within LSx to use (0-3) */
>  	int ret;
> @@ -292,12 +315,18 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  	if (ret)
>  		goto out;
>  
> +	ls_last_state = pca955x_ledstate(ls, ls_led);
> +	input_bit = pca955x_read_input_bit(pca955x, pca955x_led->led_num);
>  	switch (value) {
>  	case LED_FULL:
> -		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
> +		ls = pca955x_ledsel(ls, ls_led,
> +				(ls_last_state == input_bit) ? 
> +				PCA955X_LS_LED_ON : PCA955X_LS_LED_OFF);
>  		break;
>  	case LED_OFF:
> -		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
> +		ls = pca955x_ledsel(ls, ls_led,
> +				(ls_last_state == input_bit) ? 
> +				PCA955X_LS_LED_OFF : PCA955X_LS_LED_ON);
>  		break;
>  	case LED_HALF:
>  		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]

