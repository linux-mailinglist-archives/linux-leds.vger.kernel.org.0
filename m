Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A32DAAE3
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 13:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439658AbfJQLJv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 07:09:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37808 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405264AbfJQLJv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 07:09:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id f22so2095501wmc.2
        for <linux-leds@vger.kernel.org>; Thu, 17 Oct 2019 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qCyVynuK7PaSvkeosZV34szIPo2U5n7bK+UWhJ6bjPY=;
        b=h8UffXa2hhVQYJJ/wxhWdOwKrjrPLX/WdcMY/ndNiZuY6l4OKj0WKif0p8Wsrvv33C
         O9gjsNrzDxHyzZ/TOeAsuKMCt7MdjkMlsA3w4Vx/Pv8tkyXOthkuqva6vtiF/qf7iozA
         LUidAJEkf/ejnJ7cTXSY6aIp7mVZCzAU/vlvTf+kBJzbl1VxwX0Q0CQzIcS6GTuxvK60
         b9ome2O1dpYgTC8B1y8DHSXAyetStGZ5Oskw2ogh6OEVAbQZVSSG1VKs/1ExFpUjeVRa
         pnHZtSgNe89CeG/xnWQ8rqok5uGR5Ze+qRNxLDr9RMZGIRp2cnCnIpjZ8HwJ7LBYFp5y
         s1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qCyVynuK7PaSvkeosZV34szIPo2U5n7bK+UWhJ6bjPY=;
        b=tLLnNJZ0wyuKy16PHqwhYQRBA6CXbf3g9iL4EOmOQ/irXXiaJvTTHXI11hpTo5CT4j
         H8KzkxESA5XrZRvIsKaPJFGLN2hjSUWFz83/pEEVqZzvrj8nB3Zdb7Audww9WApxUj3i
         B0PiqkyZ+NYeaeCLu72TXFgthZUA7hERmrPXUDaFJnVfNE5fNTuotKT9K2ukEZDUMrXr
         gDHKvT1cTIluYwVyISRwUqb6cMXq9oONSErSvfkxSvX4lA+Vx5kKAfEwnwrUVbQEHyMB
         H2kr3UVCBSpfOaW/JJS8R+oKHmaL5GxaLFq1Wl742mGCJHZ1fT2VZKTjHA+M8Tqfggxo
         DKBg==
X-Gm-Message-State: APjAAAVd76ELspRNHMfOHXztUjGkldRRwh8pYyLEjpZFKjsRCQmoRHl/
        AehOb1G/wJxMsuzY0HqGsrkW4g==
X-Google-Smtp-Source: APXvYqylxkpYUC0YR/BT7g7dc/nso2TOI0NcgI5CsiSqzmU5I4fsasacsNe9XwwS9TKTyn1Xxp0ywQ==
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr2301642wmh.56.1571310587778;
        Thu, 17 Oct 2019 04:09:47 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y13sm3163455wrg.8.2019.10.17.04.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 04:09:46 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:09:45 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V7 5/6] backlight: qcom-wled: add support for short
 circuit handling.
