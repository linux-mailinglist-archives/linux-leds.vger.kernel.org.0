Return-Path: <linux-leds+bounces-1926-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39399088B0
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 11:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E791B25D57
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 09:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13661946A6;
	Fri, 14 Jun 2024 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DyGdPtVC"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3086119412D;
	Fri, 14 Jun 2024 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358478; cv=none; b=V6NBrq+V7E1rWKr9zlwqLsyIGhp5weg3rxijaC1DFUpSxPUcCZjW2hXtrtJn77ONjw+61JQ4FrY5VocaxKLvbtUsFQoZk0HLrgVXQaeCWBPHqgX2hqbYYkWU3qmYoMq9akm0VHDMQl7csQj8hCr8bs64s96Id8+YXs41/M3qULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358478; c=relaxed/simple;
	bh=LPsGomOjuosLutGl0N/WwgNE2B736KH7EMTOa4C9ITw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1yKLeHxKMexeHLOc5HbGyf7rzvaKVPJb+KNZ0h+c9HIxE/nBZRWQ2q/P8g7lEul9V3FeCrxy5Qsf+oAFHLE4g+3/Ho+s3K/V5u7OLRc++LgQ8vXR0ssDVYrsGEajzrx9S3qxyUczEWSDzGC1Nfwiaj7V1f78Pbx9lLsD9cWXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DyGdPtVC; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718358473;
	bh=LPsGomOjuosLutGl0N/WwgNE2B736KH7EMTOa4C9ITw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyGdPtVCQxMIu1/YdPFzw/0HmT9xMTXvZiSklhivsMgTboE8qSo9LPeLzDnHBr73A
	 hCyM8FQoJjaTSWK7O5MnOZPGQn99NtLFTG2g2AodeWoR2uuhZd+/GsRs/VQg+xjsE4
	 +AFKWZho2KOUVmH8pMDmPxvzDq/0GUEgONv6VZm0=
Date: Fri, 14 Jun 2024 11:47:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 4/5] leds: Add ChromeOS EC driver
Message-ID: <4b301931-4c29-435e-a2e7-6cc2ed540aa5@t-8ch.de>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
 <20240613-cros_ec-led-v3-4-500b50f41e0f@weissschuh.net>
 <20240614090219.GE2561462@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614090219.GE2561462@google.com>

On 2024-06-14 10:02:19+0000, Lee Jones wrote:
> On Thu, 13 Jun 2024, Thomas Weißschuh wrote:
> 
> > The ChromeOS Embedded Controller exposes an LED control command.
> > Expose its functionality through the leds subsystem.
> > 
> > The LEDs are exposed as multicolor devices.
> > A hardware trigger, which is active by default, is provided to let the
> > EC itself take over control over the LED.
> > 
> > The driver is designed to be probed via the cros_ec mfd device.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  MAINTAINERS                 |   5 +
> >  drivers/leds/Kconfig        |  15 +++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-cros_ec.c | 299 ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 320 insertions(+)
> 
> Mostly fine.  Couple of points.
> 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index aacccb376c28..8bc3491a08af 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5135,6 +5135,11 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> >  F:	sound/soc/codecs/cros_ec_codec.*
> >  
> > +CHROMEOS EC LED DRIVER
> > +M:	Thomas Weißschuh <thomas@weissschuh.net>
> > +S:	Maintained
> > +F:	drivers/leds/leds-cros_ec.c
> > +
> >  CHROMEOS EC SUBDRIVERS
> >  M:	Benson Leung <bleung@chromium.org>
> >  R:	Guenter Roeck <groeck@chromium.org>
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 05e6af88b88c..aa2fec9a34ed 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -179,6 +179,21 @@ config LEDS_CR0014114
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called leds-cr0014114.
> >  
> > +config LEDS_CROS_EC
> > +	tristate "LED Support for ChromeOS EC"
> > +	depends on MFD_CROS_EC_DEV
> > +	depends on LEDS_CLASS_MULTICOLOR
> > +	select LEDS_TRIGGERS
> > +	default MFD_CROS_EC_DEV
> > +	help
> > +	  This option enables support for LEDs managed by ChromeOS ECs.
> > +	  All LEDs exposed by the EC are supported in multicolor mode.
> > +	  A hardware trigger to switch back to the automatic behaviour is
> > +	  provided.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called leds-cros_ec.
> > +
> >  config LEDS_EL15203000
> >  	tristate "LED Support for Crane EL15203000"
> >  	depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index effdfc6f1e95..3491904e13f7 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -26,6 +26,7 @@ obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
> >  obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
> >  obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
> >  obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
> > +obj-$(CONFIG_LEDS_CROS_EC)		+= leds-cros_ec.o
> >  obj-$(CONFIG_LEDS_DA903X)		+= leds-da903x.o
> >  obj-$(CONFIG_LEDS_DA9052)		+= leds-da9052.o
> >  obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
> > diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> > new file mode 100644
> > index 000000000000..7bb21a587713
> > --- /dev/null
> > +++ b/drivers/leds/leds-cros_ec.c
> > @@ -0,0 +1,299 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  ChromeOS EC LED Driver
> > + *
> > + *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/leds.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/platform_data/cros_ec_commands.h>
> > +#include <linux/platform_data/cros_ec_proto.h>
> > +
> > +#define DRV_NAME	"cros-ec-led"
> 
> Please refrain from defining device names.  Use the string in-place.

