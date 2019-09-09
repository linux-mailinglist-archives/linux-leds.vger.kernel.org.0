Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E638AD613
	for <lists+linux-leds@lfdr.de>; Mon,  9 Sep 2019 11:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbfIIJxJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Sep 2019 05:53:09 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32920 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfIIJxJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Sep 2019 05:53:09 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so12497286wme.0
        for <linux-leds@vger.kernel.org>; Mon, 09 Sep 2019 02:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q0Bu4MUr8Rse6QepVD+Mo7/VVrikFAdvAtW78HC8sMg=;
        b=Bdcic7+lcLbSMXP63HOL8yGDSyRidRn33ahnPC9DyBQXs/uzkjDWHM6b+3k/T5b8rP
         B0EcqGZmUCTyCvJUwQmSpboPIL7qnlQNvmgn6UBWaCeq8OxhRiPa784Gi4iG4ziivAHe
         40DI6CbEhX8vC6FpHJuao5Ia8QbiRsojJzGqRn4PvkWrgyaQRQW8cqHcQ+fq9pvmnn57
         OTr9M3sOnmtmha2JM6yxCnLPt3ol5O/t3/kjj+47pamlrROJHzvMxkTNqp0WRQoja+4U
         NN+IVCqxOSJmxpEQRTn+Od7PnTqjxD4F9bnN/lmRbb0qrsSzeSADIEW/BnF3aXzyqR4y
         dEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q0Bu4MUr8Rse6QepVD+Mo7/VVrikFAdvAtW78HC8sMg=;
        b=sYR1MAbOl9DkFT2tiyhrTPn7fS67VySOyQ9cAedY5kc8CU6ZuN4hEnHmjFC4rC2S9J
         r+lcWRaRE6XcpqOLOOtDHzGtnhPl35t7YyUjrZyTqeTaPur65iJaOQr0AXOWsHagtoUy
         E6YqcyHWBJcfZ9vQTWBRaMqSAKt5ZcjD+TwZc9atZHBV36+p4hb1oZ76U0B8Y07jTyWD
         sEZiGaoceeJbKA8z9gJCyVoW29QKo32hGwjuIsh6pnkADSoh8HcNalO/U84+HiQq8ARa
         +4ib+A6cg7gxE5uWrgbFjD80uhDIdXLxuBfg1jHYEvkL2qx8tQm6lrejKtsSQIjW2Zsj
         wXgA==
X-Gm-Message-State: APjAAAX3Y3stvYWsdIOlIFspLbi1hShBg/tPuHt6GVo0nF80EUBV7PiH
        POtkS4IBXVRU2X7tntxR6a7zCA==
X-Google-Smtp-Source: APXvYqyD7rIWfK15PwhuVw8tOpuuhFAqh0A4/sE3kYWn0d2L0pLoNlfPN6HlEweSVm7rZWqOpmvIXg==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr19129801wmd.14.1568022787085;
        Mon, 09 Sep 2019 02:53:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id q15sm12234012wmb.28.2019.09.09.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 02:53:06 -0700 (PDT)
Date:   Mon, 9 Sep 2019 10:53:04 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH v4 4/4] backlight: add led-backlight driver
Message-ID: <20190909095304.67ehnpg6gckwpno4@holly.lan>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717141514.21171-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 17, 2019 at 04:15:14PM +0200, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/video/backlight/Kconfig  |   7 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 268 +++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> new file mode 100644
> index 000000000000..ac5ff78e7859
> --- /dev/null
> +++ b/drivers/video/backlight/led_bl.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
> + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> + *
> + * Based on pwm_bl.c
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>

Why do we need this header file?

> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define BKL_FULL_BRIGHTNESS 255

If we really need to have a full intensity constant then shouldn't we
use LED_FULL directly.

> +
> +struct led_bl_data {
> +	struct device		*dev;
> +	struct backlight_device	*bl_dev;
> +	struct led_classdev	**leds;
> +	bool			enabled;
> +	int			nb_leds;
> +	unsigned int		*levels;
> +	unsigned int		default_brightness;
> +	unsigned int		max_brightness;
> +};
> +
> +static int to_led_brightness(struct led_classdev *led, int value)
> +{
> +	return (value * led->max_brightness) / BKL_FULL_BRIGHTNESS;

This code looks broken.

For example led->max_brightness is 127 then the value this
function will pick values is in the interval 0..63 which is
wrong since we are not using the full range of the LED.

Similarly led->max_brightness is > 255 then we'll generate values
that are out-of-range


Daniel.
