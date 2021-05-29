Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE12394B7A
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2J76 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2J76 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:59:58 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AAAC061574;
        Sat, 29 May 2021 02:58:21 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id n12so1190430pgs.13;
        Sat, 29 May 2021 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pwGMQEJEW6MxLu1LN/2x++8DmewQkyXXXLNPzwcxJEw=;
        b=FKr/C9cDWw1OHWVr619eLcYio96r70TAFaTshp7hND28feIjlB6yF0+ahiDY1TPOij
         FOeE1D+hBeE31eYvG2ztiv2NqNbt8DppPxD9Os0iY7hf+FvVm4JNRt9Yj9ZzJGLFtJ/W
         9khfEnVIcXlNSRNx83yowSDjNqA2xRPb0y6X3+ysB2Uip1E/qqljlj/qT04Hl9Ur4oGF
         Qdbl8zXQrWY84LZSo4uy1Ap+1adDEmaNr3u06p60nuT0UKaE1H48PGJSo72mT6HyO1mz
         J7EW9m9vyCqQXpbb4Lil4uZGMYTjWFfXqTeXDLsIG88Sn9pWduZ1wR9xfx29EreM8f80
         5HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pwGMQEJEW6MxLu1LN/2x++8DmewQkyXXXLNPzwcxJEw=;
        b=gQ5F9JhBt33wzUrosOMGEkKS1TK/l6oorpAodWwly5RBZPdG2iIdZiJUhFuwz/49SW
         DZ9CfRIfuXnt394a3xRL2is+vsc9uvkByPcuHtwmvgxWn5jtTT58kJLYiVYA7x9Jbw89
         Utt0bNZfMPZCh4QIocf73ujNqmmT41adZIMf2c/7Q5GpVygAIBjWRq27GHJhXFHdwJR4
         20mN4SXFjJtGp6yO3tRRTN0dkcp7phdR/alzxOTbuV58ge1w9gG2C/KltH9RCOsGCQhH
         NaFH3aLU8cZlKI6ol/IbYDyeAz4ydGy4l89naJQgtl7lhZX6Del3Xt/s2iQ1P0M8wuFk
         POQg==
X-Gm-Message-State: AOAM531bOeRj2UH7wPh/k821u94J0SV0OBFCVLUxIHYZ9QHeaREYn9CN
        QLbZAV2b5oi3aEcnaYowlVnJ4T6eeWW7C5t9Os4=
X-Google-Smtp-Source: ABdhPJy8L+Xi8dHxLNkXEHloOwxyzR4myIpauEtgthgYMTMTMfz7U+Lx6xwR4l566fmSPrRxpmy5pO8MChNfLIL3i+k=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr13351976pgc.203.1622282300872;
 Sat, 29 May 2021 02:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-29-andy.shevchenko@gmail.com> <20210528101454.GJ2209@amd>
 <YLDNKekDfNQPorRG@smile.fi.intel.com>
In-Reply-To: <YLDNKekDfNQPorRG@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:58:04 +0300
Message-ID: <CAHp75VemPYaGY_icsuCa4AKi1tucpEuKFKhDPo4cS_a0cLDa2w@mail.gmail.com>
Subject: Re: [PATCH v1 28/28] leds: sgm3140: Put fwnode in any case during ->probe()
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 2:01 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 12:14:54PM +0200, Pavel Machek wrote:
> > Hi!
> >
> > > fwnode_get_next_child_node() bumps a reference counting of a returned variable.
> > > We have to balance it whenever we return to the caller.
> >
> > This (and similar) -- in half of the drivers we hold the handle from
> > successful probe. Is it a problem and why is it problem only for some
> > drivers?
>
> Hmm... I'm not sure I have understood the question correctly. Any examples of
> the driver that you think needs some attention?
>
> In general the idea is that these kind of for-loops or getting next fwnode
> should be balanced.
>
> In case of for-loops the error or any other breakage means that reference count
> is bumped, for the get_next API it's always the case.
>
> I have checked between drivers and only considered above cases. Wherever there
> is a for-loop which isn't broken, we are fine. Wherever we have explicit
> reference counter drop for get_next cases, we are fine. If (any) framework
> requires the resource to be present that framework should bump and drop
> reference count on the resource by itself (so I split LED framework out from
> the consideration and consider that it does the right things)
>
> > Thanks for series, btw, I pushed out current version of the tree.
>
> Should I rebase the new version on something I can find in your Git tree?

I found the above is good justification, so I leave those patches
unchanged in v2.

-- 
With Best Regards,
Andy Shevchenko
