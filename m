Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E38513A11
	for <lists+linux-leds@lfdr.de>; Thu, 28 Apr 2022 18:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349984AbiD1Qpz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 28 Apr 2022 12:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349900AbiD1Qpy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Apr 2022 12:45:54 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24149B1A94
        for <linux-leds@vger.kernel.org>; Thu, 28 Apr 2022 09:42:39 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id g6so10734533ejw.1
        for <linux-leds@vger.kernel.org>; Thu, 28 Apr 2022 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AkQQpoM0XqeDnroSElMP8/Xsy0E3kSoEUlYeB6Pe/vk=;
        b=bz9fRRT9A06VnWM5YCZauEp8rMIqhBhq2O7w/BgDv9VGUkM2g91QDtmNKbe1n5q1MA
         Tvsv1uTCi1B4r8TCbe1VoL9OfXhKYuFI5QdlV7vebCaH7JcLINfuTmlGeWDZY+XnVHiH
         C05m7IossFyNWXyN2z3+Kp946vNEWL8tnJUn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AkQQpoM0XqeDnroSElMP8/Xsy0E3kSoEUlYeB6Pe/vk=;
        b=xDlLILIB0wSDMME4NInWL4hGdyj/zG+TBqAtJ9WOM7Ev25zEz2MRggLX38cICdt4wr
         WLb3z/eLe8u/xDfj4NKJGNU4npgmg7nOwIquL5wp6YJKxypJmlbk05uR6KY4D2Lgj+uL
         1Iv/H+XUuG82FbsQbk15u5F0BP7PL2gWSU1pW2c/ML7p1baYLkDSV3xyuHPz5QNk/dnT
         vzF3RsXJidv3lv5wCGA7qD62G1pn/ixbrQmkfcS1PaZz66e3QrMruohT7s8Turc/DqIW
         8BYRoNdTotIazZ6/mmm7MyAXy3qPSaNBsHsWCXBCfyCKA9mfulPOguY9kqN/i25rQMV5
         kdew==
X-Gm-Message-State: AOAM533IUa6HZq0pcdD704UK3Tnovl+Px0mAR33f3YsF2OXur10lJ2rz
        +sMgKv7SSX2JK8oA29BNgUllY4Os+/PAeAWg
X-Google-Smtp-Source: ABdhPJyUWKdLSAcRgcgh1ygbEDtKzksJ1BCAEUKW6qM8jyT2JJRSGr3Un9ULd1Qoz/LE2PTxskLW/Q==
X-Received: by 2002:a17:907:168a:b0:6da:9167:47dc with SMTP id hc10-20020a170907168a00b006da916747dcmr32114841ejc.126.1651164157718;
        Thu, 28 Apr 2022 09:42:37 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id dc16-20020a170906c7d000b006f391eafd1esm185632ejb.67.2022.04.28.09.42.36
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 09:42:37 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id bi24-20020a05600c3d9800b00393ff664705so3342386wmb.4
        for <linux-leds@vger.kernel.org>; Thu, 28 Apr 2022 09:42:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr40096910wmb.29.1651164156093; Thu, 28
 Apr 2022 09:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220303214300.59468-1-bjorn.andersson@linaro.org>
 <20220303214300.59468-2-bjorn.andersson@linaro.org> <CAD=FV=WkgcJA6-niUh0L5_jLNSS=Hv0xrR5QZghPmNriekH7XA@mail.gmail.com>
 <CAD=FV=Xa4wW2AH1RzwQRiTZt__Eptr2+Li5SmfZyUjTvNTkOcA@mail.gmail.com>
