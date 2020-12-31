Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4732E7FD7
	for <lists+linux-leds@lfdr.de>; Thu, 31 Dec 2020 13:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgLaMSu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 31 Dec 2020 07:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLaMSt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 31 Dec 2020 07:18:49 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3427C061573
        for <linux-leds@vger.kernel.org>; Thu, 31 Dec 2020 04:18:08 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r4so7119257wmh.5
        for <linux-leds@vger.kernel.org>; Thu, 31 Dec 2020 04:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7SqcNl5KWJPGbXH65bKbbN1vtS8pHNjLIp3wmAVPS+8=;
        b=F0Ty4zFCDW5DJIvU7G6DHJocno5RtfsBgnYkYnGMSK88ObGi0268Fnw/DLUJdepaxW
         A6ZQM3J5FWnOBndRIGfHhgmNDZ8q4i3o5tf84GZU3fndsYVjgVqrCelSI1OkFUpHDDV3
         OG9x14ceTTBlV+ytPQUQywLl0XlZMZvNir9NDn8eLY69sZY2NRW3Q7u+rIsAJ0/zRxGm
         E4uhdTVSWJSPn2/ljRClFbQZ4B/9efeoO1O8+hCOTBZEjGOgaQwN8E7EGQEPNITYr81Z
         qBQZdcB+FgEMd4ZvsrgDxCWat9IM7yeyBuU0v5X9ow3No6WxvbHtTKgq+G4vcCsHcGZK
         8QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7SqcNl5KWJPGbXH65bKbbN1vtS8pHNjLIp3wmAVPS+8=;
        b=GrUCmimemh1QZVYmc4HBmbL6xnIsPbJLHtuMqKnI8Q9vn1qTVqrxLi5a12qv/NWSa1
         jONsaFdEJIgyfmBVMoXW91BmfyoUcacglBVc58ZiNaJhxZrOTD6o3kygV8Tm6XXLLH9v
         7OoX7C4LCF4y5/MuWmpBJNY/1i/7h4Yv/KURzuG6AR651tVz6mn7W5kUx8J0s6FtsNI3
         3dnEtlZbBJizXn//457pCkmj/xEzLVAzC8x1EgwTiR6eufxrZmIXHjOnNrHz1OBD69oP
         FDbzUKsmMm0EMw63ZJGs2fIB94c+4hNLSMVTP2zx/w5ZOZoBqQsJNTiYoJEmOI0jtDTW
         wwww==
X-Gm-Message-State: AOAM532yRDXrO3NuvrTsp3nL2xM0muUu91Cr0rIC184xKX4FNcsWmnSB
        hw8joqva/jCk5UaNrwGFUL2iSw==
X-Google-Smtp-Source: ABdhPJyZpFCcTny/kpxj+lNXYT/J5a5zwnln/azNAkSLIx5BERCKXlTb9EROUOzJtMiXDd6c5BrYzg==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr11923999wmh.185.1609417086646;
        Thu, 31 Dec 2020 04:18:06 -0800 (PST)
Received: from dell ([91.110.221.133])
        by smtp.gmail.com with ESMTPSA id a62sm12743892wmf.7.2020.12.31.04.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:18:05 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:18:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201231121803.GC4413@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz>
 <20201231083317.GB4413@dell>
 <20201231093945.GA22962@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201231093945.GA22962@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 31 Dec 2020, Pavel Machek wrote:

> Hi!
> 
> > > > The node names for devices using the pwm-leds driver follow a certain
> > > > naming scheme (now).  Parent node name is not enforced, but recommended
> > > > by DT project.
> > > > 
> > > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > > >         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > > > 
> > > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > > Acked-by: Rob Herring <robh@kernel.org>
> > > 
> > > Thanks, applied.
> > 
> > Sorry, what?
> > 
> > Applied to what tree?
> 
> I took it to (local copy) of leds-next tree on. But now I realised it
> is mfd, not a LED patch, so I undone that. Sorry for the confusion.
> 
> Anyway, patch still looks good to me:
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks Pavel.

I plan on taking this next week.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
