Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD10267113
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2019 16:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbfGLONd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Jul 2019 10:13:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45278 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfGLONd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jul 2019 10:13:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CEDRIT092587;
        Fri, 12 Jul 2019 09:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562940807;
        bh=YW3sK+F5zmkuKFJo+PPGd5WmyO9vtPWKKZvVyHOFWzM=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=ykAXzGqqnwpvPjg9N3nuoo+lffUPH6z0oIM5FEIQLp1STWAzVbZp9Q+Omae9hoddb
         NB6khMmARHV3v7N6RDSkgRtwdidtBTeguVGs6SDGpv2p9lr9T4UvHERIKKM3mFUXWJ
         Pjpef2/2uXCdKBZvmCopDewET1vf3kRMp3fXOATg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CEDRPj044580
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Jul 2019 09:13:27 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Jul 2019 09:13:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Jul 2019 09:13:26 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CEDQ1l044081;
        Fri, 12 Jul 2019 09:13:26 -0500
Subject: Re: [PATCH v3] leds: max77650: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        <bgolaszewski@baylibre.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190711074402.12257-1-nishkadg.linux@gmail.com>
 <20190711075405.12634-1-nishkadg.linux@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5aa4cb9b-3f0a-60da-a900-2ea58f979de7@ti.com>
Date:   Fri, 12 Jul 2019 09:12:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190711075405.12634-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 7/11/19 2:54 AM, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak.
> Hence create a new label, err_node_put, which puts the previous node and
> returns variable rv. Modify the mid-loop return statements to instead
> store the return value in rv and jump to err_node_put.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Reviewed-by: Dan Murphy <dmurphy@ti.com>


> ---
> Changes in v3:
> - Add change log.
> Changes in v2:
> - Change subject line to match previous patches on the same file.
> - Merge the of_node_put calls into a single call in a label at the end
>    of the function instead of calling it separately for each return
>    statement.
>
>   drivers/leds/leds-max77650.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
> index 6b74ce9cac12..1eb9998899e4 100644
> --- a/drivers/leds/leds-max77650.c
> +++ b/drivers/leds/leds-max77650.c
> @@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *pdev)
>   
>   	for_each_child_of_node(of_node, child) {
>   		rv = of_property_read_u32(child, "reg", &reg);
> -		if (rv || reg >= MAX77650_LED_NUM_LEDS)
> -			return -EINVAL;
> +		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
> +			rv = -EINVAL;
> +			goto err_node_put;
> +		}
>   
>   		led = &leds[reg];
>   		led->map = map;
> @@ -109,8 +111,10 @@ static int max77650_led_probe(struct platform_device *pdev)
>   		} else {
>   			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
>   							"max77650:%s", label);
> -			if (!led->cdev.name)
> -				return -ENOMEM;
> +			if (!led->cdev.name) {
> +				rv = -ENOMEM;
> +				goto err_node_put;
> +			}
>   		}
>   
>   		of_property_read_string(child, "linux,default-trigger",
> @@ -118,20 +122,23 @@ static int max77650_led_probe(struct platform_device *pdev)
>   
>   		rv = devm_of_led_classdev_register(dev, child, &led->cdev);
>   		if (rv)
> -			return rv;
> +			goto err_node_put;
>   
>   		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
>   		if (rv)
> -			return rv;
> +			goto err_node_put;
>   
>   		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
>   		if (rv)
> -			return rv;
> +			goto err_node_put;
>   	}
>   
>   	return regmap_write(map,
>   			    MAX77650_REG_CNFG_LED_TOP,
>   			    MAX77650_LED_TOP_DEFAULT);
> +err_node_put:
> +	of_node_put(child);
> +	return rv;
>   }
>   
>   static struct platform_driver max77650_led_driver = {
