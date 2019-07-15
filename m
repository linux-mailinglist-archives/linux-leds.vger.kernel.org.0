Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3908D69B19
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 21:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfGOS7h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 14:59:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39400 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729237AbfGOS7g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 14:59:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FIxSf4052471;
        Mon, 15 Jul 2019 13:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563217168;
        bh=N3fMjata3zL3geeXyrSCAk5wL3P5q8EO2OfKf0/Z79c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SMvkglYAenP3PtJS0uEm6spz+vd28Q4Eeo4ap+M3fAWNKgw9IDFAVuwpEuhZ2/Vmt
         O2JREk6zIEJ98l5FPiM3J4l7CmSkWUeqkRkPR2Hzwg8SJx+Zfoqv7bKP8OMGt9E+Za
         ts/7dt6TGwsqi0KAw/KN4XQHKLkVONXMtghvi8TM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FIxS7e083798
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jul 2019 13:59:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 15
 Jul 2019 13:59:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 15 Jul 2019 13:59:28 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FIxRqk008774;
        Mon, 15 Jul 2019 13:59:27 -0500
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <9c17e9cc-8162-7b5d-2db9-d2bed20969c5@ti.com>
Date:   Mon, 15 Jul 2019 13:59:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190715155657.22976-3-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

JJ

On 7/15/19 10:56 AM, Jean-Jacques Hiblot wrote:
> A LED is usually powered by a voltage/current regulator. Let the LED core
> know about it. This allows the LED core to turn on or off the power supply
> as needed.

This allows the LED core to turn on or off managed power supplies.


>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   drivers/leds/led-class.c | 15 ++++++++++++
>   drivers/leds/led-core.c  | 50 +++++++++++++++++++++++++++++++++++++---
>   drivers/leds/leds.h      |  1 +
>   include/linux/leds.h     |  4 ++++
>   4 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4793e77808e2..cadd43c30d50 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -253,6 +253,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
>   {
>   	char name[LED_MAX_NAME_SIZE];
>   	int ret;
> +	struct regulator *regulator;
>   
>   	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>   	if (ret < 0)
> @@ -272,6 +273,20 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
>   		dev_warn(parent, "Led %s renamed to %s due to name collision",
>   				led_cdev->name, dev_name(led_cdev->dev));
>   
> +	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
Store the regulator in  led_cdev->regulator and drop the else case below.
> +	if (IS_ERR(regulator)) {
> +		if (PTR_ERR(regulator) != -ENODEV) {
> +			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> +				led_cdev->name);
> +			device_unregister(led_cdev->dev);
> +			mutex_unlock(&led_cdev->led_access);
> +			return PTR_ERR(regulator);
> +		}
> +		led_cdev->regulator = NULL;
> +	} else {
> +		led_cdev->regulator = regulator;
> +	}
> +
>   	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>   		ret = led_add_brightness_hw_changed(led_cdev);
>   		if (ret) {
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 7107cd7e87cf..a12b880b0a2f 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -23,6 +23,33 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>   
> +static bool __led_need_regulator_update(struct led_classdev *led_cdev,
> +					int brightness)
> +{
> +	bool new_state = (brightness != LED_OFF);
> +
> +	return led_cdev->regulator && led_cdev->regulator_state != new_state;
> +}
> +
> +static int __led_handle_regulator(struct led_classdev *led_cdev,
> +				int brightness)
> +{
> +	int rc;

Should there be a check for the regulator pointer.

If (!led_cdev->regulator)

     return 0;


Otherwise

Reviewed-by: Dan Murphy <dmurphy@ti.com>

<snip>

