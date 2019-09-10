Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24779AE90E
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfIJL02 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:26:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34019 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbfIJL01 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:26:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id a11so9668927wrx.1
        for <linux-leds@vger.kernel.org>; Tue, 10 Sep 2019 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2U0vF9K5FUZesrb/f2dR+z0p/SVAlF7QvnXLB1ik3bo=;
        b=SRBVq+k/9dc8SXn1wOvnBCc62YimdTFEAa7BaW0MnrQ46cgN9H+PU81Tp9sHi+xsDJ
         1VSTFchloZhE48V5IFUIAurGh/6Hoe5uU1tpS8BYGUdnGZUOjcJzlb0IS/shw18Og+Cb
         t/dsc5/OJzyVYaoRVjx49msQUe2jgVctiuKDTkRxpshWJrEdhC62UEMB9aWVc4adn0Ce
         e49duMogzQrkfuF6b7Jrfm1mQx1qmlv49al+0aIW7ii4MEhz9RljbDMwtr71WfPrZDHI
         9DiOaPjXpQQMw2I2yd1YNj5GJM/M5hvw8zscYctV5caP6llagJrzf/RgH1+JXEfwIbjg
         cqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2U0vF9K5FUZesrb/f2dR+z0p/SVAlF7QvnXLB1ik3bo=;
        b=bSapp3WzOUT/7uu0MZvIo1NAzHP5AsfypgWXMphFU9uPVM6GpNlE6ofyhKScCW7OQX
         Kjq/h1KWHjaqetKAk+ZMIAlbdQXmpwmMaRRC3WYH0BIgNaVPwKIarYmpDg6bOrA2/grE
         lz0tL4ARXeWwiDeuuF/ejnUpljHI1FvuqmzD0837HQjQXORNFMdSoBU3IGhTZkQAmNUR
         8uzm1HsLF7CbOBJj7ySmQ5JKTn4LBKNresIltMWC2QdbOrodh94iWIwstdgzSIjwBxUc
         Nh1zOXwa63/FiVgc1HH0VjWFUeB/XDj5F09EO0VGwVx3BtAMzSxa9GMN6B/NfBzillDs
         MENQ==
X-Gm-Message-State: APjAAAUHXBNd9l5/lOI3zDzK4HinA/Kcug1EyUqOIiAdAirkwm5bLYzB
        713PPAW0lBgUAMubNAO4NjlUlQ==
X-Google-Smtp-Source: APXvYqwhEg3hf1AkS2G22feB0s4++EdgJF22iHMS+DuQWNtvuw8RWa4RD2zltWw9uEeHwxN8X39oTA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr23802140wrv.224.1568114785307;
        Tue, 10 Sep 2019 04:26:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y13sm36988391wrg.8.2019.09.10.04.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 04:26:24 -0700 (PDT)
Date:   Tue, 10 Sep 2019 12:26:22 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dridevel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v5 4/4] backlight: add led-backlight driver
Message-ID: <20190910112622.iflmknh5qplbfoyu@holly.lan>
References: <20190910105946.23057-1-jjhiblot@ti.com>
 <20190910105946.23057-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910105946.23057-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 10, 2019 at 12:59:46PM +0200, Jean-Jacques Hiblot wrote:
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
>  drivers/video/backlight/led_bl.c | 264 +++++++++++++++++++++++++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 8b081d61773e..585a1787618c 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
>  	help
>  	  Support for backlight control on RAVE SP device.
>  
> +config BACKLIGHT_LED
> +	tristate "Generic LED based Backlight Driver"
> +	depends on LEDS_CLASS && OF
> +	help
> +	  If you have a LCD backlight adjustable by LED class driver, say Y
> +	  to enable this driver.
> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 63c507c07437..2a67642966a5 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>  obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
> +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> new file mode 100644
> index 000000000000..a72456e11fb9
> --- /dev/null
> +++ b/drivers/video/backlight/led_bl.c
> @@ -0,0 +1,264 @@
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

Maybe this is a nitpick but it is one I have now raised three times and
I don't recall any response, what symbols from this header are used in
this file?

AFAICT everything defined in this header includes the string "gpio" and
that string doesn't appear anywhere in the file (except this line).


> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

Come to think of it, are you sure you need this include? devm_kzalloc()
doesn't comes from this file.


> +#define BKL_FULL_BRIGHTNESS 255

This is unused. Please remove.


Other than that, looks good!


Daniel.
