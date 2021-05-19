Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D57D3891E9
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 16:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354818AbhESOvz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 10:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354811AbhESOvz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 10:51:55 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C156C061763
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:50:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v12so14329417wrq.6
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Bju2/0eN1crwRy8NW0NKdt4SusccnUyH2kNJFGpO3Gg=;
        b=BQ0wb+l4eU5E6LXYCwaarjsAw6yPlLu9W6EiabgI+nO22I+6DV/bIxaDS5Kc/NkZ9z
         g5ArK3rjoggNB6rgNnxcGpn/MDh4rC5iJIQ9ptEO8ZIDJRbQovG88q8caw+Iw6Vo1K/7
         cT6j1A7d/Eqf0dtlUKxAkQlsICEjFzHrEor1ZLrZez3sN2dN8okRW2WLGn5Q5NeWtXzQ
         BJOx2fdWrlKwYPfZMPpDbIKMzFHZFm7Y9A1ibD6cMHShxytE94HxUt/iCqnMUXkl7Aev
         yPWcWLE7bC3e/1CIkS0QDIbZBE0Tuctn6mGNoYgfbMZKEz7pgUAF6QgCLssN+Kyx/SjJ
         3Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Bju2/0eN1crwRy8NW0NKdt4SusccnUyH2kNJFGpO3Gg=;
        b=LiAnelbXb4ERmFdc4JgtbaJ7eibZT/bMyXGcWIPJDJnovZJw/ab3XRMRFSFd5OQzsN
         GWWapFKwoocvvx5nv3QrI1+nlepXiHE8IrxvNCYWTCcIL7ny0R6vOeFG+yLSMYUwtf5B
         PYovQTGy99YJahHBl9aOB1pPWWxxCOoZ+j47gG1FHM/EVnwZ1llEGko2hl3TxFVyuopl
         ZvpUWw56lr1eYf4IhD6yC9uYt5x6R7we9Ni0SOmJZNpY8SgGCX5U19IsiEHkZswrK2Iz
         u3XymlbJBliX9vOMK0dCsmVcLgt4lAumYYgDWmdd9U/Mw4ck2I0Gc8e0fvDA+4rSaabb
         IUnA==
X-Gm-Message-State: AOAM533gUcafk0YMDKGrnsJL6s0/Iu9ZTfqanYvvfsPuye5oUl9sR7AY
        D8JzTH9hIAxje9jksov2nczWGg==
X-Google-Smtp-Source: ABdhPJyiC8K7WnFxsXBX7COv5F4gSgoaz/20+HNO7ys0bYcGX56g68V0qD16NLwnO5bgMXzcNVAHcw==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr14535482wrp.89.1621435831756;
        Wed, 19 May 2021 07:50:31 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id b10sm30501848wrr.27.2021.05.19.07.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:50:31 -0700 (PDT)
Date:   Wed, 19 May 2021 15:50:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: Re: [PATCH v7 1/4] mfd: rt4831: Adds support for Richtek RT4831
Message-ID: <20210519145029.GD2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> This adds support Richtek RT4831 core. It includes four channel WLED driver
> and Display Bias Voltage outputs.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> - Send the patch series for the wrong mail subject.
> 
> The RT4831 regulator patches are already on main stream, and can be referred to
> 9351ab8b0cb6 regulator: rt4831: Adds support for Richtek RT4831 DSV regulator
> 934b05e81862 regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator
> 
> since v6
> - Respin the date from 2020 to 2021.
> - Rmove the shutdown routine.
> - Change the macro OF_MFD_CELL to MFD_CELL_OF.
> 
> since v5
> - Rename file name from rt4831-core.c to rt4831.c
> - Change RICHTEK_VID to RICHTEK_VENDOR_ID.
> - Change gpio_desc nameing from 'enable' to 'enable_gpio' in probe.
> - Change variable 'val' to the meaningful name 'chip_id'.
> - Refine the error log when vendor id is not matched.
> - Remove of_match_ptr.
> 
> since v2
> - Refine Kconfig descriptions.
> - Add copyright.
> - Refine error logs in probe.
> - Refine comment lines in remove and shutdown.
> ---
>  drivers/mfd/Kconfig  |  10 +++++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/rt4831.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 drivers/mfd/rt4831.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
