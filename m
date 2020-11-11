Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1812AF220
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 14:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgKKN2P (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 08:28:15 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36008 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgKKN2P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Nov 2020 08:28:15 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABDRtr7047674;
        Wed, 11 Nov 2020 07:27:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605101275;
        bh=5DywEUHKNJ5cXm51fkZLYQrZO7shFaxfdI2bky8hDEc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EMMa+UDCGt3u6Igo2utAp/I4864xwcdyXhj3f1QM3nC94212xIwT4U6J+tzYPdVk7
         TTC/yTei6lBWS4ziGEcJuFBaLLvBf9Ax7q4raTJJsx+zmii92M5jIr9hISgg/pcqta
         RPrXdysWgcEkH9LHAAv3uake/5otaLm5OE3lRFI0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABDRtTh035990
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Nov 2020 07:27:55 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 07:27:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 07:27:55 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABDRtT2038587;
        Wed, 11 Nov 2020 07:27:55 -0600
Subject: Re: [PATCH] leds: lp50xx: add missing fwnode_handle_put in error
 handling case
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201111032159.17833-1-miaoqinglang@huawei.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e803008d-2d68-6048-90dc-d05c311a5fb9@ti.com>
Date:   Wed, 11 Nov 2020 07:27:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111032159.17833-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 11/10/20 9:21 PM, Qinglang Miao wrote:
> Fix to goto child_out to do fwnode_handle_put(child)
> from the error handling case rather than simply return,
> as done elsewhere in this function.
>
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   drivers/leds/leds-lp50xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 5fb4f24aeb2e..49a997b2c781 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -488,7 +488,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
>   					   sizeof(*mc_led_info), GFP_KERNEL);
>   		if (!mc_led_info)
> -			return -ENOMEM;
> +			goto child_out;
>   

Thanks for the patch.

Need to set ret = -ENOMEM; then do child_out so the error is reported 
properly

Dan
