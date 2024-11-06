Return-Path: <linux-leds+bounces-3308-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A99BE45F
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB261C2189B
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFAE1DDC02;
	Wed,  6 Nov 2024 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7stQKbv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A001D358B;
	Wed,  6 Nov 2024 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730889433; cv=none; b=BvjIDtgAra0PNxpjIubk4N7pXr7DfNOO8RkRIENh4N+H1KKya/1rZAwSHqsh+9nlk2dW4KqlR6vuQlMDrRZ94egFo1ZOckHVosreuZ+DcP/HE/SEJg89EbjwaFsDcTdCyZwiJx9mcV1+WC0J6YkptAfjvIobflAt9aaL7RK3J4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730889433; c=relaxed/simple;
	bh=SyN0BUUE8vNmc14UElwkyTklWam+fc6Pwz1elb5EFK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzS7zbJoKyR6dJaRP1EYhlHZpcZOQRKXMPe+AMBuVieY5Y11AbzC6qN2Y2uu1hoFz3LUqX4tBWlKIdQLXEoWzDhpvj9uIxaaMtRVtW4t21b79cBP4OdU5XanbE7LjLXkzVfeGflxiTEU8GeeASX2K0WBAwPQGgFL4GZpt7fa2GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7stQKbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702C0C4CECD;
	Wed,  6 Nov 2024 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730889432;
	bh=SyN0BUUE8vNmc14UElwkyTklWam+fc6Pwz1elb5EFK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7stQKbvzSYGtXaumP8DyzzSAbZ76+cgJwizkFvB/f2GUYjrIckTu7L1v3+8yzA6m
	 uYaxND4M3410Jmt+apcbF7Dd43OdKbRzCvt5uemnAXPsKjlTOQW8lbWy2RPYLhQVRI
	 I8ikaNeBTgg9eyXERA4TpPF66oNs0RROsWIofmjK7RsvDe3WPOSg+lhj9633qPvmbp
	 mfP9raFYEhiDfRcL16g+KqakzsfRJXF7pFSIC9uZmY3KtzJWQ7qbGmcAejdxCfnJmO
	 O23zJHfaHbjBPYVkuAO03CPdDtLgqNA7fh8M5J+rCzV/8u/AWM/1+HrS3ebVvWE4qx
	 M+JiX4n+KDSnQ==
Date: Wed, 6 Nov 2024 10:37:06 +0000
From: Lee Jones <lee@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU
 global LEDs brightness change
Message-ID: <20241106103706.GP1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-8-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104141924.18816-8-kabel@kernel.org>

On Mon, 04 Nov 2024, Marek Behún wrote:

> Recall that on Turris Omnia, the LED controller has a global brightness
> property, which allows the user to make the front LED panel dimmer.
> 
> There is also a button on the front panel, which by default is
> configured so that pressing it changes the global brightness to a lower
> value (unless it is at 0%, in which case pressing the button changes the
> global brightness to 100%).
> 
> Newer versions of the MCU firmware support informing the SOC that the
> brightness was changed by button press event via an interrupt.
> 
> Now that we have the turris-omnia-mcu driver, which adds support for MCU
> interrupts, add the ability to inform the userspace (via a sysfs
> notification) that the global brightness was changed.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/leds/Kconfig             |  2 +-
>  drivers/leds/leds-turris-omnia.c | 48 ++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index fcbe93b61e49..148384aacdcc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -217,7 +217,7 @@ config LEDS_TURRIS_OMNIA
>  	depends on I2C
>  	depends on MACH_ARMADA_38X || COMPILE_TEST
>  	depends on OF
> -	depends on TURRIS_OMNIA_MCU
> +	depends on TURRIS_OMNIA_MCU_GPIO
>  	select LEDS_TRIGGERS
>  	help
>  	  This option enables basic support for the LEDs found on the front
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 7d2ed0c6500a..168ce362fd14 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -43,12 +43,15 @@ struct omnia_led {
>   * @client:			I2C client device
>   * @lock:			mutex to protect
>   * @has_gamma_correction:	whether the MCU firmware supports gamma correction
> + * @brightness_knode:		kernel node of the "brightness" device sysfs attribute (this is the
> + *				driver specific global brightness, not the LED classdev brightness)
>   * @leds:			flexible array of per-LED data
>   */
>  struct omnia_leds {
>  	struct i2c_client *client;
>  	struct mutex lock;
>  	bool has_gamma_correction;
> +	struct kernfs_node *brightness_knode;
>  	struct omnia_led leds[];
>  };
>  
> @@ -373,6 +376,30 @@ static struct attribute *omnia_led_controller_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(omnia_led_controller);
>  
> +static irqreturn_t omnia_brightness_changed_threaded_fn(int irq, void *data)
> +{
> +	struct omnia_leds *leds = data;
> +
> +	if (unlikely(!leds->brightness_knode)) {
> +		/*
> +		 * It would be nicer to get this dirent in the driver probe method, before the IRQ
> +		 * is requested. But the really_probe() function in drivers/base/dd.c registers
> +		 * driver's .dev_groups only after probe is finished, so during driver probe the
> +		 * "brightness" sysfs node is not yet present.

Right, but this is known and therefore never called from probe making
this comment superfluous.  Either do something about it or remove the
comment and carry-on working with what you have. :)

> +		 *
> +		 * Note that sysfs_get_dirent() may sleep. This is okay, because we are in threaded
> +		 * context.
> +		 */
> +		leds->brightness_knode = sysfs_get_dirent(leds->client->dev.kobj.sd, "brightness");
> +		if (!leds->brightness_knode)
> +			return IRQ_NONE;
> +	}
> +
> +	sysfs_notify_dirent(leds->brightness_knode);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int omnia_mcu_get_features(const struct i2c_client *mcu_client)
>  {
>  	u16 reply;
> @@ -459,6 +486,14 @@ static int omnia_leds_probe(struct i2c_client *client)
>  			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
>  	}
>  
> +	if (client->irq && (ret & OMNIA_FEAT_BRIGHTNESS_INT)) {
> +		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +						omnia_brightness_changed_threaded_fn, IRQF_ONESHOT,
> +						"leds-turris-omnia", leds);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Cannot request brightness IRQ\n");
> +	}
> +
>  	mutex_init(&leds->lock);
>  
>  	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
> @@ -481,6 +516,19 @@ static int omnia_leds_probe(struct i2c_client *client)
>  
>  static void omnia_leds_remove(struct i2c_client *client)
>  {
> +	struct omnia_leds *leds = i2c_get_clientdata(client);
> +
> +	/*
> +	 * We need to free the brightness IRQ here, before putting away the brightness sysfs node.
> +	 * Otherwise devres would free the interrupt only after the sysfs node is removed, and if
> +	 * an interrupt occurred between those two events, it would use a removed sysfs node.
> +	 */
> +	devm_free_irq(&client->dev, client->irq, leds);
> +
> +	/* Now put away the sysfs node we got the first time the interrupt handler was called */
> +	if (leds->brightness_knode)
> +		sysfs_put(leds->brightness_knode);
> +
>  	/* put all LEDs into default (HW triggered) mode */
>  	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
>  
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]

