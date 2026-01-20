Return-Path: <linux-leds+bounces-6683-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFBD3C549
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 11:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3596700160
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 09:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915C8345CC7;
	Tue, 20 Jan 2026 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GhRrHXHH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C22E8B75
	for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901927; cv=none; b=jj4CrcDlzf1rd9NnDMrAbLuEfXeCgcD5TlP1A7kekciSySD04UpyENEfcwezswkjwqaBYfohanpXtAQ/vdYSCL708o/81sjeivj7cdZMGpQnfgy/i/fkPSDZ60NpPbWhc9ER5hlh/3ztbzm1pGRxifzTZ8esCs9kCW6sgjaiPR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901927; c=relaxed/simple;
	bh=fe4X9cUXePaawaT4qNrxQlN770EBdOFRImJxWrnEhUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpl9AY/g6hZ7IoBMOUJrtJFJXFV3agt7m0TQQY1sABzzifMUVYUXfBGDy7fXIPBFIO3YmXx3+vdqcx/i8lfeBCfG+73hlZS/LT9UOd8pqW5MWlIDCyTw42G/fK5pp/rJqv+JOhCKZUevVK5G4wpt+TJVb8pDqyIXd8F8ta/FR3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GhRrHXHH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47edffe5540so44484645e9.0
        for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 01:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768901922; x=1769506722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPcPIZUGx04qHWK759PItSENS0mcgGK/1dry0pxcZSU=;
        b=GhRrHXHHA9XaNb+N7dT+VVb9laC5CpSkVTTKe+PupT/lRLgQ83mBZXWKCkmhAyi2UY
         CVCzzN67E8BjO7b6BiUpNDt9VF2SlDZlRjP29WGrb83debl1URarYxs1KzgmggvUOlnx
         8B6dHxQaV2NvYHurlqmcxVTujXImSXzUUoFFVIXzFE4zENdEKN/D0N4+tQ+jPyWtChp1
         4yb6XglKY4WsOcsujYTZXpK24Abwi37HLyLDVodkjtuzKGf//4fnEbsnuwW0uHW3K910
         KZ0sxV3yX5yJBUewQhBrB9njahWB7LEHtHVuv3s12+axHmCIxTK7EMcp6/cRS/j80r4A
         4r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901922; x=1769506722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPcPIZUGx04qHWK759PItSENS0mcgGK/1dry0pxcZSU=;
        b=lzvSsDGPbKQHtdOxpcFegZQGnUHia13/apcmdJJG934wONX0/C0X+ARRBwTbDs3oQu
         3/kVUU7v0ixsXQ+rxIakJ4PeAM2RkfxjTKA9K+A8xGlDasTeds6aWtVXDsfSNrdySavm
         AL59ggQwovjdBM4jKKwpnpIg136ll7eYn9zkc4hAurtV/7yf8jqKuSyndRqws+4+vYQr
         z1BJhkUoiE/2kMI/0sIkPlb8mv1fbfuaOahuzQlGqP+fElc/QGs+gP7mKDT3FF8FdqAF
         +bbchrEQ2zUI+aM0bVjkn1eajhc/fmdtZQkVeitYV9VKmpL43CGJCuhvNwuAxxN4FrMx
         utng==
X-Forwarded-Encrypted: i=1; AJvYcCXWw80ccYlOH/PeLJ8gm7KLRj4SUdNDgHJSwRrM5jM4MKBTtl522xrSkBCOtW0DJr8hExmpjlFpqHXG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mB1rx2yK+WMiWD6y6ymjOSXMMBJSAvf9Dzv+zDZEvZJRqfA0
	RjCeMj9ZrIJr6F6I09aF0hsc0qHQ1FR4qQjmytDU6uBSFgTycBpF8db8R9SxCrk//cA=
X-Gm-Gg: AY/fxX4oDgZa4Rqoa7ZTiFr8jSELUaRpzSbTmLgJO8oz0IlyKRvo20AMA0ES+8wXAuf
	J7z2DfE+WAsG4xMmNLta7PZbGoLMCf4r6YsRc79+vNB5nb/W1wDhGTUGbNGWDJLz7qhPdJU8aFR
	kop2H/7M4/y218UNEMq4pgDadu0xZkmxVeIuerm7iWHqqqJ/GtCYx4s8/sqmfIRxIqS+7a6DqYr
	X+wa7qZlDDs16Uq2jyspZeZGvJCgJFLe5comzDhOrDJ31XWqYZjV7CRglZYfPJKZWJNwidq3WT+
	0qU4qF+c9ixi58JS1AebFVYo3KiYWFHIZKEOi5l8/KNC4JQZUN2c7CDLxb1o34MQ9ESDtz0aa1f
	i+MVMMKvp3YOhC6+DLU4/mVetSJAj5pLIzdMQFv8rxhht2aE5nuthOTI+O01LdjzL23Zfvsx/zv
	fgEODNNxjzohPEgARNKM+rtKHTo5MzuZL6DwJDyQpFj8wVvpmrmLeCOxNv6VtHhJWbqG2EROU1v
	1nrM4yrFeMvg0F4Y61NQQp636np/HxOPqgO4x7VmKmrgrHsYz9O0VZXBeM3LUDIHcT9LFbA
