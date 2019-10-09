Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3797D0D2E
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 12:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfJIKwT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 06:52:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55772 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfJIKwS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 06:52:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Aq8Ax054543;
        Wed, 9 Oct 2019 05:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570618328;
        bh=ktaw6ZnLw43SX95dpH3rXIgCjNUTGzTpN+8L4m/vs/Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X1yDGh7j+sP2kNWxJn5JnuCiiLGI3v4qBTGsbDfS0dsxdBrgiUCxVNcOU4FDs9oNw
         b7YWKBh40kM9kw/QPHp59SjF8371NF0L/e/N/Kl8dCqRhiFdPUmjfOImt2e6LloLed
         ot8oonamk3lff7E8XNCm8Xea7qPTaoa2qxR98STg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99Aq8dN114672
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 05:52:08 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 05:52:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 05:52:08 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99Aq5Ig029117;
        Wed, 9 Oct 2019 05:52:06 -0500
Subject: Re: [PATCH v10 1/6] leds: populate the device's of_node
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-2-jjhiblot@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2291da29-22d4-0637-a711-07c480120be6@ti.com>
Date:   Wed, 9 Oct 2019 13:52:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009085127.22843-2-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi JJ,

On 09/10/2019 11:51, Jean-Jacques Hiblot wrote:
> If initialization data is available and its fwnode is actually a of_node,
> store this information in the led device's structure. This will allow the
> device to use or provide OF-based API such (devm_xxx).
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   drivers/leds/led-class.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 647b1263c579..bfa1b1033274 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -276,8 +276,10 @@ int led_classdev_register_ext(struct device *parent,
>   		mutex_unlock(&led_cdev->led_access);
>   		return PTR_ERR(led_cdev->dev);
>   	}
> -	if (init_data && init_data->fwnode)
> +	if (init_data && init_data->fwnode) {
>   		led_cdev->dev->fwnode = init_data->fwnode;
> +		led_cdev->dev->of_node = to_of_node(init_data->fwnode);
> +	}
>   
>   	if (ret)
>   		dev_warn(parent, "Led %s renamed to %s due to name collision",

This doesn't compile, as it's missing #include <linux/of.h> (which you 
add in the next patch).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
