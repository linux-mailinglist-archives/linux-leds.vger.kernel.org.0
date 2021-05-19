Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53D53891F0
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 16:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354821AbhESOwX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 10:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354832AbhESOwV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 10:52:21 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9C6C061763
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:51:02 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so3609184wmf.5
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9hWo+oUpcm6brp7QVlWP1qMLhPG7on+ugtgTIWdWGgk=;
        b=DkbY+S6Kg6quQSONCtHMXfCOVH4OqhINL2j5T2IQkq270nlPjxKYMOHAvn7NWQh8X3
         Jhma/fsIgCa0KwMhVLvInBhtvcRSi7uxPlGlTwbvO6clzDTUen87CWrbzK5cRjybbWRP
         PhJn84d1pBheNl2WpfksWb0E2d+ClU+7OKVwGil1F+lQanIzMlgNYDRkpjv5F54gFZAF
         JqAdn/Wh9QK5zpJOpgWnqRxeQRToHI85pqtl/YpVaxYF47j9Nz2GikmJ0e3/mhMoEV2F
         Fr0AE4zoSCrxSgKOhdk2qoKqrJ8Bsm9nTRjKH8MfzK/wIo1B8JlgqujcclkxDnRVOdcB
         2MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9hWo+oUpcm6brp7QVlWP1qMLhPG7on+ugtgTIWdWGgk=;
        b=NSbUwdGCuvaMPfKRqYWM1xAEzrfm724RPpVHs1b/ohgvizy/9cFeCIE8bco521C1wN
         GVGLyV8xhHl3FEemd0nMVaWal916d6pAhsM5EvaGUDkkJEzqQj2jyCyCevLdvBOYQqQW
         O0l2pnLCbpkpykSqHa7DZ0czx/5FR1Nt0qoJf/YcprToE6pQc5vxs+c2cHru4DOaWK3T
         CcbSMD5WFNjNMen6uUY2wj73GnXXs++LNW9dko1PSJ8epGdVPX44dxOAeFrvtw/JEXRp
         P2Zy7axT3ObzuBiERLCJd88qHCddwBf/ote6Kl69SwfnOxc8gJbIPcGZ6zTDHh8wGY/d
         AI3A==
X-Gm-Message-State: AOAM5316XeDFswmkCUDlbnD4xn7p6ZhBNamolY6OA60YAge7e/heNI/l
        HStVmkGepu4oW8kt7UaPl2LlDA==
X-Google-Smtp-Source: ABdhPJxq4yOvrbz4+GMdrRqg0XGhy30GzDMOvEMevBFgiblHVaKtLBRosn/C9Txh2zMPl8KgwasAgQ==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr12270205wmq.4.1621435860634;
        Wed, 19 May 2021 07:51:00 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id l8sm7188514wry.55.2021.05.19.07.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:51:00 -0700 (PDT)
Date:   Wed, 19 May 2021 15:50:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: Re: [PATCH v7 3/4] mfd: rt4831: Adds DT binding document for Richtek
 RT4831
Message-ID: <20210519145058.GF2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
 <1621262161-9972-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-3-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