X-Received: by 2002:a05:600c:1d14:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-4803e7a39damr16391835e9.13.1768901922024;
        Tue, 20 Jan 2026 01:38:42 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b267661sm298932175e9.13.2026.01.20.01.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:38:41 -0800 (PST)
Date: Tue, 20 Jan 2026 09:38:39 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <aW9NH5GTwSR-m7VQ@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
 <aVuN7zVUWJ1qsVh8@aspen.lan>
 <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
 <aWe-QA_grqNwnE4n@aspen.lan>
 <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>

On Tue, Jan 20, 2026 at 10:22:02AM +0530, tessolveupstream@gmail.com wrote:
>
>
> On 14-01-2026 21:33, Daniel Thompson wrote:
> > On Tue, Jan 13, 2026 at 12:47:26PM +0530, tessolveupstream@gmail.com wrote:
> >>
> >>
> >> On 05-01-2026 15:39, Daniel Thompson wrote:
> >>> On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
> >>>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
> >>>> single one. This allows panels that require driving several enable pins
> >>>> to be controlled by the backlight framework.
> >>>>
> >>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >>>> ---
> >>>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
> >>>>  1 file changed, 45 insertions(+), 16 deletions(-)
> >>>>
> >>>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> >>>> index 728a546904b0..037e1c111e48 100644
> >>>> --- a/drivers/video/backlight/gpio_backlight.c
> >>>> +++ b/drivers/video/backlight/gpio_backlight.c
> >>>> @@ -17,14 +17,18 @@
> >>>>
> >>>>  struct gpio_backlight {
> >>>>  	struct device *dev;
> >>>> -	struct gpio_desc *gpiod;
> >>>> +	struct gpio_desc **gpiods;
> >>>> +	unsigned int num_gpios;
> >>>
> >>> Why not use struct gpio_descs for this?
> >>>
> >>> Once you do that, then most of the gbl->num_gpios loops can be replaced with
> >>> calls to the array based accessors.
> >>>
> >>
> >> Based on your feedback, I have updated the implementation to use
> >> struct gpio_descs and array-based accessors, as recommended like
> >> below:
> >>
> >> git diff drivers/video/backlight/gpio_backlight.c
> >> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> >> index 037e1c111e48..e99d7a9dc670 100644
> >> --- a/drivers/video/backlight/gpio_backlight.c
> >> +++ b/drivers/video/backlight/gpio_backlight.c
> >> @@ -14,22 +14,37 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/property.h>
> >>  #include <linux/slab.h>
> >> +#include <linux/bitmap.h>
> >>
> >>  struct gpio_backlight {
> >>         struct device *dev;
> >> -       struct gpio_desc **gpiods;
> >> +       struct gpio_descs *gpiods;
> >>         unsigned int num_gpios;
> >>  };
> >>
> >>  static int gpio_backlight_update_status(struct backlight_device *bl)
> >>  {
> >>         struct gpio_backlight *gbl = bl_get_data(bl);
> >> -       unsigned int i;
> >> +       unsigned int n = gbl->num_gpios;
> >>         int br = backlight_get_brightness(bl);
> >> +       unsigned long *value_bitmap;
> >> +       int words = BITS_TO_LONGS(n);
> >> +
> >> +       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
> >
> > Not sure you need a kcalloc() here. If you want to support more than 32
> > GPIOs then you can pre-allocate space with a devm_kcalloc() in the probe
> > method rather than reallocate every time it is used.
> >
> > To be honest I don't really mind putting a hard limit on the maximum
> > gpl->num_gpios (so you can just use a local variable) and having no
> > allocation at all.
> >
>
> Thanks for the suggestion. I addressed the kcalloc() concern by
> moving the bitmap allocation to probe using devm_kcalloc() as
> below:
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 0eb42d8bf1d9..7af5dc4f0315 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -19,32 +19,25 @@
>  struct gpio_backlight {
>         struct device *dev;
>         struct gpio_descs *gpiods;
> -       unsigned int num_gpios;
> +       unsigned long *bitmap;
>  };
>
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>         struct gpio_backlight *gbl = bl_get_data(bl);
> -       unsigned int n = gbl->num_gpios;
> +       unsigned int n = gbl->gpiods->ndescs;
>         int br = backlight_get_brightness(bl);
> -       unsigned long *value_bitmap;
> -       int words = BITS_TO_LONGS(n);
> -
> -       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
> -       if (!value_bitmap)
> -               return -ENOMEM;
>
>         if (br)
> -               bitmap_fill(value_bitmap, n);
> +               bitmap_fill(gbl->bitmap, n);
>         else
> -               bitmap_zero(value_bitmap, n);
> +               bitmap_zero(gbl->bitmap, n);
>
> -       gpiod_set_array_value_cansleep(gbl->gpiods->ndescs,
> +       gpiod_set_array_value_cansleep(n,
>                                        gbl->gpiods->desc,
>                                        gbl->gpiods->info,
> -                                      value_bitmap);
> +                                      gbl->bitmap);
>
> -       kfree(value_bitmap);
>         return 0;
>  }
>
> @@ -67,22 +60,25 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>         struct device_node *of_node = dev->of_node;
> -       struct backlight_properties props;
> +       struct backlight_properties props = { };
>         struct backlight_device *bl;
>         struct gpio_backlight *gbl;
> -       int ret, init_brightness, def_value;
> -       unsigned int i;
> +       bool def_value;
> +       enum gpiod_flags flags;
> +       unsigned int n;
> +       int words;
>
> -       gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> -       if (gbl == NULL)
> +       gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
> +       if (!gbl)
>                 return -ENOMEM;
>
>         if (pdata)
>                 gbl->dev = pdata->dev;
>
>         def_value = device_property_read_bool(dev, "default-on");
> -
> -       gbl->gpiods = devm_gpiod_get_array(dev, NULL, GPIOD_ASIS);
> +       flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +
> +       gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
>         if (IS_ERR(gbl->gpiods)) {
>                 if (PTR_ERR(gbl->gpiods) == -ENODEV)
>                         return dev_err_probe(dev, -EINVAL,
> @@ -90,12 +86,17 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>                 return PTR_ERR(gbl->gpiods);
>         }
>
> -       gbl->num_gpios = gbl->gpiods->ndescs;
> -       if (gbl->num_gpios == 0)
> +       n = gbl->gpiods->ndescs;
> +       if (!n)
>                 return dev_err_probe(dev, -EINVAL,
> -                       "The gpios parameter is missing or invalid\n");
> +                       "No GPIOs provided\n");
> +
> +       words = BITS_TO_LONGS(n);
> +       gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
> +                                  GFP_KERNEL);
> +       if (!gbl->bitmap)
> +               return -ENOMEM;
>
> -       memset(&props, 0, sizeof(props));
>         props.type = BACKLIGHT_RAW;
>         props.max_brightness = 1;
>         bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> @@ -106,50 +107,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>         }
>
>         /* Set the initial power state */
> -       if (!of_node || !of_node->phandle) {
> +       if (!of_node || !of_node->phandle)
>                 /* Not booted with device tree or no phandle link to the node */
>                 bl->props.power = def_value ? BACKLIGHT_POWER_ON
>                                                     : BACKLIGHT_POWER_OFF;
> -       } else {
> -               bool all_high = true;
> -               unsigned long *value_bitmap;
> -               int words = BITS_TO_LONGS(gbl->num_gpios);
> -
> -               value_bitmap = kcalloc(words, sizeof(unsigned long),
> -                                      GFP_KERNEL);
> -               if (!value_bitmap)
> -                       return -ENOMEM;
> -
> -               ret = gpiod_get_array_value_cansleep(gbl->gpiods->ndescs,
> -                                                    gbl->gpiods->desc,
> -                                                    gbl->gpiods->info,
> -                                                    value_bitmap);
> -               if (ret) {
> -                       kfree(value_bitmap);
> -                       return dev_err_probe(dev, ret,
> -                               "failed to read initial gpio values\n");
> -               }
> -
> -               all_high = bitmap_full(value_bitmap, gbl->num_gpios);
> -
> -               kfree(value_bitmap);
> -               bl->props.power =
> -                       all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
> -       }
> -
> -       bl->props.brightness = 1;
> -
> -       init_brightness = backlight_get_brightness(bl);
> +       else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
> +               bl->props.power = BACKLIGHT_POWER_OFF;
> +       else
> +               bl->props.power = BACKLIGHT_POWER_ON;
>
> -       for (i = 0; i < gbl->num_gpios; i++) {
> -               ret = gpiod_direction_output(gbl->gpiods->desc[i],
> -                                            init_brightness);
> -               if (ret)
> -                       return dev_err_probe(dev, ret,
> -                                       "failed to set gpio %u direction\n",
> -                                       i);
> -       }
> +       bl->props.brightness = def_value ? 1 : 0;
>
> +       gpio_backlight_update_status(bl);
> +
>         platform_set_drvdata(pdev, bl);
>         return 0;
>  }
>
> Kindly confirm whether this approach aligns with your
> expectations.

As mentioned yesterday, I'd rather just review a v2 patch than this kind of
meta-patch. Please send a v2 patch instead.


Daniel.

