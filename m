Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1876B3D98
	for <lists+linux-leds@lfdr.de>; Fri, 10 Mar 2023 12:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjCJLYB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Mar 2023 06:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCJLYA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2023 06:24:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAA9BC6EB;
        Fri, 10 Mar 2023 03:23:58 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC9BAEF;
        Fri, 10 Mar 2023 12:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678447437;
        bh=dK+70SCtbx4b19lJdgxKmY8clmcH2oZ7QWKLWvmvLPM=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=KObX5hPwDx+9Dlf7ZrdY+6jMpjKxqks/8xCYdzyH8M7pDjcQxhloRMAx9gBZOVmJg
         gV02cEKWYUJqcoxitHN8rTYbnNNOR5lEqXKRWntsVfeFOXwHgpDMwab5MdqNkGnIlv
         WYFmSR8taBgOQaZ0XZOSxTD8xqoklnByzxUBEqdI=
Message-ID: <10a4c704-c7aa-0f8b-cba5-d33a9a2bf29a@ideasonboard.com>
Date:   Fri, 10 Mar 2023 11:23:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] platform: x86: int3472: Register a LED lookup
 table entry for the privacy LED
Content-Language: en-US
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230310095635.813262-1-hpa@redhat.com>
 <20230310095635.813262-5-hpa@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230310095635.813262-5-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kate

On 10/03/2023 09:56, Kate Hsuan wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> All currently known models using the tps68470 PMIC have a privacy LED for
> the back sensor (first ACPI consumer dev of the PMIC) connected to the
> ileda output of the PMIC.
> 
> Add a LED lookup table entry for this, so that the v4l2-core code turns on
> the LED when streaming from the sensor.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/platform/x86/intel/int3472/tps68470.c | 30 +++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 82ef022f8916..a53de9cd0540 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -140,11 +140,18 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
>   	return n_consumers;
>   }
>   
> +static void skl_int3472_tps68470_unregister_led_lookup(void *led_lookup)
> +{
> +	led_remove_lookup(led_lookup);
> +}
> +
>   static int skl_int3472_tps68470_probe(struct i2c_client *client)
>   {
> -	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct device *dev = &client->dev;
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
>   	const struct int3472_tps68470_board_data *board_data;
>   	struct tps68470_clk_platform_data *clk_pdata;
> +	struct led_lookup_data *led_lookup;
>   	struct mfd_cell *cells;
>   	struct regmap *regmap;
>   	int n_consumers;
> @@ -177,6 +184,25 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>   		if (!board_data)
>   			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
>   
> +		/* Add a LED lookup table entry for the privacy LED */
> +		led_lookup = devm_kzalloc(&client->dev, sizeof(*led_lookup), GFP_KERNEL);
> +		if (!led_lookup)
> +			return -ENOMEM;
> +
> +		ret = skl_int3472_get_sensor_adev_and_name(&client->dev, NULL, &led_lookup->dev_id);
> +		if (ret)
> +			return ret;
> +
> +		led_lookup->provider = "tps68470-ileda";
> +		led_lookup->con_id = "privacy-led";
> +		led_add_lookup(led_lookup);
> +

I'm not so sure about this one, because whilst the discrete type INT3472's only have a single 
dependent, on lots of platforms the TPS68470 type has 2. skl_int3472_get_sensor_adev_and_name() will 
just get those attributes of the first dependent; that conceivably might not be the ov5693. If it 
returns the ov7251's attributes this would assign the wrong LED to it, as that one needs the IR LED 
to function.

I think that this functionality probably needs to be added to the board data returned by 
int3472_tps68470_get_board_data(), just as the GPIO lookups are.

> +		ret = devm_add_action_or_reset(&client->dev,.
> +					       skl_int3472_tps68470_unregister_led_lookup,
> +					       led_lookup);
> +		if (ret)
> +			return ret;
> +
>   		cells = kcalloc(TPS68470_WIN_MFD_CELL_COUNT, sizeof(*cells), GFP_KERNEL);
>   		if (!cells)
>   			return -ENOMEM;
> @@ -259,4 +285,4 @@ module_i2c_driver(int3472_tps68470);
>   MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI TPS68470 Device Driver");
>   MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
>   MODULE_LICENSE("GPL v2");
> -MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator");
> +MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator leds-tps68470");

