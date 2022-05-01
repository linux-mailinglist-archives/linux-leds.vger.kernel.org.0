Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D3A51681A
	for <lists+linux-leds@lfdr.de>; Sun,  1 May 2022 23:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355190AbiEAVjK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 May 2022 17:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355197AbiEAVjH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 May 2022 17:39:07 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B703D492
        for <linux-leds@vger.kernel.org>; Sun,  1 May 2022 14:35:38 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2f7c424c66cso131875477b3.1
        for <linux-leds@vger.kernel.org>; Sun, 01 May 2022 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T254pOQ0OrSDi8zN/59MRP0JPU9NfQ5B5Rmbgtdrkko=;
        b=wlpA+CfyvX91ALnfVCMPP166Rc0Mpatt42DsMvCkWJmeZUVRfB6mnUYecnMGRNYbhI
         ld8YsssomjW9oCtQmr15blAmBLS+t4KouSWHxbIZVjnsq1DnJlp8Fx6XNCVuGUF0GS/N
         6klXRU6dGXOQupaFrwlX9Yah5rEs29v06x/UCbuJ/f0GQoJQPiBvrEccSjVf/VH42K7p
         RwLGlqfP5o3h1uwBR8xQuBvPKaAX5Sq4RHEUwFvP/y5fx9owfyl5p9sMhmOT/ahPJUD6
         7q+tV1u5MOsspWP4YhNR748kjKGgc9lX4NNszXKAVeEM0jxtUxFRG3LYR6gGsd4NYws0
         Yv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T254pOQ0OrSDi8zN/59MRP0JPU9NfQ5B5Rmbgtdrkko=;
        b=oir6NFPmTDMPJhhBWvUTrQF8tmWAawioiltNW9cN1NyDsKDvgCYn88aY3bRNNUj6N2
         i2RzfgYrO5O6TeOv4cXyIkdzqGRVy2s4QDiPWA7pUE8qNtGyVDhdqmA7prFpD2Wzwwts
         tsoLJUt5nn2ezQAYaVgq+Wa8OUbf/v31AiCzcA3q/EYMRNwc8DSV1KwQIZIZGRRucBZX
         DQlmiSBrLjrdhHJZsTE/JoNv5uGz4EhN7c9Dvhw+r60ujNhjpFaAhLnwrIZTxqXD5XaZ
         Gv4//oj+DSg/pOEycIjA5Z3veVMSka886Ew+kj+N1T2sXe/4FvnNPM7bJQ4kklCGD53U
         1NlQ==
X-Gm-Message-State: AOAM533qrtul6x5OWjrZqF2+BLAQru+2iYVHBonClTR9o3IJCIgDcMoA
        OUKST/ukMgv6YZbBjSdMu6+E91YpDuuHpQgcCVCX6A==
X-Google-Smtp-Source: ABdhPJyiNIf7FX2G9hbcHdCnWtNprAICIXfmTZ2O7M9XljL3Duwj1WbWX/AgvgI1z1Nmh9oOd4l1d7OyIUiw7QC5qEY=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr9543818ywe.140.1651440937377; Sun, 01
 May 2022 14:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-18-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-18-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:35:26 +0200
Message-ID: <CACRpkda10Cv9W07FjO4Ww58V_cgP05Thz-7cv6aF=QC8iW2vDA@mail.gmail.com>
Subject: Re: [PATCH 17/48] ARM: pxa: corgi: use gpio descriptors for audio
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
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
