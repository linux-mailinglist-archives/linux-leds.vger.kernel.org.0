Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D043A017
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2019 15:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfFHN4Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 Jun 2019 09:56:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45964 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFHN4X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 8 Jun 2019 09:56:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x58DuK4G075410;
        Sat, 8 Jun 2019 08:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560002180;
        bh=bILsyMcX+WhP4GfRkFOWK/PnvPt9VLImwiibJDrqgyM=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=rwQJpukXKZZ0qJhwcWBAp/BxJcLZBARqgF2RzuRS0rkDMxW/Jn+qRavqkifEsylYC
         UACdUEbRBgluZwpPl7BF6hhNvkdgTYu8n7WS32mmX2dzNYVEb8rGB+1Dr6Wk0GKyf7
         zYY2TcNWlssuaGHa5o+XrI3xGRDWY3qSbkWaWp3w=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x58DuKlv025033
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Jun 2019 08:56:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 8 Jun
 2019 08:56:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 8 Jun 2019 08:56:20 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x58DuJvB060866;
        Sat, 8 Jun 2019 08:56:19 -0500
Subject: Re: [PATCH 2/2] Simplify LED registeration by
 devm_led_classdev_register()
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <linux-leds@vger.kernel.org>
References: <20190608121312.11056-1-oleg@kaa.org.ua>
 <20190608121312.11056-2-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f3e24a0a-15be-6c36-de35-231ce931f770@ti.com>
Date:   Sat, 8 Jun 2019 08:56:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608121312.11056-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/8/19 7:13 AM, Oleh Kravchenko wrote:

Missing a commit log.

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
