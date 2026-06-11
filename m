Return-Path: <linux-leds+bounces-8568-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lKwxGYCcKmpctgMAu9opvQ
	(envelope-from <linux-leds+bounces-8568-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 13:31:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA8671578
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 13:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fuSv5Pq0;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8568-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8568-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66FEA301E7E8
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136E53E6DD8;
	Thu, 11 Jun 2026 11:30:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E59381B1A;
	Thu, 11 Jun 2026 11:30:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177444; cv=none; b=BqCgvwkuJ8sC4I5HT3xeUMQJ16XlT9S1pZ2jaoKV98KR1350Jr0p87ZN+7gh9PR0KKLdBXYmOTLsLfTPIYzchcnN9//DXdlQ3X3gpD8UIoRpKkd08RjpFAb+MsCCvsqbdmWIpe/Z5tprOgMCYAixk4dkOPk9Bx8huEpFyuhTNp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177444; c=relaxed/simple;
	bh=I+DLwJN2u0GSO6ZTJ67Utz5lEafP5XeM7zcNJa5hrmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKR/gRZt3bNpsosEQLtzVU6K4jt6kZhfOo920qdCi01aGV48QG7onVIR1jdkOD/2o6rkb2v3NZfP8T7U8vfLkx82uUWtLBrhvGCd66ASImOUcm/1Qh/5kpytCiLdVS1sRuT8Xkc8e729O0B0b8CGcTpdq7etP8iGS4pJYA1TymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuSv5Pq0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C3D1F00893;
	Thu, 11 Jun 2026 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781177442;
	bh=1Q0T0fOSnrEZgHRMfBVT+QCLa/RsFvlUpXXyWGKZ6xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fuSv5Pq0TLtblvVdPXnlAbdIIJiAYLAMLN1XAZwKJkwmE0v18pxNc8hH105cMU2Lm
	 xEFIl5lJXiKw2MY6QeUuEZ0qLlgHPDyo5Wg4PteKuyjHsY8nizQ8GpWYs7f9gK2SgD
	 0b01T6NzaDoYo7eNka42/NL4ojpcR6/ZbQ1vt1sT90L4yGTg0ifaebtOk5fcTUv9f4
	 CsZDaALlxySSKN95XjY7mT/QFvRrpcA/pCJmhPBJWWs2vaqmLm1Od+fIfbFtmt7Njx
	 NLBWRnYnPQVJvUgNo5YNJ4fWxm2sPRYNjEuyDij5EsbefVZzuXUkciPPiUnTBkoFC5
	 e2k+N2nTvpNhQ==
Date: Thu, 11 Jun 2026 12:30:37 +0100
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
Subject: Re: [PATCH v8 5/7] leds: Add driver for ASUS Transformer LEDs
Message-ID: <20260611113037.GO4151951@google.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
 <20260528053203.9339-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528053203.9339-6-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8568-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0FA8671578

On Thu, 28 May 2026, Svyatoslav Ryhel wrote:

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
>  drivers/leds/Kconfig                    |  11 +++
>  drivers/leds/Makefile                   |   1 +
>  drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
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
> index 000000000000..09503e76331c
> --- /dev/null
> +++ b/drivers/leds/leds-asus-transformer-ec.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/err.h>
> +#include <linux/leds.h>
> +#include <linux/mfd/asus-transformer-ec.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +enum {
> +	ASUSEC_LED_AMBER,
> +	ASUSEC_LED_GREEN,
> +	ASUSEC_LED_MAX
> +};
> +
> +struct asus_ec_led_config {
> +	const char *name;
> +	unsigned int color;
> +	unsigned long long ctrl_bit;

Should we use 'u64' here instead of 'unsigned long long' to align with standard
kernel integer types?

> +};
> +
> +struct asus_ec_led {
> +	struct asus_ec_leds_data *ddata;
> +	struct led_classdev cdev;
> +	unsigned long long ctrl_bit;

Should we use 'u64' here as well to keep it consistent?

> +};
> +
> +struct asus_ec_leds_data {
> +	const struct asusec_core *ec;
> +	struct asus_ec_led leds[ASUSEC_LED_MAX];
> +};
> +
> +static const struct asus_ec_led_config asus_ec_leds[] = {
> +	[ASUSEC_LED_AMBER] = {
> +		.name = "amber",
> +		.color = LED_COLOR_ID_AMBER,
> +		.ctrl_bit = ASUSEC_CTL_LED_AMBER,
> +	},
> +	[ASUSEC_LED_GREEN] = {
> +		.name = "green",
> +		.color = LED_COLOR_ID_GREEN,
> +		.ctrl_bit = ASUSEC_CTL_LED_GREEN,
> +	},
> +};
> +
> +static enum led_brightness asus_ec_led_get_brightness(struct led_classdev *cdev)
> +{
> +	struct asus_ec_led *led = container_of(cdev, struct asus_ec_led, cdev);
> +	const struct asusec_core *ec = led->ddata->ec;

I'm getting confused here.

ddata is what I'd be calling the device data struct passed by the parent?

In fact, ddata is a little known concept in Leds.  Any reason to go for
this over the standard nomenclature?

> +	u64 ctl;
> +	int ret;
> +
> +	ret = asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);

Did we discuss preferring regmap already?

> +	if (ret)
> +		return LED_OFF;
> +
> +	return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
> +}
> +
> +static int asus_ec_led_set_brightness(struct led_classdev *cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct asus_ec_led *led = container_of(cdev, struct asus_ec_led, cdev);
> +	const struct asusec_core *ec = led->ddata->ec;
> +
> +	if (brightness)
> +		return asus_dockram_access_ctl(ec->dockram, NULL,
> +					       led->ctrl_bit, led->ctrl_bit);
> +
> +	return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_bit, 0);
> +}
> +
> +static int asus_ec_led_probe(struct platform_device *pdev)
> +{
> +	const struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct asus_ec_leds_data *ddata;
> +	struct device *dev = &pdev->dev;
> +	int i, ret;

Could we declare the loop counter 'i' directly within the 'for' statement's
scope to keep its scope limited? For example, 'for (int i = 0; ...)'.

> +
> +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, ddata);
> +	ddata->ec = ec;
> +
> +	for (i = 0; i < ASUSEC_LED_MAX; i++) {

Nit: for (int i = ...

> +		const struct asus_ec_led_config *cfg = &asus_ec_leds[i];
> +		struct asus_ec_led *led = &ddata->leds[i];
> +
> +		led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s::%s",
> +						ddata->ec->name, cfg->name);
> +		if (!led->cdev.name)
> +			return -ENOMEM;
> +
> +		led->cdev.max_brightness = 1;
> +		led->cdev.color = cfg->color;
> +		led->cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
> +		led->cdev.brightness_get = asus_ec_led_get_brightness;
> +		led->cdev.brightness_set_blocking = asus_ec_led_set_brightness;
> +
> +		led->ddata = ddata;
> +		led->ctrl_bit = cfg->ctrl_bit;
> +
> +		ret = devm_led_classdev_register(dev, &led->cdev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to register %s LED\n",
> +					     cfg->name);

Should we capitalise the error message here to match our style guidelines
(e.g. 'Failed to register...')?

> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver asus_ec_led_driver = {
> +	.driver.name = "asus-transformer-ec-led",
> +	.probe = asus_ec_led_probe,
> +};
> +module_platform_driver(asus_ec_led_driver);
> +
> +MODULE_ALIAS("platform:asus-transformer-ec-led");
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