Message-ID: <20191017110945.6dbldlrykumvlpqm@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-6-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571220826-7740-6-git-send-email-kgunda@codeaurora.org>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 16, 2019 at 03:43:45PM +0530, Kiran Gunda wrote:
> Handle the short circuit interrupt and check if the short circuit
> interrupt is valid. Re-enable the module to check if it goes
> away. Disable the module altogether if the short circuit event
> persists.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/qcom-wled.c | 132 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 128 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 2807b4b..b5b125c 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -2,6 +2,9 @@
>  /* Copyright (c) 2015, Sony Mobile Communications, AB.
>   */
>  
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/ktime.h>
>  #include <linux/kernel.h>
>  #include <linux/backlight.h>
>  #include <linux/module.h>
> @@ -56,6 +59,16 @@
>  #define WLED3_SINK_REG_STR_CABC(n)			(0x66 + (n * 0x10))
>  #define  WLED3_SINK_REG_STR_CABC_MASK			BIT(7)
>  
> +/* WLED4 specific control registers */
> +#define WLED4_CTRL_REG_SHORT_PROTECT			0x5e
> +#define  WLED4_CTRL_REG_SHORT_EN_MASK			BIT(7)
> +
> +#define WLED4_CTRL_REG_SEC_ACCESS			0xd0
> +#define  WLED4_CTRL_REG_SEC_UNLOCK			0xa5
> +
> +#define WLED4_CTRL_REG_TEST1				0xe2
> +#define  WLED4_CTRL_REG_TEST1_EXT_FET_DTEST2		0x09
> +
>  /* WLED4 specific sink registers */
>  #define WLED4_SINK_REG_CURR_SINK			0x46
>  #define  WLED4_SINK_REG_CURR_SINK_MASK			GENMASK(7, 4)
> @@ -105,17 +118,23 @@ struct wled_config {
>  	bool cs_out_en;
>  	bool ext_gen;
>  	bool cabc;
> +	bool external_pfet;
>  };
>  
>  struct wled {
>  	const char *name;
>  	struct device *dev;
>  	struct regmap *regmap;
> +	struct mutex lock;	/* Lock to avoid race from thread irq handler */
> +	ktime_t last_short_event;
>  	u16 ctrl_addr;
>  	u16 sink_addr;
>  	u16 max_string_count;
>  	u32 brightness;
>  	u32 max_brightness;
> +	u32 short_count;
> +	bool disabled_by_short;
> +	bool has_short_detect;
>  
>  	struct wled_config cfg;
>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
> @@ -166,6 +185,9 @@ static int wled_module_enable(struct wled *wled, int val)
>  {
>  	int rc;
>  
> +	if (wled->disabled_by_short)
> +		return -ENXIO;
> +
>  	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
>  				WLED3_CTRL_REG_MOD_EN,
>  				WLED3_CTRL_REG_MOD_EN_MASK,
> @@ -202,18 +224,19 @@ static int wled_update_status(struct backlight_device *bl)
>  	    bl->props.state & BL_CORE_FBBLANK)
>  		brightness = 0;
>  
> +	mutex_lock(&wled->lock);
>  	if (brightness) {
>  		rc = wled->wled_set_brightness(wled, brightness);
>  		if (rc < 0) {
>  			dev_err(wled->dev, "wled failed to set brightness rc:%d\n",
>  				rc);
> -			return rc;
> +			goto unlock_mutex;
>  		}
>  
>  		rc = wled_sync_toggle(wled);
>  		if (rc < 0) {
>  			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
> -			return rc;
> +			goto unlock_mutex;
>  		}
>  	}
>  
> @@ -221,15 +244,61 @@ static int wled_update_status(struct backlight_device *bl)
>  		rc = wled_module_enable(wled, !!brightness);
>  		if (rc < 0) {
>  			dev_err(wled->dev, "wled enable failed rc:%d\n", rc);
> -			return rc;
> +			goto unlock_mutex;
>  		}
>  	}
>  
>  	wled->brightness = brightness;
>  
> +unlock_mutex:
> +	mutex_unlock(&wled->lock);
> +
>  	return rc;
>  }
>  
> +#define WLED_SHORT_DLY_MS			20
> +#define WLED_SHORT_CNT_MAX			5
> +#define WLED_SHORT_RESET_CNT_DLY_US		USEC_PER_SEC
> +
> +static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
> +{
> +	struct wled *wled = _wled;
> +	int rc;
> +	s64 elapsed_time;
> +
> +	wled->short_count++;
> +	mutex_lock(&wled->lock);
> +	rc = wled_module_enable(wled, false);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "wled disable failed rc:%d\n", rc);
> +		goto unlock_mutex;
> +	}
> +
> +	elapsed_time = ktime_us_delta(ktime_get(),
> +				      wled->last_short_event);
> +	if (elapsed_time > WLED_SHORT_RESET_CNT_DLY_US)
> +		wled->short_count = 1;
> +
> +	if (wled->short_count > WLED_SHORT_CNT_MAX) {
> +		dev_err(wled->dev, "Short trigged %d times, disabling WLED forever!\n",
> +			wled->short_count);
> +		wled->disabled_by_short = true;
> +		goto unlock_mutex;
> +	}
> +
> +	wled->last_short_event = ktime_get();
> +
> +	msleep(WLED_SHORT_DLY_MS);
> +	rc = wled_module_enable(wled, true);
> +	if (rc < 0)
> +		dev_err(wled->dev, "wled enable failed rc:%d\n", rc);
> +
> +unlock_mutex:
> +	mutex_unlock(&wled->lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int wled3_setup(struct wled *wled)
>  {
>  	u16 addr;
> @@ -318,7 +387,7 @@ static int wled4_setup(struct wled *wled)
>  	int rc, temp, i, j;
>  	u16 addr;
>  	u8 sink_en = 0;
> -	u32 sink_cfg = 0;
> +	u32 sink_cfg;
>  
>  	rc = regmap_update_bits(wled->regmap,
>  				wled->ctrl_addr + WLED3_CTRL_REG_OVP,
> @@ -340,6 +409,21 @@ static int wled4_setup(struct wled *wled)
>  	if (rc < 0)
>  		return rc;
>  
> +	if (wled->cfg.external_pfet) {
> +		/* Unlock the secure register access */
> +		rc = regmap_write(wled->regmap, wled->ctrl_addr +
> +				  WLED4_CTRL_REG_SEC_ACCESS,
> +				  WLED4_CTRL_REG_SEC_UNLOCK);
> +		if (rc < 0)
> +			return rc;
> +
> +		rc = regmap_write(wled->regmap,
> +				  wled->ctrl_addr + WLED4_CTRL_REG_TEST1,
> +				  WLED4_CTRL_REG_TEST1_EXT_FET_DTEST2);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
>  	rc = regmap_read(wled->regmap, wled->sink_addr +
>  			 WLED4_SINK_REG_CURR_SINK, &sink_cfg);
>  	if (rc < 0)
> @@ -425,6 +509,7 @@ static int wled4_setup(struct wled *wled)
>  	.num_strings = 4,
>  	.switch_freq = 11,
>  	.cabc = false,
> +	.external_pfet = false,
>  };
>  
>  static const u32 wled3_boost_i_limit_values[] = {
> @@ -590,6 +675,7 @@ static int wled_configure(struct wled *wled, int version)
>  		{ "qcom,cs-out", &cfg->cs_out_en, },
>  		{ "qcom,ext-gen", &cfg->ext_gen, },
>  		{ "qcom,cabc", &cfg->cabc, },
> +		{ "qcom,external-pfet", &cfg->external_pfet, },
>  	};
>  
>  	prop_addr = of_get_address(dev->of_node, 0, NULL, NULL);
> @@ -678,6 +764,38 @@ static int wled_configure(struct wled *wled, int version)
>  	return 0;
>  }
>  
> +static int wled_configure_short_irq(struct wled *wled,
> +				    struct platform_device *pdev)
> +{
> +	int rc, short_irq;
> +
> +	if (!wled->has_short_detect)
> +		return 0;
> +
> +	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
> +				WLED4_CTRL_REG_SHORT_PROTECT,
> +				WLED4_CTRL_REG_SHORT_EN_MASK,
> +				WLED4_CTRL_REG_SHORT_EN_MASK);
> +	if (rc < 0)
> +		return rc;
> +
> +	short_irq = platform_get_irq_byname(pdev, "short");
> +	if (short_irq < 0) {
> +		dev_dbg(&pdev->dev, "short irq is not used\n");
> +		return 0;
> +	}
> +
> +	rc = devm_request_threaded_irq(wled->dev, short_irq,
> +				       NULL, wled_short_irq_handler,
> +				       IRQF_ONESHOT,
> +				       "wled_short_irq", wled);
> +	if (rc < 0)
> +		dev_err(wled->dev, "Unable to request short_irq (err:%d)\n",
> +			rc);
> +
> +	return rc;
> +}
> +
>  static const struct backlight_ops wled_ops = {
>  	.update_status = wled_update_status,
>  };
> @@ -711,6 +829,7 @@ static int wled_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	mutex_init(&wled->lock);
>  	rc = wled_configure(wled, version);
>  	if (rc)
>  		return rc;
> @@ -725,6 +844,7 @@ static int wled_probe(struct platform_device *pdev)
>  		break;
>  
>  	case 4:
> +		wled->has_short_detect = true;
>  		rc = wled4_setup(wled);
>  		if (rc) {
>  			dev_err(&pdev->dev, "wled4_setup failed\n");
> @@ -737,6 +857,10 @@ static int wled_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> +	rc = wled_configure_short_irq(wled, pdev);
> +	if (rc < 0)
> +		return rc;
> +
>  	val = WLED_DEFAULT_BRIGHTNESS;
>  	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
