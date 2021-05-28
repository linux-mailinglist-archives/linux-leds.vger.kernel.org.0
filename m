Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EB8394822
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 23:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhE1VI6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 17:08:58 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:53102 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhE1VI5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 17:08:57 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id EC5951A205EA;
        Sat, 29 May 2021 00:00:27 +0300 (EEST)
Subject: Re: [PATCH v1 05/28] leds: el15203000: Correct headers (of*.h ->
 mod_devicetable.h)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-6-andy.shevchenko@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <f21ff98f-8728-eea1-f9ef-c14f64d31d0e@kaa.org.ua>
Date:   Sat, 29 May 2021 00:00:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510095045.3299382-6-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

10.05.21 12:50, Andy Shevchenko пише:
> There is no user of of*.h headers, but mod_devicetable.h.
> Update header block accordingly.
> 
> While at it, drop unneeded dependency to OF.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/leds/Kconfig           | 1 -
>  drivers/leds/leds-el15203000.c | 3 ++-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index dcbfcd491fd0..531c79155717 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -167,7 +167,6 @@ config LEDS_EL15203000
>  	tristate "LED Support for Crane EL15203000"
>  	depends on LEDS_CLASS
>  	depends on SPI
> -	depends on OF
>  	help
>  	  This option enables support for EL15203000 LED Board
>  	  (aka RED LED board) which is widely used in coffee vending
> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
> index bcdbbbc9c187..fcb90d7cd42f 100644
> --- a/drivers/leds/leds-el15203000.c
> +++ b/drivers/leds/leds-el15203000.c
> @@ -4,8 +4,9 @@
>  
>  #include <linux/delay.h>
>  #include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/property.h>
>  #include <linux/spi/spi.h>
>  
>  /*
> 

Reviewed-by: Oleh Kravchenko <oleg@kaa.org.ua>
