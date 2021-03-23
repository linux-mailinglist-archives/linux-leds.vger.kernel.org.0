Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B156E3459F2
	for <lists+linux-leds@lfdr.de>; Tue, 23 Mar 2021 09:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhCWIj6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 04:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCWIjj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Mar 2021 04:39:39 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA2DC061763
        for <linux-leds@vger.kernel.org>; Tue, 23 Mar 2021 01:39:39 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k10so25715597ejg.0
        for <linux-leds@vger.kernel.org>; Tue, 23 Mar 2021 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vOdKWnp3rkpIGMt87ZNlf2cZf53/gDQXm8BtihNuwrY=;
        b=awC7OJCja/vDjs8UM3Q2cV7cH4nuw99ReUsihpNF+0rbb/GYsXuZl+yoz8gQu8xn4B
         hTALcZCKLmRhR6rGBx5oe19l9xnWJ31Ch53+rY2CpZSSvH55LYyJp+91113PSVJNIS00
         yFWPcW99/D9lZFnQZlpOHcfmEI5dxY6BBarjNauuYBRpKnAvbIeobKullrS6/F+GabEX
         RLIqR2rCthAonYJaBQByTJodXq+ZjqYwTvE5UiCKMUxKQmKPupfoBqFqkV0eDKW7SzPm
         0+ul8XGZKTS40YtkXqZCXjiN7E6EnNaZwrf+8JXCI2s9pdm7CQckxordKve2k8LhNwLb
         jcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vOdKWnp3rkpIGMt87ZNlf2cZf53/gDQXm8BtihNuwrY=;
        b=o6z66RUDtOAD9PO7QcQgdmOFD3SwwI0nNCmAp9FfJJnY7MvghQVMbTkQdcyGJou8CZ
         fSot3pGgqOuuMWFVi2E6Il0VJnQFdzQos6u29DYFljvjpmQP7UciStl8SSmjQEl7Ik/d
         zHKJAa6RIu9XWtQii/DcyZNjuqSgvvFFAZGWAKtVqgFDW38fUMqeHu7tzGPmc6l5mfpE
         r4/GEKUVzoX93HVbCcKPrrREWuMIpy9R6eit3gzTd40Ie5/EaFKXLUzQ6zGHFKR0Hiyl
         yoLTT6NDIU/mPKpBgIt5UPPhvWTdxdMTYZxnHsGme27ip4XT/q5gGMLIFkzBd+kF4EE3
         oARg==
X-Gm-Message-State: AOAM532LYc9vnfH3xKH2GOwuXlqOLpmmIvJsLAL8UNfQ63WhUp2vHqzP
        ZBuYnYhMmzkpIm3AxgE9LTIXLA==
X-Google-Smtp-Source: ABdhPJztz2rpnHmS0vjtxAqb+sjwT+S9UIOX/8oNcIG+D+p3IjWse50o3nha+gQW7cNBnqWhjOEJGw==
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr3749846ejb.360.1616488777820;
        Tue, 23 Mar 2021 01:39:37 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id h13sm12649939edz.71.2021.03.23.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 01:39:37 -0700 (PDT)
Date:   Tue, 23 Mar 2021 08:39:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210323083935.GF2916463@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210322161810.biagj2qro66rv4gt@maple.lan>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 22 Mar 2021, Daniel Thompson wrote:

> On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> > Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Why are you Reviewing/Acking a patch that was applied on the 10th?

> > ---
> >  drivers/video/backlight/qcom-wled.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index 3bc7800eb0a9..497b9035a908 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -1704,6 +1704,7 @@ static int wled_remove(struct platform_device *pdev)
> >  
> >  static const struct of_device_id wled_match_table[] = {
> >  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> > +	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
> >  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
> >  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
> >  	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
