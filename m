Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739DD4CB34C
	for <lists+linux-leds@lfdr.de>; Thu,  3 Mar 2022 01:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiCCAEU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Mar 2022 19:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiCCAES (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Mar 2022 19:04:18 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F22BCFA
        for <linux-leds@vger.kernel.org>; Wed,  2 Mar 2022 16:03:30 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x5so4430349edd.11
        for <linux-leds@vger.kernel.org>; Wed, 02 Mar 2022 16:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=712s7UNzasxlj0dwsyjRXVd8K8/HcJjmlNagNGk3tak=;
        b=ED9WDqjaIvY/PNhXMFZcJHPNR7h/tTUuq7WLYZ1ylEvNffoEcxKxybLHrav42m9Cnn
         RVEvb/IBLv+PhIPTpr690rtY8c24fbS5byCNqvx9Uwev3vYjz8sAMB11j/c+q3crVNAP
         sIZB594RAxB9rrrDgiPoWjkncYFw0ihals3NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=712s7UNzasxlj0dwsyjRXVd8K8/HcJjmlNagNGk3tak=;
        b=bBeHcw/RNSn4KeAUbEWaBlm5/Le3xadFneWMVaJcS7hvnhtgdgZtOw4A5L9ZxzT/Po
         rMSu9C4xPa1PC7hPsohYbHvXyAHvY6MDpI18Dq9pZTlh5eiyL2l6ujLjr0oe3pqyLfTC
         nazg2HgyngL/lWTACd2xqNk8XatgeIHLEqEOq8KKaMX/4dj39BgGJQ/BzvAMCAXlhcUU
         +AlPrYxonO/Vb/XP49le1lIkyJU89UjA/u6vjxyiEse2zsu/vF4aKTIST5tDBZ17kiIO
         VZxoCWZLgNnlS8ljqDhoe+5RR7IrdrtXf3pyrlccVg2ti5xxJPqTnGRrh00eHu0nu09s
         bWsA==
X-Gm-Message-State: AOAM531hWudcsNoO1HTOAJ/UfMzNfolatdZZLnUEhj3yMtOOPOp1SPH1
        mKolPKrzolGnw/Cd2IFqzocJ2MsIL+sv/MbX
X-Google-Smtp-Source: ABdhPJzdrWTXll0YO8Ay2kfuDL4smXlPF1RqY8AbdI4mqcqpYF6EBJ0QmkEH3g4dRHGPLCFrCHwf1g==
X-Received: by 2002:a05:6402:177b:b0:413:2822:1705 with SMTP id da27-20020a056402177b00b0041328221705mr31902856edb.270.1646265809082;
        Wed, 02 Mar 2022 16:03:29 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id bx1-20020a0564020b4100b00410f01a91f0sm150281edb.73.2022.03.02.16.03.28
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 16:03:28 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 19so1897985wmy.3
        for <linux-leds@vger.kernel.org>; Wed, 02 Mar 2022 16:03:28 -0800 (PST)
X-Received: by 2002:a05:600c:190d:b0:381:6ea1:8cc with SMTP id
 j13-20020a05600c190d00b003816ea108ccmr1737073wmq.118.1646265807989; Wed, 02
 Mar 2022 16:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20220218183116.2261770-1-bjorn.andersson@linaro.org> <20220218183116.2261770-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220218183116.2261770-2-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Mar 2022 16:03:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
Message-ID: <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Fri, Feb 18, 2022 at 10:29 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +                             struct pwm_state *state)
> +{
> +       struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +       struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +       unsigned int pre_div;
> +       unsigned int refclk;
> +       unsigned int val;
> +       unsigned int m;
> +       u16 pwm_value;
> +       int ret;
> +
> +       ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
> +       if (ret)
> +               return;
> +
> +       refclk = lpg_clk_rates[(val & PWM_CLK_SELECT_MASK) - 1];

I don't know why I didn't notice it before (maybe I was accidentally
not building with KASAN?), but in my recent boots I'm getting a KASAN
error pointing at the line above.

Sure enough, the above looks a bit on the unsafe side. If (val & 0x3)
is 0 then the "-1" will not be so wonderful. I put some printouts and,
indeed, it's not so great.

[    7.201635] DOUG: val is 0x00000004

Amazingly my `refclk` ends up as 0 and I guess somehow this doesn't
cause a divide by 0.


-Doug
