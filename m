Return-Path: <linux-leds+bounces-6450-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8FCCB1C9
	for <lists+linux-leds@lfdr.de>; Thu, 18 Dec 2025 10:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CB953010E78
	for <lists+linux-leds@lfdr.de>; Thu, 18 Dec 2025 09:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1081632FA3F;
	Thu, 18 Dec 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCNqQ0ZN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C12E717B
	for <linux-leds@vger.kernel.org>; Thu, 18 Dec 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049351; cv=none; b=mD9wnMUEy/EMRvorCKnUAAgZbuoskzuyfXYi922cjdlU9CAtPtgxhWFWWRspY/kqSjjzmf/XesDQF0FsLo48MxO7zj01CJFMkzncgzXV9OVss0JSU3XNIOK9yhlDuDcnLsmJnrcfaJQbAkU/PEB9Y9BEBdkdm+q/u4gxO8IkbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049351; c=relaxed/simple;
	bh=M8R1W9w45wNbmNXzjsnUtrx48q5+svUbetCOgjF1O4c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+RBAfL0XCXx7wKf2MUJkHc6unYoBIPMVT9MEchxhivrO0LLgOt6s+uiBxPDu+gUAVVDQrNY2SJMQTw/ntJszcn1+27m0zIMamwpqDkaP9VPlMZcJJQwX7T5ANxB8IvwR+/WsQOB583xEAheHkLq2rV0R159qLlSAvt1rRu9Xr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCNqQ0ZN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61123C113D0
	for <linux-leds@vger.kernel.org>; Thu, 18 Dec 2025 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766049351;
	bh=M8R1W9w45wNbmNXzjsnUtrx48q5+svUbetCOgjF1O4c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=vCNqQ0ZNmeDcxTR2SpGFi5IXekrEXbS09qLEORG9dkR33hbHA2zMPgER0UmcR95U9
	 A0PR5ZDSG0YPFvgWGaHnsSR8sGkylj8RYGUCtP4TNyg/441p+Ch2T/C7TOpFLz/LkY
	 h95M6Ux6xhRIMSDZqbhQypLLjjxIy2t8O9fosE4E9XEA/LMdy550Bh6DYNmHoiWbA2
	 0SSFCgEmYGlAUIB49T/6YPOLSHqkZp9FjlSTEvoMmsytb3s8uuH+hrJCxySd59h+TC
	 6/LMvaL182wg4Ee+p0Ke8hVEgVHg/yjUtL32ZL9RtX/hpXV/3Ow2130WCRVw2E+ORa
	 XzJc+eE4rFz2Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37bbb36c990so11946891fa.0
        for <linux-leds@vger.kernel.org>; Thu, 18 Dec 2025 01:15:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9p6UrBC7XqcApQfc+fMt7AEH2w/ckCyE4d7D0+GbBCAkHqky2vJ08J0KHsssrzWO/+G2n5fYMtkIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfi55UuICFTNB5GgHKg9gqwRRnC2zV2O4Qyoyd6K/srQ/3TF4
	VU9E8lyOWT+zfy2oxRSqpRZ0nyTerqMnR4M3DCTsxO93RVP387WhtOi4QGekjh66wCMTN3uKQAo
	2m32KbexF2HisgrpuDxTE58NMjqBvbPuW54U87u0HMQ==
X-Google-Smtp-Source: AGHT+IGddlJU0seb2vkpl3ywZnH/NWQkhgcnYhtxgt58KbAEeph1cdDhqxyCkCn5cPrFBgqKLU4TcjAMvO/LX7XUeeE=
X-Received: by 2002:a05:651c:548:b0:37a:582b:9ae3 with SMTP id
 38308e7fff4ca-38113272b01mr6430371fa.17.1766049346640; Thu, 18 Dec 2025
 01:15:46 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Dec 2025 01:15:45 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Dec 2025 01:15:45 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251215175115.135294-5-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215175115.135294-1-sander@svanheule.net> <20251215175115.135294-5-sander@svanheule.net>
