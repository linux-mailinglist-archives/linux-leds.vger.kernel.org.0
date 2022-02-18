Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1EF74BBD17
	for <lists+linux-leds@lfdr.de>; Fri, 18 Feb 2022 17:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbiBRQL0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Feb 2022 11:11:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237449AbiBRQLY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Feb 2022 11:11:24 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879BA2B4042
        for <linux-leds@vger.kernel.org>; Fri, 18 Feb 2022 08:11:06 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id u18so16316210edt.6
        for <linux-leds@vger.kernel.org>; Fri, 18 Feb 2022 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2OloDpJvsjdWi7wGdly9G9Fl4hNwVdVhIAytmuuXRs=;
        b=EkJRBZvSnj9R4IxbhdruXGy1aYW2yS2ue39KyFuXYWoUHS8yMXNEtcICUEj45dcK7D
         Ju1waEUm5V22tInwgU0e5alziJzVuCyDNowFFx/G8WGjFod0Jk+kODbiGWAn11xCkIY6
         Nb4cJq6//pZhbOaTWDt3uiAOK54AuW1bKNcUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2OloDpJvsjdWi7wGdly9G9Fl4hNwVdVhIAytmuuXRs=;
        b=apYZ4tAuhBbwKKC8CCdcxMPnDXu+uiE+hJy5rB4G9qViy75fdwwqwYSoymj8kjtTMy
         cHu3HYLWmMZYCN+bznyHwdHfmRIQs6qFtAIKE6KOvlPT2b72wbor9I2bsbaHs9nneRHN
         Y2/VQBlUHohrCSxFZvWqPTZ7Ykty1fr6O51VgaVZsOXni8qrV5VFy/PTvwkUETMZpu1s
         vwXftCP0ml4RpHit9iaY2DholltKNcd9GGXovx6vvPZlGLTSxYn+zOjQD1BBnn7mGFcx
         H0hSPdlX1FTshQPiB4eSGgmLkDRUsDFoOEidpVofHdfCN6uTJTqbLzICE7CLxVpaDoYV
         Q4nw==
X-Gm-Message-State: AOAM532tjsznQPobVX5dLpnoPNSJAxWYzyp0CPjKtr7ysF3D+/Umlo1N
        jvWvpQQqKNMsr5O0HTo6yxGn0m6FyZFMvL+s41A=
X-Google-Smtp-Source: ABdhPJyU/qTSa2BQgWlLxHchK/Q1tt7AUlPYwA06SFLFMJBbbvIitlxCx5CtWXPy8F2ak0XDzJeMGQ==
X-Received: by 2002:a05:6402:2922:b0:40f:7241:74d4 with SMTP id ee34-20020a056402292200b0040f724174d4mr9106140edb.43.1645200664608;
        Fri, 18 Feb 2022 08:11:04 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id kq17sm2370716ejb.205.2022.02.18.08.11.03
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 08:11:04 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id d27so15392589wrc.6
        for <linux-leds@vger.kernel.org>; Fri, 18 Feb 2022 08:11:03 -0800 (PST)
X-Received: by 2002:adf:ef07:0:b0:1e3:333f:a101 with SMTP id
 e7-20020adfef07000000b001e3333fa101mr6712804wro.301.1645200663316; Fri, 18
 Feb 2022 08:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20220216045620.1716537-1-bjorn.andersson@linaro.org> <20220216045620.1716537-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220216045620.1716537-2-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Feb 2022 08:10:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xj5k7JROP1PFY9tmXxLY7FRJNdr-+UmkCW_YGqpDkFew@mail.gmail.com>
Message-ID: <CAD=FV=Xj5k7JROP1PFY9tmXxLY7FRJNdr-+UmkCW_YGqpDkFew@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] leds: Add driver for Qualcomm LPG
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Satya Priya Kakitapalli <c_skakit@qti.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Tue, Feb 15, 2022 at 8:54 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +                        const struct pwm_state *state)
> +{
> +       struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +       struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +       int ret;
> +
> +       if (state->polarity != PWM_POLARITY_NORMAL)
> +               return -EINVAL;
> +
> +       mutex_lock(&lpg->lock);
> +
> +       if (state->enabled) {
> +               ret = lpg_calc_freq(chan, state->period);
> +               if (ret < 0)
> +                       goto out_unlock;
> +
> +               lpg_calc_duty(chan, state->duty_cycle);
> +       }
> +       chan->enabled = state->enabled;
> +
> +       lpg_apply(chan);
> +
> +       triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
> +
> +out_unlock:
> +       mutex_unlock(&lpg->lock);
> +
> +       return ret;
> +}

My compiler (correctly) yelled that `ret` is returned uninitialized if
`state->enabled` is false. I initialized `ret` to 0 and the problem
went away. I assume that the patch will need to spin to fix that
unless everything else looks great and a maintainer wants to fix that
when applying.

With that fix, I was able to use Bjorn's patch along with Satya's
patches adding pm8350c support (removing the now defunct
"pwm_9bit_mask" property) to make the PWM on my board work. Thus, once
the error my compiler complained about is fixed I'm happy with my
`Tested-by` being added.

For now I haven't actually reviewed the code here, but if folks feel
like it needs an extra pair of eyes then please yell and I'll find
some time to do it.

-Doug
