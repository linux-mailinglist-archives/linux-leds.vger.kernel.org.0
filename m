Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34882B9CAC
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 22:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgKSVKi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 16:10:38 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36598 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgKSVKi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 16:10:38 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJLAMpo113729;
        Thu, 19 Nov 2020 15:10:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605820222;
        bh=Aa9owdtChBq0Vud6FElifszzVskd35I01WdLJoXGt6Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CNLibd4Pbgu+wJ8eCiQFCeVs7NkcwXdjwDMr08Vl7wTwn0KRTgaVNKKzULj3DHA0i
         5fc6OI5m9hVpffkzEpg27gRYs9xw3/hBOgB5Jg89CaLNq3zEOUlZ1t42CpKxi9QU3z
         Iy15Bafvc8f00VtwhFJ/qKShePgKCmYKWm7Rcf6Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJLAMwk071440
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Nov 2020 15:10:22 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 15:10:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 15:10:22 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJLAM99021659;
        Thu, 19 Nov 2020 15:10:22 -0600
Subject: Re: [PATCH v2] leds: lp50xx: add missing fwnode_handle_put in error
 handling case
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201119070841.712-1-miaoqinglang@huawei.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <978b21a3-57da-e49f-975c-f803a18d1b7a@ti.com>
Date:   Thu, 19 Nov 2020 15:10:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119070841.712-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 11/19/20 1:08 AM, Qinglang Miao wrote:
> Fix to set ret and goto child_out for fwnode_handle_put(child)
> in the error handling case rather than simply return, as done
> elsewhere in this function.
>
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   v2: forget to set ret on v1
>
>   drivers/leds/leds-lp50xx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 5fb4f24ae..f13117eed 100644
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
Reviewed-by: Dan Murphy <dmurphy@ti.com>
