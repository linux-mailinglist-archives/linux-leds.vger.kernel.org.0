Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23572E83EF
	for <lists+linux-leds@lfdr.de>; Fri,  1 Jan 2021 15:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbhAAOUi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 1 Jan 2021 09:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbhAAOUh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Jan 2021 09:20:37 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC67C061575
        for <linux-leds@vger.kernel.org>; Fri,  1 Jan 2021 06:19:56 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id h205so49173912lfd.5
        for <linux-leds@vger.kernel.org>; Fri, 01 Jan 2021 06:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QsPmcpPsnbLYhOMm5UbpDdIc3jRbIuXMnc0dIdfRJHg=;
        b=ErisSbaPcB8BB4XhBaWiauqo6oXZ2o5NsyVejRrRaKper3qCdYovSNVlXPD3wRx1xB
         UFwuAu4cpmxBx+mRF7I7XoC1BKvwvLnvuK1PpXRKuLEWxrP9GvrUlmZLJ93tADwZxdyY
         +b9Ce0wgIDopTSu5KBkkoRIHjCIrQp2SmxDdTKljJzHZzaYpFO8BWikWDK2tXiynpi/Y
         ayxFzMP5kebCNJvMaiH9BugTZs1fD4mB9U+6Q2J/3i982m/x7bKORtkO3EmFk+kttqrZ
         i6nwdpUIimpvx3Bc/HiB9YgWmjB88ghyc9bOXY0PAvZTcGzypsqNyKJs/PYXqCjj0K59
         433A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QsPmcpPsnbLYhOMm5UbpDdIc3jRbIuXMnc0dIdfRJHg=;
        b=DMV2za8UddGxEZyDr1Faj3k7EbcIhTY4WPqZxJ3UdhyHI4FBXg8IliuthkoPqkHkI5
         IJ/v0XZpedqtjDp0RXfspH/yk/mt2NJl3asc3acoe2/e0cd7/Pg5Z/sna8s3Z/1H8W8o
         hoh1miNI9N6woe7Mc79w9QIb4ZyIWgCeQ5v3X/lYZJC1qQINa1+mOadjpXkpuVccUGxB
         HzXnlIn/MJCJ9D5bPX9in5Zzz3BF2Ws8OaDRDJNxgRrlk5L4eesBN4iLQUqRNs7zi4sE
         IH1B8hmr/jRDdH5iyuxlZAc+9BES1du25LrincHN6zS+VkzURaleRqiiESAPpMjfEFM3
         wYxQ==
X-Gm-Message-State: AOAM530uiTO/SxJdQFSOzfr7svI6s0E5vNmROAki5hfBs9QsD2lqb6Dr
        luI8K76lho4cj+IhkNCycldpGnWFDlsCrC62OS6kSBzasuI8pw==
X-Google-Smtp-Source: ABdhPJxjCnV8DIPwpx74Q8C5a9/BZjmLvCTVWXleQYJzFd8wFli1vcpOuHDFfoh4HZJiP/V09zBm24OUcYJkBpc5Fmk=
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr28579606lfq.586.1609510795503;
 Fri, 01 Jan 2021 06:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20201201101350.1401956-1-linus.walleij@linaro.org>
 <20201201101350.1401956-2-linus.walleij@linaro.org> <20201230190907.GE25903@duo.ucw.cz>
In-Reply-To: <20201230190907.GE25903@duo.ucw.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Jan 2021 15:19:44 +0100
Message-ID: <CACRpkdYtcmLc3GsJA8H0g_G55Cnffn2Tm2da6UOqyv2DSn_UXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v7] leds: rt8515: Add Richtek RT8515 LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

will send a new version with some minor tweaks!

On Wed, Dec 30, 2020 at 8:09 PM Pavel Machek <pavel@ucw.cz> wrote:

> > +     if (ret1 || ret2) {
> > +             dev_err(rt->dev,
> > +                     "either %s or %s missing from DT, using HW max\n"=
,
> > +                     resistance, max_ua_prop);
> > +             max_ma =3D RT8515_MAX_IOUT_MA;
> > +             max_intensity =3D hw_max;
> > +             goto out_assign_max;
> > +     }
>
> I'd go with some minimum values if we don't have complete information
> from devicetree.

I think this is safe because of the way the current limiting
resistors work, the device is designed to have hardware
constraints on currents. The max brightness is the max
current as limited by hardware. It is not possible to break
this LED with software.

Of course someone could have mounted the LED in violation
of the manual but ... we can't protect for everything I think.

The resistances etc is mainly here to give v4l an idea of the
current since V4L is a current-oriented API. Not a good fit
in this case, but with these DT properties we can make it fit
somewhat so ... =C2=AF\_(=E3=83=84)_/=C2=AF

> > +MODULE_LICENSE("GPL v2");
>
> v2+, iirc?

It seems GPL-2.0-or-late just use "GPL" as license so I changed
to that.

Yours,
Linus Walleij
