Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B8422268C
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 17:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgGPPKS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 11:10:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41654 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgGPPKS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 11:10:18 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GFAAjr102655;
        Thu, 16 Jul 2020 10:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594912210;
        bh=MuC1mrGD+6kFJ+XNShFDWlSuTcu/XarBjg4fbxwV/QM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=c0AK/jN6A09iPlLK/JzmrdCxOZmFSpbcPlku0s+TD/91yCLNHJhqzTXhuR2z8R8vU
         8AmhL8LMwllskX9JJVQ1maqb7pgjXpclc9pMm3RZKnII3jdNaKW49DpKXT6QsziXSK
         TuRP7+6wIp0VopP2lHuWUtSbvl4NV/fD/5HeUub8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GFAAuw096948
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 10:10:10 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 10:10:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 10:10:09 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GFA933008409;
        Thu, 16 Jul 2020 10:10:09 -0500
Subject: Re: [PATCH v5 2/3] leds: initial support for Turris Omnia LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, <jacek.anaszewski@gmail.com>
References: <20200716114047.22943-1-marek.behun@nic.cz>
 <20200716114047.22943-3-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3c500c32-a97f-3fa9-cb32-2c3c263e6988@ti.com>
Date:   Thu, 16 Jul 2020 10:10:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716114047.22943-3-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/16/20 6:40 AM, Marek Behún wrote:
> This adds basic support for LEDs on the front side of CZ.NIC's Turris
> Omnia router.
>
> There are 12 RGB LEDs. The controller supports HW triggering mode for
> the LEDs, but this driver does not support it yet, and sets all the LEDs
> defined in device-tree into SW mode upon probe.
>
> This driver uses the multi color LED framework.

As Pavel pointed out to me

s/multi color/multicolor


> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>   drivers/leds/Kconfig             |  11 ++
>   drivers/leds/Makefile            |   1 +
>   drivers/leds/leds-turris-omnia.c | 293 +++++++++++++++++++++++++++++++
>   3 files changed, 305 insertions(+)
>   create mode 100644 drivers/leds/leds-turris-omnia.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 0d034453eeb9..125349824bb6 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -176,6 +176,17 @@ config LEDS_EL15203000
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called leds-el15203000.
>   
> +config LEDS_TURRIS_OMNIA
> +	tristate "LED support for CZ.NIC's Turris Omnia"
> +	depends on LEDS_CLASS_MULTI_COLOR
> +	depends on I2C
> +	depends on MACH_ARMADA_38X || COMPILE_TEST
> +	depends on OF
> +	help
> +	  This option enables basic support for the LEDs found on the front
> +	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> +	  front panel.
> +
>   config LEDS_LM3530
>   	tristate "LCD Backlight driver for LM3530"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 53a752c32e67..664ca1d719c4 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -87,6 +87,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
>   obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
>   obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> +obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>   obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>   obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>   obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> new file mode 100644
> index 000000000000..c735e837ef48
> --- /dev/null
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia LEDs driver
> + *
> + * 2020 by Marek Behun <marek.behun@nic.cz>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include "leds.h"
> +
> +#define OMNIA_BOARD_LEDS		12
> +#define OMNIA_LED_NUM_CHANNELS		3
> +
> +#define CMD_LED_MODE			3
> +#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
> +#define CMD_LED_MODE_USER		0x10
> +
> +#define CMD_LED_STATE			4
> +#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
> +#define CMD_LED_STATE_ON		0x10
> +
> +#define CMD_LED_COLOR			5
> +#define CMD_LED_SET_BRIGHTNESS		7
> +#define CMD_LED_GET_BRIGHTNESS		8
> +
> +#define OMNIA_CMD			0
> +
> +#define OMNIA_CMD_LED_COLOR_LED		1
> +#define OMNIA_CMD_LED_COLOR_R		2
> +#define OMNIA_CMD_LED_COLOR_G		3
> +#define OMNIA_CMD_LED_COLOR_B		4
> +#define OMNIA_CMD_LED_COLOR_LEN		5
> +
> +struct omnia_led {
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
> +	int reg;
> +};
> +
> +#define to_omnia_led(l)			container_of(l, struct omnia_led, mc_cdev)
> +

Still funky spacing here

Otherwise

Reviewed-by: Dan Murphy <dmurphy@ti.com>


