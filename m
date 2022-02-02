Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE7134A7AC5
	for <lists+linux-leds@lfdr.de>; Wed,  2 Feb 2022 23:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347777AbiBBWIn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Feb 2022 17:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236427AbiBBWIn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Feb 2022 17:08:43 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5100AC06173E
        for <linux-leds@vger.kernel.org>; Wed,  2 Feb 2022 14:08:43 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id u18so1406527edt.6
        for <linux-leds@vger.kernel.org>; Wed, 02 Feb 2022 14:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HlraHmNgdumj40y+Vxj8nJOCtHX98SAfTtbNfZ64dtc=;
        b=yWO2Xpa2CCWLLJb5WHskpjn5ZNPJ/SJ+AOhMyUg5xDbi75ZZhWweuQFle7wYLU4M8D
         fvyHZSTOE+nAgE9ATzz7pArYZV4gxHZhHzKlHiDXUgXFcOlYCojCjCGlpirLz4MGUhDQ
         MURclDksMefKRG8nXCl9XVfWTzeD20uzS6M/EzsF1ljdSgzEkmr5DpjVVq8Ca+rTUe9q
         WhXFwcSNP/efg0S9o+bEOQmnIFtWelEWRhlr7iJYNcAodLqZS+583KP/lhXLlKnZRQE9
         TWPsmQyj4c+34zeOudEqMi4j9H0RPJn03T1e7v2bD0xzjLD6PGOE6adR1FZsuuyFnYBM
         zfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HlraHmNgdumj40y+Vxj8nJOCtHX98SAfTtbNfZ64dtc=;
        b=4c1044MLMrSMEQLCYOOnYuYVHRQnGOx/nxDNok5RfznuVc3q/ocrxPkD04Wvtce/Nc
         H24ovADrBmYtgwSrI/k8PMLl+X79Wl01mUo+FwYhCDLsSwfNMHWpPXot6pDjSb+vbd9y
         Y+zfWDV14o8lBDODywEVETISOM0ReJqHwbamr0xL/KRJY7ofVWppAvA4FhFpd3A+Msp3
         oXdfwGxYpo1YixWgSmNQFYuDoWj4Dlepm6aUOeM2SzOsXlmvsl/5UqVcoQn45Zrp8CC9
         t7EpVzPqZggZsjz3DrdWQutoyBD0+p/bdkREetsuzpqs1MUBgetkqoWOFYaV9etbgTCb
         AZGA==
X-Gm-Message-State: AOAM5303XDOq87Y14FueG2CP5pdBedelE+CNQMw9X1M7IY0fg7jjd9iX
        ifvEp3Cdk40q9WDvVFv0ix4DeoQhQhD3U/l0wdoUUA==
X-Google-Smtp-Source: ABdhPJxU13IvMNJB9CLX9RID5RdpALDQmWnXhxjxw3ECF0QxhrvMFXS5K8yqGKyoBUl9QipAitnbbCsrxrqrphUFvGs=
X-Received: by 2002:a05:6402:50cf:: with SMTP id h15mr25388003edb.102.1643839721825;
 Wed, 02 Feb 2022 14:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20220129005429.754727-1-bjorn.andersson@linaro.org>
 <20220129005429.754727-2-bjorn.andersson@linaro.org> <20220202111833.ibeq3udj37dkfv6l@SoMainline.org>
 <Yfrj7DnXET6fT3BX@ripper>
In-Reply-To: <Yfrj7DnXET6fT3BX@ripper>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 2 Feb 2022 16:08:29 -0600
Message-ID: <CAOCOHw7LS=NALXzHMN6LauEqrjDk2y27VoQtaT4tkHJiYxM7MQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] leds: Add driver for Qualcomm LPG
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Uwe Kleine-K?nig" <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Satya Priya Kakitapalli <c_skakit@qti.qualcomm.com>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 2, 2022 at 2:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 02 Feb 03:18 PST 2022, Marijn Suijten wrote:
>
> > On 2022-01-28 16:54:29, Bjorn Andersson wrote:
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
> > > smartphones etc, for which the driver support multiple channels to be
> > > ganged up to a MULTICOLOR LED. In this configuration the pattern
> > > generators will be synchronized, to allow for multi-color patterns.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >
> > There may still be some things to improve based on whether lo_pause
> > works in non-ping-pong mode - to alleviate the requirement for the first
> > delta_t to be at most 512ms - but this patch should not be delayed much
> > longer and that's perhaps for a followup patch.  Same for my request for
> > documentation and examples which at the same time serve as some form of
> > tests to see if everything works as desired.
> >
>
> I've been considering lopause to be the value before we start the
> pattern, but I think you're right in that it denotes how long we should
> hold the first value.
>
> So I think it might make sense in the predefined "<value> <delay> <value>
> <delay>" scheme to use first <delay> as to calculate lo-pause. I think
> it has to be calculated, because the first value will iiuc be held
> for (lopause + 1) * delay ms.
>
> > I also vaguely remember other (downstream) drivers to support more than
> > 512ms per step by (drastically?) changing PWM period, but not sure how
> > that worked again nor if it was reliable.
> >
>
> Thinking about it again, while 512 is the 9th bit, we should be able to
> represent [0..1023] with 9 bits...
>

Sorry, my mind was elsewhere as I wrote that. [0..511] is what we got.

Regards,
Bjorn
