Return-Path: <linux-leds+bounces-8848-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GYm+OZ+KRmrdYAsAu9opvQ
	(envelope-from <linux-leds+bounces-8848-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:58:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA496F9CD3
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:58:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NI9G7KeM;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8848-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8848-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 077683017BEF
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 15:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD0732E73E;
	Thu,  2 Jul 2026 15:52:05 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A652BEC2B;
	Thu,  2 Jul 2026 15:52:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007524; cv=none; b=BJtzZNuKgXXmZv1VtN8NUh/D2BL7IsawSFm6coio1X0Van1+KRbTKErkLCtqmyGCFUr+wBCYKgQC0YYGWrTs5o+1Wq5Cq2XqZc6gpVQfSmFgWFypSt6A9YuV5G6qp5t7gnOnA3k+DfXRJuJlCCzM1rgrM4qY9Fq3fl6uZW87F/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007524; c=relaxed/simple;
	bh=Xll902MuNcefJZU1SiBNjp9dZYJQDGmzURTNkzqhbwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1bDj0a5mXtE0bz84NCVIBLMjAYL9pg+aMIuHzNaBQ1pckcyPnGc8hDiNwwwgh8/CNevcG/OwGeHwQizUq5q1mfw0wP9OkYx8VZugkYqJXxKC99BaYVA/4fAHyT6mpLj4YwJKUNRVdVh/D/D0olaoYXsMiJyvV+2F9xMF2G16d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI9G7KeM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C24D1F000E9;
	Thu,  2 Jul 2026 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007523;
	bh=nFmJIzAybOwXcEQ/9/oYU0DtvwMQUgYqckewftDHMyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NI9G7KeMUsOJxHMd1NdNNuUmzMSFMniMHPNgW0GbaDw3xDMW+vVBm5yF7lY3LURy+
	 AwyOUf+Yro3RavXoVEr9UvCv4HnS2hmWFDFuFKLAl8pmuqHVMu4gcKEWWu976G+64i
	 1Ktpn1tdGnHaYk7zoTtRdH+NMwgnPNYI3lTynRTC0RikD/U+1BWTbQ0AM149wp24iy
	 wm2C1PJpUgDxmVzTnQUOjHytXdDLlq7/yl1bjYU7TUoTYnovb7zMekLvliMPRyn49e
	 H+A6PJV/R9ZhO5fa6AKMc/y23xrYHAzHIZyNWtxxgS1cemclANUpcySkwhgY/2r+Pv
	 bOeZeOqde9S/g==
Date: Thu, 2 Jul 2026 16:51:57 +0100
From: Lee Jones <lee@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v5 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
Message-ID: <20260702155157.GX2108533@google.com>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
 <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-2-03aacd49747c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-2-03aacd49747c@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-8848-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BA496F9CD3

Please consider these:

/* Sashiko Automation: Issues Found (4 Findings) */

On Fri, 29 May 2026, Neil Armstrong wrote:

> From: KancyJoe <kancy2333@outlook.com>
> 
> Implement support for the Silergy SY7758 6-channel High Efficiency LED
> Driver used for backlight brightness control in the Ayaneo Pocket S2
> dual-DSI panel.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/video/backlight/Kconfig  |   8 ++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/sy7758.c | 259 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a7a3fbaf7c29..a1f70a2bae99 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -207,6 +207,14 @@ config BACKLIGHT_KTZ8866
>  		Say Y to enable the backlight driver for the Kinetic KTZ8866
>  		found in Xiaomi Mi Pad 5 series.
>  
> +config BACKLIGHT_SY7758
> +	tristate "Backlight Driver for Silergy SY7758"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable the backlight driver for the Silergy SY7758
> +	  backlight controller found in Ayaneo Pocket S2.
> +
>  config BACKLIGHT_LM3533
>  	tristate "Backlight Driver for LM3533"
>  	depends on MFD_LM3533
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 794820a98ed4..39ef588b1cf2 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
>  obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
>  obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
>  obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
> +obj-$(CONFIG_BACKLIGHT_SY7758)		+= sy7758.o
>  obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
>  obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>  obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
> new file mode 100644
> index 000000000000..786589cb8df9
> --- /dev/null
> +++ b/drivers/video/backlight/sy7758.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Silergy SY7758 6-channel High Efficiency LED Driver
> + *
> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
> + * Copyright (C) 2026 Linaro Limited
> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +#include <linux/backlight.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/err.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/regmap.h>
> +#include <linux/bitfield.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define DEFAULT_BRIGHTNESS	1024
> +#define MAX_BRIGHTNESS		4080
> +#define REG_MAX			0xAE
> +
> +/* Registers */
> +#define REG_DEV_CTL		0x01
> +#define REG_DEV_ID		0x03
> +#define REG_BRT_12BIT_L		0x10
> +#define REG_BRT_12BIT_H		0x11
> +
> +/* OTP memory */
> +#define REG_OTP_CFG0		0xA0
> +#define REG_OTP_CFG1		0xA1
> +#define REG_OTP_CFG2		0xA2
> +#define REG_OTP_CFG5		0xA5
> +#define REG_OTP_CFG9		0xA9
> +
> +/* Fields */
> +#define BIT_DEV_CTL_FAST	BIT(7)
> +#define MSK_DEV_CTL_BRT_MODE	GENMASK(2, 1)
> +#define BIT_DEV_CTL_BL_CTLB	BIT(0)
> +
> +#define MSK_BRT_12BIT_L		GENMASK(7, 0)
> +#define MSK_BRT_12BIT_H		GENMASK(3, 0)
> +
> +#define MSK_CFG0_CURRENT_LOW	GENMASK(7, 0)
> +
> +#define BIT_CFG1_PDET_STDBY	BIT(7)
> +#define MSK_CFG1_CURRENT_MAX	GENMASK(6, 4)
> +#define MSK_CFG1_CURRENT_HIGH	GENMASK(3, 0)
> +
> +#define BIT_CFG2_UVLO_EN	BIT(5)
> +#define BIT_CFG2_UVLO_TH	BIT(4)
> +#define BIT_CFG2_BL_ON		BIT(3)
> +#define BIT_CFG2_ISET_EN	BIT(2)
> +#define BIT_CFG2_BST_ESET_EN	BIT(1)
> +
> +#define BIT_CFG5_PWM_DIRECT	BIT(7)
> +#define MSK_CFG5_PS_MODE	GENMASK(6, 4)
> +#define MSK_CFG5_PWM_FREQ	GENMASK(3, 0)
> +
> +#define MSK_CFG9_VBST_MAX	GENMASK(7, 5)
> +#define BIT_CFG9_JUMP_EN	BIT(4)
> +#define MSK_CFG9_JUMP_TH	GENMASK(3, 2)
> +#define MSK_CFG9_JUMP_VOLTAGE	GENMASK(1, 0)
> +
> +struct sy7758 {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct gpio_desc *gpio;
> +	struct backlight_device *bl;
> +};
> +
> +static const struct regmap_config sy7758_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = REG_MAX,
> +};
> +
> +static int sy7758_backlight_update_status(struct backlight_device *backlight_dev)
> +{
> +	struct sy7758 *sydev = bl_get_data(backlight_dev);
> +	unsigned int brightness = backlight_get_brightness(backlight_dev);
> +	int ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_L,
> +			   FIELD_PREP(MSK_BRT_12BIT_L,
> +				      brightness & 0xff));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_H,
> +			   FIELD_PREP(MSK_BRT_12BIT_H,
> +				      (brightness >> 8) & 0xf));
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops sy7758_backlight_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = sy7758_backlight_update_status,
> +};