In-Reply-To: <CAD=FV=Xa4wW2AH1RzwQRiTZt__Eptr2+Li5SmfZyUjTvNTkOcA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Apr 2022 09:42:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1jGdZiqu4ADo6ZDuMfhsLrvZyX9ab4KtJZoxwgj4oeA@mail.gmail.com>
Message-ID: <CAD=FV=U1jGdZiqu4ADo6ZDuMfhsLrvZyX9ab4KtJZoxwgj4oeA@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] leds: Add driver for Qualcomm LPG
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Wed, Apr 6, 2022 at 8:18 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi Pavel,
>
> On Thu, Mar 3, 2022 at 2:10 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Mar 3, 2022 at 1:41 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > > PMICs from Qualcomm. These PMICs typically comes with 1-8 LPG instances,
> > > with their output being routed to various other components, such as
> > > current sinks or GPIOs.
> > >
> > > Each LPG instance can operate on fixed parameters or based on a shared
> > > lookup-table, altering the duty cycle over time. This provides the means
> > > for hardware assisted transitions of LED brightness.
> > >
> > > A typical use case for the fixed parameter mode is to drive a PWM
> > > backlight control signal, the driver therefor allows each LPG instance
> > > to be exposed to the kernel either through the LED framework or the PWM
> > > framework.
> > >
> > > A typical use case for the LED configuration is to drive RGB LEDs in
> > > smartphones etc, for which the driver supports multiple channels to be
> > > ganged up to a MULTICOLOR LED. In this configuration the pattern
> > > generators will be synchronized, to allow for multi-color patterns.
> > >
> > > The idea of modelling this as a LED driver ontop of a PWM driver was
> > > considered, but setting the properties related to patterns does not fit
> > > in the PWM API. Similarly the idea of just duplicating the lower bits in
> > > a PWM and LED driver separately was considered, but this would not allow
> > > the PWM channels and LEDs to be configured on a per-board basis. The
> > > driver implements the more complex LED interface, and provides a PWM
> > > interface on the side of that, in the same driver.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Changes since v13:
> > > - Fixed mixed space/tab indentation in documentation
> > > - Added 0 as to lpg_clk_rates[] to match the hardware state, to avoid + 1 in
> > >   lpg_apply_freq() and - 1 in lpg_pwm_get_state()
> > > - Don't divide with 0 if current clock is 0 in lpg_pwm_get_state(), just return
> > >   period = duty = 0 in this case
> > > - Renamed "clk" in struct lpg_channel to clk_sel
> > > - Renamed "pre_div" in struct lpg_channel to pre_div_sel
> > >
> > > Changes since v12:
> > > - Initialize ret in lpg_pwm_apply()
> > >
> > > Changes since v11:
> > > - Extended commit message to cover decision to put pwm_chip in the LED driver
> > > - Added Documentation, in particular for the hw_pattern format
> > > - Added a lock to synchronize requests from LED and PWM frameworks
> > > - Turned out that the 9bit selector differs per channel in some PMICs, so
> > >   replaced bitmask in lpg_data with lookup based on QPNP SUBTYPE
> > > - Fixed kerneldoc for the struct device pointer in struct lpg
> > > - Rewrote conditional in lut_free() to make it easier to read
> > > - Corrected and deduplicated max_period expression in lpg_calc_freq()
> > > - Extended nom/dom to numerator/denominator in lpg_calc_freq()
> > > - Replaced 1 << 9 with LPG_RESOLUTION in one more place in lpg_calc_freq()
> > > - Use FIELD_PREP() in lpg_apply_freq() as masks was introduced for reading the
> > >   same in get_state()
> > > - Cleaned up the pattern format, to allow specifying both low and high pause
> > >   with and without pingpong mode.
> > > - Only update frequency and pwm_value if PWM channel is enabled in lpg_pwm_apply
> > > - Make lpg_pwm_get_state() read the hardware state, in order to pick up e.g.
> > >   bootloader backlight configuration
> > > - Use devm_bitmap_zalloc() to allocate the lut_bitmap
> > > - Use dev_err_probe() in lpg_probe()
> > > - Extended Kconfig help text to mention module name and satisfy checkpatch
> > >
> > >  Documentation/leds/leds-qcom-lpg.rst |   76 ++
> > >  drivers/leds/Kconfig                 |    3 +
> > >  drivers/leds/Makefile                |    3 +
> > >  drivers/leds/rgb/Kconfig             |   18 +
> > >  drivers/leds/rgb/Makefile            |    3 +
> > >  drivers/leds/rgb/leds-qcom-lpg.c     | 1405 ++++++++++++++++++++++++++
> > >  6 files changed, 1508 insertions(+)
> >
> > Gets rid of the KASAN error and PWM still works for me, so happy to add back:
> >
> > Tested-by: Douglas Anderson <dianders@chromium.org>
> >
> > I haven't done a full review of the driver but I did a once-over of
> > the changes between v12 and v13 and they look good to me.
>
> With v5.18-rc1 released, this seems like it would be an ideal time to
> land this driver and its bindings in a for-next branch for the leds
> subsystem. Is there anything blocking it? Are you the right person to
> land them? Ideally the bindings / driver (patch #1 and #2) from
> Satya's series [1] could land right atop it since it's ready too?
>
> [1] https://lore.kernel.org/r/1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com/

I don't mean to be a huge pest, but we're already at v5.18-rc4 (almost
at -rc5) and these two series are still pending. I'm worried that
we're going to miss the window to land them again. Can you give any
update about them?

Thanks!

-Doug
