Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F334DAB32
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 13:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439701AbfJQL3q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 07:29:46 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51605 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409073AbfJQL3q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 07:29:46 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so2187996wme.1
        for <linux-leds@vger.kernel.org>; Thu, 17 Oct 2019 04:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y25SQvHW6/7riw64/wdhH01byzi//dz718QUhzJWQoM=;
        b=LZ2BxUT3XYkN17tFc8dU93+VqpMf/c0mPGTp3UVIyg3upGlb3iY+XDdf1yfAjNQUV9
         MEbhUG/4TIwoL/i8Lg8m5fewSbe3O7KW9XX4meNTSrHGz/tZpRsIOHp0b43jn04q0XCI
         lO2jcDZa4Y8HiPEG3fP63QY6pTT7blXEh1CEunMeL+cA/8ticCfbt7sVTYaoXZEXw1ke
         5sRkxNtiy98Ej84gJCr8gbkGZ+Xxk1gqz+P34xf6RGTNU0XuTkJ9F5jUvo8ZbLcpK/t2
         wEUD0CrW6jFNo5lUiEKuA4upAA7nY7xJYPs35VaGodmJRe61wsS6q1Mh0BQ+ZhYxEVZu
         Z/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y25SQvHW6/7riw64/wdhH01byzi//dz718QUhzJWQoM=;
        b=NdpdkbbvVRkA3tm7jTrrQW/D3s6XxkraupjTXypBQeYFTkaebguWJ1NU71PtDqPO0g
         LWrQDVIB2lqU7OPl/q3M1pODP4qMsl3zO0ddmRtQWSAfOF8JQuN2AfwB6JcuqgQbMeYS
         iw9xxqo4JRq3xPlxd4LwcFGXQ3a5lueQ4F7EYpjiMSDCeDYNYv8qJVS38WXL404hUcVX
         gOzYJuVS7ujnVLnTzK/ZKu6cEm4L7jauZCU+y8KuCJGHSveqrVh/V59t7GZpl3+YOAHk
         sMDOPPAXDuFwHzTg1bHRz3ia5fvxYfbqwbRLmUMI3u7jN8VjElA2m4cAvfbSzmH4ZemD
         ReQQ==
X-Gm-Message-State: APjAAAUkq+sCJp7uvcK8sZEjueQ2yPVMQYG5oH/lBNtFm7j1jFYrrg0F
        +/Nhn+4z5Nw5NSW9GAQuFP7pZg==
X-Google-Smtp-Source: APXvYqy315waZYadAwtLx/wuKd4IUjaUiXe5iNXNBULrE+UNqPPTqxikRQdXUrJkHirN8ZpFE3jJ2w==
X-Received: by 2002:a1c:e057:: with SMTP id x84mr2365727wmg.72.1571311784048;
        Thu, 17 Oct 2019 04:29:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id q22sm1795666wmj.5.2019.10.17.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 04:29:43 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:29:41 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191017112941.qqvgboyambzw63i3@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 16, 2019 at 03:43:46PM +0530, Kiran Gunda wrote:
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

It's a complex bit of code but I'm OK with it in principle. Everything
below is about small details and/or nitpicking.


> +static void wled_ovp_work(struct work_struct *work)
> +{
> +	struct wled *wled = container_of(work,
> +					 struct wled, ovp_work.work);
> +	enable_irq(wled->ovp_irq);
> +}
> +

A bit of commenting about why we have to wait 10ms before enabling the
OVP interrupt would be appreciated.


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
> +		dev_dbg(wled->dev, "WLED OVP fault detected, int_sts=%x fault_sts= %x\n",
> +			int_sts, fault_sts);
> +
> +	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT) {
> +		mutex_lock(&wled->lock);
> +		disable_irq_nosync(wled->ovp_irq);

We're currently running the threaded ISR for this irq. Do we really need
to disable it?

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

Snip.


> +static int wled_remove(struct platform_device *pdev)
> +{
> +	struct wled *wled = dev_get_drvdata(&pdev->dev);
> +
> +	cancel_delayed_work_sync(&wled->ovp_work);
> +	mutex_destroy(&wled->lock);

Have the irq handlers been disabled at this point?

Also, if you want to destroy the mutex shouldn't that code be 
introduced in the same patch that introduces the mutex?
> +
> +	return 0;
> +}


Daniel.
