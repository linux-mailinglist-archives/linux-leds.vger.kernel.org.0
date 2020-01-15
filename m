Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EF213C387
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jan 2020 14:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgAONtV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jan 2020 08:49:21 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57192 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgAONtU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jan 2020 08:49:20 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDnCS7081492;
        Wed, 15 Jan 2020 07:49:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579096152;
        bh=fzI8kwVr+5hXza98K+UGFAa4YR6NM4hcw0gyyXklECs=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=yDGgmpDwC7/JeK4bFtiYSW6KQQIS4Tg93kmRCW6l+ee5OnzyQrtRBrX1pcgVDQC3b
         vFdd0FFfn42LXep5fbrksYnt5py6jsgfhWOWinXCZP/DsIAYDzh2E8GUh5hZUBc8YX
         SSSZYvo10sq8stVzQrBVVkyTMi+OXx+Se63A14/4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDnCnp057301;
        Wed, 15 Jan 2020 07:49:12 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:49:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:49:12 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDnBYi056543;
        Wed, 15 Jan 2020 07:49:11 -0600
Subject: Re: [PATCH] leds: add SGI IP30 led support
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20200115130536.11453-1-tbogendoerfer@suse.de>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b5bf7941-3fc1-641d-5482-509eeae34eac@ti.com>
Date:   Wed, 15 Jan 2020 07:46:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200115130536.11453-1-tbogendoerfer@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thomas

On 1/15/20 7:05 AM, Thomas Bogendoerfer wrote:
> This patch implemenets a driver to support the front panel LEDs of
> SGI Octane (IP30) workstations.

Thanks for the patch

Some nitpicks below


> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>   drivers/leds/Kconfig     | 11 ++++++
>   drivers/leds/Makefile    |  1 +
>   drivers/leds/leds-ip30.c | 82 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 94 insertions(+)
>   create mode 100644 drivers/leds/leds-ip30.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b68520ac251..8ef0fe900928 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -836,6 +836,17 @@ config LEDS_LM36274
>   	  Say Y to enable the LM36274 LED driver for TI LMU devices.
>   	  This supports the LED device LM36274.
>   
> +config LEDS_IP30
> +	tristate "LED support for SGI Octane machines"
> +	depends on LEDS_CLASS
> +	depends on SGI_MFD_IOC3
What is the dependency on the MFD?
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
> index 2da39e896ce8..89a527ac8ab6 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
>   obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>   obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
> +obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>   

Extra tab


>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
> new file mode 100644
> index 000000000000..b0a83f78c439
> --- /dev/null
> +++ b/drivers/leds/leds-ip30.c
> @@ -0,0 +1,82 @@
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
> +	if (value)
> +		writel(1, led->reg);
> +	else
> +		writel(0, led->reg);
> +}
> +
> +static int ip30led_create(struct platform_device *pdev, int num)
> +{
> +	struct resource *res;
> +	struct ip30_led *data;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, num);
> +	if (!res)
> +		return -EBUSY;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->reg = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->reg))
> +		return PTR_ERR(data->reg);
> +
> +
> +	if (num == 0) {
> +		data->cdev.name = "ip30:white";
This also needs a function as defined in dt-bindings/common.h
> +		data->cdev.default_trigger = "default-on";

The name, color, function and trigger can be pulled from the DT or Firmware.

The firmware should contain a node for each LED to be configured.

> +	} else {
> +		data->cdev.name = "ip30:red";
Same as above
> +		data->cdev.default_trigger = "panic";
> +		writel(0, data->reg);

Is the LED on by default?

Dan

