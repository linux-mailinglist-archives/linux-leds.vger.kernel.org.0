Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A470DAC16
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 14:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409390AbfJQM1U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 08:27:20 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36982 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406042AbfJQM1U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 08:27:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C121B60DBC; Thu, 17 Oct 2019 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571315238;
        bh=V0OSA8TfZ3C/p9yJ+yBRs9fodkgVtPNmYbkRqh5cSXQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QmUxWYjBPlxwmetZ9TPVXGej0eidEQ9HC1IEvCmrTnMbuzilV5V+6SHnz0yGYGElJ
         zzJFUzd0TvCmYl5JzQANIWSAT8IbNMmvYNN9NrdK4Yy8ZM+vi3OtturJ0h7NJLjLFM
         fqI/MjyJbOyxEaZf+cTtx23ILcx/7vzTD3qlQbSM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 5182360953;
        Thu, 17 Oct 2019 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571315235;
        bh=V0OSA8TfZ3C/p9yJ+yBRs9fodkgVtPNmYbkRqh5cSXQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JdjmUUfP8dTVaEMdSm+Z9l56JXe3XnUaA3Z22nJEjxTkp21XQASxSxZfPJcP2p2wd
         Jsc5q6oUg6RQDUxSTHsY8dbstOs8qS7W4tT6l8QFIRk/DqJa7OmwehvT7thrV2sCyl
         6bOquP48phGNywflHucwwphc95Won+ISqAW2ksrE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Oct 2019 17:57:15 +0530
From:   kgunda@codeaurora.org
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V7 4/6] backlight: qcom-wled: Add support for WLED4
 peripheral.
In-Reply-To: <20191017110631.k2u254jjcza6ngzt@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-5-git-send-email-kgunda@codeaurora.org>
 <20191017110631.k2u254jjcza6ngzt@holly.lan>
