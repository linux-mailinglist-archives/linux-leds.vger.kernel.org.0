Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0977CE1FA8
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406888AbfJWPnu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 11:43:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44572 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404173AbfJWPnu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 11:43:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so22622887wrl.11
        for <linux-leds@vger.kernel.org>; Wed, 23 Oct 2019 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cp/bKPmOd9wwA4BZhWKOauvWXaeJD/pIcjMd6beaxRQ=;
        b=le/ggxrtxBY0aOfi5C32/o6JeR/4ennlok4WqnjTgQx7s9X1xDaDNz9CcPys+4Da/u
         +l4GR7jZlPHmDB9FqWPUeXo188cyFjdNJIFXoZAyXtwRdiUbh6XQ9b6GyYun46CHL/o1
         6HRGtILIunUXlhxYtJDuZ0wx05ULasV2hwY0NNkkFkep29gtTTupyBctD/7W0pYsiFF9
         O0vM/7qVhFfVTanPnnMbFg8Y0ia/5MP98XgupTU79vw23VA9+ekx4Imj6+w1aAtvUZZ9
         DYKtEqZzxezcsbEcoQQ9xvaNmOuD9Btk90igjbE8u6deXPO4j/25sSSo79H4wtyo4HbI
         8Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cp/bKPmOd9wwA4BZhWKOauvWXaeJD/pIcjMd6beaxRQ=;
        b=saU/ya+wz3qR2dAAEIVu9o54Aoj3/f4jUxpQ6Wr4ZeNmLC/mbH6UKfoYFX9T5syXuH
         N1t7viyINujyhuHq3ucGTQWmw2Z6C8LneptQ4CfOQfguXYsbMTELoIuuWNpUp/fUfjSl
         q3nZ4x42wwblWy5l1ZTj2rqB+8tJZDcW0q2PmzQYbmKehkpr4bgQIk3HY+Gcg83Z05bK
         pe6ECHPMoi7DROoQ8wUY24q2FujfCipspuRBECaFRK33oV13O+jMmUSYNFZ1sycTvIUU
         tJ8YJWxZvtGpGXxMsRvi1u3H0Awwo0/t4aEDF8j95asnV4LVDPaK7IEui0faC+ookVog
         bGMA==
X-Gm-Message-State: APjAAAVowdvWtpVxn/buACzeGLFv7WQbrGJF88Kwy9DZDGrRVne2p+F/
        0J6UqEgZv7d7yTCFlRIGQa0EXQ==
X-Google-Smtp-Source: APXvYqxNW7pX8Ad3lZSxQ/eqvR5t4G3x36lwT8btH4OZn3/Gn7z2W416Q+XgJz+E5urIkkOXRyTYWA==
X-Received: by 2002:adf:e446:: with SMTP id t6mr8980725wrm.7.1571845425844;
        Wed, 23 Oct 2019 08:43:45 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id 12sm15136004wmk.13.2019.10.23.08.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 08:43:45 -0700 (PDT)
