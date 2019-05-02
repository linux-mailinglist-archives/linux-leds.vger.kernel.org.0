Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD21170C
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 12:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEBKTz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 06:19:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38060 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfEBKTz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 06:19:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id k16so2550344wrn.5
        for <linux-leds@vger.kernel.org>; Thu, 02 May 2019 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1bEgHj4Gb0Tk23WosQcMZIVF8WSF1bhnwj2JIcCDbKA=;
        b=Wnlny8NyYMphdkafjynA/aRFrhuFTHBSYdUde99T9rffaY/iGg8eFoi8JDJ9P9kOu8
         fFlqhLFt4GSabtaMBDx/Pgs6bxapQgGiJ6Ii/dzNZXeevUg17tW4uCPBGAEQ/6yrVMgr
         C0W+w5ocA+KsE1+EawmZmlv55eb3E+guDIXrNYy1xDlxVtE5R2ptPTHHasTd6xAxpeCm
         nd+eXBoOHwu9rDuiaY5J4otKWnH0tSWdL6zLS9/lqpWFlrkqtRQEZEqrQgJhjbfkdWcW
         m+qnK2gG7RcQW6FBVf+05lSJhWRuA583+7oTTGhoLFfjLFOLsp0GqQnY1vQfIc0PHru7
         u4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1bEgHj4Gb0Tk23WosQcMZIVF8WSF1bhnwj2JIcCDbKA=;
        b=aN4A5wXkTUw/7bO6afSVSg9fdn3m2821NX9Qr7oaOQC4hSOYIPohOtpXXXjFO+hDQj
         3ELb+/rSztzq7sZrM9Ztmau7NcaMya7+a3TfQlvdJ+SL1TOuECrOqdHljFN22RPbPRs/
         7u9puv+joNrIraXLkib90QoWIORKn98NYWritw76s6AyLe0cdLSVMUcurDuBrTaZPJOW
         ecQpjgpfzLgPgrgoG9qFVsS4fGyHk0ywFKmUyDq/mNHRsMa2A658wcOJ2iOEmUYW6DEd
         7VQEnO4pFSzEH/6LTfRKsppdBGkCuCYEZcC2NmIrEmMANAvLWSMjhIfUQlcOO721GdYz
         pK5Q==
X-Gm-Message-State: APjAAAU+k/XqE3KzfVlhYXYVTWKo+qA2n/fFsDDh9w987oVBWa0mF6yw
        LW9hyJtwKqhX0INvdecy5i5Whg==
X-Google-Smtp-Source: APXvYqzU1qo4jQnlC5zdY/3S8Pws6rQTr32rfBMKmOUGKDUaw5cUYg8dkE6KTdOfeUwVTIIPHolREQ==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr2251339wro.206.1556792392779;
        Thu, 02 May 2019 03:19:52 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
        by smtp.googlemail.com with ESMTPSA id z4sm10174683wmk.5.2019.05.02.03.19.51
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 03:19:51 -0700 (PDT)
Subject: Re: [PATCH v6 3/3] backlight: lm3630a: add firmware node support
To:     Brian Masney <masneyb@onstation.org>, lee.jones@linaro.org,
        jingoohan1@gmail.com, robh+dt@kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dmurphy@ti.com, jonathan@marek.ca,
        Daniel Thompson <daniel@redfelineninja.org.uk>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-4-masneyb@onstation.org>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <3d8a2f9e-bd41-7713-5ad4-05a0d71e8fb1@linaro.org>
Date:   Thu, 2 May 2019 11:19:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424092505.6578-4-masneyb@onstation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 24/04/2019 10:25, Brian Masney wrote:
> Add fwnode support to the lm3630a driver and optionally allow
> configuring the label, default brightness level, and maximum brightness
> level. The two outputs can be controlled by bank A and B independently
> or bank A can control both outputs.
> 
> If the platform data was not configured, then the driver defaults to
> enabling both banks. This patch changes the default value to disable
> both banks before parsing the firmware node so that just a single bank
> can be enabled if desired. There are no in-tree users of this driver.

