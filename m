Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F728567DB
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 13:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfFZLnM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 07:43:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42166 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfFZLnM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 07:43:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QBh1Dt058683;
        Wed, 26 Jun 2019 06:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561549381;
        bh=WwHQvZVuBJ4XkmGdaiEi/q1HLv0u2YRrE022uHmQfco=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vJiJSx52YheNxh4+vzGtHWRxLhdiTdGWocbHw532ycmCrV6zNoXKf1Yf+g+J4pcPh
         1By/DdttkARmrxJM4ndjIf4x8bkugjXs8+wAKtovVhW3dWiW5ddvCQYPqZLm17bHE2
         dYYnnsn24/w7//JL/RKCWSCrUNJJtSmwVEpk+E3E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QBh1fe101052
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 06:43:01 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 06:43:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 06:43:01 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QBh0dl016779;
        Wed, 26 Jun 2019 06:43:00 -0500
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
To:     Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
CC:     <daniel.thompson@linaro.org>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <jacek.anaszewski@gmail.com>,
        <robh+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <pbacon@psemi.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e3a6f4f5-8da9-f533-5cef-3ae2a87f52bc@ti.com>
Date:   Wed, 26 Jun 2019 06:42:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 6/24/19 11:05 PM, Brian Dodge wrote:
> The original patch adding this driver and DT bindings improperly
> used "arc" as the vendor-prefix. This adds "arctic" which is the
> proper prefix and retains "arc" to allow existing users of the
> "arc" prefix to update to new kernels. There is at least one
> (Samsung Chromebook Plus)
>
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> ---
>   drivers/video/backlight/arcxcnn_bl.c | 35 +++++++++++++++++++++++++----------
>   1 file changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
> index 7b1c0a0..14c67f2 100644
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
> + * Copyright 2016-2019  pSemi, Inc.
> + * Author : Brian Dodge <bdodge@psemi.com>
>    */
>   
>   #include <linux/backlight.h>
> @@ -191,27 +191,40 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
>   	if (ret == 0)
>   		lp->pdata->initial_brightness = prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
Can you add new lines between these and all below
>   	if (ret == 0)
>   		lp->pdata->led_config_0 = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,led-config-1", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
>   	if (ret == 0)
>   		lp->pdata->led_config_1 = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,dim-freq", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
>   	if (ret == 0)
>   		lp->pdata->dim_freq = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,comp-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
>   	if (ret == 0)
>   		lp->pdata->comp_config = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,filter-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,filter-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node,
> +				"arc,filter-config", &prog_val);
>   	if (ret == 0)
>   		lp->pdata->filter_config = (u8)prog_val;
>   
> -	ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,trim-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
>   	if (ret == 0)
>   		lp->pdata->trim_config = (u8)prog_val;
>   
> @@ -381,6 +394,8 @@ static int arcxcnn_remove(struct i2c_client *cl)
>   }
>   
>   static const struct of_device_id arcxcnn_dt_ids[] = {
> +	{ .compatible = "arctic,arc2c0608" },
> +	/* here to remaim compatible with an older binding, do not use */

s/remaim/remain


>   	{ .compatible = "arc,arc2c0608" },
>   	{ }
>   };
> @@ -404,5 +419,5 @@ static struct i2c_driver arcxcnn_driver = {
>   module_i2c_driver(arcxcnn_driver);
>   
>   MODULE_LICENSE("GPL v2");
> -MODULE_AUTHOR("Brian Dodge <bdodge@arcticsand.com>");
> +MODULE_AUTHOR("Brian Dodge <bdodge@psemi.com>");
>   MODULE_DESCRIPTION("ARCXCNN Backlight driver");
