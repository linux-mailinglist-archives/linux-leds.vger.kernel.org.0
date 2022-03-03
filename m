Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F41F4CC308
	for <lists+linux-leds@lfdr.de>; Thu,  3 Mar 2022 17:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbiCCQmf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Mar 2022 11:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235093AbiCCQme (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Mar 2022 11:42:34 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B47619D638
        for <linux-leds@vger.kernel.org>; Thu,  3 Mar 2022 08:41:49 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id o1so6316362edc.3
        for <linux-leds@vger.kernel.org>; Thu, 03 Mar 2022 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxP+Xw6wPB8ZIhMnioV3Otj/1gb/UWZW6hrVr3vPJh4=;
        b=JJ4qQXPFXhyPdRQ0jQQAs/7g/HtEmcuxjknmziNouLk2APczDb9gNerpsCYvxKiJ5K
         aWtbVRqTo7FT+DLr5vQPqTPdNSTiNewBOYpdsd8k5Sc4NHxlaezItfTgp9QvsXaG6ncg
         QHuppgQ5OWsYYaz4dlXR+Tra8Yi3baP/LcF58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxP+Xw6wPB8ZIhMnioV3Otj/1gb/UWZW6hrVr3vPJh4=;
        b=5shz41rafxwVIY8ZS3iA5z+SpsxxepkzBcs9s4kc49H4jAkkeQ3IfW57fX8re2Ys5Y
         SgDaGQL6+3FlGda0WCmve2UF5BW0fY6DuoLhwgvjfdojBbjdL5tbTKUFBJMvdvg3CyOQ
         pTL1oiClAU30tGePcAdJB9CaVIMxWMqZGAExw0mPRSW/S+G8yXdKJ4vSP4Jmn2/3I2cK
         1M1+i2XNokWEdVCHdDYelMPMoVUJ2uUux0Y+ZcEvkOaL0ebYNpaMUksSXnfHB2zkzDpE
         jLgpXTkbGFew8UAcPJTBIw2DS/R1tvZG3rwiZ1+TBJFLQ9bidk1RtL0+dJm/LcuxAw2v
         LHCQ==
X-Gm-Message-State: AOAM530NrHn/3em45gylDeV3innK0eBuFGxjULR3zQRF5ab7JS0Sy6h8
        4ImwJck+CbcpufeL5SSRR+tZtbls6QWl59X8
X-Google-Smtp-Source: ABdhPJy+GjhyPNu+icgW/qyDPbQwVJG0/cza9J/5lq6ATS47TEuaPUpMauckv1HqTrXm4oQo7q5w4g==
X-Received: by 2002:a05:6402:12d7:b0:415:ced2:389d with SMTP id k23-20020a05640212d700b00415ced2389dmr5772216edx.197.1646325707209;
        Thu, 03 Mar 2022 08:41:47 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090608c700b006cef23cf158sm851211eje.175.2022.03.03.08.41.45
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 08:41:45 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id m42-20020a05600c3b2a00b00382ab337e14so4487275wms.3
        for <linux-leds@vger.kernel.org>; Thu, 03 Mar 2022 08:41:45 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr4453828wmh.73.1646325705202; Thu, 03 Mar
 2022 08:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220218183116.2261770-1-bjorn.andersson@linaro.org>
 <20220218183116.2261770-2-bjorn.andersson@linaro.org> <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Mar 2022 08:41:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=We4Lv25h2XF6BsdYhMbYu4716LBuhAjH5N0s_HHt_Xcw@mail.gmail.com>
Message-ID: <CAD=FV=We4Lv25h2XF6BsdYhMbYu4716LBuhAjH5N0s_HHt_Xcw@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] leds: Add driver for Qualcomm LPG
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Wed, Mar 2, 2022 at 4:03 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Feb 18, 2022 at 10:29 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> > +                             struct pwm_state *state)
> > +{
> > +       struct lpg *lpg = container_of(chip, struct lpg, pwm);
> > +       struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> > +       unsigned int pre_div;
> > +       unsigned int refclk;
> > +       unsigned int val;
> > +       unsigned int m;
> > +       u16 pwm_value;
> > +       int ret;
> > +
> > +       ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
> > +       if (ret)
> > +               return;
> > +
> > +       refclk = lpg_clk_rates[(val & PWM_CLK_SELECT_MASK) - 1];
>
> I don't know why I didn't notice it before (maybe I was accidentally
> not building with KASAN?), but in my recent boots I'm getting a KASAN
> error pointing at the line above.
>
> Sure enough, the above looks a bit on the unsafe side. If (val & 0x3)
> is 0 then the "-1" will not be so wonderful. I put some printouts and,
> indeed, it's not so great.
>
> [    7.201635] DOUG: val is 0x00000004
>
> Amazingly my `refclk` ends up as 0 and I guess somehow this doesn't
> cause a divide by 0.

I dug a little more and found a document that talks about this
register. I guess the answer here is that at boot time on my device
the PWM is disabled and has never been enabled. That explains why, at
boot time, the "clk_select" is 0 AKA "no clock". So we do an invalid
memory access here and that's not so great, but it doesn't _truly_
cause any harm. All we need is something like this right before the
array dereference:

if ((val & PWM_CLK_SELECT_MASK) == 0)
  return;

I'm still pretty interested in seeing this patch series land and, if
it helps it land sooner, I wouldn't object to the above getting fixed
in a followup patch.

-Doug
