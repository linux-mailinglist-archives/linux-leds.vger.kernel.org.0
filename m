Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75257305E50
	for <lists+linux-leds@lfdr.de>; Wed, 27 Jan 2021 15:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhA0OaL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Jan 2021 09:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhA0O36 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Jan 2021 09:29:58 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AC0C06174A
        for <linux-leds@vger.kernel.org>; Wed, 27 Jan 2021 06:29:18 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id w8so2330369oie.2
        for <linux-leds@vger.kernel.org>; Wed, 27 Jan 2021 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4id04Ce+fp/e8CTiMx3Sr5ui4DlY1xAuBgKbADQCYHs=;
        b=FKfbCeJ016u5l9An/csG2m8Rg9KIwa1az5mkdyLz6vQD2H/ZLDX22a136QcU+sX+cC
         macnEmVGvuGkhW6ADkL6d9AAr5+hnIauK2CY+P0c6syRwiE5ZQU5q7kNiUyey9krm/oQ
         m9Njx2D0OJq+8Q1+0FO6uD+0o/wk2QgjxoI4+cXkelu/17hwikos1fPqbWoSmH8PfY16
         iIeiuM2T/fmzueo3KiysSr0fDpjQFl6+tD9/H0kXS5MlSGWfQvS5M6G/eiOC7P4Q2vdN
         7nTY49ZpUCrJ540N8TLfzFqbltgcamSnpNtghTT7hGXnqYOCJ79YIzWGkCzw/CVIqEnP
         5qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4id04Ce+fp/e8CTiMx3Sr5ui4DlY1xAuBgKbADQCYHs=;
        b=Aljrwd58zhS2hBjv9ZTKuhdbOoKX8xWkON8OODxoWDG0XKs2SSEePphWfe2dk69p1f
         G/MSJrrnCmTmffJTxKYO58a6ohvqUupGNc4vAK99vnobzcJyahPRbXsN92w0pqem/j5y
         o0TA5Ob0ncVSPtutaHl54VQOzlxD8qNsRj7K4KRaTpdIIXWPvR6D8NyAi4JhLdwrGD5i
         gIWHm50Pqk01G9s0l2ra1pi8keNl/MtkwirHag//iDvx8VLIOEOaEJ3BR4UrsOYDTjfp
         PRzVun4P8FL+UXuIepo4g+PXtws7X9kHQcU4nYs/VYSLocVNoS5WzEr8Sz1FHOANbYhg
         knyA==
X-Gm-Message-State: AOAM531TTYKjXuNv80kUrUELFoOE+z58RWnWHHZXfHOGxdp7QKfCeWjq
        z8y7lFZEuylwP7MLnruUzQZm2g==
X-Google-Smtp-Source: ABdhPJwb2/m3MU/zw67FfMAeQmwXNthxIFKhH0xwTluKN9VbYYGvTbrGNUpiIuOT6X0+/4woOhNIrA==
X-Received: by 2002:aca:d643:: with SMTP id n64mr3351850oig.151.1611757757891;
        Wed, 27 Jan 2021 06:29:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e14sm443934oou.19.2021.01.27.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:29:17 -0800 (PST)
Date:   Wed, 27 Jan 2021 08:29:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "N?colas F. R. A. Prado" <nfraprado@protonmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 3/4] ARM: qcom_defconfig: Enable QCOM SPMI Flash LEDs
Message-ID: <YBF4u3Q59GMARSlm@builder.lan>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-4-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126140240.1517044-4-nfraprado@protonmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue 26 Jan 08:06 CST 2021, N?colas F. R. A. Prado wrote:

> Enable module for the Qualcomm SPMI Flash LEDs present on the PM8941
> PMIC.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> Changes in v2:
> - Enabled CONFIG_LEDS_CLASS_FLASH since the driver now depends on it.
> 
>  arch/arm/configs/qcom_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index f6e9675f639c..05cacc59087e 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -202,6 +202,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_MSM=y
>  CONFIG_NEW_LEDS=y
>  CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_CLASS_FLASH=y

This doesn't seem critical to boot the system, can we make it =m?

Regards,
Bjorn

>  CONFIG_LEDS_GPIO=y
>  CONFIG_LEDS_PM8058=y
>  CONFIG_LEDS_TRIGGERS=y
> @@ -284,3 +285,4 @@ CONFIG_DYNAMIC_DEBUG=y
>  CONFIG_DEBUG_INFO=y
>  CONFIG_MAGIC_SYSRQ=y
>  # CONFIG_SCHED_DEBUG is not set
> +CONFIG_LEDS_QCOM_SPMI_FLASH=m
> -- 
> 2.30.0
> 
> 
