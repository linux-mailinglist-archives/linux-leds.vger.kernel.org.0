Return-Path: <linux-leds+bounces-8227-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOlYL4TEDWql3AUAu9opvQ
	(envelope-from <linux-leds+bounces-8227-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:26:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F06DA58F928
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BC53309CD68
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC03B3EAC86;
	Wed, 20 May 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDMGW+u+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7743E7BA9;
	Wed, 20 May 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286385; cv=none; b=o8OXRnZbZuIqqvoE6Sn1h15z7dnpb+E/JqJHAXpSIFKghkrq/HQ5Ywtj/7V9LCKxp486sFlS/sMt3TlJ9tj6+jWrYopkmQNRppzSuu7bRt3U5bJxpgmMPcWoUGAHvens/Bl8tyMHBCZbWRulLz/6tx5GI6YpoeEa+zV+WCXn/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286385; c=relaxed/simple;
	bh=urVpk5FrqM1PXQGZOyno2GRVDehK82CXj4371lEWmFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8+SRMOj8SEiMuxRWXAfTIercm4zImqIXyK+fYA5ue0maC1dfLi2SCkQXc94OjO2VMg652I4Qxdu4Q5oH1DvxbxNIRRIk6BxNv4wPMPnvbhtqnlTWlTdT4NjVSyJ7xkfXZ+zFGaRXNoOjiD19GnHDzEFa3Odsg2vxkwxH+6Kd5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDMGW+u+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315B71F000E9;
	Wed, 20 May 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779286384;
	bh=soqjfBbtbCAHiu0tUPNmDYvG0MoLjrfL00dolMCHGlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RDMGW+u+7Dj1K2l4w9TQJZOofU6PM5IDQLZmmB9AAJHfX/T4NkpIgQCrdIiRyyw/y
	 NJzuChNwR2md+meBcfbsnVYx8GEVmJtH+yRUtGQZkY0ooLMWX55KiaxG6a/sLmgLRA
	 Ye6IibQZSgrof7L7JHqJLGLTQl76PC6c/Ad2R0+JTYzn835vjTjCPFlDSbD7kxwRvB
	 ANq2diAGH8UlP5tn6yLG2NG9s+nzdSmVxSuKJnUEeacCFIeD4IJFoKhSknUoqM6fdh
	 VPtjPPJtKB8WUziGYnGRe2h0iQTMx0ni3QzLEnxbeiJupk8rNqy7PHujZh5UYYyTKv
	 FyQADRJMfv38g==
Date: Wed, 20 May 2026 15:12:59 +0100
From: Lee Jones <lee@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v5 4/5] leds: is31fl32xx: Add powerdown pin to exit
 hardware shutdown mode
Message-ID: <20260520141259.GD2767592@google.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
 <20260508131139.1523597-5-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508131139.1523597-5-jerrysteve1101@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8227-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F06DA58F928
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 08 May 2026, Jun Yan wrote:

> The IS31FL32XX series features an SDB shutdown pin.
> Driving it low (active low) places the chip into hardware shutdown
> mode for power saving, while all register contents are preserved
> and registers are not reset.
> 
> Drive the pin logic low during probe() to exit hardware shutdown
> mode.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/leds/leds-is31fl32xx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git "a/drivers/leds/leds-is31fl32xx.c" "b/drivers/leds/leds-is31fl32xx.c"
> index fe07acbb103a..57d779e07a62 100644
> --- "a/drivers/leds/leds-is31fl32xx.c"
> +++ "b/drivers/leds/leds-is31fl32xx.c"
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/gpio.h>

<linux/gpio/consumer.h>?

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
> @@ -421,6 +423,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
> +	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> +				"Failed to get powerdown gpio\n");
> +

"Failed to get 'powerdown' GPIO".

Shows that powerdown is the name of the pin and correctly capitalises
GPIO.

>  	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
>  	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
>  
> -- 
> 2.53.0
> 
> 

-- 
Lee Jones

