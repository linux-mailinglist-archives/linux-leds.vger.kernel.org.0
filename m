Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEB451683E
	for <lists+linux-leds@lfdr.de>; Sun,  1 May 2022 23:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352165AbiEAVtE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 May 2022 17:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357515AbiEAVsr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 May 2022 17:48:47 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0033A21B1
        for <linux-leds@vger.kernel.org>; Sun,  1 May 2022 14:45:18 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id m128so23343701ybm.5
        for <linux-leds@vger.kernel.org>; Sun, 01 May 2022 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Zs9ZXFuA5R/0ymMTjHB7/FZWKOdSvop8pXLfIOyulA=;
        b=jIUUFw/Dk0bJvSpV2KhChXMwtNlLYqsYYK4oY1ZrIaM5CwokwxvKI2nY/2x/UYhhSZ
         cnYvPcNR4I1+2mQEXOx+fTBIepxbMOgfBDYzGHDeV47Jl9VtWIb/nS+yTlzYid021q5y
         4rk1aenFHUTcFpOe8yZyA6PrfG7AdYTLzyJZCxoXrUBdmiOH7kD+EpptUWvO22jzMcIN
         xSCS+MFyhpSsWhXxvfUnHSHIueURSlmIpP3ceYNATHQiGd7mRdyumFBzg7HidVpGXR/K
         HmLBNFjobzv+Lfi/mc0Jdu1mADUOwm6Q+P8Sv4LOYfSplf9TRRKfiG/zS7FqqwYnszNe
         9g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Zs9ZXFuA5R/0ymMTjHB7/FZWKOdSvop8pXLfIOyulA=;
        b=dbZ5gZiiadEvXY+BfAjq1FOEESeeQ+iIlta0xdFS6unoqdU6DrbxJ7/a9l8tfeEnSu
         BomXMiWUN7Fr+XmET/FkbprThn4y/dXFbE+4GTWrNE28bm3ixjYVICafWC5J2NFParK9
         jW4C9uewkx5tdfr3NBpKGVy9MQwhesAXvDClor3H8bxjs633+WezmDn+PEP0c2Yge7zt
         gPKHtu0TKsbuYsPcYOsbRY76jDA0rCsmIWZ5Iku5fHXqHNPgzu3VycT7DEI7gl8K4e8+
         HnRf20SE4zlfmmAMnDEh+WRRgPU2r84KhdGtbBADug/fFDTYoYdIR8r9btXpUz1E6odT
         Wc5g==
X-Gm-Message-State: AOAM532gXqkp1FmsjK6v3P8hQEBZnAXzZsvgOnlQf1m38uH/Lq0xqDME
        1Keb51/z7RzX8A/OrQZdGcI2SOUur7CWRTtLwWr3og==
X-Google-Smtp-Source: ABdhPJz9eJE7cneK+kxH13EYMup9tW/2JAXx6cXKgLkzm/eVQ61nD3w0biIeuzEawWWGZ8vTkmgdM3jCm2iwQFey2JY=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr8658475ybh.369.1651441518148; Sun, 01
 May 2022 14:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-22-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-22-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:45:06 +0200
Message-ID: <CACRpkdZsSdOSq=sdxDZMb8QJCRsrxm280RvYzH2Ns9L5+RtU8g@mail.gmail.com>
Subject: Re: [PATCH 21/48] ARM: pxa: eseries: use gpio lookup for audio
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The three eseries machines have very similar drivers for audio, all
> using the mach/eseries-gpio.h header for finding the gpio numbers.
>
> Change these to use gpio descriptors to avoid the header file
> dependency.
>
> I convert the _OFF gpio numbers into GPIO_ACTIVE_LOW ones for
> consistency here.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nice use of active low. Maybe I would simply have dropped
the _OFF suffix on these GPIO lines as it can be confusing now
that their active level is encoded but no big deal.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
