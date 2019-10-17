Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D1BDAC0C
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 14:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406175AbfJQM07 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 08:26:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41318 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406185AbfJQM07 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 08:26:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id p4so2117943wrm.8
        for <linux-leds@vger.kernel.org>; Thu, 17 Oct 2019 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=e5PXvkJj6yLgLLpU0V58xaLs23PCozUwXaPXAmVU3f0=;
        b=M2+1Qx/DuhYBuThmcJfx5JfLuZjkWpvQDesjuHxTZhU9PtIHUdL/6uku69PjxWiFS0
         izL2XiCoH8HlOCBoynrQsmJWHBCw2SxY7rXrVVH3yHulOIoF5CTvk6jXRZDSkn1W0qoC
         k4Z69DTZEC67KFn2mZmNGzRgt6tQw9k3d6LS5FXJN3jRbM6AGkE/OvAkDLMb74TMFKOj
         gkoAVRzzD7B40WH5J7S+jxmQieTt7TFSP+3DVU4vkDWXslo+sopj8M1Oi3kXFP8zGgbl
         81dAGokpcP2vQZw8NSMLOE2+TelgnrLf8l2oA/HZz4dsNrw+ExOotvKGCPKa4DSehi/B
         izBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=e5PXvkJj6yLgLLpU0V58xaLs23PCozUwXaPXAmVU3f0=;
        b=bLY/FCHv8LiSfPdPHiKiK3m/2ahHmarO+Guv1xsTEeiTF7VAchEji/dTD/Gi8I5bk3
         qYkEPBOQKhCzABLq+41Qh63DCAucIKM9//xRIjUlRKZ24IY3q/UrANNgWYRV0rxguVNi
         xJn9OoP0BWuVKFG92gNXBQLkw2rbkaLopLdDyOBN1LX+o/T4Mn7Y15sObB7rr4s9RCU/
         w/oHNUrbL1RPf9wf/2+S4APOG3ZO+gY9DEKd4Q1s38Gv3amMRV9DmeOTe/xnxhLcQM+i
         QWi7qLKyPLDL/zQYbO6PjTGwBlIiJ6gTlH0d55N8nm9eOiQh06w8twDAC9L6Q/D4WLLk
         jFmQ==
X-Gm-Message-State: APjAAAWWRXMcbQVoIF1K3Gqm3fPlpQNnlw1TxKauvN2qR2orcJ7d6t5j
        lgI6uFq1+/7ZShmF8+4WT2nMBg==
X-Google-Smtp-Source: APXvYqzyogR392IihF9V6Qtqx5jcBT3nSHcny6/n70UWDhG9oPfn0XgXCOSrbIDl4TXqD5bQtmy5Sw==
X-Received: by 2002:adf:a157:: with SMTP id r23mr2691445wrr.51.1571315215846;
        Thu, 17 Oct 2019 05:26:55 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id o22sm2299542wra.96.2019.10.17.05.26.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 05:26:55 -0700 (PDT)
Date:   Thu, 17 Oct 2019 13:26:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191017122653.GO4365@dell>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 16 Oct 2019, Kiran Gunda wrote:

> The auto string detection algorithm checks if the current WLED
> sink configuration is valid. It tries enabling every sink and
> checks if the OVP fault is observed. Based on this information
> it detects and enables the valid sink configuration.
> Auto calibration will be triggered when the OVP fault interrupts
> are seen frequently thereby it tries to fix the sink configuration.
> 
> The auto-detection also kicks in when the connected LED string
> of the display-backlight malfunctions (because of damage) and
> requires the damaged string to be turned off to prevent the
> complete panel and/or board from being damaged.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 410 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 404 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index b5b125c..ff7c409 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c


[...]

> +	/* iterate through the strings one by one */

Please use proper English in comments (less a full stop).

In this case, just s/iterate/Iterate/.

