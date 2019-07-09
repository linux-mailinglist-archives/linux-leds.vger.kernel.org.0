Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F086F63366
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2019 11:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfGIJbk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Jul 2019 05:31:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35167 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfGIJbk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Jul 2019 05:31:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so2454517wmg.0
        for <linux-leds@vger.kernel.org>; Tue, 09 Jul 2019 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yJGoyEUVe04ghlPBAiRSMxOfNeRDmZRLOGlGSZ3RhuY=;
        b=rqnKeKFjvWV2+mKs3dFf/1L6IRTNBJkA4VnQHtXllGQzIsJlwefKhcgiFdS2J01ObC
         HoB3s69MZhZ6+Wt95wiTGoJdHI+oGi+6ATxt5S+sRw/dQzcPqEg2MUhcdiO9OnZskuj8
         XNAC6hB2+Uw/NSI7ARjYIErlAz5FAuiBDVbJSc8x7A7CV+W5emZwsJZlIuI7BNq/4lUt
         O1Hv0JKjg7zfpa6uuo2F/o21JcyaBSlseMFLej56n11uaasGBx/+1It0lmGBW4Vy9ABE
         Eg2EU957+uxwWq2RfZh98sjALcDFDUePr/2Azx/nBObLuxWReaUIIt2tIt6nf9e8I3gZ
         /5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yJGoyEUVe04ghlPBAiRSMxOfNeRDmZRLOGlGSZ3RhuY=;
        b=iCd+WZ5MkrNaRkGSwEZmQ8JxHcJLcEPhU/zPdNxnkmus4a7OSdoBX83XCLD1bLVWaP
         uEjlR5yc9dGdENquik9BFJ5ratvdxJBGeveam/Yi1PMFdfbZSiETZRyzvwipCT+uiWp4
         vWHzBid7Ytrw7TA53vzo32H7oshRdBZ1/qDyrlwX2kNvoGOEiEw97mVDW+k8KBuOxQ5c
         66gu93A8KNkdiwN/v3Mkzj65el42aEzQsgg9hOamXUm55EM/leiBFSYgQhDUe5ajDsN0
         Xho5yQ2EIv/CDUxSPzjLAXTNf79p7Gxl1uAKeTHFNgF9kmQf1GVSPOI6e9upT+eCgzUy
         P5yA==
X-Gm-Message-State: APjAAAVjA5j7QfzEEwNiDx1CMNNqZiYf2ZuwiRyJKz9Jcvxgu8xQSWHv
        4JC9lvt4iKdhxaJRHEHBPRoiGA==
X-Google-Smtp-Source: APXvYqxaKfA0IPSQWqpEN1DXOFT+NZh2VNo/h4XIwGQO9RD28/m5pNHRYx4x8r8Sj6hw0LG/HUd+3w==
X-Received: by 2002:a1c:1bd7:: with SMTP id b206mr16469516wmb.85.1562664697503;
        Tue, 09 Jul 2019 02:31:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c14sm15454547wrr.56.2019.07.09.02.31.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 02:31:36 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:31:35 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH v2 4/4] backlight: add led-backlight driver
Message-ID: <20190709093135.ceuj5tszmuri52w2@holly.lan>
References: <20190708102700.23138-1-jjhiblot@ti.com>
 <20190708102700.23138-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708102700.23138-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 08, 2019 at 12:27:00PM +0200, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  drivers/video/backlight/Kconfig  |   7 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 235 +++++++++++++++++++++++++++++++
>  3 files changed, 243 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c

> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> new file mode 100644
> index 000000000000..7644277cfdbb
> --- /dev/null
> +++ b/drivers/video/backlight/led_bl.c
> @@ -0,0 +1,235 @@
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

Header should no longer be needed.

> +static int led_bl_probe(struct platform_device *pdev)
> +{
> +	struct backlight_properties props;
> +	struct led_bl_data *priv;
> +	int ret;
> +	int i;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->dev = &pdev->dev;
> +
> +	ret = led_bl_parse_dt(&pdev->dev, priv);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to parse DT data\n");
> +		return ret;
> +	}
> +	priv->leds = devm_kzalloc(&pdev->dev,
> +				  sizeof(struct led_classdev *) * priv->nb_leds,
> +				  GFP_KERNEL);
> +	if (!priv->leds)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->nb_leds; i++) {
> +		priv->leds[i] = devm_led_get(&pdev->dev, i);
> +		if (IS_ERR(priv->leds[i]))
> +			return PTR_ERR(priv->leds[i]);
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = priv->max_brightness;
> +	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
> +			&pdev->dev, priv, &led_bl_ops, &props);
> +	if (IS_ERR(priv->bl_dev)) {
> +		dev_err(&pdev->dev, "failed to register backlight\n");
> +		ret = PTR_ERR(priv->bl_dev);
> +		goto err;

goto is pointless for a pure-devm function.

> +	}
> +
> +	priv->bl_dev->props.brightness = priv->default_brightness;
> +	backlight_update_status(priv->bl_dev);

This will light up the backlight during backlight probe.

Can you take a look at pwm_backlight_initial_power_state() and decide
how much of it applies to an LED based backlight (the phandle stuff
certainly does).


Daniel.