Date:   Wed, 23 Oct 2019 16:43:43 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V9 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191023154343.p5tc7m5muez3td46@holly.lan>
References: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
 <1571814423-6535-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571814423-6535-7-git-send-email-kgunda@codeaurora.org>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 23, 2019 at 12:37:03PM +0530, Kiran Gunda wrote:
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/qcom-wled.c | 400 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 394 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 658b1e0..33b6007 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -17,19 +17,29 @@
>  #define WLED_MAX_STRINGS				4
>  
>  #define WLED_DEFAULT_BRIGHTNESS				2048
> -
> +#define WLED_SOFT_START_DLY_US				10000
>  #define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
>  
>  /* WLED3/WLED4 control registers */
> +#define WLED3_CTRL_REG_FAULT_STATUS			0x08
> +#define  WLED3_CTRL_REG_ILIM_FAULT_BIT			BIT(0)
> +#define  WLED3_CTRL_REG_OVP_FAULT_BIT			BIT(1)
> +#define  WLED4_CTRL_REG_SC_FAULT_BIT			BIT(2)
> +
> +#define WLED3_CTRL_REG_INT_RT_STS			0x10
> +#define  WLED3_CTRL_REG_OVP_FAULT_STATUS		BIT(1)
> +
>  #define WLED3_CTRL_REG_MOD_EN				0x46
>  #define  WLED3_CTRL_REG_MOD_EN_MASK			BIT(7)
>  #define  WLED3_CTRL_REG_MOD_EN_SHIFT			7
>  
> +#define WLED3_CTRL_REG_FEEDBACK_CONTROL			0x48
> +
>  #define WLED3_CTRL_REG_FREQ				0x4c
>  #define  WLED3_CTRL_REG_FREQ_MASK			GENMASK(3, 0)
>  
>  #define WLED3_CTRL_REG_OVP				0x4d
> -#define  WLED3_CTRL_REG_OVP_MASK				GENMASK(1, 0)
> +#define  WLED3_CTRL_REG_OVP_MASK			GENMASK(1, 0)
>  
>  #define WLED3_CTRL_REG_ILIMIT				0x4e
>  #define  WLED3_CTRL_REG_ILIMIT_MASK			GENMASK(2, 0)
> @@ -119,6 +129,7 @@ struct wled_config {
>  	bool ext_gen;
>  	bool cabc;
>  	bool external_pfet;
> +	bool auto_detection_enabled;
>  };
>  
>  struct wled {
> @@ -127,17 +138,22 @@ struct wled {
>  	struct regmap *regmap;
>  	struct mutex lock;	/* Lock to avoid race from thread irq handler */
>  	ktime_t last_short_event;
> +	ktime_t start_ovp_fault_time;
>  	u16 ctrl_addr;
>  	u16 sink_addr;
>  	u16 max_string_count;
> +	u16 auto_detection_ovp_count;
>  	u32 brightness;
>  	u32 max_brightness;
>  	u32 short_count;
> +	u32 auto_detect_count;
>  	bool disabled_by_short;
>  	bool has_short_detect;
>  	int short_irq;
> +	int ovp_irq;
>  
>  	struct wled_config cfg;
> +	struct delayed_work ovp_work;
>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
>  };
>  
> @@ -182,6 +198,13 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
>  	return 0;
>  }
>  
> +static void wled_ovp_work(struct work_struct *work)
> +{
> +	struct wled *wled = container_of(work,
> +					 struct wled, ovp_work.work);
> +	enable_irq(wled->ovp_irq);
> +}
> +
>  static int wled_module_enable(struct wled *wled, int val)
>  {
>  	int rc;
> @@ -193,7 +216,25 @@ static int wled_module_enable(struct wled *wled, int val)
>  				WLED3_CTRL_REG_MOD_EN,
>  				WLED3_CTRL_REG_MOD_EN_MASK,
>  				val << WLED3_CTRL_REG_MOD_EN_SHIFT);
> -	return rc;
> +	if (rc < 0)
> +		return rc;
> +
> +	if (wled->ovp_irq > 0) {
> +		if (val) {
> +			/*
> +			 * The hardware generates a storm of spurious OVP
> +			 * interrupts during soft start operations. So defer
> +			 * enabling the IRQ for 10ms to ensure that the
> +			 * soft start is complete.
> +			 */
> +			schedule_delayed_work(&wled->ovp_work, HZ / 100);
> +		} else {
> +			if (!cancel_delayed_work_sync(&wled->ovp_work))
> +				disable_irq(wled->ovp_irq);
> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  static int wled_sync_toggle(struct wled *wled)
> @@ -300,6 +341,304 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
>  	return IRQ_HANDLED;
>  }
>  
> +#define AUTO_DETECT_BRIGHTNESS		200
> +
> +static void wled_auto_string_detection(struct wled *wled)
> +{
> +	int rc = 0, i;
> +	u32 sink_config = 0, int_sts;
> +	u8 sink_test = 0, sink_valid = 0, val;
> +
> +	/* Read configured sink configuration */
> +	rc = regmap_read(wled->regmap, wled->sink_addr +
> +			 WLED4_SINK_REG_CURR_SINK, &sink_config);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to read SINK configuration rc=%d\n",
> +			rc);
> +		goto failed_detect;
> +	}
> +
> +	/* Disable the module before starting detection */
> +	rc = regmap_update_bits(wled->regmap,
> +				wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
> +				WLED3_CTRL_REG_MOD_EN_MASK, 0);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to disable WLED module rc=%d\n", rc);
> +		goto failed_detect;
> +	}
> +
> +	/* Set low brightness across all sinks */
> +	rc = wled4_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to set brightness for auto detection rc=%d\n",
> +			rc);
> +		goto failed_detect;
> +	}
> +
> +	if (wled->cfg.cabc) {
> +		for (i = 0; i < wled->cfg.num_strings; i++) {
> +			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
> +						WLED4_SINK_REG_STR_CABC(i),
> +						WLED4_SINK_REG_STR_CABC_MASK,
> +						0);
> +			if (rc < 0)
> +				goto failed_detect;
> +		}
> +	}
> +
> +	/* Disable all sinks */
> +	rc = regmap_write(wled->regmap,
> +			  wled->sink_addr + WLED4_SINK_REG_CURR_SINK, 0);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to disable all sinks rc=%d\n", rc);
> +		goto failed_detect;
> +	}
> +
> +	/* Iterate through the strings one by one */
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
> +		/* Enable the sink */
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
> +	if (sink_valid != sink_config) {
> +		dev_warn(wled->dev, "%x is not a valid sink configuration - using %x instead\n",
> +			 sink_config, sink_valid);
> +		sink_config = sink_valid;
> +	}
> +
> +	/* Write the new sink configuration */
> +	rc = regmap_write(wled->regmap,
> +			  wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
> +			  sink_config);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to reconfigure the default sink rc=%d\n",
> +			rc);
> +		goto failed_detect;
> +	}
> +
> +	/* Enable valid sinks */
> +	for (i = 0; i < wled->cfg.num_strings; i++) {
> +		if (wled->cfg.cabc) {
> +			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
> +						WLED4_SINK_REG_STR_CABC(i),
> +						WLED4_SINK_REG_STR_CABC_MASK,
> +						WLED4_SINK_REG_STR_CABC_MASK);
> +			if (rc < 0)
> +				goto failed_detect;
> +		}
> +
> +		if (sink_config & BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
> +			val = WLED4_SINK_REG_STR_MOD_MASK;
> +		else
> +			val = 0x0; /* Disable modulator_en for unused sink */
> +
> +		rc = regmap_write(wled->regmap, wled->sink_addr +
> +				  WLED4_SINK_REG_STR_MOD_EN(i), val);
> +		if (rc < 0) {
> +			dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
> +				rc);
> +			goto failed_detect;
> +		}
> +	}
> +
> +	/* Restore the feedback setting */
> +	rc = regmap_write(wled->regmap,
> +			  wled->ctrl_addr + WLED3_CTRL_REG_FEEDBACK_CONTROL, 0);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to restore feedback setting rc=%d\n",
> +			rc);
> +		goto failed_detect;
> +	}
> +
> +	/* Restore brightness */
> +	rc = wled4_set_brightness(wled, wled->brightness);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to set brightness after auto detection rc=%d\n",
> +			rc);
> +		goto failed_detect;
> +	}
> +
> +	rc = regmap_update_bits(wled->regmap,
> +				wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
> +				WLED3_CTRL_REG_MOD_EN_MASK,
> +				WLED3_CTRL_REG_MOD_EN_MASK);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to enable WLED module rc=%d\n", rc);
> +		goto failed_detect;
> +	}
> +
> +failed_detect:
> +	return;
> +}
> +
> +#define WLED_AUTO_DETECT_OVP_COUNT		5
> +#define WLED_AUTO_DETECT_CNT_DLY_US		USEC_PER_SEC
> +static bool wled_auto_detection_required(struct wled *wled)
> +{
> +	s64 elapsed_time_us;
> +
> +	if (!wled->cfg.auto_detection_enabled)
> +		return false;
> +
> +	/*
> +	 * Check if the OVP fault was an occasional one
> +	 * or if it's firing continuously, the latter qualifies
> +	 * for an auto-detection check.
> +	 */
> +	if (!wled->auto_detection_ovp_count) {
> +		wled->start_ovp_fault_time = ktime_get();
> +		wled->auto_detection_ovp_count++;
> +	} else {
> +		elapsed_time_us = ktime_us_delta(ktime_get(),
> +						 wled->start_ovp_fault_time);
> +		if (elapsed_time_us > WLED_AUTO_DETECT_CNT_DLY_US)
> +			wled->auto_detection_ovp_count = 0;
> +		else
> +			wled->auto_detection_ovp_count++;
> +
> +		if (wled->auto_detection_ovp_count >=
> +				WLED_AUTO_DETECT_OVP_COUNT) {
> +			wled->auto_detection_ovp_count = 0;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static int wled_auto_detection_at_init(struct wled *wled)
> +{
> +	int rc;
> +	u32 fault_status, rt_status;
> +
> +	if (!wled->cfg.auto_detection_enabled)
> +		return 0;
> +
> +	rc = regmap_read(wled->regmap,
> +			 wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS,
> +			 &rt_status);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to read RT status rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = regmap_read(wled->regmap,
> +			 wled->ctrl_addr + WLED3_CTRL_REG_FAULT_STATUS,
> +			 &fault_status);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to read fault status rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	if ((rt_status & WLED3_CTRL_REG_OVP_FAULT_STATUS) ||
> +	    (fault_status & WLED3_CTRL_REG_OVP_FAULT_BIT)) {
> +		mutex_lock(&wled->lock);
> +		wled_auto_string_detection(wled);
> +		mutex_unlock(&wled->lock);
> +	}
> +
> +	return rc;
> +}
> +
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
> +	if (fault_sts & (WLED3_CTRL_REG_OVP_FAULT_BIT |
> +		WLED3_CTRL_REG_ILIM_FAULT_BIT))
> +		dev_dbg(wled->dev, "WLED OVP fault detected, int_sts=%x fault_sts= %x\n",
> +			int_sts, fault_sts);
> +
> +	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT) {
> +		if (wled_auto_detection_required(wled)) {
> +			mutex_lock(&wled->lock);
> +			wled_auto_string_detection(wled);
> +			mutex_unlock(&wled->lock);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int wled3_setup(struct wled *wled)
>  {
>  	u16 addr;
> @@ -436,8 +775,10 @@ static int wled4_setup(struct wled *wled)
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
> @@ -500,7 +841,9 @@ static int wled4_setup(struct wled *wled)
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
> @@ -511,6 +854,7 @@ static int wled4_setup(struct wled *wled)
>  	.switch_freq = 11,
>  	.cabc = false,
>  	.external_pfet = false,
> +	.auto_detection_enabled = false,
>  };
>  
>  static const u32 wled3_boost_i_limit_values[] = {
> @@ -677,6 +1021,7 @@ static int wled_configure(struct wled *wled, int version)
>  		{ "qcom,ext-gen", &cfg->ext_gen, },
>  		{ "qcom,cabc", &cfg->cabc, },
>  		{ "qcom,external-pfet", &cfg->external_pfet, },
> +		{ "qcom,auto-string-detection", &cfg->auto_detection_enabled, },
>  	};
>  
>  	prop_addr = of_get_address(dev->of_node, 0, NULL, NULL);
> @@ -797,6 +1142,40 @@ static int wled_configure_short_irq(struct wled *wled,
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
> +		dev_dbg(&pdev->dev, "OVP IRQ not found - disabling automatic string detection\n");
> +		return 0;
> +	}
> +
> +	rc = devm_request_threaded_irq(wled->dev, wled->ovp_irq, NULL,
> +				       wled_ovp_irq_handler, IRQF_ONESHOT,
> +				       "wled_ovp_irq", wled);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Unable to request ovp_irq (err:%d)\n",
> +			rc);
> +		wled->ovp_irq = 0;
> +		return 0;
> +	}
> +
> +	rc = regmap_read(wled->regmap, wled->ctrl_addr +
> +			 WLED3_CTRL_REG_MOD_EN, &val);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* Keep OVP irq disabled until module is enabled */
> +	if (!(val & WLED3_CTRL_REG_MOD_EN_MASK))
> +		disable_irq(wled->ovp_irq);
> +
> +	return 0;
> +}
> +
>  static const struct backlight_ops wled_ops = {
>  	.update_status = wled_update_status,
>  };
> @@ -837,6 +1216,7 @@ static int wled_probe(struct platform_device *pdev)
>  
>  	switch (version) {
>  	case 3:
> +		wled->cfg.auto_detection_enabled = false;
>  		rc = wled3_setup(wled);
>  		if (rc) {
>  			dev_err(&pdev->dev, "wled3_setup failed\n");
> @@ -858,10 +1238,16 @@ static int wled_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> +	INIT_DELAYED_WORK(&wled->ovp_work, wled_ovp_work);
> +
>  	rc = wled_configure_short_irq(wled, pdev);
>  	if (rc < 0)
>  		return rc;
>  
> +	rc = wled_configure_ovp_irq(wled, pdev);
> +	if (rc < 0)
> +		return rc;
> +
>  	val = WLED_DEFAULT_BRIGHTNESS;
>  	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
>  
> @@ -880,7 +1266,9 @@ static int wled_remove(struct platform_device *pdev)
>  	struct wled *wled = dev_get_drvdata(&pdev->dev);
>  
>  	mutex_destroy(&wled->lock);
> +	cancel_delayed_work_sync(&wled->ovp_work);
>  	disable_irq(wled->short_irq);
> +	disable_irq(wled->ovp_irq);
>  
>  	return 0;
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
