Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D927A507D6C
	for <lists+linux-leds@lfdr.de>; Wed, 20 Apr 2022 01:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358534AbiDSX6i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Apr 2022 19:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352109AbiDSX6g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Apr 2022 19:58:36 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E01F1D323
        for <linux-leds@vger.kernel.org>; Tue, 19 Apr 2022 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650412551; x=1681948551;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KKbVILJHDOZ2N6m0wCdUFAHCkLkQrMH0aZI7ADXChcU=;
  b=eOMVQ+cwwE9HVMUlo81oXXO+V1nQybzYC1RFCZc6mBeUffMXJ8OlvKTl
   nrA+YfPvnnhByF4WnE76sfstBwtTR9dlT3ZbNxAMDkwhjrqdYajUtnzkC
   Tt8Kh6bo2y3zBHPx13m5dVniC8h1uX2LpAVR+d3R8znKwUYsorhDTM+pR
   5hindj1ewvWFGpHAkluWJhwhD3o6kAYLsL+edOvdKsdPNZY4Sf/TW1XPQ
   WlxpsMrxgA5anvgSF25/LGa4dezSV0Wuc+Hj6wWzhGnEros5ha/gvg4ou
   RYzsWu/MjXqj/YAE6pXTNKOquupZIfV/MOwduBMf0E2WPxMuVs/OIgfpf
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; 
   d="scan'208";a="302502775"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 07:55:49 +0800
IronPort-SDR: jbl4hWlDNzVH110RtMbpB1ex/benQBpTFhL3H4LVuZM9JhtktNJgQXsYBfJtxcExsMt0nRev1l
 4kcTmpDF7mtTYiMT9fiGT7oDOgHZ7O9UviQOyHlQM2wdm9j1uOu4EalGyg4o9QwTggm+vASdhR
 yvM++eGjSrHyKXOsK6Pd8aaoE+ZtLe1e/Qw89737VuId4KHzqUdfnn1Bbe2fjiGTETjXfXoOhM
 5R9xTJhAlBZ8mKJoMe36DgDhgEiH61kWkQRQgwXZhVeUmSp9HuZfAYAr9sPCkMBupMZc44xU8d
 h4rflb+bBSQDkS0wumfhi1SC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Apr 2022 16:26:53 -0700
IronPort-SDR: 8FimgaXHderyeFoGiLiLEoILykqrQQV44LtS4hbjfcR7KM4v/YjIgjVTK0sOeEXW8V2x1yw1mV
 Tcn1dlt4y1nmJ80TV3xZZAiaFN7WmZAHzgJ5pYeyPgj1aLRvvZ8a+7A7un4AntKGAXIWUTaMUw
 EWiQqH4mvslLrhHhsQq+mlXwEliZMej2P6OloyjGmy5/NQDlK158ORKkp9rjy2HNzz7TGRyXL8
 gck64J4GYc38GNiy55itbxh+DpI7QuK5+Cs2ATdubpyjb+4Ow9hn+MT/P4+3b3TfcYHu/DHXsG
 bRU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Apr 2022 16:55:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kjgfr0B3nz1SVnx
        for <linux-leds@vger.kernel.org>; Tue, 19 Apr 2022 16:55:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650412546; x=1653004547; bh=KKbVILJHDOZ2N6m0wCdUFAHCkLkQrMH0aZI
        7ADXChcU=; b=LCqvtKdjRzDf5W/dOuU4+TSqtj4jJ6smpVH8RFQjhPvD0oWKSgK
        VNbKgZqe7cD95Wa4oWwwzQwFfFjHRTAt35h60/w1of/oOG9jfbrw4iqvuZS7dtTe
        aZtfiNytQfRTWGOEMs2tAcmlOzwo+vE0kys3+zkyflfi5RxJfbaxotJUsG4D0jJy
        WojFgUn199a5v964YoPbv5FCMw8NXqS+6upFcwqh5wpiQQtGpdju9BDzMHfoMB6A
        m60tmCvI2wmQoTXA6bLHrqCEivcB876f24T7gNJPXqdWy6pTqCQua5gzTqx0/f/H
        kRzjX0Tbt6TjZYydknqyZIUM109PRCFtLhg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id NOFLSg_ohRVc for <linux-leds@vger.kernel.org>;
        Tue, 19 Apr 2022 16:55:46 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kjgff0k5zz1Rvlx;
        Tue, 19 Apr 2022 16:55:37 -0700 (PDT)
Message-ID: <56f889d7-2305-ba7a-42af-9580d8f7df93@opensource.wdc.com>
Date:   Wed, 20 Apr 2022 08:55:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 13/48] ARM: pxa: use pdev resource for palmld mmio
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>, robert.jarzmik@free.fr,
        linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org, Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-14-arnd@kernel.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220419163810.2118169-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/20/22 01:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The palmld header is almost unused in drivers, the only
