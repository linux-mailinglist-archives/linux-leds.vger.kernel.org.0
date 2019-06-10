Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601B03B74B
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 16:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390801AbfFJO0T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 10:26:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54528 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389402AbfFJO0S (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 10:26:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AEQEMO082091;
        Mon, 10 Jun 2019 09:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560176774;
        bh=MCwaAhpKgdZSCwWZz2rkXa2waxvi+eQpdMMUcAWPYf4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=GjipU9CTt+oG8o2nq5X8BO8NcEcTDSJUXh9SBMFVq2FoSCUlMrZsM1guz7XudAFFF
         ms9lZhkXhkg8cUn+SePQMF4PU4u9KGtX5r6O7q3K7ytTRhSscJNhRURyja5XFpf10Y
         9G0+NseY7qD/wRPthRINwWV2gi7g3Yiau5K5rr+U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AEQEAV111202
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 09:26:14 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 09:26:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 09:26:14 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AEQEm9083299;
        Mon, 10 Jun 2019 09:26:14 -0500
Subject: Re: [PATCH v2 2/2] Simplify LED registeration by
 devm_led_classdev_register()
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <linux-leds@vger.kernel.org>
References: <20190608143039.13454-1-oleg@kaa.org.ua>
 <20190608143039.13454-2-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ab1404dc-0a1f-ec23-3e3d-8eec86d24c8b@ti.com>
Date:   Mon, 10 Jun 2019 09:26:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608143039.13454-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/8/19 9:30 AM, Oleh Kravchenko wrote:
> Then there is no need to set np or store it.

Huh?  This does not really explain much about what this patch is doing.

Dan


> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   drivers/leds/leds-cr0014114.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
> index 91deb40db307..880089ef9a9b 100644
> --- a/drivers/leds/leds-cr0014114.c
> +++ b/drivers/leds/leds-cr0014114.c
> @@ -183,12 +183,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>   	size_t			i = 0;
>   	struct cr0014114_led	*led;
>   	struct fwnode_handle	*child;
> -	struct device_node	*np;
>   	int			ret;
>   	const char		*str;
>   
>   	device_for_each_child_node(priv->dev, child) {
> -		np = to_of_node(child);
>   		led = &priv->leds[i];
>   
>   		ret = fwnode_property_read_string(child, "label", &str);
> @@ -207,8 +205,7 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>   		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
>   		led->ldev.brightness_set_blocking = cr0014114_set_sync;
>   
> -		ret = devm_of_led_classdev_register(priv->dev, np,
> -						    &led->ldev);
> +		ret = devm_led_classdev_register(priv->dev, &led->ldev);
>   		if (ret) {
>   			dev_err(priv->dev,
>   				"failed to register LED device %s, err %d",
> @@ -217,8 +214,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>   			return ret;
>   		}
>   
> -		led->ldev.dev->of_node = np;
> -
>   		i++;
>   	}
>   
