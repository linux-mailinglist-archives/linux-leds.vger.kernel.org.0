Return-Path: <linux-leds+bounces-8329-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCgLEeAMF2oR2gcAu9opvQ
	(envelope-from <linux-leds+bounces-8329-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 17:25:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B55645E6D51
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 17:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C95D3114512
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 15:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E7C3C4579;
	Wed, 27 May 2026 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mk9fyaRP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E103783B0;
	Wed, 27 May 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895175; cv=none; b=rYtuR25YPuTNJdLULE87blte3QXN73GYA3Oy5w6RDnWK2Tv/2nwhD/G7aJUyYUqvGGPMbYenrN5tgpObpVr1obJjplKbPYMeM9BVejqdxuOdA1VFnkzdlJit+WZGf2beB8Zc0PYLSwemUECefNRsVDB/tV6BttNgnp8AcksbSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895175; c=relaxed/simple;
	bh=H0Z12nZagKhkkLz1vGrPL/qTGoHtCMhHyoXtCaStVkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSEATTRuTC2+K0UUs9ghZGf+ekBhtvAj3SpblhRjozPnAIYQR4XCsXKS5d43w8ysp9Zqz4KoXCPW3MLZnbmDqzAc9dLyLrhuKdSNhvkgZ1vx//DViGY9QH/VzUeB/1SRAgKI6f1gDxetlL1/d7wcm10cj7CBttnvOoknaXz1K0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mk9fyaRP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D011F000E9;
	Wed, 27 May 2026 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779895173;
	bh=S61TVoA9RCpVNWgGfCv8NungB4DHHFRPSuDcKMBqL/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mk9fyaRPQUmYBbQEedVrmKNSHF4rVq/0ZwX861fJy03Oevy78CYUSPmD4KPRrQbfk
	 crOieSwR97rB76cMCMFmvkNv6eMmP3HXnAoeJ6YkCb3tq5XM9O5EZv0fxfMDuqiCDg
	 adWhwlMYUDSapeFjFVeVwTWyweH1mN8k8ffzJ0lMqA+NtpbD05ts+ED5fRWUZecEsP
	 FzWVqjpHNkqCUxgVnRiRQaT9aqxhB3UctNCFuaCmq37EQdsLy9u82KzxYAFO2rJo5a
	 pqD9ULnlZ7EDXG5+HeUgnj+sGRo3NZdGL3tHsCRsdHPkE2xbDeN3+T8tf8dhmWgMDu
	 n+9L0XFsB8YXg==
Date: Wed, 27 May 2026 16:19:29 +0100
From: Lee Jones <lee@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v7 6/6] leds: is31fl32xx: Move pwm frequency setting to
 init_regs()
Message-ID: <20260527151929.GB712405@google.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
 <20260520135659.1430008-7-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520135659.1430008-7-jerrysteve1101@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8329-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B55645E6D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026, Jun Yan wrote:

> commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().
> 
> This causes the PWM frequency configuration programmed in
> is31fl32xx_parse_dt() to be overwritten by the register reset
> operation performed in is31fl32xx_init_regs().
> 
> Move the PWM frequency setting logic from is31fl32xx_parse_dt() to
> is31fl32xx_init_regs() and separates device tree parsing from hardware
> initialization.
> 
> Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/leds/leds-is31fl32xx.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 2d7ff4c5a08c..c545a3b7a05a 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -63,6 +63,7 @@ struct is31fl32xx_priv {
>  	struct i2c_client *client;
>  	struct gpio_desc *powerdown_gpio;
>  	unsigned int num_leds;
> +	bool pwm_22khz;
>  	struct is31fl32xx_led_data leds[];
>  };
>  
> @@ -346,6 +347,14 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
>  	if (ret)
>  		return ret;
>  
> +	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> +		priv->pwm_22khz) {

Nit: No need to wrap here.  Use up to 100-chars to beautify.

> +		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> +							IS31FL32XX_PWM_FREQUENCY_22KHZ);

Nit: Line-up with the '('.

> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * Set enable bit for all channels.
>  	 * We will control state with PWM registers alone.
> @@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
>  static int is31fl32xx_parse_dt(struct device *dev,
>  			       struct is31fl32xx_priv *priv)
>  {
> -	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
>  	/* Driving this GPIO line low takes the chip out of shutdown,
> @@ -431,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
>  				"Failed to get powerdown gpio\n");
>  
> -	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> -	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> -
> -		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> -				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
> -
> -		if (ret) {
> -			dev_err(dev, "Failed to write output PWM frequency register\n");
> -			return ret;
> -		}
> -	}
> +	priv->pwm_22khz = of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm");
>  
>  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
>  		struct led_init_data init_data = {};
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones

