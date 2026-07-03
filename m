Return-Path: <linux-leds+bounces-8924-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2DhhF4eaR2oJcAAAu9opvQ
	(envelope-from <linux-leds+bounces-8924-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:18:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91C701BC3
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JJL2ju4D;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8924-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8924-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9691E3029406
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 11:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C2F3A874C;
	Fri,  3 Jul 2026 11:03:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83333A9CB;
	Fri,  3 Jul 2026 11:03:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076613; cv=none; b=AawL2d3XX+WXmKWow18r8bIpVNs4Y5oSQHgsMfiS1gP46zDVddSNvwsPBi5/lDVERtFVGTABccNWc74BFwVdstfC/oKCS5cIUVNr3k1VUFJoPOhvtXgtsyx2JibSedVikIMw3VnteTgF4gbihD2PY0/X5Bf5kjT/PobudJ/vfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076613; c=relaxed/simple;
	bh=4hb9PqTgHcMpimrLU4uTuGnwTmjyLSCZSnJhvYFeVZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbuxrgXivvot/21K3uZzsvwhpFseMykmQJ5WUdGePuLGkzUL0v22th9HbckGgzDvna6XNRw+t0RwLrKrFdhd3AfMcEl2K9I53eWcsqxG8qkzdY8+1+BzfzIM+0ZfVqy4VbpeEuebacjDIRVztQ2RcrCwW31xsFxB5rKffQEzrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJL2ju4D; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E1A1F000E9;
	Fri,  3 Jul 2026 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076611;
	bh=MJwmfqxvvmXg7PRVlLP5qous35GydyXRIKiSBudfPmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JJL2ju4DpuSqXH9uy9JmRK76ZybQHoX+J84ZABp0hGy+Oh0rin9jJFVRIGqU/Hu/z
	 wnF8+00a09CUXMIlP0nLVnA973O+FWWZwPGu1gQkHzFO+kdWyKh7O8dIbL3C35pEtI
	 w6hUsKWSo4wQ+dWoV9SVQAtDDkP0Bl3GYDdOayTsvtSHXD8cuvl8u6fUg1uWk25+4Z
	 iVRXYr3Jaj/E53VZpYyqcODo2321WEJ2EskVw9ghc7tsOZ2MKyurEhG4qqRtpAw5rW
	 8OfwrMEvYzx77pUUO1TJ0HsC6xPpdan5aNzwx9ukW6vD8938p5qJ0+ylkNgSR7ig+2
	 3Z2gp41VuOKlA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfbg8-00000000j6F-3ioE;
	Fri, 03 Jul 2026 13:03:28 +0200
Date: Fri, 3 Jul 2026 13:03:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 08/14] mfd: lm3533: Convert to use OF bindings
Message-ID: <akeXAOpb13hupUGM@hovoldconsulting.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-9-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-9-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8924-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D91C701BC3

On Wed, Jun 17, 2026 at 11:00:25AM +0300, Svyatoslav Ryhel wrote:
> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for backlight
> ---
>  drivers/iio/light/lm3533-als.c      |  67 +++++---
>  drivers/leds/leds-lm3533.c          |  50 ++++--
>  drivers/mfd/lm3533-core.c           | 236 ++++++++++++----------------
>  drivers/mfd/lm3533-ctrlbank.c       |   5 -
>  drivers/video/backlight/lm3533_bl.c |  55 +++++--
>  include/linux/mfd/lm3533.h          |  52 +-----
>  6 files changed, 220 insertions(+), 245 deletions(-)
 
>  static int lm3533_als_probe(struct platform_device *pdev)
>  {
> -	const struct lm3533_als_platform_data *pdata;
>  	struct lm3533 *lm3533;
>  	struct lm3533_als *als;
>  	struct iio_dev *indio_dev;
> @@ -803,12 +817,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  	if (!lm3533)
>  		return -EINVAL;
>  
> -	pdata = dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> -
>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*als));
>  	if (!indio_dev)
>  		return -ENOMEM;
> @@ -817,25 +825,27 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  	indio_dev->channels = lm3533_als_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
>  	indio_dev->name = dev_name(&pdev->dev);
> -	iio_device_set_parent(indio_dev, pdev->dev.parent);

Why are you reparenting the iio device here? 

That's an ABI break.

