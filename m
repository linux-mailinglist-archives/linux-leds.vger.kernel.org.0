Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E09B122C58
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 13:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfLQM4V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 07:56:21 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60072 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQM4V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 07:56:21 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHCuCMN064150;
        Tue, 17 Dec 2019 06:56:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576587372;
        bh=1qUgNe6rvXdvP9mRolqQkKsWnzN3nvAWiLVZf6TRI+U=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=EQ9/fKgC2hOFL44pXoYPkcccs5aBLXdamoRU3yB3PAxwLUXG6lzfflUhe7mompcKg
         22GahX2PuIopZgqtYC/tYJTrc72KuVWjh4QtV9E85/Yeq86PFwyE274S7tDdIFUNAW
         xdtoSS+7OgiQfOTtg0IKhTOfwrsF3jlXwz3iqw9o=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHCuCNP062296
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 06:56:12 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 06:56:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 06:56:11 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHCuBvg129742;
        Tue, 17 Dec 2019 06:56:11 -0600
Subject: Re: [PATCH 2/2] leds: lm3692x: Allow to set ovp and brigthness mode
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com>
Date:   Tue, 17 Dec 2019 06:53:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

On 12/16/19 6:28 AM, Guido Günther wrote:
> Overvoltage protection and brightness mode are currently hardcoded
> as disabled in the driver. Make these configurable via DT.

Can we split these up to two separate patch series?

We are adding 2 separate features and if something is incorrect with one 
of the changes it is a bit hard to debug.

>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/leds/leds-lm3692x.c | 43 +++++++++++++++++++++++++++++++------
>   1 file changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 8b408102e138..2c084b333628 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -114,6 +114,7 @@ struct lm3692x_led {
>   	struct regulator *regulator;
>   	int led_enable;
>   	int model_id;
> +	u8 boost_ctrl, brightness_ctrl;
>   };
>   
>   static const struct reg_default lm3692x_reg_defs[] = {
> @@ -249,10 +250,7 @@ static int lm3692x_init(struct lm3692x_led *led)
>   	if (ret)
>   		goto out;
>   
> -	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
> -			LM3692X_BOOST_SW_1MHZ |
> -			LM3692X_BOOST_SW_NO_SHIFT |
> -			LM3692X_OCP_PROT_1_5A);
> +	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL, led->boost_ctrl);
>   	if (ret)
>   		goto out;

regmap_update_bits


>   
> @@ -268,8 +266,7 @@ static int lm3692x_init(struct lm3692x_led *led)
>   	if (ret)
>   		goto out;
>   
> -	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
> -			LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN);
> +	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL, led->brightness_ctrl);
>   	if (ret)
>   		goto out;
regmap_update_bits
>   
> @@ -326,6 +323,8 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
>   {
>   	struct fwnode_handle *child = NULL;
>   	struct led_init_data init_data = {};
> +	u32 ovp = 0;
> +	bool exp_mode;
>   	int ret;
>   
>   	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
> @@ -350,6 +349,38 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
>   		led->regulator = NULL;
>   	}
>   
> +	led->boost_ctrl = LM3692X_BOOST_SW_1MHZ |
> +		LM3692X_BOOST_SW_NO_SHIFT |
> +		LM3692X_OCP_PROT_1_5A;
Make this a #define and then it can be reused as a mask for 
regmap_update_bits
> +	ret = device_property_read_u32(&led->client->dev,
> +				       "ti,overvoltage-volts", &ovp);
> +	if (!ret) {

if (ret)

     set boost_ctrl to default value since the default is not 0

led->boost_ctrl |= LM3692X_OVP_29V;

else

      do case

> +		switch (ovp) {
> +		case 0:
> +			break;
> +		case 22:
If the value is 21v why is this case 22?  DT binding says 21 is the 
first value
> +			led->boost_ctrl |= LM3692X_OVP_21V;
> +			break;
> +		case 25:
> +			led->boost_ctrl |= LM3692X_OVP_25V;
> +			break;
> +		case 29:
> +			led->boost_ctrl |= LM3692X_OVP_29V;
> +			break;
> +		default:
> +			dev_err(&led->client->dev, "Invalid OVP %d\n", ovp);
> +			return -EINVAL;
> +		}
> +	}
> +	dev_dbg(&led->client->dev, "OVP: %dV", ovp);
> +
extra debug statement
> +	led->brightness_ctrl = LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN;
Same comment as before on the #define
> +	exp_mode = device_property_read_bool(&led->client->dev,
> +				     "ti,brightness-mapping-exponential");
> +	dev_dbg(&led->client->dev, "Exponential brightness: %d", exp_mode);

extra debug statement

Dan


