Return-Path: <linux-leds+bounces-8641-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pTlM2G6MmqI4gUAu9opvQ
	(envelope-from <linux-leds+bounces-8641-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:16:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106769AE0A
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:16:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eyrOoDqr;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8641-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8641-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B516A318957B
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 15:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6CA47DFB2;
	Wed, 17 Jun 2026 15:09:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EED247DF81;
	Wed, 17 Jun 2026 15:09:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708989; cv=none; b=ilABc7LvmmrUVGmWXvgu71z1TR/ofeqQyTeDTwnX3CnBOFD6waWihZbvbMTn3XXuCwRZvgxHXJdZexBMxLJcaZ9uD0tyOnCKm/K+sr43b3mfiKO5xtMd7Ddh5E2HqKOkG6rgPJC1UPWkid4oHlFFHcKR8mPxj3RobH9SkXcqbOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708989; c=relaxed/simple;
	bh=pnaCXN4o9iJ/EFPuJFEHU8pUNzuZP+0JNfFmSbAeL9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMegjHCMsekvWTKA3YvQdrh+sL2DeJdRVXORovmjIlPnRgQSzGs8z/DXCGVoed4na8/AgD9OKYrtXyNREusyeu56cA7uUA1qqRXhYOkVT91Q4acDk+4OMwJRsM2v6yXZVQHsJeqw73zqvCvUhMuMkVCXIKr5I2qsYStL5QraYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyrOoDqr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CD91F000E9;
	Wed, 17 Jun 2026 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781708988;
	bh=yWHF2hAobh2LahFzLp0FOlYus1djuiHQzw5tgm/oJFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eyrOoDqrcvgceysgFI2CeQQ7MUiQ/d9nRhHTHlrpYKtnjyJTZu1XYctz9GIdpQSXG
	 myxLkyPQtUnhc5Y+3SUJGo+vI/PEVAmjImxEks7TnWnQZcoPdAeyp8JT5Yvb+ALP+G
	 TzX0ErpRlJovpXc5+ZDU0bErgjUrhVMQd/lvO7FoeM+Rtin/U3iIrMuQzMlj4vWQXz
	 1WPqvLoEQQrLqZkQnBHY0iICD6DuA3oMuPv0j5MFOJiF1CRJH1co+o3MOKWx0cy5a4
	 q73p4a1LcPaPx8jF8QZbLBKZKm3OeM6ICbEVBGAgdJrHXNGcQSr7ODlWzdoLyXETD3
	 cEEqj/Ur58CTg==
Date: Wed, 17 Jun 2026 16:09:43 +0100
From: Lee Jones <lee@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v8 4/6] leds: is31fl32xx: Add powerdown pin for hardware
 shutdown mode
Message-ID: <20260617150943.GL10056@google.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
 <20260607152002.446617-5-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607152002.446617-5-jerrysteve1101@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8641-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4106769AE0A

/* Sashiko Automation: Issues Found (2 Findings) */

Please consider these.

On Sun, 07 Jun 2026, Jun Yan wrote:

> The IS31FL32XX series features an SDB shutdown pin. Driving it low
> (active low) places the chip into hardware shutdown mode for power
> saving, while all register contents are preserved and registers are
> not reset.
> 
> Deassert/assert the pin accordingly during probe() and remove() to
> manage hardware shutdown mode.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/leds/leds-is31fl32xx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 6c8d6b833260..b34fcef2c173 100644
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
> @@ -421,6 +423,15 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>  	int ret = 0;
>  
> +	/*
> +	 * Driving this GPIO line low takes the chip out of shutdown,
> +	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
> +	 */
> +	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> +				"Failed to get 'powerdown' GPIO\n");
> +

[Severity: Medium]
Does this leave the chip actively powered on if probe fails later?

The powerdown gpio is acquired and driven logically low with GPIOD_OUT_LOW,
which wakes the chip from hardware shutdown.

If a subsequent initialization step in probe() fails (for example, if
is31fl32xx_init_regs() returns an error), probe() will return an error
without explicitly reverting the GPIO to its shutdown state.

The devres framework automatically frees the GPIO descriptor, but it does
not revert its physical output level. Will this leave the device powered
on indefinitely instead of returning it to its low-power standby state?



>  	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
>  	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
>  
> @@ -609,6 +620,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
>  	if (ret)
>  		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
>  			ERR_PTR(ret));
> +
> +	if (priv->powerdown_gpio)
> +		gpiod_set_value_cansleep(priv->powerdown_gpio, 1);

[Severity: Medium]
Could this cause an I2C error cascade during driver unbind due to the teardown
order?

The driver registers LEDs using devm_led_classdev_register_ext(), which
means the LED class devices are unregistered by devres after the driver's
remove() callback completes.

When this asserts the powerdown_gpio, it places the chip into hardware
shutdown mode. Subsequently, devres invokes led_classdev_unregister() which
attempts to gracefully turn off each LED:

drivers/leds/led-class.c:led_classdev_unregister() {
    ...
    if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
        led_set_brightness(led_cdev, LED_OFF);
    ...
}

This triggers an I2C write to the chip via is31fl32xx_brightness_set().
Because the hardware is already in hardware shutdown mode, will these
I2C writes fail and result in errors?


>  }
>  
>  /*
> -- 
> 2.54.0
> 

-- 
Lee Jones

