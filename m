Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7554345B17
	for <lists+linux-leds@lfdr.de>; Tue, 23 Mar 2021 10:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCWJky (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 05:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhCWJkr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Mar 2021 05:40:47 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AB9C061765
        for <linux-leds@vger.kernel.org>; Tue, 23 Mar 2021 02:40:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id e14so7758822ejz.11
        for <linux-leds@vger.kernel.org>; Tue, 23 Mar 2021 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zXs5SbjReTCcPNHIOjgz/S/VxQjjjOm2F5VH26PFX/A=;
        b=vj5G9pjhGIJnSvkO3MxGjzGfY8QUgcgIr8he+j8CuGbyyEfP5EQNfrmrCqoMO2CZZR
         bdckdLSvsCoLrRu48EzAHYo4oxQAXRsUdNra/JouZ1qUvhf0uMbOSV9a8F/maOBLtAGe
         RV8MmfA3GtVVlaVinDJ3S/lzsL0qE8O+YupeIpqcYG0BGXJHE1Cmp6/9QWlQ43zL/NC1
         yqNdlWiaSh5Wv3ibiPp3WlVe3b07LVjSxW+cyyrOQWmSgGZNcN5r0izAQP2icBVact0v
         03lDSR3Wp+6bfpj+WhlvsvC7QM5dX/IjE1uKpWf59cRSsmbH828i6f8T/ahuVCQ1UXlk
         uGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zXs5SbjReTCcPNHIOjgz/S/VxQjjjOm2F5VH26PFX/A=;
        b=gj8e+fgPzH9AY5SJWSnlcP8epA3cbirFxlAiX/rD5pFHuG7WGRJ4h6C3ExkK4ALC+x
         oATQ4ZAJlHr7gq4lN7F8vD6RiGkKefsVWGELMkioE23RlR6O/knoIDlviZ98R4I6Ih9p
         gWObrSi0WcLJKnXTpYqpRHHwwP0RBGnJGRV8MayZOwD1jJf0WE3MlHyrVLPddRo/3nP6
         VkmTt+GHgij/TSpaJ6OIfblhmrxyW0MFZVIw/WbGMmUCrPthDwhON49Zxgw1LlVVF59B
         EFT1cvVg1MJVgp1GowFQr21lf29ERoozHcGDtEFzPRZOzXtxsZMzMFp8GEcAYoxfFgZl
         igKg==
X-Gm-Message-State: AOAM531fltCQJem15HN3dTQDRAOVikVpDKcd5iGFmXYZCoV0yu6YCcs9
        R+IrM/TR9YtYHF0NaNmUerO1Dw==
X-Google-Smtp-Source: ABdhPJwpBn5eyAJHqJLdU0Wab+Ro1IIWRDZ1hGuA1iPJeA/Fp0ww4Ebsg8Pw9LsY5dn4holDmh/FWw==
X-Received: by 2002:a17:906:53d7:: with SMTP id p23mr4111539ejo.140.1616492445327;
        Tue, 23 Mar 2021 02:40:45 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id 90sm12948482edf.31.2021.03.23.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 02:40:44 -0700 (PDT)
Date:   Tue, 23 Mar 2021 09:40:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V5 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
Message-ID: <20210323094041.GT2916463@dell>
References: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
 <1616071180-24493-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1616071180-24493-3-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 18 Mar 2021, Kiran Gunda wrote:

> As per the current implementation, after FSC (Full Scale Current)
> and brightness update the sync bits are set-then-cleared.
> But, the FSC and brightness sync takes place when the sync bits are
> set (e.g. on a rising edge). So the hardware team recommends a
> clear-then-set approach in order to guarantee such a transition
> regardless of the previous register state.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
