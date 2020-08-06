Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E7323DC83
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 18:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgHFQxW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Aug 2020 12:53:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56292 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgHFQwy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2020 12:52:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076F15Ev107938;
        Thu, 6 Aug 2020 10:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596726065;
        bh=SsDht611ujdkNQFc6BFSfYMna5LmuK9AurW2tYiBVyU=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=IydTJGkvBiT7VaX6EBJOe1Z1CzhZiR6dHukbm9n8mlGN/ogWpgM04AcWOGWWqilRV
         aVoxk2TSG5yjqHjWygESa/KQksSSpl/nyd+5j9Y0f+uKkuyeyay94f0K+0S0ahvi4w
         a3NIvRw6BmqgBwxkkKa4qNyqzlfEDuB14CS9L//w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 076F15G0015172
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 10:01:05 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 10:01:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 10:01:05 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076F14J2050834;
        Thu, 6 Aug 2020 10:01:04 -0500
Subject: Re: [PATCH 1/2] leds: is31fl319x: Add sdb pin and generate a 5ms low
 pulse when startup
To:     Grant Feng <von81@163.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200806062130.25187-1-von81@163.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7c828160-bef6-45b5-60d1-85c6074953c4@ti.com>
Date:   Thu, 6 Aug 2020 10:00:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806062130.25187-1-von81@163.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Grant

On 8/6/20 1:21 AM, Grant Feng wrote:
> generate a 5ms low pulse on sdb pin when startup, then the chip
> becomes more stable in the complex EM environment.
>
> Signed-off-by: Grant Feng <von81@163.com>
> ---
>   drivers/leds/leds-is31fl319x.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
> index ca6634b8683c..b4f70002cec9 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -16,6 +16,8 @@
>   #include <linux/of_device.h>
>   #include <linux/regmap.h>
>   #include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   
>   /* register numbers */
>   #define IS31FL319X_SHUTDOWN		0x00
> @@ -61,6 +63,7 @@
>   struct is31fl319x_chip {
>   	const struct is31fl319x_chipdef *cdef;
>   	struct i2c_client               *client;
> +	struct gpio_desc		*sdb_pin;
>   	struct regmap                   *regmap;
>   	struct mutex                    lock;
>   	u32                             audio_gain_db;
> @@ -265,6 +268,15 @@ static int is31fl319x_parse_dt(struct device *dev,
>   		is31->audio_gain_db = min(is31->audio_gain_db,
>   					  IS31FL319X_AUDIO_GAIN_DB_MAX);
>   
> +	is31->sdb_pin = gpiod_get(dev, "sdb", GPIOD_ASIS);

Since this is optional maybe use devm_gpiod_get_optional.

If this is required for stability then if the GPIO is not present then 
the parse_dt should return the error.

And use the devm_gpiod_get call.  Otherwise you are missing the 
gpiod_put when exiting or removing the driver.

Dan


