Return-Path: <linux-leds+bounces-8328-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BMSDyYMF2oR2gcAu9opvQ
	(envelope-from <linux-leds+bounces-8328-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 17:22:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2285E6CB5
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 17:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6683E304D24D
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 15:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F358632D45B;
	Wed, 27 May 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvCWYrCJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21AC2EF652;
	Wed, 27 May 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895069; cv=none; b=Pzdh/7BdAtIk9OFIWIS4jMxJZHEnQzHw8A+zWqydoapLi6jPWRkFow6Ot3QFPjzWeScwz53eNWb6WFCmSr7mTndBHudsrt1lpNRt8NlSolD4Ezfj+jIwusoLZw4giCSWfQjdly6ZSHetRoOIlpZ1MwOCW3NJzLu5crRP0ksHcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895069; c=relaxed/simple;
	bh=38rAyioNU6OWTqjTTNN2Wg2rr/lC3hqa9Hrhie3g+FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDenBlXMJDQ2LeF/+Qwa0gZD2UfyV1Dkz8nlTBzFcKEAu/OcMPCly9qfTE5GhUYL1xeX1Hp8jUiZE1f4wvOK7Lvp609QqnobjGiEj9HdM8O691U4e57GYXe3AJo2t1stOqi+dD2TBv2XyWFTZCCh067uhcR4TR4LNObbV1+9+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvCWYrCJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3F11F000E9;
	Wed, 27 May 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779895068;
	bh=agrESt33FjKI9sUZg4Nsx9u+qkDeyGqeXH9fcwdmxhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CvCWYrCJZco+GUmpDaNCqvaer1WcZNZTRut8D/iEyYrjqgC50kUypy9/K5eQGXxGW
	 NBSq1Qo2HlLkfIHMrL2og+7hAHv24AoPQAs2YmC130ZRrYa5oQK+AblGpeWbUlxYFO
	 Wl0z76t3DMbhLqYLlkfJgGz24YU3LhBzxaw1NG+4xPayIOSeLxSt5wmdK8VG0RzqHT
	 fyP7+hFprOhcXvBrScooHwS6sze4IJh+gttLwbdNaSNyAo4N1HVjWYZY7+qtIIIKcb
	 48orC/Oh2yh9xRc4led3038Hs75aL8X2W3iFDeYJhf18vF6x8WdC6PSXPXdforGjUX
	 aJLAOfmIrMvdQ==
Date: Wed, 27 May 2026 16:17:43 +0100
From: Lee Jones <lee@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v7 4/6] leds: is31fl32xx: Add powerdown pin for hardware
 shutdown mode
Message-ID: <20260527151743.GA712405@google.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
 <20260520135659.1430008-5-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520135659.1430008-5-jerrysteve1101@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8328-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AA2285E6CB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026, Jun Yan wrote:

> The IS31FL32XX series features an SDB shutdown pin.
> Driving it low (active low) places the chip into hardware shutdown

Nit: No need to wrap for a new sentence.

> mode for power saving, while all register contents are preserved
> and registers are not reset.
> 
> Deassert/assert the pin accordingly during probe() and remove()
> to manage hardware shutdown mode.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/leds/leds-is31fl32xx.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index fe07acbb103a..5b9ed5a1818f 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> @@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
>  struct is31fl32xx_priv {
>  	const struct is31fl32xx_chipdef *cdef;
>  	struct i2c_client *client;
> +	struct gpio_desc *powerdown_gpio;
>  	unsigned int num_leds;
>  	struct is31fl32xx_led_data leds[];
>  };
> @@ -421,6 +423,14 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
> +	/* Driving this GPIO line low takes the chip out of shutdown,
> +	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
> +	 */

Please use properly formatted multi-line comments.

> +	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> +				"Failed to get powerdown gpio\n");

Nit: GPIO

> +
>  	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
>  	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
>  
> @@ -609,6 +619,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
>  	if (ret)
>  		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
>  			ERR_PTR(ret));
> +
> +	if (priv->powerdown_gpio)
> +		gpiod_set_value(priv->powerdown_gpio, 1);
>  }
>  
>  /*
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones

