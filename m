Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1559C627E2
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2019 20:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730848AbfGHSFu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jul 2019 14:05:50 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53854 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfGHSFu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jul 2019 14:05:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68I5gQj024246;
        Mon, 8 Jul 2019 13:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562609142;
        bh=wEbRu5aOTp26FP4TWDfUijCXFiai/2iU7BfaaA5fAN4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dBDfzhoOpie6dafFJ81O8Dg2iNxxIOcT8M/K5LlvPJMLBOGG4vA08UDO1CIgDgO3S
         4BH4D0OxKi6M5dklrHO2QzwqTMcMVxagJlCS4xbiUG5T5DPGiS2U4WKrYKVOe0Wn8L
         xOXpFfJMMqX/BpJue0j+NnQEZQfmMNmaAzJuFFx0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68I5ghh040190
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jul 2019 13:05:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 13:05:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 13:05:42 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68I5fos046757;
        Mon, 8 Jul 2019 13:05:41 -0500
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
To:     Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
CC:     <daniel.thompson@linaro.org>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <jacek.anaszewski@gmail.com>,
        <robh+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <pbacon@psemi.com>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c7b8da82-e492-db1e-5a02-e4a36df6a6f2@ti.com>
Date:   Mon, 8 Jul 2019 13:05:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Brian

On 6/30/19 7:28 PM, Brian Dodge wrote:
> The original patch adding this driver and DT bindings improperly
> used "arc" as the vendor-prefix. This adds "arctic" which is the
> proper prefix and retains "arc" to allow existing users of the
> "arc" prefix to update to new kernels. There is at least one
> (Samsung Chromebook Plus)
>
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   drivers/video/backlight/arcxcnn_bl.c | 41 +++++++++++++++++++++++++++---------
>   1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
> index 7b1c0a0..a419554 100644
> --- a/drivers/video/backlight/arcxcnn_bl.c
> +++ b/drivers/video/backlight/arcxcnn_bl.c
> @@ -1,9 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Backlight driver for ArcticSand ARC_X_C_0N_0N Devices
> + * Backlight driver for pSemi (formerly ArcticSand) ARC_X_C_0N_0N Devices
>    *
> - * Copyright 2016 ArcticSand, Inc.
> - * Author : Brian Dodge <bdodge@arcticsand.com>

I know you are the original author from ArcticSand but did pSemi 
actually own the copyright in 2016?

I don't think this is a big issue just wondering if we should retain the 
ArcticSand copyright as well.

Probably a question for your legal department.

Otherwise

Reviewed-by: Dan Murphy <dmurphy@ti.com>

> + * Copyright 2016-2019  pSemi, Inc.
> + * Author : Brian Dodge <bdodge@psemi.com>
>    */
>   
>   #include <linux/backlight.h>
> @@ -191,27 +191,46 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
>   	if (ret == 0)
>   		lp->pdata->initial_brightness = prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
> +
>   	if (ret == 0)
>   		lp->pdata->led_config_0 = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,led-config-1", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
> +
>   	if (ret == 0)
>   		lp->pdata->led_config_1 = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,dim-freq", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
> +
>   	if (ret == 0)
>   		lp->pdata->dim_freq = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,comp-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
> +
>   	if (ret == 0)
>   		lp->pdata->comp_config = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,filter-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,filter-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node,
> +				"arc,filter-config", &prog_val);
> +
>   	if (ret == 0)
>   		lp->pdata->filter_config = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,trim-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
> +
>   	if (ret == 0)
>   		lp->pdata->trim_config = (u8)prog_val;
>   
> @@ -381,6 +400,8 @@ static int arcxcnn_remove(struct i2c_client *cl)
>   }
>   
>   static const struct of_device_id arcxcnn_dt_ids[] = {
> +	{ .compatible = "arctic,arc2c0608" },
> +	/* here to remain compatible with an older binding, do not use */
>   	{ .compatible = "arc,arc2c0608" },
>   	{ }
>   };
> @@ -404,5 +425,5 @@ static struct i2c_driver arcxcnn_driver = {
>   module_i2c_driver(arcxcnn_driver);
>   
>   MODULE_LICENSE("GPL v2");
> -MODULE_AUTHOR("Brian Dodge <bdodge@arcticsand.com>");
> +MODULE_AUTHOR("Brian Dodge <bdodge@psemi.com>");
>   MODULE_DESCRIPTION("ARCXCNN Backlight driver");