> remaining thing now is the PATA device address, which should
> really be passed as a resource.
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-ide@vger.kernel.org
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-pxa/palmld-pcmcia.c             |  3 ++-
>  arch/arm/mach-pxa/palmld.c                    | 12 +++++++++---
>  arch/arm/mach-pxa/{include/mach => }/palmld.h |  2 +-
>  drivers/ata/pata_palmld.c                     |  3 +--
>  4 files changed, 13 insertions(+), 7 deletions(-)
>  rename arch/arm/mach-pxa/{include/mach => }/palmld.h (98%)
> 
> diff --git a/arch/arm/mach-pxa/palmld-pcmcia.c b/arch/arm/mach-pxa/palmld-pcmcia.c
> index 07e0f7438db1..720294a50864 100644
> --- a/arch/arm/mach-pxa/palmld-pcmcia.c
> +++ b/arch/arm/mach-pxa/palmld-pcmcia.c
> @@ -13,9 +13,10 @@
>  #include <linux/gpio.h>
>  
>  #include <asm/mach-types.h>
> -#include <mach/palmld.h>
>  #include <pcmcia/soc_common.h>
>  
> +#include "palmld.h"
> +
>  static struct gpio palmld_pcmcia_gpios[] = {
>  	{ GPIO_NR_PALMLD_PCMCIA_POWER,	GPIOF_INIT_LOW,	"PCMCIA Power" },
>  	{ GPIO_NR_PALMLD_PCMCIA_RESET,	GPIOF_INIT_HIGH,"PCMCIA Reset" },
> diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
> index d85146957004..d821606ce0b5 100644
> --- a/arch/arm/mach-pxa/palmld.c
> +++ b/arch/arm/mach-pxa/palmld.c
> @@ -29,8 +29,8 @@
>  #include <asm/mach/map.h>
>  
>  #include "pxa27x.h"
> +#include "palmld.h"
>  #include <linux/platform_data/asoc-pxa.h>
> -#include <mach/palmld.h>
>  #include <linux/platform_data/mmc-pxamci.h>
>  #include <linux/platform_data/video-pxafb.h>
>  #include <linux/platform_data/irda-pxaficp.h>
> @@ -279,9 +279,15 @@ static inline void palmld_leds_init(void) {}
>   * HDD
>   ******************************************************************************/
>  #if defined(CONFIG_PATA_PALMLD) || defined(CONFIG_PATA_PALMLD_MODULE)
> +static struct resource palmld_ide_resources[] = {
> +	DEFINE_RES_MEM(PALMLD_IDE_PHYS, 0x1000),
> +};
> +
>  static struct platform_device palmld_ide_device = {
> -	.name	= "pata_palmld",
> -	.id	= -1,
> +	.name		= "pata_palmld",
> +	.id		= -1,
> +	.resource	= palmld_ide_resources,
> +	.num_resources	= ARRAY_SIZE(palmld_ide_resources),
>  };
>  
>  static struct gpiod_lookup_table palmld_ide_gpio_table = {
> diff --git a/arch/arm/mach-pxa/include/mach/palmld.h b/arch/arm/mach-pxa/palmld.h
> similarity index 98%
> rename from arch/arm/mach-pxa/include/mach/palmld.h
> rename to arch/arm/mach-pxa/palmld.h
> index 99a6d8b3a1e3..ee3bc15b71a2 100644
> --- a/arch/arm/mach-pxa/include/mach/palmld.h
> +++ b/arch/arm/mach-pxa/palmld.h
> @@ -9,7 +9,7 @@
>  #ifndef _INCLUDE_PALMLD_H_
>  #define _INCLUDE_PALMLD_H_
>  
> -#include "irqs.h" /* PXA_GPIO_TO_IRQ */
> +#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
>  
>  /** HERE ARE GPIOs **/
>  
> diff --git a/drivers/ata/pata_palmld.c b/drivers/ata/pata_palmld.c
> index 2448441571ed..400e65190904 100644
> --- a/drivers/ata/pata_palmld.c
> +++ b/drivers/ata/pata_palmld.c
> @@ -25,7 +25,6 @@
>  #include <linux/gpio/consumer.h>
>  
>  #include <scsi/scsi_host.h>
> -#include <mach/palmld.h>
>  
>  #define DRV_NAME "pata_palmld"
>  
> @@ -63,7 +62,7 @@ static int palmld_pata_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	/* remap drive's physical memory address */
> -	mem = devm_ioremap(dev, PALMLD_IDE_PHYS, 0x1000);
> +	mem = devm_platform_ioremap_resource(pdev, 0);
>  	if (!mem)
>  		return -ENOMEM;
>  

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
