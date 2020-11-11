Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559FA2AFB19
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 23:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgKKWIH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 17:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgKKWIG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Nov 2020 17:08:06 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D2BC0613D1
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2020 14:08:06 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id v144so5313189lfa.13
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2020 14:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F2beeTOgaJyHW85fLBo4COylcprGpfrB3l8r4p6xwpk=;
        b=fAO6y/53ZsXBLy9Z5jkgC9AtkqJSFdnsbAwB+vuFdbewS4ysDFT5tiZ5NPxyi/r4X2
         a5Hx/nPKF+t2PstPCNlsekhMVYR+7hrgNOoEZtH7MGI1zBO5hNRGT8q972fF76xUuPXx
         0uYfXg44smo2ROBHfZgC+6IwZgs8uVeO3esq5OsjP4UZYNciXkBVmG9oyqR2ZT3Ivblg
         ntrVrL/wF6OuoDld8n4pJenvnmH2qM3qp9vrigwtY38C5plZL8W8rtlOQNSkP/yIalbN
         R49C6WKGBAUtu8S4UTDEwZDqU2NLS0UNwC1A4tSeeosM2ltzqTI9Wfe01FQgGMX94S9i
         7/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F2beeTOgaJyHW85fLBo4COylcprGpfrB3l8r4p6xwpk=;
        b=YzCARavj9L35lymS6StgDpV1nV/6dPW4zc8OBo3W5p2L8QQ3ISYP1KQoG5SXFDofmb
         DI7b6+LxQpLQ190QGM0Gny9tCbwSkK3lYLHxWCQliLSLevh0VOePiGCdHjLz+JxiGE+A
         vozyMdBENbvD6Onv+XvCD8RBv0EtcExbTI7/kat4ldu663H79O49r3Uj7wJZEpy8m3sw
         +LK2mgDaYGXqIBMPbBYzVuTAbKGLYPlf8aa4a+rOX+jnqua6MiG/9Ox5N2fPojlfEbm6
         pELX4LeuwpEp0SNp6DBWrxV98/t6OVvHyb2AGF8lRVa560zOknZI2f4lgnXPa4XrpKE9
         zbFg==
X-Gm-Message-State: AOAM531DbchPuaZWLBG+CDDhHFJOowLrrSlWvPNE/b9qtXeFxBSkesH1
        Yyu36VyG6kL/0KiyFnbClyXBrTe7xMgyLqs98Hz3yA==
X-Google-Smtp-Source: ABdhPJxQedYdYjwb41wZla8UK7aA+8TS+hr/3tc7pjBujcqhyhSZKOvfwprV9oKIP0mKfTwlFGhoxjez/3TqV8DD7hI=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr9849908lfm.333.1605132484865;
 Wed, 11 Nov 2020 14:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
 <20201111011417.2275501-2-linus.walleij@linaro.org> <20201111113848.GX6899@valkosipuli.retiisi.org.uk>
 <CACRpkdYK+X==Xm3AfymV_HEaZHOvPS-LtCLKZXc2jmzV7KUZoQ@mail.gmail.com> <20201111165503.GZ6899@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201111165503.GZ6899@valkosipuli.retiisi.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Nov 2020 23:07:53 +0100
Message-ID: <CACRpkdYvfxWE83O+4OAKx02kJK5XRBCLN0rFPjBYheQ65n4urA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Nov 11, 2020 at 5:56 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> On Wed, Nov 11, 2020 at 05:34:58PM +0100, Linus Walleij wrote:

> > The way I understand it is that this component contains its own
> > current regulation electronic. You request a brightness
> > between 1-100 and it will support this range (no external
> > current boost). And as a user that is "all you need to know".
> >
> > Isn't this problem more prevalent when you have some kind of
> > external current-regulator that you need to program?
> >
> > This component draws its power directly from VBAT (the main
> > battery) so regulating how much of that it takes is up to the
> > component.
> >
> > I could think of the component brightness being a problem if
> > the flash is embedded in some kind of plastic that cannot
> > take the heat though, but I haven't seen any code trying to
> > hold it down for this reason. I suppose the component
> > datasheet (that I don't have) specifies all these things...
>
> The LED is different from the LED driver. If you happen to have a LED with
> smaller maximum current than the LED driver can provide, the software has
> to limit the current the driver provides, or hardware damage will result.
>
> This is why virtually all flash LED drivers have these properties.

Hm you're right of course.

I did some research, the flash driver in the RT8515
appears to be somewhat clever.

Here is a schematic picture from the LG P970 service
manual where you can see the connections from the RT8515
to the LED:
https://dflund.se/~triad/images/rt8515.jpg

On this image you can see that there are two resistors connected
from the pins "RFS" and "RTS" to ground.

RFS (resistance flash setting?) is 20 kOhm
RTS (resistance torch setting?) is 39 kOhm

Some sleuthing finds us the RT9387A which we have a datasheet for:
https://static5.arrow.com/pdfs/2014/7/27/8/21/12/794/rtt_/manual/94download_ds.jspprt9387a.jspprt9387a.pdf
This apparently works the same way so now we have a
RT9387A driver as well.

The two resistances control the max current for flash
and torch, with I = 5500 / R, up to 700 mA.
For 20 and 39 kOhm this means

ImaxFlash = 275 mA
ImaxTorch = 141 mA

So the max current is actually hardwired into the
circuit.

The setting of brightness is done with the pulse train,
but it is a PWM dimmer setting on top of the max
current.

So I'll just put in these max currents (assuming they
are using the same equation).

Yours,
Linus Walleij
