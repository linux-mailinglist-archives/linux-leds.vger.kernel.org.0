Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5D7326624
	for <lists+linux-leds@lfdr.de>; Fri, 26 Feb 2021 18:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZRKJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Feb 2021 12:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhBZRKB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Feb 2021 12:10:01 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE00C061788
        for <linux-leds@vger.kernel.org>; Fri, 26 Feb 2021 09:09:08 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id u187so6070148wmg.4
        for <linux-leds@vger.kernel.org>; Fri, 26 Feb 2021 09:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oPmNNtgVI1eH+eqDytkra/zaGpGkiEOuBv8E+PK1q2E=;
        b=L7hDueq6FbCIPz8Y3pcSNYtyDe8eNaCraw1jcrjoeS23ebZwbWTe2IvnUl3GTrNLmq
         dp/21SOTMaADDXil2WuhCsxvlC5Bd8t6Q0CQjJBwgdkDx6CfVANpZLQhHs7HuFp/tUKp
         ugk+lZE1L3c+edikdt8ARj5u40FArM+iVyHpBjX8Uv1EsQ60LVXZpBDQQ8fdHQnKZfNz
         cTjpmuu4CpOZKv6UhEPfmTf1zEiyzlIUG2JkbTKRtqrdRvBv5kIBCgG2Genf1uTGFD+J
         sm4ouIPR9uM8KYMJ6DojeiG7g8mio0pX6cOcHUcdrBSc1xVMNbSKwqDTO5CEYpuya8rP
         U7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oPmNNtgVI1eH+eqDytkra/zaGpGkiEOuBv8E+PK1q2E=;
        b=gO5v9K7eljMFy8QdO2iZpaAoWprQksywRqi6oUCyueQoG2mVEc77FN2gH17wFYEOoo
         wlsPdOL+W2T5YIL92DYWwUnOv0ufHbRgAplp4QYePpbo5F6n/B0CWWW8fhY29V0r54qm
         Fs9vR+tjdD2EeSpRixDr/ozklyfBrj1t4Wr5/Kh3mVK3mWHkwx5wrkqxDqC9jx/lUjD6
         f4CTil1fo67uia4/tyleqMbR1vucLtEqCwQV/U+BQ6NPfH7UEC7gOn/rC+nyP6DXpIDF
         ZFiYfALlfHMXgeU6XeaU4DBO97VQ3RH4nuXSk43uR+BBEjp7O/KUbwroXjVU/z6kgMFi
         uCJQ==
X-Gm-Message-State: AOAM531AnW52uR1ZwDIgDx+39oMfnoMsAAg4LyDn0/YnVerEgWy4Wh9T
        UF6SjWC0VKVf1Lz3euBNLqmYXA==
X-Google-Smtp-Source: ABdhPJy+3JLr8vLHWKe27u3nSTX1ODTzNCh6BSKvpoFvfptBEwnzyGPmA8wyoRhYBiUAbOt8tHcXWw==
X-Received: by 2002:a1c:5584:: with SMTP id j126mr3925587wmb.153.1614359347431;
        Fri, 26 Feb 2021 09:09:07 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id m9sm19290337wml.3.2021.02.26.09.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 09:09:06 -0800 (PST)
Date:   Fri, 26 Feb 2021 17:09:04 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] backlight: qcom-wled: Fix FSC update issue for
 WLED5
Message-ID: <20210226170904.u5ysz6kg4tqbh3us@maple.lan>
References: <1614341544-5306-1-git-send-email-kgunda@codeaurora.org>
 <1614341544-5306-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614341544-5306-2-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 26, 2021 at 05:42:23PM +0530, Kiran Gunda wrote:
> Currently, for WLED5, the FSC (Full scale current) setting is not
> updated properly due to driver toggling the wrong register after
> an FSC update.
> 
> On WLED5 we should only toggle the MOD_SYNC bit after a brightness
> update. For an FSC update we need to toggle the SYNC bits instead.
> 
> Fix it by adopting the common wled3_sync_toggle() for WLED5 and
> introducing new code to the brightness update path to compensate.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
>  drivers/video/backlight/qcom-wled.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3bc7800..aef52b9 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -348,7 +348,7 @@ static int wled3_sync_toggle(struct wled *wled)
>  	return rc;
>  }
>  
> -static int wled5_sync_toggle(struct wled *wled)
> +static int wled5_mod_sync_toggle(struct wled *wled)
>  {
>  	int rc;
>  	u8 val;
> @@ -445,10 +445,23 @@ static int wled_update_status(struct backlight_device *bl)
>  			goto unlock_mutex;
>  		}
>  
> -		rc = wled->wled_sync_toggle(wled);
> -		if (rc < 0) {
> -			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
> -			goto unlock_mutex;
> +		if (wled->version < 5) {
> +			rc = wled->wled_sync_toggle(wled);
> +			if (rc < 0) {
> +				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
> +				goto unlock_mutex;
> +			}
> +		} else {
> +			/*
> +			 * For WLED5 toggling the MOD_SYNC_BIT updates the
> +			 * brightness
> +			 */
> +			rc = wled5_mod_sync_toggle(wled);
> +			if (rc < 0) {
> +				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
> +					rc);
> +				goto unlock_mutex;
> +			}
>  		}
>  	}
>  
> @@ -1459,7 +1472,7 @@ static int wled_configure(struct wled *wled)
>  		size = ARRAY_SIZE(wled5_opts);
>  		*cfg = wled5_config_defaults;
>  		wled->wled_set_brightness = wled5_set_brightness;
> -		wled->wled_sync_toggle = wled5_sync_toggle;
> +		wled->wled_sync_toggle = wled3_sync_toggle;
>  		wled->wled_cabc_config = wled5_cabc_config;
>  		wled->wled_ovp_delay = wled5_ovp_delay;
>  		wled->wled_auto_detection_required =
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
