Return-Path: <linux-leds+bounces-8643-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CeUCBDe/Mmo85AUAu9opvQ
	(envelope-from <linux-leds+bounces-8643-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:37:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B53569B0E7
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:37:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b5ft2tOr;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8643-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8643-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37132332AA23
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 15:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D29480968;
	Wed, 17 Jun 2026 15:17:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4B480357;
	Wed, 17 Jun 2026 15:17:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709479; cv=none; b=BU1h0JtaeP160h0euOU3MpIfiu1f3t/DNTgNK52R429Y3E4+po+UDL8bvLnLFLfcZ7fl0sHuoeijJ1gZ9rK11eiLSNH6ouhJXBmZSaWeXPVV4e5py8OJdnr7ZYQdMuJIjI2SqzewnOYyDQZjScycUGA0jHp+/IjsI4BLhgCgO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709479; c=relaxed/simple;
	bh=s4XnDyYEnU7iyMLma7eKS5rpTSnVqs0yk3L9Yz//VKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgVpmiKO5HfbGD/JRSgNpRb5Bfa/L6ZLpy+CiCxMf2vSXmbmefqjF3W26Wi9HSdzMbkWgsVQS29kIR7oAoKKdnM3n8F/M6z6GZtnkXABI/iMOGgyVP5FX2CcwNa+mnZ2BHL/ERNU3nrIJaWDrUTDiBa50Vi7Q207pNmqjIou8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5ft2tOr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83DB1F000E9;
	Wed, 17 Jun 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781709476;
	bh=DNXW92mrLV7ElnfHPSHnaaVpi4R2p+rMMVi7ufFqAYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b5ft2tOr3Nez4BK5kfaGYQYnrRAbojr0obzUYEtrXcbthoDL5VvSFjp/+cObqhuxq
	 eleqj4VTtJO3hLdOTHGFYnox8ZIohjD8eKsiFmM3lInSo57xQPjFYmwjymF9jdUtwS
	 Gi28JSIA5WkRUhHvu5cEgAQQKELL6i3wz+C7tc6QIdeazsUpmM7gThISUlZzU93zbj
	 hO7Ou0aot9u7Tj0PfTIgsTis9xwHiKXczwVTNkUBi1hFyOcnqQ0PO1vx5Rs63qS9Qg
	 dxfCT01S8wHjuVZPiR0oa75IKd4r+D6o2c9nlpvOmIx7seT9ao72iviUmsm/O3ijza
	 rkAfPlSU3LT0A==
Date: Wed, 17 Jun 2026 16:17:51 +0100
From: Lee Jones <lee@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v8 6/6] leds: is31fl32xx: Move pwm frequency setting to
 init_regs()
Message-ID: <20260617151751.GN10056@google.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
 <20260607152002.446617-7-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260607152002.446617-7-jerrysteve1101@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8643-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jerrysteve1101@gmail.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luccafachinetti@gmail.com,m:pzalewski@thegoodpenguin.co.uk,m:daniel@zonque.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B53569B0E7

/* Sashiko Automation: Reviewed (2 Findings) */

And this one please.

On Sun, 07 Jun 2026, Jun Yan wrote:

> commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().

[Severity: High]
This isn't a bug introduced by this patch, but registering LED class devices
before hardware initialization completes exposes the LEDs prematurely.

In is31fl32xx_probe(), is31fl32xx_parse_dt() is called, which internally
executes devm_led_classdev_register_ext() for each LED:

drivers/leds/leds-is31fl32xx.c:is31fl32xx_probe() {
	...
	ret = is31fl32xx_parse_dt(dev, priv);
	if (ret)
		return ret;

	ret = is31fl32xx_init_regs(priv);
	...
}

This registers the LEDs to the subsystem, potentially immediately triggering
led_set_brightness_nopm() via default state settings (e.g., "default-on").
This schedules an asynchronous work item to configure the LED over I2C.

However, is31fl32xx_probe() then immediately calls is31fl32xx_init_regs(),
which performs a full hardware reset (is31fl32xx_reset_regs()).

If the hardware reset races with or occurs after the default state triggers,
will the initial LED states be wiped out?  Must the hardware be fully
initialized and reset before registering the LED devices?


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
>  drivers/leds/leds-is31fl32xx.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index cbda7edbfb48..b43879bffb06 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c

[Severity: High]
This is a pre-existing issue, but there is an incorrect use of max()
instead of min() in is31fl3293_reset():

drivers/leds/leds-is31fl32xx.c:is31fl3293_reset() {
	...
	for (i = 0; i < priv->num_leds; i++) {
		struct is31fl32xx_led_data *led_data = &priv->leds[i];
		int current_level_reg = IS31FL3293_CL_REG + led_data->channel - 1;
		int microamp = max(led_data->max_microamp, IS31FL3293_MAX_MICROAMP);
		int current_level = (microamp * 0xff) / IS31FL3293_MAX_MICROAMP;

		ret = is31fl32xx_write(priv, current_level_reg, current_level);
	...
}

This bounds the user-specified current limit against the hardware maximum of
20,000 µA (IS31FL3293_MAX_MICROAMP) using max(), forcing the current to
always be at least the max chip rating.

If an LED is only rated for 5mA, does this force it to 20mA, which could
physically damage it?

Furthermore, if a user requests a value larger than 20mA (e.g., 30,000 µA),
max() allows it.  The subsequent calculation exceeds 255. Because
is31fl32xx_write() takes a u8 argument, this value is truncated, resulting in
unexpectedly lower current.

Should the code use min() to properly enforce the hardware's maximum rating?

> @@ -63,6 +63,7 @@ struct is31fl32xx_priv {
>  	struct i2c_client *client;
>  	struct gpio_desc *powerdown_gpio;
>  	unsigned int num_leds;
> +	bool pwm_22khz;
>  	struct is31fl32xx_led_data leds[];
>  };
>  
> @@ -346,6 +347,13 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
>  	if (ret)
>  		return ret;
>  
> +	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) && priv->pwm_22khz) {
> +		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> +				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * Set enable bit for all channels.
>  	 * We will control state with PWM registers alone.
> @@ -420,7 +428,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
>  static int is31fl32xx_parse_dt(struct device *dev,
>  			       struct is31fl32xx_priv *priv)
>  {
> -	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
>  	/*
> @@ -432,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
>  				"Failed to get 'powerdown' GPIO\n");
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

-- 
Lee Jones

