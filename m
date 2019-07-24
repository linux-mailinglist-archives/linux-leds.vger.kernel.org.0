Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F357329C
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jul 2019 17:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387609AbfGXPUH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Jul 2019 11:20:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49928 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387598AbfGXPUH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jul 2019 11:20:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OFJWrj063869;
        Wed, 24 Jul 2019 10:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563981572;
        bh=Ua5DWgIEXvCLn2aPdIuqggdMNXp+esjXU5HJ26C5IH4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=g14J0rPilZFTpoNFJNPC2RiaiZmtzxYdO9pJ2Hvyo2WydcLMXTsDr6ckLysH2R7BU
         RfuMAtVyOyYuflfjQFvd8uQ0cYV/lY4BzV5vFiXz7bCz0YrwQ7pRYp6gTEqF2NtRTi
         brYMZfsKPr2UMV/ev8UyYICYGXjl2RARuvh8Kmhc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OFJWUt010721
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 10:19:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 10:19:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 10:19:32 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OFJVLP121293;
        Wed, 24 Jul 2019 10:19:31 -0500
Subject: Re: [PATCH v1 1/3] leds: lm3532: Switch to use
 fwnode_property_count_uXX()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <dbd94f8c-04a4-05de-40d0-d9c0ad9dac0f@ti.com>
Date:   Wed, 24 Jul 2019 10:19:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
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

Thanks for the update with the new call

Acked-by: Dan Murphy <dmurphy@ti.com>


> ---
>   drivers/leds/leds-lm3532.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index 180895b83b88..646100724971 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -549,10 +549,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>   				lm3532_als_configure(priv, led);
>   		}
>   
> -		led->num_leds = fwnode_property_read_u32_array(child,
> -							       "led-sources",
> -							       NULL, 0);
> -
> +		led->num_leds = fwnode_property_count_u32(child, "led-sources");
>   		if (led->num_leds > LM3532_MAX_LED_STRINGS) {
>   			dev_err(&priv->client->dev, "To many LED string defined\n");
>   			continue;