> +static const struct of_device_id lm3533_als_match_table[] = {
> +	{ .compatible = "ti,lm3533-als" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm3533_als_match_table);
> +
>  static struct platform_driver lm3533_als_driver = {
>  	.driver	= {
>  		.name	= "lm3533-als",
> +		.of_match_table = lm3533_als_match_table,
>  	},
>  	.probe		= lm3533_als_probe,
>  	.remove		= lm3533_als_remove,

You should also remove the platform module alias below.

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index 0cb0585eb960..ed810c23f30f 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -10,8 +10,10 @@
>  #include <linux/module.h>
>  #include <linux/leds.h>
>  #include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> @@ -50,6 +52,9 @@ struct lm3533_led {
>  	struct mutex mutex;
>  	unsigned long flags;
>  
> +	u32 max_current;
> +	u32 pwm;
> +
>  	bool have_als;
>  };
>  
> @@ -616,22 +621,20 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
>  	NULL
>  };
>  
> -static int lm3533_led_setup(struct lm3533_led *led,
> -					struct lm3533_led_platform_data *pdata)
> +static int lm3533_led_setup(struct lm3533_led *led)
>  {
>  	int ret;
>  
> -	ret = lm3533_ctrlbank_set_max_current(&led->cb, pdata->max_current);
> +	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
>  	if (ret)
>  		return ret;
>  
> -	return lm3533_ctrlbank_set_pwm(&led->cb, pdata->pwm);
> +	return lm3533_ctrlbank_set_pwm(&led->cb, led->pwm);
>  }
>  
>  static int lm3533_led_probe(struct platform_device *pdev)
>  {
>  	struct lm3533 *lm3533;
> -	struct lm3533_led_platform_data *pdata;
>  	struct lm3533_led *led;
>  	int ret;
>  
> @@ -641,12 +644,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  	if (!lm3533)
>  		return -EINVAL;
>  
> -	pdata = dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> -
>  	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
>  		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
>  		return -EINVAL;
> @@ -659,8 +656,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  	led->regmap = lm3533->regmap;
>  	led->have_als = lm3533->have_als;
>  
> -	led->cdev.name = pdata->name;
> -	led->cdev.default_trigger = pdata->default_trigger;
>  	led->cdev.brightness_set_blocking = lm3533_led_set;
>  	led->cdev.brightness_get = lm3533_led_get;
>  	led->cdev.blink_set = lm3533_led_blink_set;
> @@ -668,6 +663,15 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  	led->cdev.groups = lm3533_led_attribute_groups;
>  	led->id = pdev->id;
>  
> +	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> +					pdev->name, led->id);

Is "led-2", etc. unique enough here?