[Severity: High]
This driver sets the BL_CORE_SUSPENDRESUME option, which relies on the
backlight core to blank and unblank the brightness on suspend and resume.
However, if the system's power management cuts power to the vdd regulator
during suspend, won't the device lose all the configuration state established
in sy7758_init()?

Because there are no standard pm_ops to re-apply this initialization sequence
upon resume, it seems the backlight might operate with incorrect parameters or
fail to turn on. Should this driver implement a resume callback to restore the
volatile hardware configuration?



> +
> +static int sy7758_init(struct sy7758 *sydev)
> +{
> +	int ret = 0;
> +
> +	ret = regmap_write(sydev->regmap, REG_DEV_CTL,
> +			   BIT_DEV_CTL_FAST | BIT_DEV_CTL_BL_CTLB |
> +			   FIELD_PREP(MSK_DEV_CTL_BRT_MODE, 2));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_L,
> +			   FIELD_PREP(MSK_BRT_12BIT_L,
> +				      DEFAULT_BRIGHTNESS & 0xff));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_H,
> +			   FIELD_PREP(MSK_BRT_12BIT_H,
> +				      (DEFAULT_BRIGHTNESS >> 8)));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG5,
> +			   FIELD_PREP(MSK_CFG5_PS_MODE, 6) |
> +			   FIELD_PREP(MSK_CFG5_PWM_FREQ, 4));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG0,
> +			   FIELD_PREP(MSK_CFG0_CURRENT_LOW, 85));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG1,
> +			   BIT_CFG1_PDET_STDBY |
> +			   FIELD_PREP(MSK_CFG1_CURRENT_MAX, 1) |
> +			   FIELD_PREP(MSK_CFG1_CURRENT_HIGH, 10));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG9,
> +			   FIELD_PREP(MSK_CFG9_VBST_MAX, 4));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG2,
> +			   BIT_CFG2_BL_ON | BIT_CFG2_UVLO_EN);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int sy7758_probe(struct i2c_client *client)
> +{
> +	struct backlight_properties props = { };
> +	struct device *dev = &client->dev;
> +	struct sy7758 *sydev;
> +	unsigned int dev_id;
> +	int ret;
> +
> +	sydev = devm_kzalloc(dev, sizeof(*sydev), GFP_KERNEL);
> +	if (!sydev)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, sydev);
> +
> +	/* Initialize regmap */
> +	sydev->client = client;
> +	sydev->regmap = devm_regmap_init_i2c(client, &sy7758_regmap_config);
> +	if (IS_ERR(sydev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sydev->regmap),
> +				     "failed to init regmap\n");
> +
> +	/* Get and enable regulator */
> +	ret = devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
> +
> +	fsleep(100);
> +
> +	/* Get enable GPIO and set to high */
> +	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(sydev->gpio))
> +		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
> +				     "failed to get enable GPIO\n");

