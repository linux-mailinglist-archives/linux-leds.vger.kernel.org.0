Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9C1164D14
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 18:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgBSR4f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 12:56:35 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51142 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgBSR4f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 12:56:35 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JHuSU5009210;
        Wed, 19 Feb 2020 11:56:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582134988;
        bh=NjuzcmoUHTvYL3VcoNva3wXzFr/w550bjZ+AIRaeHME=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fFR5/roPr0Pknb3A9oO9aBcZxFv/fRlCxD2m9UNOqsJl++s2nnNvuWke/C9MzJUnU
         z7Z2B0pvVAc6o0dGyrJYcE08nPG2Cp1k6drBP0uedSdK3G/ziA8HJ3texPbkQjXWSI
         VRIA1Tsno45So7vafDmgmb2IzmQpp9AT3hDcJzog=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JHuStL012258;
        Wed, 19 Feb 2020 11:56:28 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 11:56:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 11:56:28 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JHuSlR093961;
        Wed, 19 Feb 2020 11:56:28 -0600
Subject: Re: [PATCH v3] leds: add SGI IP30 led support
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
References: <20200219160504.27555-1-tbogendoerfer@suse.de>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <93666bdf-dc53-e091-157e-e5b988ede97c@ti.com>
Date:   Wed, 19 Feb 2020 11:51:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219160504.27555-1-tbogendoerfer@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thomas

On 2/19/20 10:05 AM, Thomas Bogendoerfer wrote:
> This patch implemenets a driver to support the front panel LEDs of
> SGI Octane (IP30) workstations.
>
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---

Sorry for the delay in review I had to go back and review v1 and v2 
comments


> Changes in v3:
>    - rebased to 5.6-rc2
>
> Changes in v2:
>    - use led names conforming to include/dt-bindings/leds/common.h
>    - read LED state from firmware
>    - leave setting up to user
>
>   drivers/leds/Kconfig     | 11 ++++++
>   drivers/leds/Makefile    |  1 +
>   drivers/leds/leds-ip30.c | 80 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 92 insertions(+)
>   create mode 100644 drivers/leds/leds-ip30.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea3711..c664d84e1667 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -846,6 +846,17 @@ config LEDS_TPS6105X
>   	  It is a single boost converter primarily for white LEDs and
>   	  audio amplifiers.
>   
> +config LEDS_IP30
> +	tristate "LED support for SGI Octane machines"
> +	depends on LEDS_CLASS
> +	depends on SGI_MFD_IOC3
> +	help
> +	  This option enables support for the Red and White LEDs of
> +	  SGI Octane machines.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-ip30.
> +
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
>   
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d7e1107753fb..46bd611a03a9 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>   obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>   obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> +obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>   
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
> new file mode 100644
> index 000000000000..82453a216f81
> --- /dev/null
> +++ b/drivers/leds/leds-ip30.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED Driver for SGI Octane machines
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/leds.h>
> +
> +struct ip30_led {
> +	struct led_classdev cdev;
> +	u32 __iomem *reg;
> +};
> +
> +static void ip30led_set(struct led_classdev *led_cdev,
> +			enum led_brightness value)
> +{
> +	struct ip30_led *led = container_of(led_cdev, struct ip30_led, cdev);
> +

With max_brightness set to 1 then value will only be either 1 or 0.  The 
LED framework takes care of gating the values.

So this can be writel(value, led->reg);

Otherwise

Reviewed-by: Dan Murphy <dmurphy@ti.com>