> +	if (!led->cdev.name)
> +		return -ENOMEM;
> +
> +	led->cdev.default_trigger = "none";
> +	device_property_read_string(&pdev->dev, "linux,default-trigger",
> +				    &led->cdev.default_trigger);
> +
>  	mutex_init(&led->mutex);
>  
>  	/* The class framework makes a callback to get brightness during
> @@ -680,15 +684,22 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, led);
>  
> -	ret = led_classdev_register(pdev->dev.parent, &led->cdev);
> +	ret = led_classdev_register(&pdev->dev, &led->cdev);

Here too you appear to be reparenting the class devices.

>  	if (ret) {
> -		dev_err(&pdev->dev, "failed to register LED %d\n", pdev->id);
> +		dev_err(&pdev->dev, "failed to register LED %d\n", led->id);

This does not seem to be necessary.

>  		return ret;
>  	}
>  
>  	led->cb.dev = led->cdev.dev;
>  
> -	ret = lm3533_led_setup(led, pdata);
> +	device_property_read_u32(&pdev->dev, "led-max-microamp",
> +				 &led->max_current);
> +	led->max_current = clamp(led->max_current, LM3533_MAX_CURRENT_MIN,
> +				 LM3533_MAX_CURRENT_MAX);

Why clamp instead of having lm3533_led_setup() fail below? 

> +
> +	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
> +
> +	ret = lm3533_led_setup(led);
>  	if (ret)
>  		goto err_deregister;
>  
> @@ -725,9 +736,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
>  	lm3533_led_set(&led->cdev, LED_OFF);		/* disable blink */
>  }
>  
> +static const struct of_device_id lm3533_led_match_table[] = {
> +	{ .compatible = "ti,lm3533-leds" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm3533_led_match_table);
> +
>  static struct platform_driver lm3533_led_driver = {
>  	.driver = {
>  		.name = "lm3533-leds",
> +		.of_match_table = lm3533_led_match_table,
>  	},
>  	.probe		= lm3533_led_probe,
>  	.remove		= lm3533_led_remove,

Remove platform alias below as well.

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index b03a3ae96c10..a5aa7da9668b 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
> @@ -14,19 +14,26 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> +#include <linux/units.h>
>  
>  #include <linux/mfd/lm3533.h>
>  
>  
>  #define LM3533_BOOST_OVP_MASK		0x06
>  #define LM3533_BOOST_OVP_SHIFT		1
> +#define LM3533_BOOST_OVP_MIN		(16 * MICRO)
> +#define LM3533_BOOST_OVP_MAX		(40 * MICRO)
>  
>  #define LM3533_BOOST_FREQ_MASK		0x01
>  #define LM3533_BOOST_FREQ_SHIFT		0
> +#define LM3533_BOOST_FREQ_MIN		(500 * HZ_PER_KHZ)
> +#define LM3533_BOOST_FREQ_MAX		(1000 * HZ_PER_KHZ)
>  
>  #define LM3533_BL_ID_MASK		1
>  #define LM3533_LED_ID_MASK		3
> @@ -35,6 +42,7 @@
>  
>  #define LM3533_HVLED_ID_MAX		2
>  #define LM3533_LVLED_ID_MAX		5
> +#define LM3533_CELLS_MAX		7
>  
>  #define LM3533_REG_OUTPUT_CONF1		0x10
>  #define LM3533_REG_OUTPUT_CONF2		0x11
> @@ -42,44 +50,6 @@
>  
>  #define LM3533_REG_MAX			0xb2
>  
> -
> -static struct mfd_cell lm3533_als_devs[] = {
> -	{
> -		.name	= "lm3533-als",
> -		.id	= -1,
> -	},
> -};
> -
> -static struct mfd_cell lm3533_bl_devs[] = {
> -	{
> -		.name	= "lm3533-backlight",
> -		.id	= 0,
> -	},
> -	{
> -		.name	= "lm3533-backlight",
> -		.id	= 1,
> -	},
> -};
> -
> -static struct mfd_cell lm3533_led_devs[] = {
> -	{
> -		.name	= "lm3533-leds",
> -		.id	= 0,
> -	},
> -	{
> -		.name	= "lm3533-leds",
> -		.id	= 1,
> -	},
> -	{
> -		.name	= "lm3533-leds",
> -		.id	= 2,
> -	},
> -	{
> -		.name	= "lm3533-leds",
> -		.id	= 3,
> -	},
> -};
> -
>  /*
>   * HVLED output config -- output hvled controlled by backlight bl
>   */
> @@ -301,125 +271,91 @@ static const struct attribute_group *lm3533_attribute_groups[] = {
>  	NULL,
>  };
>  
> -static int lm3533_device_als_init(struct lm3533 *lm3533)
> -{
> -	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
> -	int ret;
> -
> -	if (!pdata->als)
> -		return 0;
> -
> -	lm3533_als_devs[0].platform_data = pdata->als;
> -	lm3533_als_devs[0].pdata_size = sizeof(*pdata->als);
> -
> -	ret = mfd_add_devices(lm3533->dev, 0, lm3533_als_devs, 1, NULL,
> -			      0, NULL);
> -	if (ret) {
> -		dev_err(lm3533->dev, "failed to add ALS device\n");
> -		return ret;
> -	}
> -
> -	lm3533->have_als = 1;
> -
> -	return 0;
> -}
> -
> -static int lm3533_device_bl_init(struct lm3533 *lm3533)
> -{
> -	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
> -	int i;
> -	int ret;
> -
> -	if (!pdata->backlights || pdata->num_backlights == 0)
> -		return 0;
> -
> -	if (pdata->num_backlights > ARRAY_SIZE(lm3533_bl_devs))
> -		pdata->num_backlights = ARRAY_SIZE(lm3533_bl_devs);
> -
> -	for (i = 0; i < pdata->num_backlights; ++i) {
> -		lm3533_bl_devs[i].platform_data = &pdata->backlights[i];
> -		lm3533_bl_devs[i].pdata_size = sizeof(pdata->backlights[i]);
> -	}
> -
> -	ret = mfd_add_devices(lm3533->dev, 0, lm3533_bl_devs,
> -			      pdata->num_backlights, NULL, 0, NULL);
> -	if (ret) {
> -		dev_err(lm3533->dev, "failed to add backlight devices\n");
> -		return ret;
> -	}
> -
> -	lm3533->have_backlights = 1;
> -
> -	return 0;
> -}
> -
> -static int lm3533_device_led_init(struct lm3533 *lm3533)
> -{
> -	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
> -	int i;
> -	int ret;
> -
> -	if (!pdata->leds || pdata->num_leds == 0)
> -		return 0;
> -
> -	if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
> -		pdata->num_leds = ARRAY_SIZE(lm3533_led_devs);
> -
> -	for (i = 0; i < pdata->num_leds; ++i) {
> -		lm3533_led_devs[i].platform_data = &pdata->leds[i];
> -		lm3533_led_devs[i].pdata_size = sizeof(pdata->leds[i]);
> -	}
> -
> -	ret = mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
> -			      pdata->num_leds, NULL, 0, NULL);
> -	if (ret) {
> -		dev_err(lm3533->dev, "failed to add LED devices\n");
> -		return ret;
> -	}
> -
> -	lm3533->have_leds = 1;
> -
> -	return 0;
> -}
> -
>  static int lm3533_device_init(struct lm3533 *lm3533)
>  {
> -	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
> +	struct device *dev = lm3533->dev;
> +	struct mfd_cell *lm3533_devices;
> +	u32 count = 0, reg, nchilds;

Don't mix multiple declarations with initialisation like this.

>  	int ret;
>  
> -	dev_dbg(lm3533->dev, "%s\n", __func__);
> +	nchilds = device_get_child_node_count(dev);
> +	if (!nchilds || nchilds > LM3533_CELLS_MAX)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "num of child nodes is not supported\n");
>  
> -	if (!pdata) {
> -		dev_err(lm3533->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> +	lm3533_devices = devm_kcalloc(dev, nchilds, sizeof(*lm3533_devices),
> +				      GFP_KERNEL);
> +	if (!lm3533_devices)
> +		return -ENOMEM;
>  
> -	lm3533->hwen = devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
> -	if (IS_ERR(lm3533->hwen))
> -		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to request HWEN GPIO\n");
> -	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
> +	device_for_each_child_node_scoped(dev, child) {
> +		if (count >= nchilds)
> +			break;

How could count be larger than nchilds?

> +
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
> +			lm3533_devices[count].name = "lm3533-als";
> +			lm3533_devices[count].of_compatible = "ti,lm3533-als";
> +			lm3533_devices[count].id = PLATFORM_DEVID_NONE;
> +
> +			lm3533->have_als = true;
> +			count++;
> +		} else if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg >= LM3533_HVLED_ID_MAX) {
> +				dev_err(dev, "invalid backlight node %pfw\n", child);
> +				continue;
> +			}
> +
> +			lm3533_devices[count].name = "lm3533-backlight";
> +			lm3533_devices[count].of_compatible = "ti,lm3533-backlight";
> +			lm3533_devices[count].id = reg;
> +			lm3533_devices[count].of_reg = reg;
> +			lm3533_devices[count].use_of_reg = true;
> +
> +			lm3533->have_backlights = true;
> +			count++;
> +		} else if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg < LM3533_HVLED_ID_MAX ||
> +			    reg > LM3533_LVLED_ID_MAX) {
> +				dev_err(dev, "invalid LED node %pfw\n", child);
> +				continue;
> +			}
> +
> +			lm3533_devices[count].name = "lm3533-leds";
> +			lm3533_devices[count].of_compatible = "ti,lm3533-leds";
> +			lm3533_devices[count].id = reg - LM3533_HVLED_ID_MAX;
> +			lm3533_devices[count].of_reg = reg;
> +			lm3533_devices[count].use_of_reg = true;
> +
> +			lm3533->have_leds = true;
> +			count++;
> +		}
> +	}

