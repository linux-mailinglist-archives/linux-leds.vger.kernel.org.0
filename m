Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE7036F204
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 23:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbhD2VaL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 17:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237175AbhD2VaK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Apr 2021 17:30:10 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA767C06138B
        for <linux-leds@vger.kernel.org>; Thu, 29 Apr 2021 14:29:23 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id k9-20020a4ad1090000b02901f9e46845e7so649523oor.6
        for <linux-leds@vger.kernel.org>; Thu, 29 Apr 2021 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WhhONAZwNzu7RDX2cDI/rhUVfkGXZp4VrgDkc/V9nE0=;
        b=rolBt33kBJCjxeIakyKhz/Gip1+9Uo2EHF1vWufZ92pl5fRIbslUFAWDDYzhNXgJam
         rhjYNWTmx33OH2khbneUteVz45t61tNYVcNiKqxbL+EmJhTYOxIk5XotNknOrznoECi9
         fhFjnab/0iDOSns9OiNJZBNmglCgAQXrx+/lUacoyHhteFOdu2tq0Z9c0AwjwG9xkdhF
         qbyDSy9uOsEeEw8qUxMQA5bio8FRAv9/WIcKskzEAa6rT8LtSITMaclZVbt9c2xiMXDa
         rmb7k6DplgNBHqyB4V41x6DXjGClF68imnGohkiZfHdxRuGvxADIQknHmjBU9oEYc1Ze
         9F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WhhONAZwNzu7RDX2cDI/rhUVfkGXZp4VrgDkc/V9nE0=;
        b=JPsHO8LxZ9j5B7IGrSCcsaJa8k6/8cqPFkapMIqvNY9SxwzZg3ry6uvFkCfkpG7MSM
         mMxOCvvKzsU0eS2cx2Q0mhECzOkwQaA3+scy2BL/1xjMofENGRlELnpikHNm9hKi++vP
         MlkLrIPDP4wksBkhVLfKMmoZmoEvBCqQ+O4GXSfJiz4D31WmgyrvVivPOFz0eCMyE3DQ
         zUeP9pfit9B7R7Sz278c61Am6uk4oJPoSQ8SO+NGEASeLGqLINkgfyxtCZCqHif1fhZ5
         1icfIEGcyFMQCPzPMuMVK2bcjyCZEo7ui2fOKOlHGPteUy+bYNOf26UESnllZpizxkhk
         irDw==
X-Gm-Message-State: AOAM5316y/N02mJ0d1o7m/hkKFL+SFHHr6KubANfrW682UzZtGG5wzlK
        MzkrvI6zika02R8fYR0csAstTg==
X-Google-Smtp-Source: ABdhPJzLm11eI5oXFElIQk+iRw+WNzVXt+SVzWtna5FYQ9mG7PG3szIK7ZDFh9i57aUdp+Uo7I2thg==
X-Received: by 2002:a4a:765c:: with SMTP id w28mr1682235ooe.8.1619731763058;
        Thu, 29 Apr 2021 14:29:23 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h184sm278354oia.1.2021.04.29.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 14:29:22 -0700 (PDT)
Date:   Thu, 29 Apr 2021 16:29:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 2/4] leds: Add driver for Qualcomm LPG
Message-ID: <20210429212920.GB2484@yoga>
References: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
 <20201021201224.3430546-3-bjorn.andersson@linaro.org>
 <20201029181357.GE26053@duo.ucw.cz>
 <YIn50NW+Pimqfsih@builder.lan>
 <20210429211223.GA5480@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429211223.GA5480@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu 29 Apr 16:12 CDT 2021, Pavel Machek wrote:

> Hi!
> 
> > > > +static int lpg_add_pwm(struct lpg *lpg)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	lpg->pwm.base = -1;
> > > > +	lpg->pwm.dev = lpg->dev;
> > > > +	lpg->pwm.npwm = lpg->num_channels;
> > > > +	lpg->pwm.ops = &lpg_pwm_ops;
> > > > +
> > > > +	ret = pwmchip_add(&lpg->pwm);
> > > > +	if (ret)
> > > > +		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
> > > > +
> > > > +	return ret;
> > > > +}
> > > 
> > > Do we need to do this? I'd rather have LED driver, than LED+PWM
> > > driver...
> > > 
> > 
> > Yes, I believe we need to do this.
> > 
> > Because each piece of hardware has N channels, which can be wired to
> > LEDs, grouped with other channels and wired to multicolor LEDs or be
> > used as PWM signals. And this configuration is board specific.
> > 
> > One such example is the laptop in front of me, which has 3 channels
> > wired to an RGB LED and 1 channel wired as a backlight control signal
> > (i.e. using pwm-backlight).  Another example is a devboard where the
> > 4 channels are wired to 4 LEDs.
> 
> Ok, so this is actually important. In this case you should have PWM
> layer, exporting PWMs, and then rgb-LED driver that takes three of
> those PWMs and turns them into LED, no?
> 
> And ... surprise ... that is likely to help other people, as LEDs
> connected to PWMs are quite common.
> 
> Hmm.?
> 
> If you can't do this for some reason, you should probably explain in
> the changelog, because this is going to be FAQ.
> 

This is exactly what the downstream implementation does and in the case
of a solid color LED this works fine.

But the hardware has a shared chunk of memory where you can write
duty-cycle values, then for each PWM channel you can specify the
start/stop index and pace for the PWM to read and update the configured
duty-cycle. This is how the hardware implements pattern support.


So downstream they have (last time I looked at the code) an addition in
the PWM API where the LED driver can inform the PWM driver part about
the indices to use. Naturally I don't think that's a good idea.


Additionally, representing this as individual PWM channels means we're
loosing the grouping that now comes from the description of multicolor
LEDs, which serves the basis for synchronizing the pattern traversal
between the involved channels.


I just posted v7, but I'd be happy to incorporate such reasoning in the
commit message (or do you really mean changelog in the email?) when we
agree on a solution.

Regards,
Bjorn
