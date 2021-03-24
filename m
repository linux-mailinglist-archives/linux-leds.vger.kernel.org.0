Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA8C3474BE
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 10:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhCXJeg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 05:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbhCXJef (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 05:34:35 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486BFC061763;
        Wed, 24 Mar 2021 02:34:35 -0700 (PDT)
Received: from thinkpad (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id A0E62140A26;
        Wed, 24 Mar 2021 10:34:32 +0100 (CET)
Date:   Wed, 24 Mar 2021 10:34:31 +0000
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: Re: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Message-ID: <20210324103431.4b945915@thinkpad>
In-Reply-To: <20210324075631.5004-2-chenhui.zhang@axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
        <20210324075631.5004-2-chenhui.zhang@axis.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 24 Mar 2021 15:56:30 +0800
Hermes Zhang <chenhui.zhang@axis.com> wrote:

> From: Hermes Zhang <chenhuiz@axis.com>
> 
> Introduce a new multiple GPIOs LED driver. This LED will made of
> multiple GPIOs (up to 8) and will map different brightness to different
> GPIOs states which defined in dts file.

I wonder how many boards have such LEDs.

Also if it wouldn't be better to expand the original leds-gpio driver.
Probably depends on how much larger would such expansion make the
leds-gpio driver.

> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>

Why do you include slab.h?

> +
> +#define MAX_GPIO_NUM  8
> +
> +struct multi_gpio_led_priv {
> +	struct led_classdev cdev;
> +
> +	struct gpio_descs *gpios;
> +
> +	u8 *states;
> +	int nr_states;
> +};

Use flexible array members. Allocate with
  devm_kzalloc(dev, struct_size(priv, states, priv->nr_states),
               GFP_KERNEL)

> +
> +
> +static void multi_gpio_led_set(struct led_classdev *led_cdev,
> +	enum led_brightness value)
> +{
> +	struct multi_gpio_led_priv *priv;
> +	int idx;
> +
> +	DECLARE_BITMAP(values, MAX_GPIO_NUM);
> +
> +	priv = container_of(led_cdev, struct multi_gpio_led_priv, cdev);
> +
> +	idx = (value - LED_OFF) * priv->nr_states / (LED_FULL + 1);

LED_FULL / LED_OFF are deprecated, don't use them.

> +
> +	values[0] = priv->states[idx];
> +
> +	gpiod_set_array_value(priv->gpios->ndescs, priv->gpios->desc,
> +	    priv->gpios->info, values);
> +}
> +
> +static int multi_gpio_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct multi_gpio_led_priv *priv = NULL;
> +	int ret;
> +	const char *state = NULL;
> +	struct led_init_data init_data = {};
> +
> +	priv = devm_kzalloc(dev, sizeof(struct multi_gpio_led_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->gpios = devm_gpiod_get_array(dev, "led", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->gpios))
> +		return PTR_ERR(priv->gpios);
> +
> +	if (priv->gpios->ndescs >= MAX_GPIO_NUM) {
> +		dev_err(dev, "Too many GPIOs\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_count_u8_elems(node, "led-states");
> +	if (ret < 0)
> +		return ret;
> +
> +	priv->nr_states = ret;
> +	priv->states = devm_kzalloc(dev, sizeof(*priv->states) * priv->nr_states, GFP_KERNEL);
> +	if (!priv->states)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u8_array(node, "led-states", priv->states, priv->nr_states);
> +	if (ret)
> +		return ret;
> +
> +	priv->cdev.max_brightness = LED_FULL;

???? max_brightness is not 255 (= LED_FULL). max_brightness must be
derived from the led-states property.


> +	priv->cdev.default_trigger = of_get_property(node, "linux,default-trigger", NULL);
> +	priv->cdev.brightness_set = multi_gpio_led_set;
> +
> +	init_data.fwnode = of_fwnode_handle(node);
> +
> +	ret = devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	of_property_read_string(node, "default-state", &state);
> +	if (!strcmp(state, "on"))
> +		multi_gpio_led_set(&priv->cdev, LED_FULL);
> +	else
> +		multi_gpio_led_set(&priv->cdev, LED_OFF);

Again LED_FULL and LED_OFF...
What about default-state = "keep" ?

Hermes, do you actually have a device that controls LEDs this way? How
many brightness options do they have?

Also I think this functionality could be easily incorporated into the
existing leds-gpio driver, instead of creating new driver.

Moreover your driver can control only one LED, so it needs to be
probed multiple times for multiple LEDs. Meanwhile the leds-gpio driver
can register multiple LEDs in one probe...

Marek
