Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C45BB6A6A
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 20:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388203AbfIRSVD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 14:21:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54030 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388200AbfIRSVC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 14:21:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IIKoZe007568;
        Wed, 18 Sep 2019 13:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568830850;
        bh=mk1J1bxX/qV9LdpG8hTCViqMRxqXPXOYl6P5hZpjSjU=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=NZ6iUKEzkI36kTAaWDz30nD1CdUNXOMaIikyYcD3cpGTOe/2oPFrLneBeXV4vfeO9
         NF31xKotltaMys5htSfHMdEVRXoCQvKHZYTtZPeAsK+MqppPRk0BkHTzwyuu/uvwHF
         ACCsvliHwwFh+5jrnJV29VYib+8WSccTN6sDnkI8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IIKol5025979;
        Wed, 18 Sep 2019 13:20:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 13:20:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 13:20:50 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IIKoW2066248;
        Wed, 18 Sep 2019 13:20:50 -0500
Subject: Re: [PATCH 1/5] leds: lm3692x: Print error value on dev_err
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1568772964.git.agx@sigxcpu.org>
 <9f95299fe7f98e4defb445e2e29531465a3a3860.1568772964.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ab49dddc-87ec-d7db-fca4-e3fbf2673290@ti.com>
Date:   Wed, 18 Sep 2019 13:23:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9f95299fe7f98e4defb445e2e29531465a3a3860.1568772964.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

On 9/17/19 9:19 PM, Guido Günther wrote:
> This gives a way better idea what is going on.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Reviewed-by: Dan Murphy <dmurphy@ti.com>


> ---
>   drivers/leds/leds-lm3692x.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 3d381f2f73d0..487228c2bed2 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -174,19 +174,20 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
>   
>   	ret = lm3692x_fault_check(led);
>   	if (ret) {
> -		dev_err(&led->client->dev, "Cannot read/clear faults\n");
> +		dev_err(&led->client->dev, "Cannot read/clear faults: %d\n",
> +			ret);
>   		goto out;
>   	}
>   
>   	ret = regmap_write(led->regmap, LM3692X_BRT_MSB, brt_val);
>   	if (ret) {
> -		dev_err(&led->client->dev, "Cannot write MSB\n");
> +		dev_err(&led->client->dev, "Cannot write MSB: %d\n", ret);
>   		goto out;
>   	}
>   
>   	ret = regmap_write(led->regmap, LM3692X_BRT_LSB, led_brightness_lsb);
>   	if (ret) {
> -		dev_err(&led->client->dev, "Cannot write LSB\n");
> +		dev_err(&led->client->dev, "Cannot write LSB: %d\n", ret);
>   		goto out;
>   	}
>   out:
> @@ -203,7 +204,7 @@ static int lm3692x_init(struct lm3692x_led *led)
>   		ret = regulator_enable(led->regulator);
>   		if (ret) {
>   			dev_err(&led->client->dev,
> -				"Failed to enable regulator\n");
> +				"Failed to enable regulator: %d\n", ret);
>   			return ret;
>   		}
>   	}
> @@ -213,7 +214,8 @@ static int lm3692x_init(struct lm3692x_led *led)
>   
>   	ret = lm3692x_fault_check(led);
>   	if (ret) {
> -		dev_err(&led->client->dev, "Cannot read/clear faults\n");
> +		dev_err(&led->client->dev, "Cannot read/clear faults: %d\n",
> +			ret);
>   		goto out;
>   	}
>   
> @@ -409,7 +411,8 @@ static int lm3692x_remove(struct i2c_client *client)
>   
>   	ret = regmap_update_bits(led->regmap, LM3692X_EN, LM3692X_DEVICE_EN, 0);
>   	if (ret) {
> -		dev_err(&led->client->dev, "Failed to disable regulator\n");
> +		dev_err(&led->client->dev, "Failed to disable regulator: %d\n",
> +			ret);
>   		return ret;
>   	}
>   
> @@ -420,7 +423,7 @@ static int lm3692x_remove(struct i2c_client *client)
>   		ret = regulator_disable(led->regulator);
>   		if (ret)
>   			dev_err(&led->client->dev,
> -				"Failed to disable regulator\n");
> +				"Failed to disable regulator: %d\n", ret);
>   	}
>   
>   	mutex_destroy(&led->lock);
