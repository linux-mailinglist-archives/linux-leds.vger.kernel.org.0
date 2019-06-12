Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A35743014
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 21:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfFLT2T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jun 2019 15:28:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34551 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbfFLT0q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jun 2019 15:26:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id c85so10264742pfc.1
        for <linux-leds@vger.kernel.org>; Wed, 12 Jun 2019 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JGTJNpxtoSxf9cQjifYgXwRhQ7ZHC2LuIfFDHnbUz+Q=;
        b=jkCOi89f8z4k6wMOAeyYKznf4Y62pis19MeQNmtA7Jh53MHFibTLDJ9TYgKVn+f5kD
         fLUDfVGDMuu4aWcnxDzxbp07lL+Lz51Iy00qrEIJCzXdYG49TZOl7ZAvAbf9jiUmmh/V
         ih3U2U6lZeAoQ/pfzf5gNEqmoDoWlcBOwlo+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JGTJNpxtoSxf9cQjifYgXwRhQ7ZHC2LuIfFDHnbUz+Q=;
        b=C/bzRMnYIchgKUEiz64SaDNjc7SxsdjY6/Y3l+5tp307xUGYxJRfRmzuFO9wzzQIwB
         EPRzdOnNvTWK8xhFP0vqDoBYR1kgeokwudTJRS+TUQ7TxfVDe27LZDpHwvp5+zgkKF5M
         so/5gMgSgzuyPtuI/Ur/vejzFC1hlWrzaU5BOr8FVWJjdnGNPNg7nj4/AnBgbjjR5OlM
         KCz58FzHDXAcfKBcqBWjGAJ0PG0PXErq9E50rG1WSVb9WJWnfLNGm+qKnKnJ1Hx96FAM
         0Hz3+C+RXSRsHnP0dBn5KILxQZEH1bchN13ay8sfBb7FTTnbIdsIt9O8cnNB6asWCqF8
         ld1A==
X-Gm-Message-State: APjAAAVEzLF4eE9ZIEUz0Y9QRdDW6wqcrhiuOv/qELjogjyTc/737cH+
        VJUt2F45Yvl0MgvGZqIEG8aDYg==
X-Google-Smtp-Source: APXvYqzXNaVC/oJkIo+F4M5Yj007p4G4RNdM/LCI3g6mVncptMolQVeByev0CceqM+5WvJuPiF17VA==
X-Received: by 2002:a62:5306:: with SMTP id h6mr89297716pfb.29.1560367605628;
        Wed, 12 Jun 2019 12:26:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id e26sm326416pfn.94.2019.06.12.12.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:26:44 -0700 (PDT)
Date:   Wed, 12 Jun 2019 12:26:42 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Brian Norris <briannorris@google.com>, Pavel Machek <pavel@ucw.cz>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Doug Anderson <dianders@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Message-ID: <20190612192642.GK137143@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
 <20190612110325.xdn3q2aod52oalge@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190612110325.xdn3q2aod52oalge@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Daniel,

On Wed, Jun 12, 2019 at 12:03:25PM +0100, Daniel Thompson wrote:
> On Tue, Jun 11, 2019 at 03:30:19PM -0700, Matthias Kaehlcke wrote:
> > On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> > > On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > > This is a long standing flaw in the backlight interfaces. AFAIK generic
> > > > userspaces end up with a (flawed) heuristic.
> > > 
> > > Bingo! Would be nice if we could start to fix this long-standing flaw.
> > 
> > Agreed!
> > 
> > How could a fix look like, a sysfs attribute? Would a boolean value
> > like 'logarithmic_scale' or 'linear_scale' be enough or could more
> > granularity be needed?
> 
> Certainly "linear" (this device will work more or less correctly if the
> userspace applies perceptual curves). Not sure about logarithmic since
> what is actually useful is something that is "perceptually linear"
> (logarithmic is merely a way to approximate that).
> 
> I do wonder about a compatible string like most-detailed to
> least-detailed description. This for a PWM with the auto-generated
> tables we'd see something like:
> 
> cie-1991,perceptual,non-linear
> 
> For something that is non-linear but we are not sure what its tables are
> we can offer just "non-linear".

Thanks for the feedback!

It seems clear that we want a string for the added flexibility. I can
work on a patch with the compatible string like description you
suggested and we can discuss in the review if we want to go with that
or prefer something else.

> > The new attribute could be optional (it only exists if explicitly
> > specified by the driver) or be set to a default based on a heuristic
> > if not specified and be 'fixed' on a case by case basis. The latter
> > might violate "don't break userspace" though, so I'm not sure it's a
> > good idea.
> 
> I think we should avoid any heuristic! There are several drivers and we
> may not be able to work through all of them and make the correct
> decision.

Agreed

> Instead one valid value for the sysfs should be "unknown" and this be
> the default for drivers we have not analysed (this also makes it easy to
> introduce change here).

An "unknown" value sounds good, it allows userspace to just do what it
did/would hace done before this attribute existed.

> We should only set the property to something else for drivers that have
> been reviewed.
> 
> There could be a special case for pwm_bl.c in that I'm prepared to
> assume that the hardware components downstream of the PWM have a
> roughly linear response and that if the user provided tables that their
> function is to provide a perceptually comfortable response.

Unfortunately this isn't universally true :(

At least several Chrome OS devices use a linear brightness scale and
userspace does the transformation in the animated slider. A quick
'git grep -A10 brightness-levels arch' suggests that there are
multiple other devices/platforms using a linear scale.

We could treat devices with a predefined brightness table as
"unknown", unless there is a (new optional) DT property that indicates
the type of the scale.

Cheers

Matthias