Why do you need the above at all? Shouldn't you be able to just use
of_platform_populate().

>  
>  	lm3533_enable(lm3533);
>  
>  	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
>  				 LM3533_BOOST_FREQ_MASK,
> -				 pdata->boost_freq << LM3533_BOOST_FREQ_SHIFT);
> +				 lm3533->boost_freq << LM3533_BOOST_FREQ_SHIFT);
>  	if (ret) {
> -		dev_err(lm3533->dev, "failed to set boost frequency\n");
> +		dev_err(dev, "failed to set boost frequency\n");
>  		goto err_disable;
>  	}
>  
>  	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
>  				 LM3533_BOOST_OVP_MASK,
> -				 pdata->boost_ovp << LM3533_BOOST_OVP_SHIFT);
> +				 lm3533->boost_ovp << LM3533_BOOST_OVP_SHIFT);
>  	if (ret) {
> -		dev_err(lm3533->dev, "failed to set boost ovp\n");
> +		dev_err(dev, "failed to set boost ovp\n");
>  		goto err_disable;
>  	}
>  
> -	lm3533_device_als_init(lm3533);
> -	lm3533_device_bl_init(lm3533);
> -	lm3533_device_led_init(lm3533);
> +	ret = mfd_add_devices(dev, 0, lm3533_devices, count, NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(dev, "failed to add MFD devices: %d\n", ret);
> +		goto err_disable;
> +	}
>  
>  	return 0;
>  
> @@ -504,7 +440,26 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
>  		return PTR_ERR(lm3533->regmap);
>  
>  	lm3533->dev = &i2c->dev;
> -	lm3533->irq = i2c->irq;
> +
> +	lm3533->hwen = devm_gpiod_get_optional(lm3533->dev, "enable",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(lm3533->hwen))
> +		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
> +				     "failed to get HWEN GPIO\n");

