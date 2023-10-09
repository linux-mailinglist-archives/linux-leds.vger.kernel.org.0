Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB867BD6FB
	for <lists+linux-leds@lfdr.de>; Mon,  9 Oct 2023 11:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345774AbjJIJ32 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Oct 2023 05:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345742AbjJIJ31 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Oct 2023 05:29:27 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5F1A2
        for <linux-leds@vger.kernel.org>; Mon,  9 Oct 2023 02:29:26 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-405361bba99so39308285e9.2
        for <linux-leds@vger.kernel.org>; Mon, 09 Oct 2023 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696843764; x=1697448564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8m4m0ieEJ2SA5cCHHqMfizD1ZJJDz/TnRHcokgUvn4=;
        b=XI0PPwQ06rDSlCLpr68nDNoKTMKv98UsyZR0SJc5Uxvs91vts0ykziX76nILvSEMGq
         Od3PB+10EvCoLvW+vH4fCK8KEoitd5VlnZoN0GZj9Lf3372M0X3nY1+BQ5HEOp+kQXCb
         vatxSuhws1ELs9EoaL+Jn4ZIGsX6XFpbHM9U2UvtghswsDBZf4xXFMLzyr3NLFgGrdhA
         4UoNjEVgCUBHpN0hJffMPYGWGjtEoGuiWb880Z5MSsTLqLYNYM7zXqvGnWPaUzveeljv
         7i/rcMPEb0Cv/R7QVE7VsFICRSBkg2HH9Keon06p/rjncWtZkvz4X4TZDZZRGsLoJS6q
         jXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696843764; x=1697448564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8m4m0ieEJ2SA5cCHHqMfizD1ZJJDz/TnRHcokgUvn4=;
        b=DmL885ELJeqrVcMJoh+AtENdd5OALv+0e+qaTIPyDpbBFCT+/vVoLy1Klr+PdYejP8
         nyjmoVLn/2+kLrG2ILjfhvSUDGlO7N+tMNsbTonw65dxd4ObZOFrmmBtvOcVAlmMMGR0
         zGCYtSkrY+cGFE+eHVJ+lato1pV1zgkimVQflqbIZ1UbXVLhWu0AUb7JFccf+tH3svGg
         Ljs5gQVdiwsR/Cs/y7GV7lGuqMIG3L3FDO1b365bCubreR/7a7ddfSccSrXhBIcfwvfS
         8rWmxQRnpaiA2xJrEFO1QzOpSWUB5+8CYi0Elp2qaMjfytWtfzMlVaA6mAhKpRRcDZP2
         Qg+A==
X-Gm-Message-State: AOJu0YyI46LICXTahrzXOmDqI8zLPc3ntLiVQgNUSAG2UBUfXtALymXB
        pfI3jK68OQMfmU+hTfLtFoMQRw==
X-Google-Smtp-Source: AGHT+IEXeYstdXT6TbrSO2yEei8azH2660L8AX7ojU3STjxM7Q8gohifEoelTb8KAy2MvYiMxGH00g==
X-Received: by 2002:a05:6000:38b:b0:329:6bd7:470c with SMTP id u11-20020a056000038b00b003296bd7470cmr9256860wrf.58.1696843764410;
        Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b0031912c0ffebsm9059425wrm.23.2023.10.09.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
Date:   Mon, 9 Oct 2023 10:29:22 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Helge Deller <deller@gmx.de>, Karel Balej <balejk@matfyz.cz>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
Message-ID: <20231009092922.GA223751@aspen.lan>
References: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
 <20231005-ktd2801-v1-1-43cd85b0629a@skole.hr>
 <20231006123014.GA96854@aspen.lan>
 <5984411.lOV4Wx5bFT@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5984411.lOV4Wx5bFT@radijator>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 06, 2023 at 03:08:42PM +0200, Duje Mihanović wrote:
> On Friday, October 6, 2023 2:30:14 PM CEST Daniel Thompson wrote:
> > On Thu, Oct 05, 2023 at 08:49:08PM +0200, Duje Mihanović wrote:
> > > +  enable-gpios:
> > > +    maxItems: 1
> >
> > Why "enable"? This is the line we are going to us to bitbang the
> > ExpressWire protocol. Doesn't that make it a control or data pin?
>
> I named it "enable" because the KTD253 driver does so too, but also because
> that pin is also used to power down the IC. If "enable" isn't right
> regardless, is just "gpios" fine for this?

KTD2692 implements ExpressWire and calls this signal ctrl-gpios. I'd
suggest copying that prior art for now.


Daniel.
