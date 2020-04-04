Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE7E419E45A
	for <lists+linux-leds@lfdr.de>; Sat,  4 Apr 2020 11:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgDDJ6o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Apr 2020 05:58:44 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55732 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgDDJ6o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Apr 2020 05:58:44 -0400
Received: by mail-pj1-f66.google.com with SMTP id fh8so4212823pjb.5;
        Sat, 04 Apr 2020 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ft8HSD7UsUrD7cFjLoCUpLGYHcAoeTVcF8sVzqPS/y8=;
        b=VXDfgQGb576L8wK7O0C87RvbKj5mqewuepd973cSA2ZixvCL/IuBi9/E+he2oDdr3C
         51e3ZYKEnSx6uYljwEuILDa/7P5jTnXs1gTrvDhcyYroxcbKjaOidcHR9DOOmPTXkBA6
         pV0f3bR1q+M67pxacwYhyg3u/IJ+ga+LijyEYnYEc6vNyWm8YcRrfxEiI49465ShXmTL
         /Z2XuIstFDsQRYB3GWQLFPjyMWgTYSzhHXx8GDBwig4PJ1huWIlcyHt3zwi/zGV2yILc
         rpstPZ0PY/FPc0Bw9BZqRk895/JvlEA0Ze0dfv67mEwQXuWC12BRLUyoM9CVa+QX3NvE
         Bf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ft8HSD7UsUrD7cFjLoCUpLGYHcAoeTVcF8sVzqPS/y8=;
        b=HxwSp/nm4hn+Z6KZag8b5fO51vPHV43JMQY9ZzGSPQ3rFmFOAUB+Pr78MI9XBrmjfj
         u85zXcfDmDXsDOakIYktaJNlqfATfCRD/NszoUUsfu+pmxrNCKYtSh+XD8nT6Nlsmvba
         7oq575WgtRy3VavKw/5oH+iLLcU7oXT21TrXm3fhal7NQ75lcdsiHnHd5TgMVI38zIsV
         jpDRuPVqqYi8PqDzTSAK7AgA6g8UeRHZvvwnuLKbed7WKiVVKxLo0gwfiRXgdaIBfhOw
         X1QCzQA5Z9ITUm3PNecGwK6AnwcoHcc3hvBnsQyIzNKGj36FIQA7Lw12CzntsOF+8tFG
         Hkqg==
X-Gm-Message-State: AGi0PuauEv8q2yw2XHedw8B0Royt8wQrFPUzssZNch2urGSSlsyW0asq
        NMjHTwvzv+qYCz81Mqyxt4oE2mr9j2hG/3c4Fi9ZVx61zHMCKg==
X-Google-Smtp-Source: APiQypKBPJ48Tmyap/R0p+vz2QVBZNYh5Kpz+LJPocOhG7glVfW8vY1reKxEdtwrG2Zg/WY2DjTAxitlaclgogeBvOI=
X-Received: by 2002:a17:90a:3602:: with SMTP id s2mr14578311pjb.143.1585994323275;
 Sat, 04 Apr 2020 02:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194757.2645388-1-luca@z3ntu.xyz> <20200330194757.2645388-3-luca@z3ntu.xyz>
In-Reply-To: <20200330194757.2645388-3-luca@z3ntu.xyz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 4 Apr 2020 12:58:31 +0300
Message-ID: <CAHp75Vf6ZS1UGUv-okzzcDNnMtjjBjGbjsXb8w6TmGcgKdhhfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 30, 2020 at 10:49 PM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>
> This device is controlled by two GPIO pins, one for enabling and the
> second one for switching between torch and flash mode.

...

> +config LEDS_SGM3140
> +       tristate "LED support for the SGM3140"
> +       depends on LEDS_CLASS_FLASH
> +       depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS

> +       depends on OF

depends on OF || COMPILE_TEST ?
But hold on...

...

> +#include <linux/of.h>

Perhaps switch this to property.h and replace OF with more generic
device property / fwnode API?

...

> +struct sgm3140 {
> +       bool enabled;
> +       struct gpio_desc *flash_gpio;
> +       struct gpio_desc *enable_gpio;
> +       struct regulator *vin_regulator;
> +
> +       /* current timeout in us */
> +       u32 timeout;
> +       /* maximum timeout in us */
> +       u32 max_timeout;
> +

> +       struct led_classdev_flash fled_cdev;

I guess it might be slightly better to make it first member of the
struct (I didn't check but the rationale is to put more often used
members at the beginning to utilize cachelines).

> +       struct v4l2_flash *v4l2_flash;
> +
> +       struct timer_list powerdown_timer;
> +};

...

> +static struct sgm3140 *flcdev_to_sgm3140(struct led_classdev_flash *flcdev)
> +{
> +       return container_of(flcdev, struct sgm3140, fled_cdev);
> +}

...and this becomes a no-op AFAICS (doesn't mean you need to remove it).

...

> +       struct device_node *child_node;

> +       child_node = of_get_next_available_child(pdev->dev.of_node, NULL);

> +       ret = of_property_read_u32(child_node, "flash-max-timeout-us",
> +                                  &priv->max_timeout);

> +       init_data.fwnode = of_fwnode_handle(child_node);

> +       of_node_put(child_node);

Device property / fwnode API?

--
With Best Regards,
Andy Shevchenko