[Severity: Medium]
Is it possible for the enable pin to be hardwired to a power rail on some
hardware designs? Using devm_gpiod_get() makes this GPIO strictly mandatory
and fails the probe if the enable-gpios property is absent in the Device Tree.
Would devm_gpiod_get_optional() be more appropriate here?



[Severity: High]
The enable GPIO is asserted high here, but is there a mechanism to ensure it
is explicitly driven low during driver removal or if the probe fails later?

If devres automatically disables the vdd regulator while the host is still
driving the GPIO high, couldn't this back-power the chip through its internal
ESD protection diodes and cause hardware damage? Using
devm_add_action_or_reset() to drive the GPIO low before the regulator is
disabled might prevent this.



> +
> +	/* Let some time for HW to settle */
> +	fsleep(10000);
> +
> +	/* try read and check device id */
> +	ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to read device id\n");
> +	if (dev_id != 0x63) {
> +		dev_err(dev, "unexpected device id: 0x%02x\n", dev_id);
> +		return -ENODEV;
> +	}
> +
> +	/* Initialize and set default brightness */
> +	ret = sy7758_init(sydev);
> +	if (ret)
> +		return ret;
> +
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = DEFAULT_BRIGHTNESS;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	sydev->bl = devm_backlight_device_register(dev, "sy7758-backlight",
> +						   dev, sydev, &sy7758_backlight_ops,
> +						   &props);
> +	if (IS_ERR(sydev->bl))
> +		return dev_err_probe(dev, PTR_ERR(sydev->bl),
> +				     "failed to register backlight device\n");
> +
> +	return backlight_update_status(sydev->bl);
> +}
> +
> +static void sy7758_remove(struct i2c_client *client)
> +{
> +	struct sy7758 *sydev = i2c_get_clientdata(client);
> +
> +	backlight_disable(sydev->bl);
> +}

[Severity: Medium]
Since the backlight was registered using devm_backlight_device_register(),
devres will unregister the sysfs interface after sy7758_remove() returns.

Does this leave a race window where userspace could concurrently write to the
sysfs brightness file and re-enable the hardware right after
backlight_disable() turns it off?

> +
> +static const struct i2c_device_id sy7758_ids[] = {
> +	{ "sy7758" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sy7758_ids);
> +
> +static const struct of_device_id sy7758_match_table[] = {
> +	{ .compatible = "silergy,sy7758", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sy7758_match_table);
> +
> +static struct i2c_driver sy7758_driver = {
> +	.driver = {
> +		.name = "sy7758",
> +		.of_match_table = sy7758_match_table,
> +	},
> +	.probe = sy7758_probe,
> +	.remove = sy7758_remove,
> +	.id_table = sy7758_ids,
> +};
> +
> +module_i2c_driver(sy7758_driver);
> +
> +MODULE_DESCRIPTION("Silergy SY7758 Backlight Driver");
> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones

