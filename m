Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBFD2758AE
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 15:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgIWN2H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 09:28:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42808 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWN2H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2020 09:28:07 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NDS2nt080673;
        Wed, 23 Sep 2020 08:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600867682;
        bh=YDcX9TebS2FrWc3wBgOvGYyc6y7XELEPtQyYtPUmREs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=O6zkBacv95QbPq8neRbzKQQC2Z9nBO9YQxC+UzWRlCCe6oGsxxhk3av+kyPJlIRIc
         7fRwomP3a6PO1wT1qqyKvKla/BPJ0m9KEIjp7itRa68pN+R7Bfo5I/uIciSxFvloT8
         dHXEUe33L307mVlR4XO7cYsxweML+FdziDndTH4w=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NDS23o073685
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 08:28:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 08:28:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 08:28:01 -0500
Received: from [10.250.36.88] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NDS1GO010489;
        Wed, 23 Sep 2020 08:28:01 -0500
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <68c3f0c2-4a29-9f59-164c-d8f7fd06d3fd@ti.com>
Date:   Wed, 23 Sep 2020 08:27:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Christophe

On 9/22/20 4:05 PM, Christophe JAILLET wrote:
> In case of memory allocation failure, we must release some resources as
> done in all other error handling paths of the function.
>
> 'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
> is called when we break out of a 'device_for_each_child_node' loop.
>
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/leds/leds-lp50xx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 47144a37cb94..8178782f2a8a 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -487,8 +487,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   		 */
>   		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
>   					   sizeof(*mc_led_info), GFP_KERNEL);
> -		if (!mc_led_info)
> -			return -ENOMEM;
> +		if (!mc_led_info) {
> +			ret = -ENOMEM;
> +			goto child_out;
> +		}
>   
>   		fwnode_for_each_child_node(child, led_node) {
>   			ret = fwnode_property_read_u32(led_node, "color",

Thanks for the patch

Acked-by: Dan Murphy <dmurphy@ti.com>

