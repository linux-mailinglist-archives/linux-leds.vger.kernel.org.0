Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E245D4AAF2B
	for <lists+linux-leds@lfdr.de>; Sun,  6 Feb 2022 13:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbiBFM0F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Feb 2022 07:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiBFM0F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Feb 2022 07:26:05 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23744C06173B
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 04:26:04 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id og43so10215746ejc.0
        for <linux-leds@vger.kernel.org>; Sun, 06 Feb 2022 04:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AldHBVkTo+1qiRINvjNGhGwAu75cjEUUHA4BKBeKPlg=;
        b=DImSatTJUu+d0SagwGOSqkJhb7uvjxlicRktwfssMy8iboXQGMzNBWP003Yg6LDRRz
         n466h0a3ytsdRMjS/Z5Quj4F8lmtNtYrB+OhZYs8nOwl7jv2cPJJKR2UoZpfkuKugnRW
         ECBZydfMoV+ugVeS9uJvTyz0DIOyC65zv73k92AdvGMc6SBzH+WSKEJvOubFt3vW7dbK
         +e/C72qXVh4HrqOmv9c7/xJUVInO29WMwx2lCTxsQ5aytlbrURFwoMMVLX1s4e6oMY0U
         wuWCDLre83OQ0TCwxgN+8xR3mdaBbDBdhISMqVZThoqNoZ9XrEFxgYWTe9ep6UFUO6GR
         SDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AldHBVkTo+1qiRINvjNGhGwAu75cjEUUHA4BKBeKPlg=;
        b=tXP9cBeLcOOUCU6o/RK/zbwbpQ8JeiEHhowbww9VpTGXDtbMoZCZYtEE7S1dEfsGXt
         bV4n24Fx+QgbPtTnywwBIn7r9DmuYjLdPzoEi1kSwY9TmAkWuMPmEbqp4L+xAlpelS3f
         +wlymS7CcOiwQukdbIRGNouslKJcvAr0GPT8uUM1aw3qbrFj62M/mEMl+VyaAHZ5omWU
         +p7pM4WIWKybJX/jF++ng3YDBbiPMT2Jrlf8uHmwoRIn/UlFkr4qyspYSg+uzDn3WY7o
         6LZK4b28eEGLrSiR3Zgilx46yJUFUUR9UvEO6eAELkHEIbIrWGz+PyCvAlaYdZH4fwQ8
         Gm/w==
X-Gm-Message-State: AOAM533qN+TBMoO/bymiSZqli3+ZBb4/bdZXUtTVUx80EEFIjA7CrJS0
        gqBXCIGy1ayB2brPBuQenrjMkihCcEU9s7BNjds=
X-Google-Smtp-Source: ABdhPJyEPZsX9Yi/wF+UxheD7JHdiUwGcDHJDenGSoKMYag6I+TJ4a2521Z/A68zJU3Z0Siv29sVLaLXSubehUYBYMw=
X-Received: by 2002:a17:906:c14d:: with SMTP id dp13mr6334423ejc.132.1644150362522;
 Sun, 06 Feb 2022 04:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20220126104844.246068-1-sven@svenschwermer.de>
 <20220126104844.246068-3-sven@svenschwermer.de> <CAHp75VfMTCvgib__PhnfB_g7xLhyNws5TDRyMVyzuAkT1ydY_w@mail.gmail.com>
 <20f95cfd-a851-af4f-1c60-45f2ca238e10@svenschwermer.de> <CAHp75VeSD5bYERp=s9Dzd0xScVc+sYSdc8W4XBfCVXJgyWMPyA@mail.gmail.com>
 <0df04a77-6765-f9bd-a678-9016d0c0c5d5@svenschwermer.de>
In-Reply-To: <0df04a77-6765-f9bd-a678-9016d0c0c5d5@svenschwermer.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 6 Feb 2022 14:25:26 +0200
Message-ID: <CAHp75VfFZH4vZK9Ny0NfdfPSPShaekHvNiLm8m6hKxMmcCX6bQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] leds: Add PWM multicolor driver
To:     Sven Schwermer <sven@svenschwermer.de>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        "post@lespocky.de" <post@lespocky.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Feb 6, 2022 at 1:04 PM Sven Schwermer <sven@svenschwermer.de> wrote:
>
> > Skipping mutex destruction is not critical, but in general if you wish
> > to free allocated resource, it should be done in reversed order...
> As far as I can tell, the ordering is already reversed:

I can't see it.

What I see is that mutex_destroy() is called before the LED class
unregisters (along with PWM and memory allocation). It means
potentially it may be the issue when during ->probe() error path or
->remove() somebody calls for LED functions which rely on mutex
presence (while it has been already destroyed).

Easiest way to fix this is to wrap mutex_destroy() to be a devm_*()
kind of function.

> >             +destroy_mutex:
> >             +       mutex_destroy(&priv->lock);
> >
> >
> >         Wrong ordering here and in ->remove().
> >
> >         Don't mix devm_* with non-devm_* calls.
> >
> >     What do you mean by this?
> >
> >
> > ...which is exactly the issue with this code because of the use of
> > devm_*() calls mixed with non-devm_*() ones.
> >
> > TL;DR: ordering is broken here. And to fix it you need either a) to
> > convert all calls to be devm_*(), or b) make them all non-devm, or c)
> > regroup resource allocation so that all devm followed by non-devm ones.Which non-devm calls are you referring to?


-- 
With Best Regards,
Andy Shevchenko