> +	for (i = 0; i < wled->cfg.num_strings; i++) {
> +		sink_test = BIT((WLED4_SINK_REG_CURR_SINK_SHFT + i));
> +
> +		/* Enable feedback control */
> +		rc = regmap_write(wled->regmap, wled->ctrl_addr +
> +				  WLED3_CTRL_REG_FEEDBACK_CONTROL, i + 1);
> +		if (rc < 0) {
> +			dev_err(wled->dev, "Failed to enable feedback for SINK %d rc = %d\n",
> +				i + 1, rc);
> +			goto failed_detect;
> +		}
> +
> +		/* enable the sink */

Here too.  And everywhere else.

> +		rc = regmap_write(wled->regmap, wled->sink_addr +
> +				  WLED4_SINK_REG_CURR_SINK, sink_test);
> +		if (rc < 0) {
> +			dev_err(wled->dev, "Failed to configure SINK %d rc=%d\n",
> +				i + 1, rc);
> +			goto failed_detect;
> +		}
> +
> +		/* Enable the module */
> +		rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
> +					WLED3_CTRL_REG_MOD_EN,
> +					WLED3_CTRL_REG_MOD_EN_MASK,
> +					WLED3_CTRL_REG_MOD_EN_MASK);
> +		if (rc < 0) {
> +			dev_err(wled->dev, "Failed to enable WLED module rc=%d\n",
> +				rc);
> +			goto failed_detect;
> +		}
> +
> +		usleep_range(WLED_SOFT_START_DLY_US,
> +			     WLED_SOFT_START_DLY_US + 1000);
> +
> +		rc = regmap_read(wled->regmap, wled->ctrl_addr +
> +				 WLED3_CTRL_REG_INT_RT_STS, &int_sts);
> +		if (rc < 0) {
> +			dev_err(wled->dev, "Error in reading WLED3_CTRL_INT_RT_STS rc=%d\n",
> +				rc);
> +			goto failed_detect;
> +		}
> +
> +		if (int_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
> +			dev_dbg(wled->dev, "WLED OVP fault detected with SINK %d\n",
> +				i + 1);

I haven't reviewed the whole patch, but this caught my eye.

I think this should be upgraded to dev_warn().

> +		else
> +			sink_valid |= sink_test;
> +
> +		/* Disable the module */
> +		rc = regmap_update_bits(wled->regmap,
> +					wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
> +					WLED3_CTRL_REG_MOD_EN_MASK, 0);
> +		if (rc < 0) {
> +			dev_err(wled->dev, "Failed to disable WLED module rc=%d\n",
> +				rc);
> +			goto failed_detect;
> +		}
> +	}
> +
> +	if (!sink_valid) {
> +		dev_err(wled->dev, "No valid WLED sinks found\n");
> +		wled->disabled_by_short = true;
> +		goto failed_detect;
> +	}
> +
> +	if (sink_valid == sink_config) {
> +		dev_dbg(wled->dev, "WLED auto-detection complete, sink-config=%x OK!\n",
> +			sink_config);

Does this really need to be placed in the kernel log?

> +	} else {
> +		dev_warn(wled->dev, "New WLED string configuration found %x\n",
> +			 sink_valid);

Why would the user care about this?  Is it not normal?

> +		sink_config = sink_valid;
> +	}

[...]

> +static irqreturn_t wled_ovp_irq_handler(int irq, void *_wled)
> +{
> +	struct wled *wled = _wled;
> +	int rc;
> +	u32 int_sts, fault_sts;
> +
> +	rc = regmap_read(wled->regmap,
> +			 wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS, &int_sts);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Error in reading WLED3_INT_RT_STS rc=%d\n",
> +			rc);
> +		return IRQ_HANDLED;
> +	}
> +
> +	rc = regmap_read(wled->regmap, wled->ctrl_addr +
> +			 WLED3_CTRL_REG_FAULT_STATUS, &fault_sts);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Error in reading WLED_FAULT_STATUS rc=%d\n",
> +			rc);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (fault_sts &
> +		(WLED3_CTRL_REG_OVP_FAULT_BIT | WLED3_CTRL_REG_ILIM_FAULT_BIT))

Break the line at the '|'.

> +		dev_dbg(wled->dev, "WLED OVP fault detected, int_sts=%x fault_sts= %x\n",
> +			int_sts, fault_sts);

dev_warn().

> +	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT) {
> +		mutex_lock(&wled->lock);
> +		disable_irq_nosync(wled->ovp_irq);
> +
> +		if (wled_auto_detection_required(wled))
> +			wled_auto_string_detection(wled);
> +
> +		enable_irq(wled->ovp_irq);
> +
> +		mutex_unlock(&wled->lock);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int wled3_setup(struct wled *wled)
>  {
>  	u16 addr;
> @@ -435,8 +775,10 @@ static int wled4_setup(struct wled *wled)
>  		sink_en |= 1 << temp;
>  	}
>  
> -	if (sink_cfg == sink_en)
> -		return 0;
> +	if (sink_cfg == sink_en) {
> +		rc = wled_auto_detection_at_init(wled);
> +		return rc;
> +	}
>  
>  	rc = regmap_update_bits(wled->regmap,
>  				wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
> @@ -499,7 +841,9 @@ static int wled4_setup(struct wled *wled)
>  		return rc;
>  	}
>  
> -	return 0;
> +	rc = wled_auto_detection_at_init(wled);
> +
> +	return rc;
>  }
>  
>  static const struct wled_config wled4_config_defaults = {
> @@ -510,6 +854,7 @@ static int wled4_setup(struct wled *wled)
>  	.switch_freq = 11,
>  	.cabc = false,
>  	.external_pfet = false,
> +	.auto_detection_enabled = false,
>  };
>  
>  static const u32 wled3_boost_i_limit_values[] = {
> @@ -676,6 +1021,7 @@ static int wled_configure(struct wled *wled, int version)
>  		{ "qcom,ext-gen", &cfg->ext_gen, },
>  		{ "qcom,cabc", &cfg->cabc, },
>  		{ "qcom,external-pfet", &cfg->external_pfet, },
> +		{ "qcom,auto-string-detection", &cfg->auto_detection_enabled, },
>  	};
>  
>  	prop_addr = of_get_address(dev->of_node, 0, NULL, NULL);
> @@ -796,6 +1142,40 @@ static int wled_configure_short_irq(struct wled *wled,
>  	return rc;
>  }
>  
> +static int wled_configure_ovp_irq(struct wled *wled,
> +				  struct platform_device *pdev)
> +{
> +	int rc;
> +	u32 val;
> +
> +	wled->ovp_irq = platform_get_irq_byname(pdev, "ovp");
> +	if (wled->ovp_irq < 0) {
> +		dev_dbg(&pdev->dev, "ovp irq is not used\n");

I assume this is optional.  What happens if no IRQ is provided?

If, for instance, polling mode is enabled, maybe something like this
would be better?

      dev_warn(&pdev->dev, "No IRQ found, falling back to polling mode\n");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
