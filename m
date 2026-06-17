Return-Path: <linux-leds+bounces-8642-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +/IhOp28Mmrb4wUAu9opvQ
	(envelope-from <linux-leds+bounces-8642-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:26:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1969AFA0
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:26:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MQukSmNX;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8642-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8642-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC8D730B79C0
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 15:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E53E47DFA0;
	Wed, 17 Jun 2026 15:10:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9D46AEDF;
	Wed, 17 Jun 2026 15:10:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709016; cv=none; b=LdD/GoWnfjDJChA470D6BEF9TXyhDcySVPqnUZyguZAAM58sWxooBTk81fwbQWOdP1A6lfoOgMT8we3rIcUqyNeCgAocUNbJylrPD6IyLwOTFIQ/vVF9wM8jcNOOF0c+uGviB/CpAzKKhIYMCFUEN/ALBH/By7G2lUWLIchyxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709016; c=relaxed/simple;
	bh=dnw1MI+aU2fC0i9sKZtMaGSbSUhxH+ZRTbnjFa//+wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTbirGF1JiPXaJr8VZEk/0t+JfV/siaiyavzn6gUbRyEdiY1eqFR1v0PUTrmDLD4WSUomze7ugQcIbdNRpPkwl6QaGqLSU6/rm880q60YJnuXy9K0oZk7pnfp8unDIMaWEGtVajLmgeks+g/RO3dWUsVR0cpVpGAB77oor78lMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQukSmNX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7538E1F000E9;
	Wed, 17 Jun 2026 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781709014;
	bh=h1eqdFeC7WOOJNCGDjJfxFAFOeqrDDu1JABNABVyycE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MQukSmNXIWkrNL+i/y9CF7IJNthtP6LRWeKCuoLZ8lLI+rwR4Ux/4SNjzmdplm/Ty
	 ycJ6u90tmZilexYtbZYUipntPdLJUcd2S46dPuPUSWZ4XI90RAv7C6IYM+M9um/7VH
	 ItSDTUjpZOyIWKEuXdcwtCds+p34bVvKJsK1Mk8oCjcrT7jeE0P/jBOZUm5Tz+bqW2
	 /LpRWg0jWE+jV+NRj3Iha5fZRMWTGEY+YP/CxNuu2Lq8J1jnB3JesYYgROkxQUGp+m
	 xY1Ax5iOCyG6I2BYX+uF/2YWPeHOi6VHf1uHGPKGJ5RNcWDGmiccyCkkbyouFuw+4W
	 uk0q2D+l4a37Q==
Date: Wed, 17 Jun 2026 16:10:09 +0100
From: Lee Jones <lee@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v8 5/6] leds: is31fl32xx: Fix missing brightness_steps
 for is31fl3236
Message-ID: <20260617151009.GM10056@google.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
 <20260607152002.446617-6-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607152002.446617-6-jerrysteve1101@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8642-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84D1969AFA0

/* Sashiko Automation: Issues Found (5 Findings) */

And these.

On Sun, 07 Jun 2026, Jun Yan wrote:

> Add missing brightness_steps for is31fl3236 to fix brightness control.
> 
> Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/leds/leds-is31fl32xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index b34fcef2c173..cbda7edbfb48 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -492,6 +492,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
>  	.pwm_register_base			= 0x01,
>  	.led_control_register_base		= 0x26,
>  	.enable_bits_per_led_control_register	= 1,
> +	.brightness_steps			= 256,
>  };
>  
>  static const struct is31fl32xx_chipdef is31fl3236a_cdef = {

While reviewing this file, I also noticed a few other regressions in the same
driver:

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



[Severity: High]
This isn't a bug introduced by this patch, but does this calculation handle the
current limit bounds correctly?

It appears that max(led_data->max_microamp, IS31FL3293_MAX_MICROAMP) forces
microamp to be at least 20,000 (the value of IS31FL3293_MAX_MICROAMP). If a
device tree requires a lower safety limit (e.g., 5000), it seems it would be
ignored.

Conversely, if the device tree specifies a value larger than 20,000 (e.g.,
30,000), the calculated current_level evaluates to 382. When passed to
is31fl32xx_write(), which takes a u8 parameter, won't this overflow and
truncate to 126, silently programming a drastically lower current limit?


drivers/leds/leds-is31fl32xx.c:is31fl32xx_probe() {
...
	ret = is31fl32xx_parse_dt(dev, priv);
	if (ret)
		return ret;

	ret = is31fl32xx_init_regs(priv);
...
}



[Severity: High]
This is a pre-existing issue, but could this ordering lead to a race condition
with userspace?

is31fl32xx_parse_dt() calls devm_led_classdev_register_ext(), which
immediately publishes the LED devices. The LED subsystem might apply
default-state triggers, or userspace might set the brightness, which sends
PWM writes to the device over I2C.

However, the hardware registers are only initialized and reset in
is31fl32xx_init_regs() afterwards. Won't this reset wipe out any brightness
state configured during or immediately after LED registration? Should the
hardware be fully initialized before device registration?


drivers/leds/leds-is31fl32xx.c:
...
static const struct is31fl32xx_chipdef is31fl3293_cdef = {
	.channels				= 3,
	.shutdown_reg				= IS31FL32XX_REG_NONE,
	.pwm_update_reg				= 0x28,
	.pwm_update_value			= 0xc5,
	.global_control_reg			= IS31FL32XX_REG_NONE,
	.reset_reg				= IS31FL32XX_REG_NONE,
	.pwm_register_base			= 0x19,
	.led_control_register_base		= IS31FL32XX_REG_NONE,
	.brightness_steps			= 4096,
	.reset_func				= is31fl3293_reset,
	.sw_shutdown_func			= is31fl3293_software_shutdown,
};
...



[Severity: High]
Is is31fl3293_cdef missing the initialization for output_frequency_setting_reg?

Since this field isn't set to IS31FL32XX_REG_NONE, it is implicitly initialized
to 0x00. During probe, is31fl32xx_init_regs() checks if this field is
!= IS31FL32XX_REG_NONE (which is 0xFF). Since 0x00 != 0xFF, if the DT
contains the issi,22khz-pwm property, the driver will erroneously write 0x01
to register 0x00.

For the IS31FL3293, register 0x00 is undefined. Can this silently corrupt the
chip state?


drivers/leds/leds-is31fl32xx.c:is31fl32xx_remove() {
...
static void is31fl32xx_remove(struct i2c_client *client)
{
	struct is31fl32xx_priv *priv = i2c_get_clientdata(client);
	int ret;

	ret = is31fl32xx_reset_regs(priv);
...
	if (priv->powerdown_gpio)
		gpiod_set_value_cansleep(priv->powerdown_gpio, 1);
}
...



[Severity: High]
Will the device acknowledge I2C writes after being powered down during removal?

In is31fl32xx_remove(), the driver asserts powerdown_gpio to place the chip
into a hardware shutdown mode. After remove() completes, devres automatically
unregisters the LED class devices that were allocated in is31fl32xx_parse_dt().

During unregistration, the LED subsystem turns off the LEDs by calling
is31fl32xx_brightness_set(), which attempts to write to the chip over I2C.
Because the chip is already physically powered down, won't this result in I2C
timeouts or EREMOTEIO errors on every driver removal?

> -- 
> 2.54.0
> 

-- 
Lee Jones

