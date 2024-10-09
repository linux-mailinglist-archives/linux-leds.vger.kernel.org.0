Return-Path: <linux-leds+bounces-3013-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A79B996665
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 12:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C559C1F270C3
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA0D18DF7D;
	Wed,  9 Oct 2024 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QosHPxkJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165118C329;
	Wed,  9 Oct 2024 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468304; cv=none; b=fDlvbpNg6x+VcjhVFUUlYrQ3WrgFq3z5ik/2+8wYha4W4kN9VFDi7zYrudtZvxYKyV93rzoFKfTZflEIjfDXTPfXIOaJfc8ED9LtQOel93c6mx54SxOf8CeGnBAtflJkQ7a1g4vJFvDVC0CvupZTu1vLWWvniIUld/e6vX+PS8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468304; c=relaxed/simple;
	bh=zcrhkQU3a/I3nldi+jyZLPEYX6EbLf6WARSWbNo2SXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJt19TnhUKu3d1BWTnlB6HEzMqIYt6fze1ouTB7sSGAn9Ggvkz3xd80+aCvkRBKEXSDTQkLUwnw3/spfw2adAQ4YzeewrrhCJPpeTibvNBk+rIe4zdMVh0ZZYrWXIEqqA19b/JFHruVnpA8nbeH81XATHUJddzS1j2l2A+gh438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QosHPxkJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BDBC4CEC5;
	Wed,  9 Oct 2024 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468303;
	bh=zcrhkQU3a/I3nldi+jyZLPEYX6EbLf6WARSWbNo2SXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QosHPxkJTXDemqEEkGWzxzp/BNx3OxfQI+DWZjB+eV46HKTPLAgvXc+y/Vv+n2u4w
	 g4MMMwzchRY2fPwwSNEtVVPYO71tglAWcndvL0pn8M9CimRzZoWt3xvtcCCUTT72e+
	 YbZHq4IEaIElCXnfLuR0gkkgE78Ff4zq7ZLf9/CJuimsaVGy2n0cKcKiK1gcSAXC5p
	 frKwu37G+oYFPnoNhahoKcwsmJN6LtiZ8UJSvkYihUjv8I58AckfZJeGvTvqPY4pFi
	 K6AmyFamB1f6ZTA1K4EK54EFT8Kf1YizI+13709GSKLTp+5ib4bJyWCmKPreO0XB3P
	 A5P2qhc993wBw==
Date: Wed, 9 Oct 2024 11:04:57 +0100
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
Subject: Re: [PATCH leds v3 06/11] leds: turris-omnia: Notify sysfs on MCU
 global LEDs brightness change
Message-ID: <20241009100457.GA276481@google.com>
References: <20240913123103.21226-1-kabel@kernel.org>
 <20240913123103.21226-7-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913123103.21226-7-kabel@kernel.org>

On Fri, 13 Sep 2024, Marek Behún wrote:

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
>  drivers/leds/leds-turris-omnia.c | 37 ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 82cf58fbe946..a87cdb58e476 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -33,6 +33,7 @@ struct omnia_leds {
>  	struct i2c_client *client;
>  	struct mutex lock;
>  	bool has_gamma_correction;
> +	struct kernfs_node *brightness_kn;

Variable nomenclature should be self documenting.

What is kn?  Please improve this.

>  	struct omnia_led leds[];
>  };
>  
> @@ -357,6 +358,21 @@ static struct attribute *omnia_led_controller_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(omnia_led_controller);
>  
> +static irqreturn_t omnia_brightness_changed_handler(int irq, void *dev_id)

Why dev_id?  This appears to be driver data.  ddata sounds more applicable.

> +{
> +	struct omnia_leds *leds = dev_id;
> +
> +	if (unlikely(!leds->brightness_kn)) {
> +		leds->brightness_kn = sysfs_get_dirent(leds->client->dev.kobj.sd, "brightness");

NACK.  This will sleep in IRQ context.

> +		if (!leds->brightness_kn)
> +			return IRQ_NONE;
> +	}
> +
> +	sysfs_notify_dirent(leds->brightness_kn);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int omnia_mcu_get_features(const struct i2c_client *client)
>  {
>  	struct i2c_client mcu_client = *client;
> @@ -420,6 +436,14 @@ static int omnia_leds_probe(struct i2c_client *client)
>  			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
>  	}
>  
> +	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
> +		ret = devm_request_any_context_irq(dev, client->irq,
> +						   omnia_brightness_changed_handler, IRQF_ONESHOT,
> +						   "leds-turris-omnia", leds);
> +		if (ret <= 0)
> +			return dev_err_probe(dev, ret ?: -ENXIO, "Cannot request brightness IRQ\n");
> +	}
> +
>  	mutex_init(&leds->lock);
>  
>  	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
> @@ -442,6 +466,19 @@ static int omnia_leds_probe(struct i2c_client *client)
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
> +	if (leds->brightness_kn)
> +		sysfs_put(leds->brightness_kn);
> +
>  	/* put all LEDs into default (HW triggered) mode */
>  	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
>  
> -- 
> 2.44.2
> 

-- 
Lee Jones [李琼斯]