Date: Thu, 18 Dec 2025 01:15:45 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mdb7CWB9PmzXJyfvGjvG0iwuwUgfLuKJuMweRFvAhAoHg@mail.gmail.com>
X-Gm-Features: AQt7F2rUvr97O3iEgnnTgHzpdjlYUFzbEonXdFtHgSUK-RNIsoOlIwmvbiCA_I4
Message-ID: <CAMRc=Mdb7CWB9PmzXJyfvGjvG0iwuwUgfLuKJuMweRFvAhAoHg@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] pinctrl: Add RTL8231 pin control and GPIO support
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 18:51:12 +0100, Sander Vanheule <sander@svanheule.net> said:
> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.
>
> Debouncing is only available for the six highest GPIOs, and must be
> emulated when other pins are used for (button) inputs. Although
> described in the bindings, drive strength selection is currently not
> implemented.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

[snip]

> +#include <linux/bitfield.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "core.h"
> +#include "pinmux.h"
> +#include <linux/mfd/rtl8231.h>

Please put this together with other global headers.

> +	RTL8231_LED_PIN_DESC(33, RTL8231_REG_PIN_HI_CFG, 1),
> +	RTL8231_LED_PIN_DESC(34, RTL8231_REG_PIN_HI_CFG, 2),
> +	RTL8231_PWM_PIN_DESC(35, RTL8231_REG_FUNC1, 3),
> +	RTL8231_GPIO_PIN_DESC(36, RTL8231_REG_PIN_HI_CFG, 4),
> +};

Newline?

> +static const unsigned int PWM_PIN = 35;

Please use the RTL8231 prefix for all symbols.

> +static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
> +	unsigned int group_selector)
> +{
> +	const struct function_desc *func = pinmux_generic_get_function(pctldev, func_selector);
> +	const struct rtl8231_pin_desc *desc = rtl8231_pins[group_selector].drv_data;
> +	const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
> +	enum rtl8231_pin_function func_flag = (uintptr_t) func->data;
> +	unsigned int function_mask;
> +	unsigned int gpio_function;

Can you put these on the same line here and elsewhere?

> +
> +	if (!(desc->functions & func_flag))
> +		return -EINVAL;
> +
> +	function_mask = BIT(desc->offset);
> +	gpio_function = desc->gpio_function_value << desc->offset;
> +
> +	if (func_flag == RTL8231_PIN_FUNCTION_GPIO)
> +		return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
> +	else
> +		return regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);

Just drop the else.

> +		/*
> +		 * Set every pin that is not muxed as a GPIO to gpio-in. That
> +		 * way the pin will be high impedance when it is muxed to GPIO,
> +		 * preventing unwanted glitches.
> +		 * The pin muxes are left as-is, so there are no signal changes.
> +		 */
> +		regmap_field_write(field_dir, is_input | ~is_gpio);

This is an MDIO regmap. The operations may fail. Don't you want to check the
return values of regmap routines?

> +
> +static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
> +{
> +	struct pinctrl_dev *pctldev;
> +	int err;
> +
> +	err = devm_pinctrl_register_and_init(dev->parent, &rtl8231_pctl_desc, ctrl, &pctldev);
> +	if (err) {
> +		dev_err(dev, "failed to register pin controller\n");
> +		return err;

Please use dev_err_probe() here an elsewhere.

> +	}
> +
> +	err = rtl8231_pinctrl_init_functions(pctldev, &rtl8231_pctl_desc);
> +	if (err)
> +		return err;
> +
> +	err = pinctrl_enable(pctldev);
> +	if (err)
> +		dev_err(dev, "failed to enable pin controller\n");
> +
> +	return err;
> +}
> +
> +/*
> + * GPIO controller functionality
> + */
> +static int rtl8231_gpio_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> +	unsigned int offset, unsigned int *reg, unsigned int *mask)

Can you align the start of the line with the opening bracket?

Bart

