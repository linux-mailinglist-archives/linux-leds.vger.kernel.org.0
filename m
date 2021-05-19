Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A713891EB
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 16:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354825AbhESOwE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 10:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354823AbhESOwE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 10:52:04 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA99C061763
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:50:44 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r12so14347764wrp.1
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jzOpdXiLDWGUEJF2EPWEV2fpTf3RICa3e5yUqeDdorw=;
        b=fmjuW1CE4yNWATIkEhIlhyAcIxhBepjY8dpsjmF2trgLwRV+pzo0bH/7HF3nswJyw9
         tJjev238hlq7nt4aq8KDfWgybqHJQ1sVX3XVwNQYj5WvBXSwPyxY0wwnALzCORKlGvOA
         E1ZkZLwOqheyT+JGldJiWWmlyqeC/ObjpVEGdcx7Tk4f6iYftuJme720nKySAaPYgLvB
         UiYDdHFWvYRKcgYI91gMeWNo7XjlgwZ9ZOybn3JdM8O1CQ2VZIyh1Iy1J2f7t6hLOAzg
         0MEknxvzch90W0UK2WPHLw4NzZkINEn0mpEx+XL8Q4sleiVJ8VSIXtmgadfq6Hv8hoDB
         gPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jzOpdXiLDWGUEJF2EPWEV2fpTf3RICa3e5yUqeDdorw=;
        b=o4Olk7X0WaACU/gcdk446y/1jQmuCbLBpPHiPPg9ves/suDFkTZu8jtMcOTaQIXYa5
         A3Ks8C7BPfCUd1ZPaLR6l90o4KSouLWJLUjtiGZRua8AO9Y1Q3PBAUO/tzub0xuqIxcx
         YHwtpNmDYbKGrzFFHLIUS0cNJvQMlXyyUDQux2Qt8GoWNqPqVgLtl7Y6FrXvJ//UUNmy
         qBwAx/OFbwFEX6GGU+i2qedVx7kBUU8et3iRRiJGMmis+xmckZT0jgZ9IAdCZn7Lmarc
         nyn+BKgv6o71C3WUyaHQTJxPcc8giE8l51bJBWwcTQmGBe4kZxOvUhwOuTMVOlGo2DR6
         /mJA==
X-Gm-Message-State: AOAM5313jy8ET27f59vMWRafxt5tYsPK0wcXtoPYkxuS3NBmnB0nXitU
        Ub4dWD3orj131hz80PsMtlj+1A==
X-Google-Smtp-Source: ABdhPJy4j2tptE/O7091QF9VE/9nmRwj16cpS+71mXYwcpZQStXYpsYFrQKNwdyhvJoa0BGQe/yvAg==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr14628914wrv.206.1621435843140;
        Wed, 19 May 2021 07:50:43 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id d9sm24271551wrx.11.2021.05.19.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:50:42 -0700 (PDT)
Date:   Wed, 19 May 2021 15:50:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: Re: [PATCH v7 2/4] backlight: rt4831: Adds DT binding document for
 Richtek RT4831 backlight
Message-ID: <20210519145040.GE2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
 <1621262161-9972-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-2-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> since v7
> - Add allOf property refer to common.yaml.
> - Remove default-brightness/max-brightness description and refer string.
> ---
>  .../leds/backlight/richtek,rt4831-backlight.yaml   | 62 ++++++++++++++++++++++
>  include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>  create mode 100644 include/dt-bindings/leds/rt4831-backlight.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
