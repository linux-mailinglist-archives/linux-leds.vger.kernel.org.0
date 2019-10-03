Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A37DCACDB
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 19:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbfJCRau (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 13:30:50 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36674 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730028AbfJCRaq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 13:30:46 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93HNef8050113;
        Thu, 3 Oct 2019 12:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570123420;
        bh=iWtSBJKe76nynGhnxiOJ2Lg3nCj737L2QbGyJus8OHE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ata+h7vnlts4aIRPksMFgleVPIt3OELkhLgzkSJT8AwEhjMkDFV3VLBW5frWbZhz8
         9lLeYzkW7QmilsFkhY2SrY9ih7FUzt6UJwlSPQwIuu5o2od2B5BS6t6GR5Xpu8irGT
         65j/0TSJeoEC6x49nwjVjNyMTvWFbp0UCFhaznEM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93HNdRh005634
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Oct 2019 12:23:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 12:23:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 12:23:28 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93HNbUm045560;
        Thu, 3 Oct 2019 12:23:37 -0500
Subject: Re: [PATCH v8 5/5] backlight: add led-backlight driver
To:     Sebastian Reichel <sre@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>,
        <dmurphy@ti.com>, <linux-leds@vger.kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-6-jjhiblot@ti.com>
 <20191003114735.byayntpe35qqrjeu@earth.universe>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <074963ce-d28f-413a-f35c-d503589a4604@ti.com>
Date:   Thu, 3 Oct 2019 19:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003114735.byayntpe35qqrjeu@earth.universe>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sebastian,

On 03/10/2019 13:47, Sebastian Reichel wrote:
> Hi,
>
> On Thu, Oct 03, 2019 at 10:28:12AM +0200, Jean-Jacques Hiblot wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> This patch adds a led-backlight driver (led_bl), which is similar to
>> pwm_bl except the driver uses a LED class driver to adjust the
>> brightness in the HW. Multiple LEDs can be used for a single backlight.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>
> (with some suggestions below)

[...]


> I suggest to restructure:
>
> 1. call led_sysfs_disable
>
> 2. use devm_add_action_or_reset() to register the
>     led_sysfs_enable loop
>
> 3. use devm_backlight_device_register() to register BL
>
> 4. drop the remove function
>
>> +
>> +	backlight_update_status(priv->bl_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int led_bl_remove(struct platform_device *pdev)
>> +{
>> +	struct led_bl_data *priv = platform_get_drvdata(pdev);
>> +	struct backlight_device *bl = priv->bl_dev;
>> +	int i;
>> +
>> +	backlight_device_unregister(bl);
>> +
>> +	led_bl_power_off(priv);
>> +	for (i = 0; i < priv->nb_leds; i++)
>> +		led_sysfs_enable(priv->leds[i]);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id led_bl_of_match[] = {
>> +	{ .compatible = "led-backlight" },
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, led_bl_of_match);
>> +
>> +static struct platform_driver led_bl_driver = {
>> +	.driver		= {
>> +		.name		= "led-backlight",
>> +		.of_match_table	= of_match_ptr(led_bl_of_match),
> You should drop of_match_ptr(). Since the driver depends on OF,
> it will always simply return led_bl_of_match.
>
> (Also after removing the OF dependency from the driver it would
> either require led_bl_of_match to be marked __maybe_unused or
> moving it into a #if CONFIG_OF area to avoid warnings.)

Thanks for the suggestions. I think I'll work on them as a separate 
thing and post them after this is merged if there are no others changes 
required.

JJ

>
> -- Sebastian
>
>> +	},
>> +	.probe		= led_bl_probe,
>> +	.remove		= led_bl_remove,
>> +};
>> +
>> +module_platform_driver(led_bl_driver);
>> +
>> +MODULE_DESCRIPTION("LED based Backlight Driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:led-backlight");
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