Message-ID: <d7c3651db7e05bbb4f1b13602916eaa4@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2019-10-17 16:36, Daniel Thompson wrote:
> On Wed, Oct 16, 2019 at 03:43:44PM +0530, Kiran Gunda wrote:
>> WLED4 peripheral is present on some PMICs like pmi8998 and
>> pm660l. It has a different register map and configurations
>> are also different. Add support for it.
> 
> There is code buried in this patch that looks like it changes the name
> that will be handed to the backlight sub-system.
> 
> It's purpose needs to be explained in the patch description (or the 
> code
> moved to a new patch).
> 
I will address it in next series.
> 
> Daniel.
> 
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 263 
>> +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 257 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index 45eeda4..2807b4b 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -17,7 +17,7 @@
>> 
>>  #define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
>> 
>> -/* WLED3 control registers */
>> +/* WLED3/WLED4 control registers */
>>  #define WLED3_CTRL_REG_MOD_EN				0x46
>>  #define  WLED3_CTRL_REG_MOD_EN_MASK			BIT(7)
>>  #define  WLED3_CTRL_REG_MOD_EN_SHIFT			7
>> @@ -31,7 +31,7 @@
>>  #define WLED3_CTRL_REG_ILIMIT				0x4e
>>  #define  WLED3_CTRL_REG_ILIMIT_MASK			GENMASK(2, 0)
>> 
>> -/* WLED3 sink registers */
>> +/* WLED3/WLED4 sink registers */
>>  #define WLED3_SINK_REG_SYNC				0x47
>>  #define  WLED3_SINK_REG_SYNC_CLEAR			0x00
>> 
>> @@ -56,6 +56,28 @@
>>  #define WLED3_SINK_REG_STR_CABC(n)			(0x66 + (n * 0x10))
>>  #define  WLED3_SINK_REG_STR_CABC_MASK			BIT(7)
>> 
>> +/* WLED4 specific sink registers */
>> +#define WLED4_SINK_REG_CURR_SINK			0x46
>> +#define  WLED4_SINK_REG_CURR_SINK_MASK			GENMASK(7, 4)
>> +#define  WLED4_SINK_REG_CURR_SINK_SHFT			4
>> +
>> +/* WLED4 specific per-'string' registers below */
>> +#define WLED4_SINK_REG_STR_MOD_EN(n)			(0x50 + (n * 0x10))
>> +#define  WLED4_SINK_REG_STR_MOD_MASK			BIT(7)
>> +
>> +#define WLED4_SINK_REG_STR_FULL_SCALE_CURR(n)		(0x52 + (n * 0x10))
>> +#define  WLED4_SINK_REG_STR_FULL_SCALE_CURR_MASK	GENMASK(3, 0)
>> +
>> +#define WLED4_SINK_REG_STR_MOD_SRC(n)			(0x53 + (n * 0x10))
>> +#define  WLED4_SINK_REG_STR_MOD_SRC_MASK		BIT(0)
>> +#define  WLED4_SINK_REG_STR_MOD_SRC_INT			0x00
>> +#define  WLED4_SINK_REG_STR_MOD_SRC_EXT			0x01
>> +
>> +#define WLED4_SINK_REG_STR_CABC(n)			(0x56 + (n * 0x10))
>> +#define  WLED4_SINK_REG_STR_CABC_MASK			BIT(7)
>> +
>> +#define WLED4_SINK_REG_BRIGHT(n)			(0x57 + (n * 0x10))
>> +
>>  struct wled_var_cfg {
>>  	const u32 *values;
>>  	u32 (*fn)(u32);
>> @@ -90,6 +112,7 @@ struct wled {
>>  	struct device *dev;
>>  	struct regmap *regmap;
>>  	u16 ctrl_addr;
>> +	u16 sink_addr;
>>  	u16 max_string_count;
>>  	u32 brightness;
>>  	u32 max_brightness;
>> @@ -116,6 +139,29 @@ static int wled3_set_brightness(struct wled 
>> *wled, u16 brightness)
>>  	return 0;
>>  }
>> 
>> +static int wled4_set_brightness(struct wled *wled, u16 brightness)
>> +{
>> +	int rc, i;
>> +	u16 low_limit = wled->max_brightness * 4 / 1000;
>> +	u8 v[2];
>> +
>> +	/* WLED4's lower limit of operation is 0.4% */
>> +	if (brightness > 0 && brightness < low_limit)
>> +		brightness = low_limit;
>> +
>> +	v[0] = brightness & 0xff;
>> +	v[1] = (brightness >> 8) & 0xf;
>> +
>> +	for (i = 0;  i < wled->cfg.num_strings; ++i) {
>> +		rc = regmap_bulk_write(wled->regmap, wled->sink_addr +
>> +				       WLED4_SINK_REG_BRIGHT(i), v, 2);
>> +		if (rc < 0)
>> +			return rc;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int wled_module_enable(struct wled *wled, int val)
>>  {
>>  	int rc;
>> @@ -267,6 +313,120 @@ static int wled3_setup(struct wled *wled)
>>  	.enabled_strings = {0, 1, 2, 3},
>>  };
>> 
>> +static int wled4_setup(struct wled *wled)
>> +{
>> +	int rc, temp, i, j;
>> +	u16 addr;
>> +	u8 sink_en = 0;
>> +	u32 sink_cfg = 0;
>> +
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->ctrl_addr + WLED3_CTRL_REG_OVP,
>> +				WLED3_CTRL_REG_OVP_MASK, wled->cfg.ovp);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->ctrl_addr + WLED3_CTRL_REG_ILIMIT,
>> +				WLED3_CTRL_REG_ILIMIT_MASK,
>> +				wled->cfg.boost_i_limit);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->ctrl_addr + WLED3_CTRL_REG_FREQ,
>> +				WLED3_CTRL_REG_FREQ_MASK,
>> +				wled->cfg.switch_freq);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	rc = regmap_read(wled->regmap, wled->sink_addr +
>> +			 WLED4_SINK_REG_CURR_SINK, &sink_cfg);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	for (i = 0; i < wled->cfg.num_strings; i++) {
>> +		j = wled->cfg.enabled_strings[i];
>> +		temp = j + WLED4_SINK_REG_CURR_SINK_SHFT;
>> +		sink_en |= 1 << temp;
>> +	}
>> +
>> +	if (sink_cfg == sink_en)
>> +		return 0;
>> +
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
>> +				WLED4_SINK_REG_CURR_SINK_MASK, 0);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
>> +				WLED3_CTRL_REG_MOD_EN,
>> +				WLED3_CTRL_REG_MOD_EN_MASK, 0);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	/* Per sink/string configuration */
>> +	for (i = 0; i < wled->cfg.num_strings; i++) {
>> +		j = wled->cfg.enabled_strings[i];
>> +
>> +		addr = wled->sink_addr +
>> +				WLED4_SINK_REG_STR_MOD_EN(j);
>> +		rc = regmap_update_bits(wled->regmap, addr,
>> +					WLED4_SINK_REG_STR_MOD_MASK,
>> +					WLED4_SINK_REG_STR_MOD_MASK);
>> +		if (rc < 0)
>> +			return rc;
>> +
>> +		addr = wled->sink_addr +
>> +				WLED4_SINK_REG_STR_FULL_SCALE_CURR(j);
>> +		rc = regmap_update_bits(wled->regmap, addr,
>> +					WLED4_SINK_REG_STR_FULL_SCALE_CURR_MASK,
>> +					wled->cfg.string_i_limit);
>> +		if (rc < 0)
>> +			return rc;
>> +
>> +		addr = wled->sink_addr +
>> +				WLED4_SINK_REG_STR_CABC(j);
>> +		rc = regmap_update_bits(wled->regmap, addr,
>> +					WLED4_SINK_REG_STR_CABC_MASK,
>> +					wled->cfg.cabc ?
>> +					WLED4_SINK_REG_STR_CABC_MASK : 0);
>> +		if (rc < 0)
>> +			return rc;
>> +	}
>> +
>> +	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
>> +				WLED3_CTRL_REG_MOD_EN,
>> +				WLED3_CTRL_REG_MOD_EN_MASK,
>> +				WLED3_CTRL_REG_MOD_EN_MASK);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
>> +				WLED4_SINK_REG_CURR_SINK_MASK, sink_en);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	rc = wled_sync_toggle(wled);
>> +	if (rc < 0) {
>> +		dev_err(wled->dev, "Failed to toggle sync reg rc:%d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct wled_config wled4_config_defaults = {
>> +	.boost_i_limit = 4,
>> +	.string_i_limit = 10,
>> +	.ovp = 1,
>> +	.num_strings = 4,
>> +	.switch_freq = 11,
>> +	.cabc = false,
>> +};
>> +
>>  static const u32 wled3_boost_i_limit_values[] = {
>>  	105, 385, 525, 805, 980, 1260, 1400, 1680,
>>  };
>> @@ -276,6 +436,15 @@ static int wled3_setup(struct wled *wled)
>>  	.size = ARRAY_SIZE(wled3_boost_i_limit_values),
>>  };
>> 
>> +static const u32 wled4_boost_i_limit_values[] = {
>> +	105, 280, 450, 620, 970, 1150, 1300, 1500,
>> +};
>> +
>> +static const struct wled_var_cfg wled4_boost_i_limit_cfg = {
>> +	.values = wled4_boost_i_limit_values,
>> +	.size = ARRAY_SIZE(wled4_boost_i_limit_values),
>> +};
>> +
>>  static const u32 wled3_ovp_values[] = {
>>  	35, 32, 29, 27,
>>  };
>> @@ -285,6 +454,15 @@ static int wled3_setup(struct wled *wled)
>>  	.size = ARRAY_SIZE(wled3_ovp_values),
>>  };
>> 
>> +static const u32 wled4_ovp_values[] = {
>> +	31100, 29600, 19600, 18100,
>> +};
>> +
>> +static const struct wled_var_cfg wled4_ovp_cfg = {
>> +	.values = wled4_ovp_values,
>> +	.size = ARRAY_SIZE(wled4_ovp_values),
>> +};
>> +
>>  static u32 wled3_num_strings_values_fn(u32 idx)
>>  {
>>  	return idx + 1;
>> @@ -295,6 +473,11 @@ static u32 wled3_num_strings_values_fn(u32 idx)
>>  	.size = 3,
>>  };
>> 
>> +static const struct wled_var_cfg wled4_num_strings_cfg = {
>> +	.fn = wled3_num_strings_values_fn,
>> +	.size = 4,
>> +};
>> +
>>  static u32 wled3_switch_freq_values_fn(u32 idx)
>>  {
>>  	return 19200 / (2 * (1 + idx));
>> @@ -309,10 +492,24 @@ static u32 wled3_switch_freq_values_fn(u32 idx)
>>  	.size = 26,
>>  };
>> 
>> +static const u32 wled4_string_i_limit_values[] = {
>> +	0, 2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000,
>> +	22500, 25000, 27500, 30000,
>> +};
>> +
>> +static const struct wled_var_cfg wled4_string_i_limit_cfg = {
>> +	.values = wled4_string_i_limit_values,
>> +	.size = ARRAY_SIZE(wled4_string_i_limit_values),
>> +};
>> +
>>  static const struct wled_var_cfg wled3_string_cfg = {
>>  	.size = 8,
>>  };
>> 
>> +static const struct wled_var_cfg wled4_string_cfg = {
>> +	.size = 16,
>> +};
>> +
>>  static u32 wled_values(const struct wled_var_cfg *cfg, u32 idx)
>>  {
>>  	if (idx >= cfg->size)
>> @@ -361,6 +558,34 @@ static int wled_configure(struct wled *wled, int 
>> version)
>>  		},
>>  	};
>> 
>> +	const struct wled_u32_opts wled4_opts[] = {
>> +		{
>> +			.name = "qcom,current-boost-limit",
>> +			.val_ptr = &cfg->boost_i_limit,
>> +			.cfg = &wled4_boost_i_limit_cfg,
>> +		},
>> +		{
>> +			.name = "qcom,current-limit-microamp",
>> +			.val_ptr = &cfg->string_i_limit,
>> +			.cfg = &wled4_string_i_limit_cfg,
>> +		},
>> +		{
>> +			.name = "qcom,ovp-millivolt",
>> +			.val_ptr = &cfg->ovp,
>> +			.cfg = &wled4_ovp_cfg,
>> +		},
>> +		{
>> +			.name = "qcom,switching-freq",
>> +			.val_ptr = &cfg->switch_freq,
>> +			.cfg = &wled3_switch_freq_cfg,
>> +		},
>> +		{
>> +			.name = "qcom,num-strings",
>> +			.val_ptr = &cfg->num_strings,
>> +			.cfg = &wled4_num_strings_cfg,
>> +		},
>> +	};
>> +
>>  	const struct wled_bool_opts bool_opts[] = {
>>  		{ "qcom,cs-out", &cfg->cs_out_en, },
>>  		{ "qcom,ext-gen", &cfg->ext_gen, },
>> @@ -374,10 +599,6 @@ static int wled_configure(struct wled *wled, int 
>> version)
>>  	}
>>  	wled->ctrl_addr = be32_to_cpu(*prop_addr);
>> 
>> -	rc = of_property_read_string(dev->of_node, "label", &wled->name);
>> -	if (rc)
>> -		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", 
>> dev->of_node);
>> -
>>  	switch (version) {
>>  	case 3:
>>  		u32_opts = wled3_opts;
>> @@ -385,6 +606,22 @@ static int wled_configure(struct wled *wled, int 
>> version)
>>  		*cfg = wled3_config_defaults;
>>  		wled->wled_set_brightness = wled3_set_brightness;
>>  		wled->max_string_count = 3;
>> +		wled->sink_addr = wled->ctrl_addr;
>> +		break;
>> +
>> +	case 4:
>> +		u32_opts = wled4_opts;
>> +		size = ARRAY_SIZE(wled4_opts);
>> +		*cfg = wled4_config_defaults;
>> +		wled->wled_set_brightness = wled4_set_brightness;
>> +		wled->max_string_count = 4;
>> +
>> +		prop_addr = of_get_address(dev->of_node, 1, NULL, NULL);
>> +		if (!prop_addr) {
>> +			dev_err(wled->dev, "invalid IO resources\n");
>> +			return -EINVAL;
>> +		}
>> +		wled->sink_addr = be32_to_cpu(*prop_addr);
>>  		break;
>> 
>>  	default:
>> @@ -392,6 +629,10 @@ static int wled_configure(struct wled *wled, int 
>> version)
>>  		return -EINVAL;
>>  	}
>> 
>> +	rc = of_property_read_string(dev->of_node, "label", &wled->name);
>> +	if (rc)
>> +		wled->name = dev->of_node->name;
>> +
>>  	for (i = 0; i < size; ++i) {
>>  		rc = of_property_read_u32(dev->of_node, u32_opts[i].name, &val);
>>  		if (rc == -EINVAL) {
>> @@ -483,6 +724,14 @@ static int wled_probe(struct platform_device 
>> *pdev)
>>  		}
>>  		break;
>> 
>> +	case 4:
>> +		rc = wled4_setup(wled);
>> +		if (rc) {
>> +			dev_err(&pdev->dev, "wled4_setup failed\n");
>> +			return rc;
>> +		}
>> +		break;
>> +
>>  	default:
>>  		dev_err(wled->dev, "Invalid WLED version\n");
>>  		break;
>> @@ -503,6 +752,8 @@ static int wled_probe(struct platform_device 
>> *pdev)
>> 
>>  static const struct of_device_id wled_match_table[] = {
>>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
>> +	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>> +	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>>  	{}
>>  };
>>  MODULE_DEVICE_TABLE(of, wled_match_table);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
