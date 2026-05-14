Return-Path: <linux-leds+bounces-8097-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL2EJGafBWr4YwIAu9opvQ
	(envelope-from <linux-leds+bounces-8097-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 12:09:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CCB540270
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 12:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18ECF301F7B5
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 10:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBE738D3FC;
	Thu, 14 May 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYCyniYj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F0253359;
	Thu, 14 May 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753376; cv=none; b=Lp7B/aqn3yuJHzoxz1Qjdir72sIMV9NsqvISGI5Cc3bas+kiroJTUTgJpTEUnJS1Tszg8akpjFOD3YfgEogdI2NOsFYuAX2H3g2AdgBRCkD0+KxfFHD/jU1hCFSeD8uiWuA5e+Wg0CHvD4JdPxM5KsnQW6IIewlSVHnxs4lZnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753376; c=relaxed/simple;
	bh=0KtD/0Uecz1jI/mc5X6HzYPn7Wh0zTexr/5tzN4O7hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF8uomPvpHUWgl6y6w9oC2U6cb/PsRJnP+SHP0RBMmPs/4OcLFT+F78LEW7QPJAnitVBdIgqELOlANJhVA9bxFtl2w3O8Nr6KoOYAveZIO66Jr/KDt8UVTNvvB0HPtwD9waD4sLR1oVwEhz5qncCheru0LJ6FTL4ivy8BVlSrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYCyniYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1E3C2BCB3;
	Thu, 14 May 2026 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753376;
	bh=0KtD/0Uecz1jI/mc5X6HzYPn7Wh0zTexr/5tzN4O7hY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYCyniYjeUDkYhomCfGmu5W3ZeD9RHG8wEln/mXkah67uuuTnBsQxh54ZW7jGbNMD
	 5z5900YnMPMvA5RS+6D2ETUOCYu6AtWnZgGZBhil1py1y4QnvKg6rh5HXkspi53YXK
	 YomH6u2m2M+0rxdlTNQSjNvNLH2/RKMhP2hsxgent+oIsrPw20AhuNyhb3pp7yonot
	 AupUiMKne7KBo9vpTu90DF7x+zGVKH7fk3X6jiD0FKEeqUUrQ7TNwnY6Lrz4ZRetX7
	 qSpPKN60ErHlclGYl38g6peHnmCGW7v+qgOznkO0WKAYYTSWuymJRMfwDWdHDsaj9d
	 g1U2aNMz1Cd1A==
Date: Thu, 14 May 2026 11:09:29 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 5/7] leds: Add driver for ASUS Transformer LEDs
Message-ID: <20260514100929.GH305027@google.com>
References: <20260502124055.22475-1-clamor95@gmail.com>
 <20260502124055.22475-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502124055.22475-6-clamor95@gmail.com>
X-Rspamd-Queue-Id: 92CCB540270
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8097-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qmqm.pl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 02 May 2026, Svyatoslav Ryhel wrote:

> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> ASUS Transformer tablets have a green and an amber LED on both the Pad
> and the Dock. If both LEDs are enabled simultaneously, the emitted light
> will be yellow.
> 
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/leds/Kconfig                    | 11 ++++
>  drivers/leds/Makefile                   |  1 +
>  drivers/leds/leds-asus-transformer-ec.c | 79 +++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c870..f637d23400a8 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-as3668.
>  
> +config LEDS_ASUS_TRANSFORMER_EC
> +	tristate "LED Support for Asus Transformer charging LED"
> +	depends on LEDS_CLASS
> +	depends on MFD_ASUS_TRANSFORMER_EC
> +	help
> +	  This option enables support for charging indicator on
> +	  Asus Transformer's Pad and it's Dock.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-asus-transformer-ec.
> +
>  config LEDS_AW200XX
>  	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 8fdb45d5b439..d5395c3f1124 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>  obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>  obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
>  obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
> +obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)	+= leds-asus-transformer-ec.o
>  obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
>  obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
>  obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds/leds-asus-transformer-ec.c
> new file mode 100644
> index 000000000000..3186038e3be7
> --- /dev/null
> +++ b/drivers/leds/leds-asus-transformer-ec.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/err.h>
> +#include <linux/leds.h>
> +#include <linux/mfd/asus-transformer-ec.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +static void asus_ec_led_set_brightness_amber(struct led_classdev *led,
> +					     enum led_brightness brightness)
> +{
> +	const struct asusec_info *ec = dev_get_drvdata(led->dev->parent);
> +
> +	if (brightness)
> +		asus_ec_set_ctl_bits(ec, ASUSEC_CTL_LED_AMBER);

Why not Regmap?

> +	else
> +		asus_ec_clear_ctl_bits(ec, ASUSEC_CTL_LED_AMBER);
> +}
> +
> +static void asus_ec_led_set_brightness_green(struct led_classdev *led,
> +					     enum led_brightness brightness)
> +{
> +	const struct asusec_info *ec = dev_get_drvdata(led->dev->parent);
> +
> +	if (brightness)
> +		asus_ec_set_ctl_bits(ec, ASUSEC_CTL_LED_GREEN);
> +	else
> +		asus_ec_clear_ctl_bits(ec, ASUSEC_CTL_LED_GREEN);
> +}

These are identical bar one variable.


> +static int asus_ec_led_probe(struct platform_device *pdev)
> +{
> +	struct asusec_info *ec = cell_to_ec(pdev);
> +	struct device *dev = &pdev->dev;
> +	struct led_classdev *amber_led, *green_led;
> +	int ret;
> +
> +	platform_set_drvdata(pdev, ec);

This appears to be unused.

> +	amber_led = devm_kzalloc(dev, sizeof(*amber_led), GFP_KERNEL);
> +	if (!amber_led)
> +		return -ENOMEM;
> +
> +	amber_led->name = devm_kasprintf(dev, GFP_KERNEL, "%s::amber", ec->name);
> +	amber_led->max_brightness = 1;
> +	amber_led->flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
> +	amber_led->brightness_set = asus_ec_led_set_brightness_amber;
> +
> +	ret = devm_led_classdev_register(dev, amber_led);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register amber LED\n");
> +
> +	green_led = devm_kzalloc(dev, sizeof(*green_led), GFP_KERNEL);
> +	if (!green_led)
> +		return -ENOMEM;
> +
> +	green_led->name = devm_kasprintf(dev, GFP_KERNEL, "%s::green", ec->name);
> +	green_led->max_brightness = 1;
> +	green_led->flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
> +	green_led->brightness_set = asus_ec_led_set_brightness_green;
> +
> +	ret = devm_led_classdev_register(dev, green_led);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register green LED\n");

Imagine instead of 2 LEDs, you had 20.  Would you copy and paste this 20
times?  Please re-author this as though there were many more so it
remains efficient and scaleable.

> +	return 0;
> +}
> +
> +static struct platform_driver asus_ec_led_driver = {
> +	.driver.name = "asus-transformer-ec-led",
> +	.probe = asus_ec_led_probe,
> +};
> +module_platform_driver(asus_ec_led_driver);
> +
> +MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
> +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> +MODULE_DESCRIPTION("ASUS Transformer's charging LED driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.51.0
> 
> 

-- 
Lee Jones