In that case given I'd certainly entertain patches that move the config 
structures out of include/linux/platform_data and say the driver 
requires a proper entry in the hardware description! Not a requirement 
though.

> 
> Driver was tested on a LG Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> Changes since v5
> - None
> 
> Changes since v4
> - Added new function lm3630a_parse_bank()
> - Renamed seen variable to seen_led_sources
> - Use the bitmask returned from lm3630a_parse_led_sources() to compare
>    against the seen_led_sources rather than just the control bank. This
>    eliminated another if statement that was previously present that
>    checked to see if control bank A should control both sinks.
> - #define LM3630A_BANK_0, LM3630A_BANK_1, LM3630A_SINK_0,
>    LM3630A_SINK_1, and LM3630A_NUM_SINKS and use where appropriate.
> - Changed all occurances of
>    'if (bank == 0) { BANK_A_WORK } else { BANK_B_WORK }' to
>    'if (bank) { BANK_B_WORK } else { BANK_A_WORK }'
> - Dropped unnecessary 'ret = 0' from lm3630a_parse_led_sources().
> - Changed 'if (ret < 0)' to 'if (ret)' in lm3630a_parse_node().
> - Dropped kerneldoc from lm3630a_parse_led_sources().
> 
> Changes since v3
> - Add support for label
> - Changed lm3630a_parse_node() to return -ENODEV if no nodes were found
> - Remove LM3630A_LED{A,B}_DISABLE
> - Add two additional newlines for code readability
> - Remove extra newline
> 
> Changes since v2
> - Separated out control banks and outputs via the reg and led-sources
>    properties.
> - Use fwnode instead of of API
> - Disable both banks by default before calling lm3630a_parse_node()
> - Add lots of error handling
> - Check for duplicate source / bank definitions
> - Remove extra ;
> - Make probe() method fail if fwnode parsing fails.
> 
>   drivers/video/backlight/lm3630a_bl.c     | 149 ++++++++++++++++++++++-
>   include/linux/platform_data/lm3630a_bl.h |   4 +
>   2 files changed, 148 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index ef2553f452ca..75d996490cf0 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -35,6 +35,14 @@
>   #define REG_MAX		0x50
>   
>   #define INT_DEBOUNCE_MSEC	10
> +
> +#define LM3630A_BANK_0		0
> +#define LM3630A_BANK_1		1
> +
> +#define LM3630A_NUM_SINKS	2
> +#define LM3630A_SINK_0		0
> +#define LM3630A_SINK_1		1
> +
>   struct lm3630a_chip {
>   	struct device *dev;
>   	struct delayed_work work;
> @@ -329,15 +337,17 @@ static const struct backlight_ops lm3630a_bank_b_ops = {
>   
>   static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
>   {
> -	struct backlight_properties props;
>   	struct lm3630a_platform_data *pdata = pchip->pdata;
> +	struct backlight_properties props;
> +	const char *label;
>   
>   	props.type = BACKLIGHT_RAW;
>   	if (pdata->leda_ctrl != LM3630A_LEDA_DISABLE) {
>   		props.brightness = pdata->leda_init_brt;
>   		props.max_brightness = pdata->leda_max_brt;
> +		label = pdata->leda_label ? pdata->leda_label : "lm3630a_leda";
>   		pchip->bleda =
> -		    devm_backlight_device_register(pchip->dev, "lm3630a_leda",
> +		    devm_backlight_device_register(pchip->dev, label,
>   						   pchip->dev, pchip,
>   						   &lm3630a_bank_a_ops, &props);
>   		if (IS_ERR(pchip->bleda))
> @@ -348,8 +358,9 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
>   	    (pdata->ledb_ctrl != LM3630A_LEDB_ON_A)) {
>   		props.brightness = pdata->ledb_init_brt;
>   		props.max_brightness = pdata->ledb_max_brt;
> +		label = pdata->ledb_label ? pdata->ledb_label : "lm3630a_ledb";
>   		pchip->bledb =
> -		    devm_backlight_device_register(pchip->dev, "lm3630a_ledb",
> +		    devm_backlight_device_register(pchip->dev, label,
>   						   pchip->dev, pchip,
>   						   &lm3630a_bank_b_ops, &props);
>   		if (IS_ERR(pchip->bledb))
> @@ -364,6 +375,123 @@ static const struct regmap_config lm3630a_regmap = {
>   	.max_register = REG_MAX,
>   };
>   
> +static int lm3630a_parse_led_sources(struct fwnode_handle *node,
> +				     int default_led_sources)
> +{
> +	u32 sources[LM3630A_NUM_SINKS];
> +	int ret, num_sources, i;
> +
> +	num_sources = fwnode_property_read_u32_array(node, "led-sources", NULL,
> +						     0);
> +	if (num_sources < 0)
> +		return default_led_sources;
> +	else if (num_sources > ARRAY_SIZE(sources))
> +		return -EINVAL;
> +
> +	ret = fwnode_property_read_u32_array(node, "led-sources", sources,
> +					     num_sources);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < num_sources; i++) {
> +		if (sources[i] < LM3630A_SINK_0 || sources[i] > LM3630A_SINK_1)
> +			return -EINVAL;
> +
> +		ret |= BIT(sources[i]);
> +	}
> +
> +	return ret;
> +}
> +
> +static int lm3630a_parse_bank(struct lm3630a_platform_data *pdata,
> +			      struct fwnode_handle *node, int *seen_led_sources)
> +{
> +	int led_sources, ret;
> +	const char *label;
> +	u32 bank, val;
> +	bool linear;
> +
> +	ret = fwnode_property_read_u32(node, "reg", &bank);
> +	if (ret)
> +		return ret;
> +
> +	if (bank < LM3630A_BANK_0 || bank > LM3630A_BANK_1)
> +		return -EINVAL;
> +
> +	led_sources = lm3630a_parse_led_sources(node, BIT(bank));
> +	if (led_sources < 0)
> +		return led_sources;
> +
> +	if (*seen_led_sources & led_sources)
> +		return -EINVAL;
> +
> +	*seen_led_sources |= led_sources;
> +
> +	linear = fwnode_property_read_bool(node,
> +					   "ti,linear-mapping-mode");
> +	if (bank) {
> +		if (led_sources & BIT(LM3630A_SINK_0) ||
> +		    !(led_sources & BIT(LM3630A_SINK_1)))
> +			return -EINVAL;
> +
> +		pdata->ledb_ctrl = linear ?
> +			LM3630A_LEDB_ENABLE_LINEAR :
> +			LM3630A_LEDB_ENABLE;
> +	} else {
> +		if (!(led_sources & BIT(LM3630A_SINK_0)))
> +			return -EINVAL;
> +
> +		pdata->leda_ctrl = linear ?
> +			LM3630A_LEDA_ENABLE_LINEAR :
> +			LM3630A_LEDA_ENABLE;
> +
> +		if (led_sources & BIT(LM3630A_SINK_1))
> +			pdata->ledb_ctrl = LM3630A_LEDB_ON_A;
> +	}
> +
> +	ret = fwnode_property_read_string(node, "label", &label);
> +	if (!ret) {
> +		if (bank)
> +			pdata->ledb_label = label;
> +		else
> +			pdata->leda_label = label;
> +	}
> +
> +	ret = fwnode_property_read_u32(node, "default-brightness",
> +				       &val);
> +	if (!ret) {
> +		if (bank)
> +			pdata->ledb_init_brt = val;
> +		else
> +			pdata->leda_init_brt = val;
> +	}
> +
> +	ret = fwnode_property_read_u32(node, "max-brightness", &val);
> +	if (!ret) {
> +		if (bank)
> +			pdata->ledb_max_brt = val;
> +		else
> +			pdata->leda_max_brt = val;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lm3630a_parse_node(struct lm3630a_chip *pchip,
> +			      struct lm3630a_platform_data *pdata)
> +{
> +	int ret = -ENODEV, seen_led_sources = 0;
> +	struct fwnode_handle *node;
> +
> +	device_for_each_child_node(pchip->dev, node) {
> +		ret = lm3630a_parse_bank(pdata, node, &seen_led_sources);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
>   static int lm3630a_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
> @@ -396,13 +524,18 @@ static int lm3630a_probe(struct i2c_client *client,
>   				     GFP_KERNEL);
>   		if (pdata == NULL)
>   			return -ENOMEM;
> +
>   		/* default values */
> -		pdata->leda_ctrl = LM3630A_LEDA_ENABLE;
> -		pdata->ledb_ctrl = LM3630A_LEDB_ENABLE;
>   		pdata->leda_max_brt = LM3630A_MAX_BRIGHTNESS;
>   		pdata->ledb_max_brt = LM3630A_MAX_BRIGHTNESS;
>   		pdata->leda_init_brt = LM3630A_MAX_BRIGHTNESS;
>   		pdata->ledb_init_brt = LM3630A_MAX_BRIGHTNESS;
> +
> +		rval = lm3630a_parse_node(pchip, pdata);
> +		if (rval) {
> +			dev_err(&client->dev, "fail : parse node\n");
> +			return rval;
> +		}
>   	}
>   	pchip->pdata = pdata;
>   
> @@ -470,11 +603,17 @@ static const struct i2c_device_id lm3630a_id[] = {
>   	{}
>   };
>   
> +static const struct of_device_id lm3630a_match_table[] = {
> +	{ .compatible = "ti,lm3630a", },
> +	{ },
> +};
> +
>   MODULE_DEVICE_TABLE(i2c, lm3630a_id);
>   
>   static struct i2c_driver lm3630a_i2c_driver = {
>   	.driver = {
>   		   .name = LM3630A_NAME,
> +		   .of_match_table = lm3630a_match_table,
>   		   },
>   	.probe = lm3630a_probe,
>   	.remove = lm3630a_remove,
> diff --git a/include/linux/platform_data/lm3630a_bl.h b/include/linux/platform_data/lm3630a_bl.h
> index 7538e38e270b..762e68956f31 100644
> --- a/include/linux/platform_data/lm3630a_bl.h
> +++ b/include/linux/platform_data/lm3630a_bl.h
> @@ -38,9 +38,11 @@ enum lm3630a_ledb_ctrl {
>   
>   #define LM3630A_MAX_BRIGHTNESS 255
>   /*
> + *@leda_label    : optional led a label.
>    *@leda_init_brt : led a init brightness. 4~255
>    *@leda_max_brt  : led a max brightness.  4~255
>    *@leda_ctrl     : led a disable, enable linear, enable exponential
> + *@ledb_label    : optional led b label.
>    *@ledb_init_brt : led b init brightness. 4~255
>    *@ledb_max_brt  : led b max brightness.  4~255
>    *@ledb_ctrl     : led b disable, enable linear, enable exponential
> @@ -50,10 +52,12 @@ enum lm3630a_ledb_ctrl {
>   struct lm3630a_platform_data {
>   
>   	/* led a config.  */
> +	const char *leda_label;
>   	int leda_init_brt;
>   	int leda_max_brt;
>   	enum lm3630a_leda_ctrl leda_ctrl;
>   	/* led b config. */
> +	const char *ledb_label;
>   	int ledb_init_brt;
>   	int ledb_max_brt;
>   	enum lm3630a_ledb_ctrl ledb_ctrl;
> 

