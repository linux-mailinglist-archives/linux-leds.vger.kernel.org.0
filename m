Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2F76C526A
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjCVRY5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjCVRYe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B152597B
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yybOyM70lubrfgDREY68dFGi3XFk6IxJtz0S+wbusmo=;
        b=PCW4uyEXg81j7lgafRFT//wkHH/ICK25GAbKmz7qPUdJH2kPX+J9Z4/V6f3pTzR5pr1Z6o
        nLgH5ZNtXPZLhn/rHCD+ShAfWUrhZb94k/PHhbOXj6elEsElwsGMKoOCBmxN6O+rdEVl3L
        JgqseODpQHL146VPCPHoWj5K70jIakI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-SrbkknitMCW7SkXlFOGdyA-1; Wed, 22 Mar 2023 13:16:48 -0400
X-MC-Unique: SrbkknitMCW7SkXlFOGdyA-1
Received: by mail-ed1-f70.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so27689065edc.9
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yybOyM70lubrfgDREY68dFGi3XFk6IxJtz0S+wbusmo=;
        b=7IDffTVSb184h/CnWq6CZmaCXOybW8Y1IhoDjDU5ywETyPxMIg0uzHDvaQHqESTxKv
         WIHPngnA35sIMiHqRsqyrdPrJ60wFK3LYNQm1o4kvAKEC5zJBAj6uvZYOd0GxaYDw6/p
         UNx0aW+casag4/f/nm664NE++ii8sVWbmwRwlFwbDk6Pz4uuvL1M3imTi7+coLqB1ajT
         hC8M14Awtsffbc2wbeAKflp45i5MVRDmHSD+XQwJ84WopDG2oVZAHQPglMOG3nlVe0in
         p5cvX5/al6ZHfbFE1OcUnLTcUYA75zdl3rzrfid95jigdO2Rcx9SOK9j2ZgiCuL2N+qc
         E48A==
X-Gm-Message-State: AO0yUKUZ0S+6BtiMZbpGtUFb/IFoGFEjASsH/kr689QnGA6hnZD6Qopm
        lguC4nZdTWXiEe5SgFQ3kwPpONAsUk775sh7zbFn2nGGezIOANZ+tpANGE3Om1HIgsqA5C1/Txy
        Dobsce6hNGVoxF7cvy/iobQ==
X-Received: by 2002:a17:906:f8db:b0:8b1:7ae8:ba6f with SMTP id lh27-20020a170906f8db00b008b17ae8ba6fmr7696679ejb.16.1679505407631;
        Wed, 22 Mar 2023 10:16:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set8faXcfrBJdaqds1K2z+gIvn6NspaXI72JkrVa/RxdzNbL1JuKW9KL8vSeAgaRt1DKAJfrcLw==
X-Received: by 2002:a17:906:f8db:b0:8b1:7ae8:ba6f with SMTP id lh27-20020a170906f8db00b008b17ae8ba6fmr7696658ejb.16.1679505407390;
        Wed, 22 Mar 2023 10:16:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tm8-20020a170907c38800b0093c82edfd48sm21597ejc.80.2023.03.22.10.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:16:46 -0700 (PDT)
Message-ID: <e8138361-7424-3c4d-935a-53dbbe723fa0@redhat.com>
Date:   Wed, 22 Mar 2023 18:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] platform/x86: int3472: Init LED registers using
 platform data
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-3-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-3-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/22/23 17:09, Daniel Scally wrote:
> Check platform data to discover the appropriate settings for the PMIC's
> WLED registers and set them during probe.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

As mentioned already the subsys-prefix for this patch is wrong
and maybe also in the subject do s/LED/WLED/, so we get:

[PATCH 2/8] leds: tps68470: Init WLED registers using platform data

although since the pdata is shared for all tps68470 LEDs
I guess without the W it makes sense too.

With the Subject subsys prefix fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/leds/leds-tps68470.c | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> index 35aeb5db89c8..d2060fe4259d 100644
> --- a/drivers/leds/leds-tps68470.c
> +++ b/drivers/leds/leds-tps68470.c
> @@ -11,6 +11,7 @@
>  #include <linux/leds.h>
>  #include <linux/mfd/tps68470.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/tps68470.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
> @@ -113,6 +114,52 @@ static int tps68470_ledb_current_init(struct platform_device *pdev,
>  	return ret;
>  }
>  
> +static int tps68470_leds_init(struct tps68470_device *tps68470)
> +{
> +	struct tps68470_led_platform_data *pdata = tps68470->dev->platform_data;
> +	int ret;
> +
> +	if (!pdata)
> +		return 0;
> +
> +	ret = regmap_write(tps68470->regmap, TPS68470_REG_ILEDCTL, pdata->iledctl_ctrlb);
> +	if (ret)
> +		return dev_err_probe(tps68470->dev, ret, "failed to set ILED CTRLB\n");
> +
> +	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDMAXF,
> +			   pdata->wledmaxf & TPS68470_WLEDMAXF_MAX_CUR_MASK);
> +	if (ret)
> +		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDMAXF\n");
> +
> +	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDTO, pdata->wledto);
> +	if (ret)
> +		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDTO\n");
> +
> +	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDC1,
> +			   pdata->wledc1 & TPS68470_WLEDC_ILED_MASK);
> +	if (ret)
> +		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDC1\n");
> +
> +	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDC2,
> +			   pdata->wledc2 & TPS68470_WLEDC_ILED_MASK);
> +	if (ret)
> +		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDC2\n");
> +
> +	ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
> +				 TPS68470_WLED_DISLED1,
> +				 pdata->wledctl_disled1 ? TPS68470_WLED_DISLED1 : 0);
> +	if (ret)
> +		return dev_err_probe(tps68470->dev, ret, "failed to set DISLED1\n");
> +
> +	ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
> +				 TPS68470_WLED_DISLED2,
> +				 pdata->wledctl_disled2 ? TPS68470_WLED_DISLED2 : 0);
> +	if (ret)
> +		dev_err_probe(tps68470->dev, ret, "failed to set DISLED2\n");
> +
> +	return 0;
> +}
> +
>  static int tps68470_leds_probe(struct platform_device *pdev)
>  {
>  	int i = 0;
> @@ -160,6 +207,10 @@ static int tps68470_leds_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	ret = tps68470_leds_init(tps68470);
> +	if (ret)
> +		goto err_exit;
> +
>  err_exit:
>  	if (ret) {
>  		for (i = 0; i < TPS68470_NUM_LEDS; i++) {

