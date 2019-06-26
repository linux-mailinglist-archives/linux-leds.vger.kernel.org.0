Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D450356733
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 12:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFZKxe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 06:53:34 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39806 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfFZKxe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 06:53:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so2183804wrt.6
        for <linux-leds@vger.kernel.org>; Wed, 26 Jun 2019 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ChXMkAxeEFCNB3SeouYi0F3f5ZyPMoaVbI0gBmbhYQs=;
        b=iwElkoCgU+DdnxpiGXXE03SHKznHfYnZB3x9WftPaQusBZYk212oLoVKXLkTH7GyBq
         2WU8o7YT2z4OvQPkY5c0bvxUqPHf4s6tn0/PJNKuDiL9/a/1cOcpYCy/Lk/So56QUguq
         KTexW+BCVxEXNeXye1/JJxruD4OgkdsWbX6+QGAizek8BYbu5nSo9FVVtjYNlNLdQCEc
         4pXs/zhHMKAaWrA2kKOkwLmsUS9bITrT4Fecmi0fdl41QLdBFzeC0ldVnElChkVAoLCr
         eHzm07DdF/7yQAKldNBmVQ6QO+yRu4Wy0LXxAmnOj9NEKRQ7lOHirrBMQUcq1tGkJMbC
         YTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ChXMkAxeEFCNB3SeouYi0F3f5ZyPMoaVbI0gBmbhYQs=;
        b=awUc+I/04FmVY74b8cB0TYL6dZbPbDd6Cmx+lOsBOK5FyVfFtyZmUS1P64ztSltdua
         LtlPqYFQ6jqO8Vt67cyxEX/ms7zS2MelXrvCK7tr2qkolB7CQpL4IhkIBRWCqXJYvXPY
         i7w0FagFLCt2exSjS1gu6R8ko3Iz+uXFWMzK7BGXkO8QMWJnjb0lLWPcpsUWSs4Uhl6n
         OdlNajyiphrviD6STOXJWDaJTc27itwidMBHbq9bNM1AwrDWlOQDCAikguf0bP9MF9GB
         JNel8Wzzdy2FocDiTE2Zj1FSVXPs/sjZMfZkXghmddbMyDlHaPukltNdk8I+JpdpOf65
         pEgg==
X-Gm-Message-State: APjAAAV9szpw37ZlgSDUcSXcOUwT/LKw10WCoE3TuNSJtnhNyIEEHsgM
        wFB/B2pkxIUizEXuHKV2CYjyIQ==
X-Google-Smtp-Source: APXvYqw8cRV8HFzMlxssHezN2+vB4WDc6ges9QHy25V3fxPaVhe1dudUKE9VexzAKWJDGVkJZ3u5wQ==
X-Received: by 2002:a5d:6b90:: with SMTP id n16mr3300909wrx.206.1561546411052;
        Wed, 26 Jun 2019 03:53:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id o14sm13726415wrp.77.2019.06.26.03.53.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:53:30 -0700 (PDT)
Date:   Wed, 26 Jun 2019 11:53:28 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Brian Dodge <bdodge09@gmail.com>
Cc:     pavel@ucw.cz, lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, pbacon@psemi.com
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
Message-ID: <20190626105328.f7mb2n7xo5afhuq2@holly.lan>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 25, 2019 at 12:05:29AM -0400, Brian Dodge wrote:
> The original patch adding this driver and DT bindings improperly
> used "arc" as the vendor-prefix. This adds "arctic" which is the
> proper prefix and retains "arc" to allow existing users of the
> "arc" prefix to update to new kernels. There is at least one
> (Samsung Chromebook Plus)
> 
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>

Still needs consensus on the DT bindings but for any future resends
please add this (to this patch only):

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
> ---
>  drivers/video/backlight/arcxcnn_bl.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
> index 7b1c0a0..14c67f2 100644
> --- a/drivers/video/backlight/arcxcnn_bl.c
> +++ b/drivers/video/backlight/arcxcnn_bl.c
> @@ -1,9 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Backlight driver for ArcticSand ARC_X_C_0N_0N Devices
> + * Backlight driver for pSemi (formerly ArcticSand) ARC_X_C_0N_0N Devices
>   *
> - * Copyright 2016 ArcticSand, Inc.
> - * Author : Brian Dodge <bdodge@arcticsand.com>
> + * Copyright 2016-2019  pSemi, Inc.
> + * Author : Brian Dodge <bdodge@psemi.com>
>   */
>  
>  #include <linux/backlight.h>
> @@ -191,27 +191,40 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
>  	if (ret == 0)
>  		lp->pdata->initial_brightness = prog_val;
>  
> -	ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
>  	if (ret == 0)
>  		lp->pdata->led_config_0 = (u8)prog_val;
>  
> -	ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,led-config-1", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,led-config-1", &prog_val);
>  	if (ret == 0)
>  		lp->pdata->led_config_1 = (u8)prog_val;
>  
> -	ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,dim-freq", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,dim-freq", &prog_val);
>  	if (ret == 0)
>  		lp->pdata->dim_freq = (u8)prog_val;
>  
> -	ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,comp-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,comp-config", &prog_val);
>  	if (ret == 0)
>  		lp->pdata->comp_config = (u8)prog_val;
>  
> -	ret = of_property_read_u32(node, "arc,filter-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,filter-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node,
> +				"arc,filter-config", &prog_val);
>  	if (ret == 0)
>  		lp->pdata->filter_config = (u8)prog_val;
>  
> -	ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
> +	ret = of_property_read_u32(node, "arctic,trim-config", &prog_val);
> +	if (ret)
> +		ret = of_property_read_u32(node, "arc,trim-config", &prog_val);
>  	if (ret == 0)
>  		lp->pdata->trim_config = (u8)prog_val;
>  
> @@ -381,6 +394,8 @@ static int arcxcnn_remove(struct i2c_client *cl)
>  }
>  
>  static const struct of_device_id arcxcnn_dt_ids[] = {
> +	{ .compatible = "arctic,arc2c0608" },
> +	/* here to remaim compatible with an older binding, do not use */
>  	{ .compatible = "arc,arc2c0608" },
>  	{ }
>  };
> @@ -404,5 +419,5 @@ static struct i2c_driver arcxcnn_driver = {
>  module_i2c_driver(arcxcnn_driver);
>  
>  MODULE_LICENSE("GPL v2");
> -MODULE_AUTHOR("Brian Dodge <bdodge@arcticsand.com>");
> +MODULE_AUTHOR("Brian Dodge <bdodge@psemi.com>");
>  MODULE_DESCRIPTION("ARCXCNN Backlight driver");
> -- 
> 2.7.4
> 
