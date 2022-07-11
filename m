Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9105F55C5AC
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jun 2022 14:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236793AbiF0OI3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Jun 2022 10:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236760AbiF0OIR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jun 2022 10:08:17 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B87312D15
        for <linux-leds@vger.kernel.org>; Mon, 27 Jun 2022 07:08:14 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so792827wmb.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Jun 2022 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mahcPko5Q/l61Ik8IYzCrdKLW0WVu7DFgtJr7eDzeMU=;
        b=FpVYcfDzaK8POC7mxKA2Rffo95k0xE0S5j1XTSQtUsUfm3/jMF27ewxALX1PIk7kqX
         c8HG6aIoRj9RFl24vtAvT4WOA9G0fDAORWX/EBZ6dBKMqPfFPKnMRam5b0i34zSN4T6g
         rympXkeeGoK4mb4gE7fls9e0Ujdxa7WTQzdA3Wp2B1HPx7cF3S8Dgj/MyMX4+vBi+tnz
         dSzW2QCTo2eHi19TZYVxBiSWI/9Qx0FW7+icVuPyDbG8kikrO+GZ0PRMGRPG2WaLQrKl
         2atjwiKdqr+Z0kcPAi7UXR83ZRynYIZqQ+goItSRBB1HB5xEC5ECEOwaYMUnsoidfDX3
         buDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mahcPko5Q/l61Ik8IYzCrdKLW0WVu7DFgtJr7eDzeMU=;
        b=AlPtuVpxtdgV7E1ydQ+uwSc3TeHq/UPK9Ej8FkW6qqi+l1/B+IMhihnZqAcjV65ppw
         5tcBClqSVKXtfMdpm1CqmhkxFdIbf6YoNSvbSs6DBRagRlS5auXqZtFPEbgakgpVUC8P
         dVWlDGhrpJMAWqkeQvCDhrVME86fad6fvOvny7jqwMRA8wOkDYeTcYvd3y/dFXehB1QS
         2yBbsDXUH7vu0K2FtbpmqQ577EwG+JK5VdRjceR4aVNbZE2LQFOgdA4MFOBZ1qOP2Z1A
         d8WrKDdYtMz5MESllz+2vOXt7NNkiHnFroLFNhPrEmcpTzPmfNM2Y6G/uKPJ/QzEI9si
         RfLw==
X-Gm-Message-State: AJIora9LVmwAFYHBDrv3F9UngkjlopJFybId+C554Bhk0X/SjHL9eWT9
        GGiZ/RWGlJXsNxAfxWADM/RmSA==
X-Google-Smtp-Source: AGRyM1vZFeymKInzIO+gklwemo43BkiJ8/H5fHHYi2uBglWy1rGRyAdw66xg6V+38wrpIbqKtAglGA==
X-Received: by 2002:a7b:c1cb:0:b0:3a0:4aec:7eb7 with SMTP id a11-20020a7bc1cb000000b003a04aec7eb7mr5220948wmj.96.1656338892963;
        Mon, 27 Jun 2022 07:08:12 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0021badf3cb26sm12705119wrr.63.2022.06.27.07.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:08:12 -0700 (PDT)
Date:   Mon, 27 Jun 2022 15:08:10 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        deller@gmx.de, cy_huang@richtek.com, lucas_tsai@richtek.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] backlight: rt4831: Apply ocp level from devicetree
Message-ID: <Yrm5yliOqzVtJoWk@google.com>
References: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
 <1655807788-24511-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655807788-24511-3-git-send-email-u0084500@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 21 Jun 2022, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property parsing in
> device_property_init function.
> 
> This value may configure prior to the kernel driver. If it's not specified in
> devicetree, keep the original setting. Else, use clamp to align the
> value in min/max range and also roundup to choose the best selector.
> 
> Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Hi, Daniel:
> 
> I may use the wrong macro, must be 'DIV_ROUND_UP', not 'roundup'.
> the v4 is to fix it.
> 
> Since v4
> - Fix wrong macro usage, must be 'DIV_ROUND_UP', not 'roundup'
> 
> Since v2:
> - Prase the 'richtek,bled-ocp-microamp', clamp the value in min/max range, and
>   roundup to get the best selector.
> 
> ---
>  drivers/video/backlight/rt4831-backlight.c | 33 +++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