Please use brackets around multline statements for readability
throughout.

> +
> +	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
> +				 &lm3533->boost_ovp);
> +
> +	lm3533->boost_ovp = clamp(lm3533->boost_ovp, LM3533_BOOST_OVP_MIN,
> +				  LM3533_BOOST_OVP_MAX);
> +	lm3533->boost_ovp = lm3533->boost_ovp / (8 * MICRO) - 2;
> +
> +	device_property_read_u32(lm3533->dev, "ti,boost-freq-hz",
> +				 &lm3533->boost_freq);
> +
> +	lm3533->boost_freq = clamp(lm3533->boost_freq, LM3533_BOOST_FREQ_MIN,
> +				   LM3533_BOOST_FREQ_MAX);
> +	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;

Again, why clamp instead of failing probe?

>  	return lm3533_device_init(lm3533);
>  }
> @@ -518,6 +473,12 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
>  	lm3533_device_exit(lm3533);
>  }
>  
> +static const struct of_device_id lm3533_match_table[] = {
> +	{ .compatible = "ti,lm3533" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm3533_match_table);
> +
>  static const struct i2c_device_id lm3533_i2c_ids[] = {
>  	{ "lm3533" },
>  	{ }
> @@ -528,6 +489,7 @@ static struct i2c_driver lm3533_i2c_driver = {
>  	.driver = {
>  		   .name = "lm3533",
>  		   .dev_groups = lm3533_attribute_groups,
> +		   .of_match_table = lm3533_match_table,
>  	},
>  	.id_table	= lm3533_i2c_ids,
>  	.probe		= lm3533_i2c_probe,
> diff --git a/drivers/mfd/lm3533-ctrlbank.c b/drivers/mfd/lm3533-ctrlbank.c
> index 91e13cfa3cf0..3aab8ece4e8c 100644
> --- a/drivers/mfd/lm3533-ctrlbank.c
> +++ b/drivers/mfd/lm3533-ctrlbank.c
> @@ -13,11 +13,6 @@
>  
>  #include <linux/mfd/lm3533.h>
>  
> -
> -#define LM3533_MAX_CURRENT_MIN		5000
> -#define LM3533_MAX_CURRENT_MAX		29800
> -#define LM3533_MAX_CURRENT_STEP		800
> -
>  #define LM3533_PWM_MAX			0x3f
>  
>  #define LM3533_REG_PWM_BASE		0x14
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index 9ef171d3aaea..2c24647fc17a 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -9,7 +9,9 @@
>  
>  #include <linux/module.h>
>  #include <linux/init.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/backlight.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> @@ -29,6 +31,9 @@ struct lm3533_bl {
>  	struct backlight_device *bd;
>  	int id;
>  
> +	u32 max_current;
> +	u32 pwm;
> +
>  	bool have_als;
>  };
>  
> @@ -242,25 +247,25 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
>  	NULL,
>  };
>  
> -static int lm3533_bl_setup(struct lm3533_bl *bl,
> -					struct lm3533_bl_platform_data *pdata)
> +static int lm3533_bl_setup(struct lm3533_bl *bl)
>  {
>  	int ret;
>  
> -	ret = lm3533_ctrlbank_set_max_current(&bl->cb, pdata->max_current);
> +	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
>  	if (ret)
>  		return ret;
>  
> -	return lm3533_ctrlbank_set_pwm(&bl->cb, pdata->pwm);
> +	return lm3533_ctrlbank_set_pwm(&bl->cb, bl->pwm);
>  }
>  
>  static int lm3533_bl_probe(struct platform_device *pdev)
>  {
>  	struct lm3533 *lm3533;
> -	struct lm3533_bl_platform_data *pdata;
>  	struct lm3533_bl *bl;
>  	struct backlight_device *bd;
>  	struct backlight_properties props;
> +	char *name = NULL;
> +	u32 default_brightness = LM3533_BL_MAX_BRIGHTNESS;
>  	int ret;
>  
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
> @@ -269,12 +274,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  	if (!lm3533)
>  		return -EINVAL;
>  
> -	pdata = dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> -
>  	if (pdev->id < 0 || pdev->id >= LM3533_HVCTRLBANK_COUNT) {
>  		dev_err(&pdev->dev, "illegal backlight id %d\n", pdev->id);
>  		return -EINVAL;
> @@ -292,13 +291,21 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
>  	bl->cb.dev = NULL;			/* until registered */
>  
> +	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> +			      pdev->name, pdev->id);

Unique enough (e.g. backlight-0)?

> +	if (!name)
> +		return -ENOMEM;
> +
> +	device_property_read_u32(&pdev->dev, "default-brightness",
> +				 &default_brightness);
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
> -	props.brightness = pdata->default_brightness;
> -	bd = devm_backlight_device_register(&pdev->dev, pdata->name,
> -					pdev->dev.parent, bl, &lm3533_bl_ops,
> -					&props);
> +	props.brightness = default_brightness;
> +
> +	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
> +					    bl, &lm3533_bl_ops, &props);

Here too you are reparenting, which results in an ABI break.

>  	if (IS_ERR(bd)) {
>  		dev_err(&pdev->dev, "failed to register backlight device\n");
>  		return PTR_ERR(bd);
> @@ -309,12 +316,19 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, bl);
>  
> -	backlight_update_status(bd);
> +	device_property_read_u32(&pdev->dev, "led-max-microamp",
> +				 &bl->max_current);
> +	bl->max_current = clamp(bl->max_current, LM3533_MAX_CURRENT_MIN,
> +				LM3533_MAX_CURRENT_MAX);

Clamping instead of failing.

>  
> -	ret = lm3533_bl_setup(bl, pdata);
> +	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
> +
> +	ret = lm3533_bl_setup(bl);
>  	if (ret)
>  		return ret;
>  
> +	backlight_update_status(bd);
> +
>  	ret = lm3533_ctrlbank_enable(&bl->cb);
>  	if (ret)
>  		return ret;
> @@ -366,11 +380,18 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
>  	lm3533_ctrlbank_disable(&bl->cb);
>  }
>  
> +static const struct of_device_id lm3533_bl_match_table[] = {
> +	{ .compatible = "ti,lm3533-backlight" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm3533_bl_match_table);
> +
>  static struct platform_driver lm3533_bl_driver = {
>  	.driver = {
>  		.name	= "lm3533-backlight",
>  		.pm	= &lm3533_bl_pm_ops,
>  		.dev_groups = lm3533_bl_attribute_groups,
> +		.of_match_table = lm3533_bl_match_table,
>  	},
>  	.probe		= lm3533_bl_probe,
>  	.remove		= lm3533_bl_remove,

Drop platform module alias below.

Johan

