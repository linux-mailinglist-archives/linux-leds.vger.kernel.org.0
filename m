Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4AB44918
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2019 19:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbfFMRNn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Jun 2019 13:13:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42692 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbfFLV7F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jun 2019 17:59:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so10438108pff.9
        for <linux-leds@vger.kernel.org>; Wed, 12 Jun 2019 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gd+iRkBoaLuR41yfzvsotNCEih/GX/9KiYnXgu8+QUw=;
        b=T7XUYpAHlXPgkrr551WjANdPkf/QWPGZgqoK1rPPuVwZ8p6OayggRIVGaOxjZAOiUp
         BlSezgIbqTvJoVsk/COKKKIMEXr4UZu2Y/l1Rruz3cX2Q8GhI7sYdzAV9MmogA8Ktqmk
         TxLMm0vLRguYsOtQwP0PqzFNNTxDhS2Pl5W3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gd+iRkBoaLuR41yfzvsotNCEih/GX/9KiYnXgu8+QUw=;
        b=UAll0mmlbWYS0Yhz2OaYO+sALS8QwxuY8PKoL0ReSkrm+CbpOfesBPV+I/IJvUFQq+
         Y7/Xx8HcWVzbVso7Hs3KZ/qfUhgtxNpDsLPcRc2gUbfAO2RZwGZ4LtOW12JKDhXyEFHP
         Q74EGeo63lZZGnP2hg8A+tCj7N6pl3afdwORiC85sFGxrvKJmhTj2w2RdaxIOygpK3Mz
         PCbr0DnfFNwOq8A5JRVyDmrcH6FG8Xqx1vaHSgXivA51ye553K8ut+1+Ctt8Is5ot2ZL
         QdSIiiE6fjFAAUjAk07ieDS3I8QqSgvBAPEj2pUhPxwUGeu2VNTPpCmIgCK6JccFgE9h
         E4Cw==
X-Gm-Message-State: APjAAAVMUh3IWYI+O/am0S5UWnMsBgY/lW4w+JEqy1uxjG9OmsOIdcWB
        090suMWiSaW6N9Cte3Km3urr1Q==
X-Google-Smtp-Source: APXvYqztdJ17/iYzrPBQCpMcy4rz+yeXFWL2Fz8rLoaOTr56VG4sXz0XFsck+nuwfJDN12phU10bSw==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr1309346pjs.101.1560376744620;
        Wed, 12 Jun 2019 14:59:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id i5sm366897pjj.8.2019.06.12.14.59.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:59:02 -0700 (PDT)
Date:   Wed, 12 Jun 2019 14:59:00 -0700
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
Message-ID: <20190612215900.GL137143@google.com>
References: <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
 <20190612110325.xdn3q2aod52oalge@holly.lan>
 <20190612192642.GK137143@google.com>
 <20190612194757.fxetkhah6detiukm@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190612194757.fxetkhah6detiukm@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jun 12, 2019 at 08:47:57PM +0100, Daniel Thompson wrote:
> On Wed, Jun 12, 2019 at 12:26:42PM -0700, Matthias Kaehlcke wrote:
> > Hi Daniel,
> > 
> > On Wed, Jun 12, 2019 at 12:03:25PM +0100, Daniel Thompson wrote:
> > > On Tue, Jun 11, 2019 at 03:30:19PM -0700, Matthias Kaehlcke wrote:
> > > > On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> > > > > On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> > > > > <daniel.thompson@linaro.org> wrote:
> > > > > > This is a long standing flaw in the backlight interfaces. AFAIK generic
> > > > > > userspaces end up with a (flawed) heuristic.
> > > > > 
> > > > > Bingo! Would be nice if we could start to fix this long-standing flaw.
> > > > 
> > > > Agreed!
> > > > 
> > > > How could a fix look like, a sysfs attribute? Would a boolean value
> > > > like 'logarithmic_scale' or 'linear_scale' be enough or could more
> > > > granularity be needed?
> > > 
> > > Certainly "linear" (this device will work more or less correctly if the
> > > userspace applies perceptual curves). Not sure about logarithmic since
> > > what is actually useful is something that is "perceptually linear"
> > > (logarithmic is merely a way to approximate that).
> > > 
> > > I do wonder about a compatible string like most-detailed to
> > > least-detailed description. This for a PWM with the auto-generated
> > > tables we'd see something like:
> > > 
> > > cie-1991,perceptual,non-linear
> > > 
> > > For something that is non-linear but we are not sure what its tables are
> > > we can offer just "non-linear".
> > 
> > Thanks for the feedback!
> > 
> > It seems clear that we want a string for the added flexibility. I can
> > work on a patch with the compatible string like description you
> > suggested and we can discuss in the review if we want to go with that
> > or prefer something else.
> 
> Great, other important thing if we did decide to go this route is there
> must be some devices with multiple strings on day 1 (such as the cie-1991
> example above).

Ok, I can add this to the PWM backlight driver (obviously with the
actual handling of the new attribute in the core).

> Whatever we say the ABI is, if we end up with established userspace
> components that strcmp("linear", ...) and there are no early counter
> examples then we could get stuck without the option to add more
> precise tokens as we learn more.

Indeed, we need userspace to understand this isn't necessarily a
'simple' string.

> > > > The new attribute could be optional (it only exists if explicitly
> > > > specified by the driver) or be set to a default based on a heuristic
> > > > if not specified and be 'fixed' on a case by case basis. The latter
> > > > might violate "don't break userspace" though, so I'm not sure it's a
> > > > good idea.
> > > 
> > > I think we should avoid any heuristic! There are several drivers and we
> > > may not be able to work through all of them and make the correct
> > > decision.
> > 
> > Agreed
> > 
> > > Instead one valid value for the sysfs should be "unknown" and this be
> > > the default for drivers we have not analysed (this also makes it easy to
> > > introduce change here).
> > 
> > An "unknown" value sounds good, it allows userspace to just do what it
> > did/would hace done before this attribute existed.
> > 
> > > We should only set the property to something else for drivers that have
> > > been reviewed.
> > > 
> > > There could be a special case for pwm_bl.c in that I'm prepared to
> > > assume that the hardware components downstream of the PWM have a
> > > roughly linear response and that if the user provided tables that their
> > > function is to provide a perceptually comfortable response.
> > 
> > Unfortunately this isn't universally true :(
> > 
> > At least several Chrome OS devices use a linear brightness scale and
> > userspace does the transformation in the animated slider. A quick
> > 'git grep -A10 brightness-levels arch' suggests that there are
> > multiple other devices/platforms using a linear scale.
> 
> Good point.
> 
> Any clue whether the tables are "stupid" (e.g. offer a poor user experience
> with notchy feeling backlight response) or whether they work because
> some of the downstream componentry has a non-linear response?

Sorry, I don't know details about any of these devices, except some of
the Chrome OS ones.

> > We could treat devices with a predefined brightness table as
> > "unknown", unless there is a (new optional) DT property that indicates
> > the type of the scale.
> 
> If we have an "unknown" and we don't know then I guess I just claimed
> that's what we have to do for cases we don't understand.
> 
> For pwm_bl it would be easy to study the table and calculate how far from the
> line the centre point is... although that bringing back heuristics into
> the picture, albeit more useful ones.

True, distinguishing between 'linear' and 'non-linear' shouldn't be a
big deal.

> As I said... I'd be OK for the pwm_bl to take a few liberties because it
> is so different from the fully fledged LED driver drivers but we don't
> need to go crazy ;-)
