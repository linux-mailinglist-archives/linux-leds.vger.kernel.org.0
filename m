Return-Path: <linux-leds+bounces-1770-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1758D64F4
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0261C2113C
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE37057C8E;
	Fri, 31 May 2024 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy7AMLdQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616256773;
	Fri, 31 May 2024 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717167327; cv=none; b=OJcoawKSpS7MGBabThu7YbpmrLMxanNwaQT0KfVvmm/K9hkvOMUoLNttDqPAMHG6bIKOjnUDcWBgPd5wnuJP9SeWYDJFpJcPmnPYrCPII3v/R+JLBGvV85GdEPoq1VHL83TzF52hXjKLQiwWEwf20fPgdcOhSuWju+LL0X/dmnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717167327; c=relaxed/simple;
	bh=H9n4gjwEhp25bKgIVaVsaRAwxRosEDCSFaZ2Ap1cPlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6hTuP7uH/XYcyI3suAm7/lrp6hMFleDmZ3APtAF+Vunp0f2/ExN31UA5b9tj2wLLhR+9iRDKwE2ivH3B8BJtu5DHJR8tWgbWXVh9DRHUJkevmdICm6e+o/MeF4AhiH71V7bjTdFm0qwS2li4m8B7nD+gHxRUHad30qUBRAyk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy7AMLdQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB94C116B1;
	Fri, 31 May 2024 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167327;
	bh=H9n4gjwEhp25bKgIVaVsaRAwxRosEDCSFaZ2Ap1cPlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cy7AMLdQpvEKFMPmis7uy1qJrWIgUPWJZWEEdrWD87UW+sePZLnD6ok0GNvzpwOzg
	 1k7HkQG2SYyHwmviCdtaHgP7FU06zdHFQApA9fOXCsHC7JB/QlIVCCTpG/1f49NJwG
	 cJuf29N08uyDBZez9Xe6sGNLUgUmmd8N50GyGUzjemc98iGjAAn6rdGyZVF/aNvV5d
	 dFWAv0SZXGqo5ILhtSXQ9ayvpZpyekuHh48FFMNCiO0x7Wxax1L5XaFQXTjpt3UVG6
	 RfFzLSKLdEPzIE0T5l9jbe3Thg41XG8tCMFVrLP+GLZcUeXDpt6TOLKFLfC3rd5pk7
	 kRtzpWMyQ0+PQ==
Date: Fri, 31 May 2024 15:55:23 +0100
From: Lee Jones <lee@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com, christophercordahi@nanometrics.ca
Subject: Re: [PATCH 1/3] leds: pca9532: Use PWM1 for hardware blinking
Message-ID: <20240531145523.GN1005600@google.com>
References: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
 <20240527125940.155260-2-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527125940.155260-2-bastien.curutchet@bootlin.com>

On Mon, 27 May 2024, Bastien Curutchet wrote:

> PSC0/PWM0 are used by all leds for brightness and blinking. This causes

LEDs everywhere please.

> conflicts when you set a brightness of a new led while an other one is
> already using PWM0 for blinking.
> 
> Use PSC1/PWM1 for blinking.
> Check that no other led is already blinking with a different PSC1/PWM1
> configuration to avoid conflict.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  drivers/leds/leds-pca9532.c | 49 ++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index bf8bb8fc007c..c210608ad336 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -191,29 +191,60 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
>  	return err;
>  }
>  
> +static int pca9532_update_hw_blink(struct pca9532_led *led,
> +				   unsigned long delay_on, unsigned long delay_off)
> +{
> +	struct pca9532_data *data = i2c_get_clientdata(led->client);
> +	unsigned int psc;
> +	int i;
> +
> +	/* Look for others leds that already use PWM1 */
> +	for (i = 0; i < data->chip_info->num_leds; i++) {
> +		struct pca9532_led *other = &data->leds[i];
> +
> +		if (other == led)
> +			continue;

Don't bunch things up please - new line here.

> +		if (other->state == PCA9532_PWM1) {
> +			if (other->ldev.blink_delay_on != delay_on ||
> +			    other->ldev.blink_delay_off != delay_off) {
> +				dev_dbg(&led->client->dev,
> +					"HW can handle only one blink configuration at a time\n");
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	psc = ((delay_on + delay_off) * 152 - 1) / 1000;

What are these funny magic numbers?  Define them please.

> +	if (psc > 255) {

And this.

> +		dev_dbg(&led->client->dev, "Blink period too long to be handled by hardware\n");

If you're returning an error, this should be dev_err().

> +		return -EINVAL;
> +	}
> +
> +	data->psc[1] = psc;

Can we define these indexes please?

> +	data->pwm[1] = (delay_on * 255) / (delay_on + delay_off);
> +
> +	return pca9532_setpwm(data->client, 1);
> +}
> +
>  static int pca9532_set_blink(struct led_classdev *led_cdev,
>  	unsigned long *delay_on, unsigned long *delay_off)
>  {
>  	struct pca9532_led *led = ldev_to_led(led_cdev);
>  	struct i2c_client *client = led->client;
> -	int psc;
> -	int err = 0;
> +	struct pca9532_data *data = i2c_get_clientdata(client);

Did you build this with W=1?  This looks unused.

> +	int err;
>  
>  	if (*delay_on == 0 && *delay_off == 0) {
>  		/* led subsystem ask us for a blink rate */
>  		*delay_on = 1000;
>  		*delay_off = 1000;
>  	}
> -	if (*delay_on != *delay_off || *delay_on > 1690 || *delay_on < 6)
> -		return -EINVAL;
>  
> -	/* Thecus specific: only use PSC/PWM 0 */
> -	psc = (*delay_on * 152-1)/1000;
> -	err = pca9532_calcpwm(client, 0, psc, led_cdev->brightness);
> +	led->state = PCA9532_PWM1;
> +	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
>  	if (err)
>  		return err;
> -	if (led->state == PCA9532_PWM0)
> -		pca9532_setpwm(led->client, 0);
> +
>  	pca9532_setled(led);
>  
>  	return 0;
> -- 
> 2.44.0
> 

-- 
Lee Jones [李琼斯]

