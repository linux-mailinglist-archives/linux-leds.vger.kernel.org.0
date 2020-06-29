Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C17420E550
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2020 00:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgF2Vfh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jun 2020 17:35:37 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34967 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbgF2Sks (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2020 14:40:48 -0400
Received: by mail-ed1-f68.google.com with SMTP id e15so13803467edr.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2020 11:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RxlE3frWwlWfzXPSu+fDyQbylRPjQog5d8nhnaN7bXU=;
        b=O5G/+aXMqfmwHtbRAAeKqRQrG4YbYEw4F99JSn7U1bUsuPvZFlCCRYbkz6a6aXVPpb
         VvUebLEVOUTrbKXIY2H0t/q+D96JkuPhN+7q1Os+t/TVYXoNiFZl89nna3RBVGN96w1m
         blInPhfbl5aS52NXsScDw37VXpSlLtehy9cmOPcOM2f5kiRy0+PZDSfHNRw0HWPEXa6K
         ccx7fwg3TvvbFXjcKyKbSO+Weviyo2blGeUDPfKR0wMPMjr/fRKOMezkepreTFNbEljJ
         JIeiROo8QwR7nsgJelVYqYVy47vXoX0B1PRVOSXwpKNWB0ihq8TMVASzHGJNEh/Tumae
         F7QQ==
X-Gm-Message-State: AOAM531Ma1/Wi8eQxN64FqVKphHZ5UAPKhH49gj+TqsOcmOmTuFAU6ye
        kAENTFwndY+QooUJ0FjAy/w=
X-Google-Smtp-Source: ABdhPJxV6a97SwexmTk2ZzmRvyM9qW6AV5KjYun5B4sBOFXb16T5LGo3hSCPrcOS7vzHkjxuh6wN3w==
X-Received: by 2002:aa7:d1c8:: with SMTP id g8mr18527786edp.337.1593456046566;
        Mon, 29 Jun 2020 11:40:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id u5sm304000ejz.15.2020.06.29.11.40.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 11:40:45 -0700 (PDT)
Date:   Mon, 29 Jun 2020 20:40:43 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] leds: s3c24xx: Convert to use GPIO descriptors
Message-ID: <20200629184043.GA21110@kozik-lap>
References: <20200627001015.427376-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200627001015.427376-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jun 27, 2020 at 02:10:15AM +0200, Linus Walleij wrote:
> This converts the s3c24xx LED driver to use GPIO descriptors
> and also modify all board files to account for these changes
> by registering the appropriate GPIO tables for each board.
> 
> The driver was using a custom flag to indicate open drain
> (tristate) but this can be handled by standard descriptor
> machine tables.
> 
> The driver was setting non-pull-up for the pin using the custom
> S3C24xx GPIO API, but this is a custom pin control system used
> by the S3C24xx and no generic GPIO function, so this has simply
> been pushed back into the respective board files.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mach-s3c24xx/common-smdk.c        | 67 +++++++++++++++-------
>  arch/arm/mach-s3c24xx/mach-mini2440.c      | 63 +++++++++++++++++---
>  arch/arm/mach-s3c24xx/mach-n30.c           | 54 +++++++++++++++--
>  arch/arm/mach-s3c24xx/mach-qt2410.c        | 12 +++-
>  arch/arm/mach-s3c24xx/mach-vr1000.c        | 38 +++++++++++-
>  drivers/leds/leds-s3c24xx.c                | 37 +++---------
>  include/linux/platform_data/leds-s3c24xx.h |  6 --
>  7 files changed, 200 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
> index 58e30cad386c..10fc804c4ec5 100644
> --- a/arch/arm/mach-s3c24xx/common-smdk.c
> +++ b/arch/arm/mach-s3c24xx/common-smdk.c
> @@ -14,6 +14,7 @@
>  #include <linux/timer.h>
>  #include <linux/init.h>
>  #include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/device.h>
>  #include <linux/platform_device.h>
>  
> @@ -44,29 +45,53 @@
>  
>  /* LED devices */
>  
> +static struct gpiod_lookup_table smdk_led4_gpio_table = {
> +	.dev_id = "s3c24xx_led.0",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 4, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table smdk_led5_gpio_table = {
> +	.dev_id = "s3c24xx_led.1",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 6, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),

The original code has here GPF(5).

> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table smdk_led6_gpio_table = {
> +	.dev_id = "s3c24xx_led.2",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 5, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),

Ditto, but GPF(6).

Rest looks fine. I will need Jacek's/Pavel's/Dan's ack to take it through
samsung-soc.

Best regards,
Krzysztof
