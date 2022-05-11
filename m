Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55871522A8F
	for <lists+linux-leds@lfdr.de>; Wed, 11 May 2022 05:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236784AbiEKDyQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 May 2022 23:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbiEKDyM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 May 2022 23:54:12 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8A74C7A3
        for <linux-leds@vger.kernel.org>; Tue, 10 May 2022 20:54:11 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-edeb6c3642so1418403fac.3
        for <linux-leds@vger.kernel.org>; Tue, 10 May 2022 20:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0WrSL/b+MR9+m4rRbjGXRX60B+r7zy7wkt64zUH48oY=;
        b=rDNhyYBHwTL4zR2u6Rh91X182mgiFM7lrZSGXKOmY04hNhVAPm4Dgx0gU5cVJ2vGDC
         VVK0s4uScAZKYRBD/jNDbgkWWuBV5j+CeByod0LNmbTJY6H1BdD52pzirbR50niNQOWs
         4UcMfF4B2g4Ic9rYOGzl0LOSN1aaLtLb/R9U55fs4o/J0pMUPrqbzTdJSVKL4Fh78wGH
         oqA+4Tao/oGIRZvarBpyi6x4Gmuur5E3YRVUVPWpq48UoXcyFBPUo67hsWk85HdW1Iyu
         UKVBVAQsXQiIpeynG/0M9jNsljMLvTSFcolAfzNWxtFedgaFi3D/S+XxgXcjaVIGS2sh
         xkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0WrSL/b+MR9+m4rRbjGXRX60B+r7zy7wkt64zUH48oY=;
        b=tGXxsB6m00vf6nMRUZ8zMpsYU2CO1mte0S0rTVXS7bwzDU3o1RFJdB63SnrbJjLUp4
         2IMjjdy87iQlf6ObT+ic2QjXqCs8Z4/bDSX5mWGtyTV6/kGzg3T8f9QfoFVHL7vKyDcX
         jeLO/O/TT1shhjvUm9RhOElHqeSqLOta50riqIxIBj0KfGSl0142QuuXwLJ3xvbwvkBn
         lzJI/pO3RQgwGpSoDgwV6cCxtiW3lUD7eDOa18JLD79hlLTUChJN+s2MOhPyUHVuQecm
         TEKB79IBwg2CraoBXo7WRXbddCc2TFmOcvIClBJxTmK4Yx9G3RTv3qERR2w5G8c5/rtb
         4gNA==
X-Gm-Message-State: AOAM5329q4GpdDkBQPyGXpWCehd6IXLeEemGa2tKVyZhq3ezaBTM3jtc
        OMldlzdMTwzdN9Il/zWGfhgBmA==
X-Google-Smtp-Source: ABdhPJyoFDZ6uvhFkWPUEbCyNMWvl/HBFzH2dTTIdFcRPaK+Uq/uWTzwMP5AeRGfoz4hWcMS4Eo26w==
X-Received: by 2002:a05:6870:818a:b0:f1:1223:3afd with SMTP id k10-20020a056870818a00b000f112233afdmr497822oae.271.1652241250132;
        Tue, 10 May 2022 20:54:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l6-20020a056830154600b0060603221269sm397354otp.57.2022.05.10.20.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 20:54:09 -0700 (PDT)
Date:   Tue, 10 May 2022 22:54:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: Re: [PATCH 2/4] leds: qcom-lpg: Add PM660L configuration and
 compatible
Message-ID: <YnszX1wdQhUSkgyH@builder.lan>
References: <20220507221123.2201668-1-marijn.suijten@somainline.org>
 <20220507221123.2201668-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507221123.2201668-2-marijn.suijten@somainline.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat 07 May 17:11 CDT 2022, Marijn Suijten wrote:

> Inherit PM660L PMIC LPG/triled block configuration from downstream
> drivers and DT sources, consisting of a triled block with automatic
> trickle charge control and source selection, three colored led channels
> belonging to the synchronized triled block and one loose PWM channel.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index cfa3362b2457..30c12ac8eed4 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1271,6 +1271,23 @@ static int lpg_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct lpg_data pm660l_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 0x100,

The documentation tells me that you have 49 entries of LUT on the
PM660L.

> +
> +	.triled_base = 0xd000,
> +	.triled_has_atc_ctl = true,
> +	.triled_has_src_sel = true,
> +
> +	.num_channels = 4,
> +	.channels = (struct lpg_channel_data[]) {

This can be const

Regards,
Bjorn

> +		{ .base = 0xb100, .triled_mask = BIT(5) },
> +		{ .base = 0xb200, .triled_mask = BIT(6) },
> +		{ .base = 0xb300, .triled_mask = BIT(7) },
> +		{ .base = 0xb400 },
> +	},
> +};
> +
>  static const struct lpg_data pm8916_pwm_data = {
>  	.num_channels = 1,
>  	.channels = (const struct lpg_channel_data[]) {
> @@ -1391,6 +1408,7 @@ static const struct lpg_data pm8350c_pwm_data = {
>  };
>  
>  static const struct of_device_id lpg_of_table[] = {
> +	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
>  	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
>  	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
>  	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
> -- 
> 2.36.0
> 
