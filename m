Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50DEA7329A
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jul 2019 17:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387594AbfGXPUB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Jul 2019 11:20:01 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33014 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387503AbfGXPUB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jul 2019 11:20:01 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OFJvQ6128867;
        Wed, 24 Jul 2019 10:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563981597;
        bh=Te1Z/mYEAwZFFXy7ZHzkiSzhAT2ymp/imdLmxiqcyXo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=nShgbGGZ+PbhF189octCDzBu0N3lshFq0N848Gsk8dyvSQyovMhx+tn1KAYenheTM
         R7MyMKrXtWlwxXyo4aBbG/UCRnx5V9QxAaZpLvQYXjFQh49tQR2n4cBQ9ISE9p6NCP
         0+fOtY2Xs0bClDbST+DLzBDz0w4dIAz4JZsBgu5w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OFJumI085653
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 10:19:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 10:19:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 10:19:56 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OFJuea059093;
        Wed, 24 Jul 2019 10:19:56 -0500
Subject: Re: [PATCH v1 2/3] leds: lm36274: Switch to use
 fwnode_property_count_uXX()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
 <20190723201459.70449-2-andriy.shevchenko@linux.intel.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <aec99cd5-b813-eb02-3f36-fbea5cd6fe49@ti.com>
Date:   Wed, 24 Jul 2019 10:19:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190723201459.70449-2-andriy.shevchenko@linux.intel.com>
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

Thanks for the update

Acked-by: Dan Murphy <dmurphy@ti.com>


> ---
>   drivers/leds/leds-lm36274.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> index ed9dc857ec8f..836b60c9a2b8 100644
> --- a/drivers/leds/leds-lm36274.c
> +++ b/drivers/leds/leds-lm36274.c
> @@ -90,9 +90,7 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>   			snprintf(label, sizeof(label),
>   				 "%s:%s", lm36274_data->pdev->name, name);
>   
> -		lm36274_data->num_leds = fwnode_property_read_u32_array(child,
> -							  "led-sources",
> -							  NULL, 0);
> +		lm36274_data->num_leds = fwnode_property_count_u32(child, "led-sources");
>   		if (lm36274_data->num_leds <= 0)
>   			return -ENODEV;
>   
