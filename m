Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC094306C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 21:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfFLTsD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jun 2019 15:48:03 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35733 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbfFLTsD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jun 2019 15:48:03 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so7756189wml.0
        for <linux-leds@vger.kernel.org>; Wed, 12 Jun 2019 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BWJ0u5CtF0Qv6wMPY5u4b0y/rHOuqwcgTyIrDriQ+5U=;
        b=OU4CYVgyAvY6XgLltsHBPWTKLAcOBVJ+l2BDA6OVEpGrrjL9RxveGqDdy9Z7aa97aB
         p9fP92nlnkD0XeXno9RtpGLmNEvUzFIh1ratSLH9V1OkY31OGiMBOKcB9WcwCTZ8dDN/
         5ai0VH0Umm6ReMFo6KnlJi8lW8/cgZK2WLk5G8u+M36rnpeCdLey864Qhrh5hcUgL1fR
         OnWQYoGiVnVt4gVgvtI8cEdFFv9rDYh0bJjwCjXHyOZjGOloSI3q9AwklACryolyK7AP
         UBd9iV7ZeBnkFyjsSnLBZqp3b1SUuvXIfGpWjiJZd+N7nxPOdf9uSx2asjYndmuKqVze
         TPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BWJ0u5CtF0Qv6wMPY5u4b0y/rHOuqwcgTyIrDriQ+5U=;
        b=tDpm2aBCfQ6hCgQslux0UjxnkWZp/yR8SA86cfSLidrBZfITg0PbFOpv3jWlHFq8we
         fvk+JXnW/NbtcI0/aslotGP+FmQ8JwDDS4SrnB1QBwMCjEke5tJ9d4N/A5h820f6d5SX
         0VhTvCfeCjVJlSelXHsQky/zdr0Opn4LOw/+gQ1THwXHIM9BBJ/3nSwx84ZnQ1Oo5U2I
         LnUV+EWFDWBB2b11EdRh3ewGCi5Dfz5Y61D7SOzcFCdqkyFDXOJFa4zO8scgJ+IrPlCU
         4jU1SNSTVIxsBKlj9B+j9OhwgMlTUnIxrvyZbhWwm6BPNb3CQuXsC6YcxsAjMLeAupwV
         LT6g==
X-Gm-Message-State: APjAAAVGYG6ZwM7lV+2kohGFFcCR3RcR7WH3Z2cst37zAh0cVBVndOlf
        ubKLTXJ6murWBO11GUcBcU3Gxg==
X-Google-Smtp-Source: APXvYqy0buIW03JQZL4j0sTgJ3eU2EeLE9URtqge/xWqgyHMmrgsNCsjtZOxUzQBCGap5NyW3Wmy+A==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr571500wmc.21.1560368880166;
        Wed, 12 Jun 2019 12:48:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f2sm1014859wrq.48.2019.06.12.12.47.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 12:47:59 -0700 (PDT)
Date:   Wed, 12 Jun 2019 20:47:57 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
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
Message-ID: <20190612194757.fxetkhah6detiukm@holly.lan>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
 <20190612110325.xdn3q2aod52oalge@holly.lan>
 <20190612192642.GK137143@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612192642.GK137143@google.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jun 12, 2019 at 12:26:42PM -0700, Matthias Kaehlcke wrote:
> Hi Daniel,
> 
> On Wed, Jun 12, 2019 at 12:03:25PM +0100, Daniel Thompson wrote:
> > On Tue, Jun 11, 2019 at 03:30:19PM -0700, Matthias Kaehlcke wrote:
> > > On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> > > > On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> > > > <daniel.thompson@linaro.org> wrote:
> > > > > This is a long standing flaw in the backlight interfaces. AFAIK generic
> > > > > userspaces end up with a (flawed) heuristic.
> > > > 
> > > > Bingo! Would be nice if we could start to fix this long-standing flaw.
> > > 
> > > Agreed!
> > > 
> > > How could a fix look like, a sysfs attribute? Would a boolean value
> > > like 'logarithmic_scale' or 'linear_scale' be enough or could more
> > > granularity be needed?
> > 
> > Certainly "linear" (this device will work more or less correctly if the
> > userspace applies perceptual curves). Not sure about logarithmic since
> > what is actually useful is something that is "perceptually linear"
> > (logarithmic is merely a way to approximate that).
> > 
> > I do wonder about a compatible string like most-detailed to
> > least-detailed description. This for a PWM with the auto-generated
> > tables we'd see something like:
> > 
> > cie-1991,perceptual,non-linear
> > 
> > For something that is non-linear but we are not sure what its tables are
> > we can offer just "non-linear".
> 
> Thanks for the feedback!
> 
> It seems clear that we want a string for the added flexibility. I can
> work on a patch with the compatible string like description you
> suggested and we can discuss in the review if we want to go with that
> or prefer something else.

Great, other important thing if we did decide to go this route is there
must be some devices with multiple strings on day 1 (such as the cie-1991
example above).

Whatever we say the ABI is, if we end up with established userspace
components that strcmp("linear", ...) and there are no early counter
examples then we could get stuck without the option to add more
precise tokens as we learn more.


> > > The new attribute could be optional (it only exists if explicitly
> > > specified by the driver) or be set to a default based on a heuristic
> > > if not specified and be 'fixed' on a case by case basis. The latter
> > > might violate "don't break userspace" though, so I'm not sure it's a
> > > good idea.
> > 
> > I think we should avoid any heuristic! There are several drivers and we
> > may not be able to work through all of them and make the correct
> > decision.
> 
> Agreed
> 
> > Instead one valid value for the sysfs should be "unknown" and this be
> > the default for drivers we have not analysed (this also makes it easy to
> > introduce change here).
> 
> An "unknown" value sounds good, it allows userspace to just do what it
> did/would hace done before this attribute existed.
> 
> > We should only set the property to something else for drivers that have
> > been reviewed.
> > 
> > There could be a special case for pwm_bl.c in that I'm prepared to
> > assume that the hardware components downstream of the PWM have a
> > roughly linear response and that if the user provided tables that their
> > function is to provide a perceptually comfortable response.
> 
> Unfortunately this isn't universally true :(
> 
> At least several Chrome OS devices use a linear brightness scale and
> userspace does the transformation in the animated slider. A quick
> 'git grep -A10 brightness-levels arch' suggests that there are
> multiple other devices/platforms using a linear scale.

Good point.

Any clue whether the tables are "stupid" (e.g. offer a poor user experience
with notchy feeling backlight response) or whether they work because
some of the downstream componentry has a non-linear response?


> We could treat devices with a predefined brightness table as
> "unknown", unless there is a (new optional) DT property that indicates
> the type of the scale.

If we have an "unknown" and we don't know then I guess I just claimed
that's what we have to do for cases we don't understand.

For pwm_bl it would be easy to study the table and calculate how far from the
line the centre point is... although that bringing back heuristics into
the picture, albeit more useful ones.

As I said... I'd be OK for the pwm_bl to take a few liberties because it
is so different from the fully fledged LED driver drivers but we don't
need to go crazy ;-)


Daniel.
