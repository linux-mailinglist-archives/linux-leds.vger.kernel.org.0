Return-Path: <linux-leds+bounces-355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A399D81107B
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 12:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FD4FB20BE8
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 11:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADCD2554F;
	Wed, 13 Dec 2023 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7rMuQG8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034125540
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 11:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7FAC433C8;
	Wed, 13 Dec 2023 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702468068;
	bh=JyyObBeV7lx+piW0vGHGGe7J7czaHg1baDvRFTL1YFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7rMuQG8++rxezs7n/Y9sURdpr7XIY9fEftxwfu1W5eXx4Y+9uZ3CtJyrCwuP9xWJ
	 aE/wcDKQULl2X4+3Kc/UN5ORX+LcVFbaN3Qo10IiJRgrOAODQRfyvKH7St5lgHiOs6
	 ojTwBd9rDcqql2hJSZrhFgKnp5q72PJFJ+Z/Mlb3z08YwvtNXlcKOU2NP811pDxw66
	 PkqMFn+ihwCmUdHaazAMubK69lhReNpD6dT8mWZzRQYdWqFRI+EgDLaTwm6erXOz/e
	 u9JfzsxmjIuNqS6jbqz+tIh3oDPhyjsB1nIb4l+WISuj9zjqGqU5VLzwrrVGan7Jm0
	 EHsZFsoRPpImQ==
Date: Wed, 13 Dec 2023 11:47:44 +0000
From: Lee Jones <lee@kernel.org>
To: Amitesh Singh <singh.amitesh@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] feat(kernel/pca963x): implement power management
Message-ID: <20231213114744.GK111411@google.com>
References: <881c6ba1-1701-41be-a4ac-81cdca5f0eea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <881c6ba1-1701-41be-a4ac-81cdca5f0eea@gmail.com>

On Sun, 10 Dec 2023, Amitesh Singh wrote:

> From a22dbd7390ce875e81d67f14f05f593d7f03d5c1 Mon Sep 17 00:00:00 2001
> From: Amitesh Singh <singh.amitesh@gmail.com>
> Date: Fri, 8 Dec 2023 15:08:33 +0530
> Subject: [PATCH] feat(kernel/pca963x): implement power management

What are you using to send this patch?

Please use the Git tools provided:

  git format-patch
  git send-email

The subject line is also totally incorrect.  Again Git can help:

  git log --oneline -- <subsystem>

Please fix the bot's complaints before re-submitting.

Thank you.

> This implements power management in upstream driver
> for pca9633 which enables device sleep and resume
> on system-wide sleep/hibernation
> 
> Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>
> ---
>  drivers/leds/leds-pca963x.c | 41 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index 47223c850e4b..462f917dc986 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -39,6 +39,7 @@
>  #define PCA963X_LED_PWM		0x2	/* Controlled through PWM */
>  #define PCA963X_LED_GRP_PWM	0x3	/* Controlled through PWM/GRPPWM */
> 
> +#define PCA963X_MODE1_SLEEP     0x04    /* Normal mode or Low Power mode,
> oscillator off */
>  #define PCA963X_MODE2_OUTDRV	0x04	/* Open-drain or totem pole */
>  #define PCA963X_MODE2_INVRT	0x10	/* Normal or inverted direction */
>  #define PCA963X_MODE2_DMBLNK	0x20	/* Enable blinking */
> @@ -380,6 +381,45 @@ static int pca963x_register_leds(struct i2c_client
> *client,
>  	return ret;
>  }
> 
> +#ifdef CONFIG_PM
> +static int pca963x_suspend(struct device *dev)
> +{
> +	struct pca963x *chip;
> +	u8 reg;
> +
> +	chip = dev_get_drvdata(dev);
> +
> +	reg = i2c_smbus_read_byte_data(chip->client, PCA963X_MODE1);
> +	reg = reg | (1 << PCA963X_MODE1_SLEEP);
> +	i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
> +
> +	return 0;
> +}
> +
> +static int pca963x_resume(struct device *dev)
> +{
> +	struct pca963x *chip;
> +	u8 reg;
> +
> +	chip = dev_get_drvdata(dev);
> +
> +	reg = i2c_smbus_read_byte_data(chip->client, PCA963X_MODE1);
> +	reg = reg & ~(1 << PCA963X_MODE1_SLEEP);
> +	i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops pca963x_pmops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pca963x_suspend, pca963x_resume)
> +};
> +
> +#define PCA963X_SMBUS_PMOPS (&pca963x_pmops)
> +
> +#else
> +#define PCA963X_SMBUS_PMOPS NULL
> +#endif
> +
>  static const struct of_device_id of_pca963x_match[] = {
>  	{ .compatible = "nxp,pca9632", },
>  	{ .compatible = "nxp,pca9633", },
> @@ -430,6 +470,7 @@ static struct i2c_driver pca963x_driver = {
>  	.driver = {
>  		.name	= "leds-pca963x",
>  		.of_match_table = of_pca963x_match,
> +		.pm = PCA963X_SMBUS_PMOPS
>  	},
>  	.probe = pca963x_probe,
>  	.id_table = pca963x_id,
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

