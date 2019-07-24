Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072F67329F
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jul 2019 17:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfGXPUs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Jul 2019 11:20:48 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33128 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfGXPUs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jul 2019 11:20:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OFKEuF128927;
        Wed, 24 Jul 2019 10:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563981614;
        bh=WgnpXFDAQycvGdMjDKa9TPbqClE4k8oDqEX/WbHpI0M=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=cuuudRSDg3GN+VGRsxYnC2dQPC2y6AeagdAWI9rdY4fPS6CTPUAR4g23EaIu2uZ3h
         fy+z9PBMiXr1LG/v3SkeYakLiC72o82AqxQPcAYfRa6ggo1ksJ0mXNhaDWgdLEsmEh
         DjvEsKMjc4lEdUwWH3+gy/ikcI8kt5dqqs4yzFHA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OFKE74060578
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 10:20:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 10:20:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 10:20:13 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OFKDHn059823;
        Wed, 24 Jul 2019 10:20:13 -0500
Subject: Re: [PATCH v1 3/3] leds: lm3697: Switch to use
 fwnode_property_count_uXX()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
 <20190723201459.70449-3-andriy.shevchenko@linux.intel.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <77435da3-1e20-3718-bc5d-4a96367f5192@ti.com>
Date:   Wed, 24 Jul 2019 10:20:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190723201459.70449-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Andy

On 7/23/19 3:14 PM, Andy Shevchenko wrote:
> Use fwnode_property_count_uXX() directly, that makes code neater.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dan Murphy <dmurphy@ti.com>

> ---
>   drivers/leds/leds-lm3697.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 54e0e35df824..b71711aff8a3 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -244,10 +244,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>   		led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
>   						   led->control_bank * 2;
>   
> -		led->num_leds = fwnode_property_read_u32_array(child,
> -						       "led-sources",
> -						       NULL, 0);
> -
> +		led->num_leds = fwnode_property_count_u32(child, "led-sources");
>   		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
>   			dev_err(&priv->client->dev, "To many LED strings defined\n");
>   			continue;
