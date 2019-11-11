Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591F0F7074
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKKJY5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:24:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37448 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfKKJY5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:24:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id t1so13780620wrv.4
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YWJNU/KRDci9JaBSSlvjD8ejfPkt5O8bTmBLBv7FEfI=;
        b=g45g1B9CgnICXh+L7YGsSwGItv1VEJKTbuwdGm/cgURZrltl6remdq17TWkf9IQj0t
         2cgaZlsss/2FQVPU4QV83/EZYMXeP4/JM/rzgGquBXWY6tsruKzcr0+SGbVegz+xLLcZ
         WRlkw6voDLEDe2B7TEZryWLFlOlqEbkxvcdq3fjD/vIom2LOugSVjFmrSTEjpHYiyTeg
         jy3QY5TM9aS6jBUdcaYKPjTc07TztHyuCW+skdOtl3zc2svXUOdhiAc53Q5Ohry9vPLQ
         X91mgOIDh2Hy+Xa/MpzmiIpup7RmwG/dso2672x4CVD4Z4HurT/bAG9/az5EB48HKFhA
         5CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YWJNU/KRDci9JaBSSlvjD8ejfPkt5O8bTmBLBv7FEfI=;
        b=PPA5jhglemOibMg7j0lN4v07OqWR7FvqHgroQcAc0zdf37j47/l9PSTc4wjx02o/x/
         1v6NtfTIEW+FaB5jzV+xG8MM4Vswgw6gXlhIVfIBFUVo0YoovdugEWeyIR4EB6lyyAxx
         98XveHRcilsRfDFDZz205K5kPC/aKhc8QuADcBaTHtBcEg4oUK8vGd+tXAoqiDkZvxac
         H70ZrPQ63L2r77OV9FCMqY4wYtLuPgbew3vyqYBUYCwhcQKgKPhho7xRhor5YkbkwzAn
         YBTlNCAqRgNYM3aXgOWKGe8y/xPvhzdxD5bNObpim8L0rYEoIl+IzdKssZBs7wvIW4WG
         Uy3w==
X-Gm-Message-State: APjAAAWS+7DkIM4XBopuaP4YMnEiiPX9D511cARJPteDa2sYXU6b2rpJ
        WuxfRmQEhxXMasWNRKjASvINGw==
X-Google-Smtp-Source: APXvYqxLWSqz1Db3ODg/rszTepYxIenSPrtyAq4nFKwOfdpSCLBq8+G1tD9JlSzHMInuJ7vRBsDVHg==
X-Received: by 2002:adf:e5c5:: with SMTP id a5mr20805012wrn.103.1573464294593;
        Mon, 11 Nov 2019 01:24:54 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id w18sm14019087wrl.2.2019.11.11.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:24:54 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:24:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Andy Gross <agross@kernel.org>, linux-fbdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V10 1/8] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Message-ID: <20191111092446.GO18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> pm8941-wled.c driver is supporting the WLED peripheral
> on pm8941. Rename it to qcom-wled.c so that it can support
> WLED on multiple PMICs.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  .../bindings/leds/backlight/{pm8941-wled.txt => qcom-wled.txt}    | 2 +-
>  drivers/video/backlight/Kconfig                                   | 8 ++++----
>  drivers/video/backlight/Makefile                                  | 2 +-
>  drivers/video/backlight/{pm8941-wled.c => qcom-wled.c}            | 0
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/leds/backlight/{pm8941-wled.txt => qcom-wled.txt} (95%)
>  rename drivers/video/backlight/{pm8941-wled.c => qcom-wled.c} (100%)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