This is the common pattern used for other drivers using the cros_ec MFD
device. I'll change it, though.

> > +static const char * const cros_ec_led_functions[] = {
> > +	[EC_LED_ID_BATTERY_LED]            = LED_FUNCTION_CHARGING,
> > +	[EC_LED_ID_POWER_LED]              = LED_FUNCTION_POWER,
> > +	[EC_LED_ID_ADAPTER_LED]            = "adapter",
> > +	[EC_LED_ID_LEFT_LED]               = "left",
> > +	[EC_LED_ID_RIGHT_LED]              = "right",
> > +	[EC_LED_ID_RECOVERY_HW_REINIT_LED] = "recovery-hw-reinit",
> > +	[EC_LED_ID_SYSRQ_DEBUG_LED]        = "sysrq-debug",
> > +};
> > +
> > +static_assert(ARRAY_SIZE(cros_ec_led_functions) == EC_LED_ID_COUNT);
> 
> What does this do?  Result in a build failure?

Yes. It's the standard C version of BUILD_BUG_ON().
It can be used in all contexts, in contrast to BUILD_BUG_ON) and is
already widely used within the tree.

The goal is to make sure that additions to "enum ec_led_id" do not
inadvertedly lead to out-of-bounds accesses in those arrays.

> > +static const int cros_ec_led_to_linux_id[] = {
> > +	[EC_LED_COLOR_RED]    = LED_COLOR_ID_RED,
> > +	[EC_LED_COLOR_GREEN]  = LED_COLOR_ID_GREEN,
> > +	[EC_LED_COLOR_BLUE]   = LED_COLOR_ID_BLUE,
> > +	[EC_LED_COLOR_YELLOW] = LED_COLOR_ID_YELLOW,
> > +	[EC_LED_COLOR_WHITE]  = LED_COLOR_ID_WHITE,
> > +	[EC_LED_COLOR_AMBER]  = LED_COLOR_ID_AMBER,
> > +};
> > +
> > +static_assert(ARRAY_SIZE(cros_ec_led_to_linux_id) == EC_LED_COLOR_COUNT);
> > +
> > +static const int cros_ec_linux_to_ec_id[] = {
> > +	[LED_COLOR_ID_RED]    = EC_LED_COLOR_RED,
> > +	[LED_COLOR_ID_GREEN]  = EC_LED_COLOR_GREEN,
> > +	[LED_COLOR_ID_BLUE]   = EC_LED_COLOR_BLUE,
> > +	[LED_COLOR_ID_YELLOW] = EC_LED_COLOR_YELLOW,
> > +	[LED_COLOR_ID_WHITE]  = EC_LED_COLOR_WHITE,
> > +	[LED_COLOR_ID_AMBER]  = EC_LED_COLOR_AMBER,
> > +};
> > +
> > +struct cros_ec_led_priv {
> > +	struct led_classdev_mc led_mc_cdev;
> > +	struct cros_ec_device *cros_ec;
> > +	enum ec_led_id led_id;
> > +};
> > +
> > +static inline struct cros_ec_led_priv *cros_ec_led_cdev_to_priv(struct led_classdev *led_cdev)
> > +{
> > +	return container_of(lcdev_to_mccdev(led_cdev), struct cros_ec_led_priv, led_mc_cdev);
> > +}
> > +
> > +union cros_ec_led_cmd_data {
> > +	struct ec_params_led_control req;
> > +	struct ec_response_led_control resp;
> > +} __packed;
> > +
> > +static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
> > +				union cros_ec_led_cmd_data *arg)
> > +{
> > +	int ret;
> > +	struct {
> > +		struct cros_ec_command msg;
> > +		union cros_ec_led_cmd_data data;
> > +	} __packed buf = {
> > +		.msg = {
> > +			.version = 1,
> > +			.command = EC_CMD_LED_CONTROL,
> > +			.insize  = sizeof(arg->resp),
> > +			.outsize = sizeof(arg->req),
> > +		},
> > +		.data.req = arg->req
> > +	};
> > +
> > +	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	arg->resp = buf.data.resp;
> > +
> > +	return 0;
> > +}
> > +
> > +static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
> > +{
> > +	struct cros_ec_led_priv *priv = cros_ec_led_cdev_to_priv(led_cdev);
> > +	union cros_ec_led_cmd_data arg = {};
> > +
> > +	arg.req.led_id = priv->led_id;
> > +	arg.req.flags = EC_LED_FLAGS_AUTO;
> > +
> > +	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
> > +}
> > +
> > +static struct led_hw_trigger_type cros_ec_led_trigger_type;
> > +
> > +static struct led_trigger cros_ec_led_trigger = {
> > +	.name = "chromeos-auto",
> > +	.trigger_type = &cros_ec_led_trigger_type,
> > +	.activate = cros_ec_led_trigger_activate,
> > +};
> > +
> > +static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,
> > +					       enum led_brightness brightness)
> > +{
> > +	struct cros_ec_led_priv *priv = cros_ec_led_cdev_to_priv(led_cdev);
> > +	union cros_ec_led_cmd_data arg = {};
> > +	enum ec_led_colors led_color;
> > +	struct mc_subled *subled;
> > +	size_t i;
> > +
> > +	led_mc_calc_color_components(&priv->led_mc_cdev, brightness);
> > +
> > +	arg.req.led_id = priv->led_id;
> > +
> > +	for (i = 0; i < priv->led_mc_cdev.num_colors; i++) {
> > +		subled = &priv->led_mc_cdev.subled_info[i];
> > +		led_color = cros_ec_linux_to_ec_id[subled->color_index];
> > +		arg.req.brightness[led_color] = subled->brightness;
> > +	}
> > +
> > +	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
> > +}
> > +
> > +static int cros_ec_led_count_subleds(struct device *dev,
> > +				     struct ec_response_led_control *resp,
> > +				     unsigned int *max_brightness)
> > +{
> > +	unsigned int range, common_range = 0;
> > +	int num_subleds = 0;
> > +	size_t i;
> > +
> > +	for (i = 0; i < EC_LED_COLOR_COUNT; i++) {
> > +		range = resp->brightness_range[i];
> > +
> > +		if (!range)
> > +			continue;
> > +
> > +		num_subleds++;
> > +
> > +		if (!common_range)
> > +			common_range = range;
> > +
> > +		if (common_range != range) {
> > +			/* The multicolor LED API expects a uniform max_brightness */
> > +			dev_warn(dev, "Inconsistent LED brightness values\n");
> 
> You shouldn't print a warning then return an error.
> 
> Please upgrade to dev_err().

Ack.

> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	if (!num_subleds)
> > +		return -EINVAL;
> > +
> > +	*max_brightness = common_range;
> > +	return num_subleds;
> > +}
> > +
> > +static const char *cros_ec_led_get_color_name(struct led_classdev_mc *led_mc_cdev)
> > +{
> > +	int color;
> > +
> > +	if (led_mc_cdev->num_colors == 1)
> > +		color = led_mc_cdev->subled_info[0].color_index;
> > +	else
> > +		color = LED_COLOR_ID_MULTI;
> > +
> > +	return led_get_color_name(color);
> > +}
> > +
> > +static int cros_ec_led_probe_led(struct device *dev, struct cros_ec_device *cros_ec,
> 
> Odd naming choice.
> 
> How about cros_ec_led_probe_one() or cros_ec_led_init()?

Ack.

> > +				 enum ec_led_id id)
> > +{
> > +	union cros_ec_led_cmd_data arg = {};
> > +	struct cros_ec_led_priv *priv;
> > +	struct led_classdev *led_cdev;
> > +	struct mc_subled *subleds;
> > +	int ret, num_subleds;
> > +	size_t i, subled;
> 
> Why size_t for the iterator?

Habit, because ARRAY_SIZE() returns size_t.
Will change to int.

> > +	arg.req.led_id = id;
> > +	arg.req.flags = EC_LED_FLAGS_QUERY;
> > +	ret = cros_ec_led_send_cmd(cros_ec, &arg);
> > +	/* Unknown LED, skip */
> 
> Place the comment inside the if() or next to the return.

Ack.
 
> > +	if (ret == -EINVAL)
> > +		return 0;
> > +	if (ret == -EOPNOTSUPP)
> > +		return -ENODEV;
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	num_subleds = cros_ec_led_count_subleds(dev, &arg.resp,
> > +						&priv->led_mc_cdev.led_cdev.max_brightness);
> > +	if (num_subleds < 0)
> > +		return num_subleds;
> > +
> > +	priv->cros_ec = cros_ec;
> > +	priv->led_id = id;
> > +
> > +	subleds = devm_kcalloc(dev, num_subleds, sizeof(*subleds), GFP_KERNEL);
> > +	if (!subleds)
> > +		return -ENOMEM;
> > +
> > +	subled = 0;
> > +	for (i = 0; i < EC_LED_COLOR_COUNT; i++) {
> > +		if (!arg.resp.brightness_range[i])
> > +			continue;
> > +
> > +		subleds[subled].color_index = cros_ec_led_to_linux_id[i];
> > +		if (subled == 0)
> > +			subleds[subled].intensity = 100;
> > +		subled++;
> > +	}
> > +
> > +	priv->led_mc_cdev.subled_info = subleds;
> > +	priv->led_mc_cdev.num_colors = num_subleds;
> > +
> > +	led_cdev = &priv->led_mc_cdev.led_cdev;
> > +	led_cdev->brightness_set_blocking = cros_ec_led_brightness_set_blocking;
> > +	led_cdev->trigger_type = &cros_ec_led_trigger_type;
> > +	led_cdev->default_trigger = cros_ec_led_trigger.name;
> > +	led_cdev->hw_control_trigger = cros_ec_led_trigger.name;
> > +
> > +	led_cdev->name = devm_kasprintf(dev, GFP_KERNEL, "chromeos:%s:%s",
> > +					cros_ec_led_get_color_name(&priv->led_mc_cdev),
> > +					cros_ec_led_functions[id]);
> > +	if (!led_cdev->name)
> > +		return -ENOMEM;
> > +
> > +	return devm_led_classdev_multicolor_register(dev, &priv->led_mc_cdev);
> > +}
> > +
> > +static int cros_ec_led_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
> > +	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
> > +	int ret = 0;
> > +	size_t i;
> > +
> > +	for (i = 0; i < EC_LED_ID_COUNT; i++) {
> > +		ret = cros_ec_led_probe_led(dev, cros_ec, i);
> > +		if (ret)
> > +			break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct platform_device_id cros_ec_led_id[] = {
> > +	{ DRV_NAME, 0 },
> > +	{}
> > +};
> > +
> > +static struct platform_driver cros_ec_led_driver = {
> > +	.driver.name	= DRV_NAME,
> > +	.probe		= cros_ec_led_probe,
> > +	.id_table	= cros_ec_led_id,
> > +};
> > +
> > +static int __init cros_ec_led_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = led_trigger_register(&cros_ec_led_trigger);
> > +	if (ret)
> > +		return ret;
> 
> This has to be done before probe?

Nope, I think the can be moved into probe.
It makes everything easier.

> > +	ret = platform_driver_register(&cros_ec_led_driver);
> > +	if (ret)
> > +		led_trigger_unregister(&cros_ec_led_trigger);
> > +
> > +	return ret;
> > +};
> > +module_init(cros_ec_led_init);
> > +
> > +static void __exit cros_ec_led_exit(void)
> > +{
> > +	platform_driver_unregister(&cros_ec_led_driver);
> > +	led_trigger_unregister(&cros_ec_led_trigger);
> > +};
> > +module_exit(cros_ec_led_exit);
> > +
> > +MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
> > +MODULE_DESCRIPTION("ChromeOS EC LED Driver");
> > +MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net");
> > +MODULE_LICENSE("GPL");
> > 
> > -- 
> > 2.45.2
> > 
> 
> -- 
> Lee Jones [李琼斯]

