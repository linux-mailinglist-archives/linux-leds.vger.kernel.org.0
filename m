Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC19C2745A2
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 17:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIVPnK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 11:43:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49702 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVPnJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 11:43:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MFh2g6126569;
        Tue, 22 Sep 2020 10:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600789382;
        bh=lqRnNZWyNplPTW8x4jeSRmQNvtsOrnj4TBlHAttNv3M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kgboz9x6qODX5bCcMFvpRXuTkZWKaxZ+DBPidDpOZRO3zaJeMdl8ec/PqSmd7ibGO
         N1Y+ZSIWAGvRdFlaI14GYOyvLaHtjodMwyBrFTPk0Oh9vgpfIqnEjRN2k4Ck5uRnfk
         aaZ4ump4rHYwuQcztcYc9jGWgyv/D618o8j+cdtc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MFh2U6069813;
        Tue, 22 Sep 2020 10:43:02 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 10:42:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 10:42:52 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MFgooP074011;
        Tue, 22 Sep 2020 10:42:51 -0500
Subject: Re: [PATCH leds v3 2/9] leds: lm36274: don't iterate through children
 since there is only one
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-3-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a2db44c8-9153-3b0e-b3fe-cb96821116ab@ti.com>
Date:   Tue, 22 Sep 2020 10:42:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200919180304.2885-3-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 9/19/20 1:02 PM, Marek Behún wrote:
> Do not use device_for_each_child_node. Since this driver works only with
> once child node present, use device_get_next_child_node instead.
> This also saves one level of indentation.
>
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/leds-lm36274.c | 50 +++++++++++++++++--------------------
>   1 file changed, 23 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> index 4a9f786bb9727..e0fce74a76675 100644
> --- a/drivers/leds/leds-lm36274.c
> +++ b/drivers/leds/leds-lm36274.c
> @@ -72,40 +72,36 @@ static int lm36274_parse_dt(struct lm36274 *chip)
>   	char label[LED_MAX_NAME_SIZE];
>   	struct device *dev = &chip->pdev->dev;
>   	const char *name;
> -	int child_cnt;
> -	int ret = -EINVAL;
> +	int ret;
>   
>   	/* There should only be 1 node */
> -	child_cnt = device_get_child_node_count(dev);
> -	if (child_cnt != 1)
> +	if (device_get_child_node_count(dev) != 1)
>   		return -EINVAL;
>   
> -	device_for_each_child_node(dev, child) {
> -		ret = fwnode_property_read_string(child, "label", &name);
> -		if (ret)
> -			snprintf(label, sizeof(label), "%s::",
> -				 chip->pdev->name);
> -		else
> -			snprintf(label, sizeof(label), "%s:%s",
> -				 chip->pdev->name, name);
> -
> -		chip->num_leds = fwnode_property_count_u32(child, "led-sources");
> -		if (chip->num_leds <= 0)
> -			return -ENODEV;
> -
> -		ret = fwnode_property_read_u32_array(child, "led-sources",
> -						     chip->led_sources,
> -						     chip->num_leds);
> -		if (ret) {
> -			dev_err(dev, "led-sources property missing\n");
> -			return ret;
> -		}
> -
> -		fwnode_property_read_string(child, "linux,default-trigger",
> -					    &chip->led_dev.default_trigger);
> +	child = device_get_next_child_node(dev, NULL);
> +
> +	ret = fwnode_property_read_string(child, "label", &name);
> +	if (ret)
> +		snprintf(label, sizeof(label), "%s::", chip->pdev->name);
> +	else
> +		snprintf(label, sizeof(label), "%s:%s", chip->pdev->name, name);
>   
> +	chip->num_leds = fwnode_property_count_u32(child, "led-sources");
> +	if (chip->num_leds <= 0)
> +		return -ENODEV;
> +
> +	ret = fwnode_property_read_u32_array(child, "led-sources",
> +					     chip->led_sources, chip->num_leds);
> +	if (ret) {
> +		dev_err(dev, "led-sources property missing\n");
> +		return ret;
>   	}
>   
> +	fwnode_property_read_string(child, "linux,default-trigger",
> +				    &chip->led_dev.default_trigger);
> +
> +	fwnode_handle_put(child);
> +
>   	chip->lmu_data.regmap = chip->regmap;
>   	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
>   	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;

Question is this device on a piece of hardware you are testing on?

Just wondering how you functionally tested all these changes you submitted

Reviewed-by: Dan Murphy <dmurphy@ti.com>

