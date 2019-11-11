Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A02FF707D
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfKKJZI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:25:08 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37476 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKKJZF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:25:05 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so13781222wrv.4
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bSMoujBCOiShaOME23UahvoRFbCvakiXJQBAxitgQQI=;
        b=s6upeI4FnIvRR5zLwQsUkI3/ZMzqr5DgNeHpWoPb+6H2V3hXM7UvBjdCn4Nux32H5U
         MvManwUvVpVjjkeVUULBcPUHTNxvLKVKzixF5laNWDCZUDW4F95Q3AsdD0IQHsGxBTQn
         B+BbSW/DT2hgASvbgYv4M42NmdlPcmU6qlv3n72TntMXJPXH64H72RWa1NSssjin1nIT
         vakgqvqU8lLKyCnj9zOgp4jk679iFCmIpMjH34kNjJ+igjToxEFjoegas90cWTR0x3Cu
         E8siF75VAjfQdqt2f6WyUGKKlkr/NlVNQaieU/RMCxT16e757uUePZm/zogW6mnRMYzv
         I8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bSMoujBCOiShaOME23UahvoRFbCvakiXJQBAxitgQQI=;
        b=b/5m+E1uZEChhudNfXkOrmae+iaW2t+1Z9qfDC+6bfwCmdux51e6AAOXBPDtce1PDQ
         /b5MikDMQChwrf+/tywdbWo43mQcK1SmvNsXjwpkWm6hpKDpwJfPJ0GF54AgZM84/K5c
         ovPnaUi73EoCi/Zb1twruYR7lkQCpfQBQxqNWaxx7YLal2iMZgK1Ggi9Iy9Qrd11kjCG
         f6+HI/rezxkEWLrx75viwggWurrLhipOm6PpxZOb8bbZZ0uppGG3IB1wcC40LZHvf69v
         4QSJWe2DxHTvcqGrMBJ0fnNL8TpNjZ4+rT7qgtqjEdxGAjhkW64N5lzwc3oJRzCmVzg9
         th0w==
X-Gm-Message-State: APjAAAXxRjFr6lhlUZJSea5HtGTIT9k9Wrwh1EjaG1ZoLuDLb8jlew7d
        +OBbTobno4JwfSLivKzUfxYg6A==
X-Google-Smtp-Source: APXvYqyfcu9bp99G9saaiWZdJypi7e3YwTOAFrPM3hIAg05FdWhgae+G6d5UMCrhcrMkQIAoN8iJNg==
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr262428wro.215.1573464302760;
        Mon, 11 Nov 2019 01:25:02 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id i71sm32275541wri.68.2019.11.11.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:02 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:24:54 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V10 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings.
Message-ID: <20191111092454.GP18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-3-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> Restructure the qcom-wled bindings for the better readability.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 110 ++++++++++++++++-----
>  1 file changed, 85 insertions(+), 25 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
