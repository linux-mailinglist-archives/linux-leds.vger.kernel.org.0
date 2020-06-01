Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49891EA68C
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 17:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgFAPJg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 11:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAPJf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 11:09:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887B0C05BD43;
        Mon,  1 Jun 2020 08:09:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id fs4so5348043pjb.5;
        Mon, 01 Jun 2020 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=apV5XVo/ogrFdU3BJNMeVW0YRhgijJcQ2gYLG1sV1Y4=;
        b=Sea9LlcONkHB0iY+y0m1OEf2CH6YSIidMhefO1yUPjECFeptnWnAEozrYZ/ruNewpx
         zVAB0spr0ZH/5jmLRFZz2jkPd5w0tHK8TZ9FUUVFqOTBxy7ykZ3X0jrwpkh9R7eV4vs+
         i8Y5WwArF4lUm/2bOvGwHDpRxs9pPf9893QkNhVkwnwvYL3HxxDCRidRpK9OqQi7P45p
         NpPOBJ77CW93UvHP5A5d877zxZ5e+xOr1mLdJUK2QfhS9VGMtAf+KlF/rrX1E/vaeOPA
         hhK5SCrQZwTosrJw/G0RAFQ8DUU/arE4M5gVGZ2HgXhaf2X/Gb6txPiNsPW6K19SrFke
         pKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=apV5XVo/ogrFdU3BJNMeVW0YRhgijJcQ2gYLG1sV1Y4=;
        b=gHwUnt+wQOQtkKvDRiuIY9rmw82wZfGWEWa+VgEETiCn1z9/X8cQvz1w5gzhrMuJ9F
         uBL4h6b6ofLanRzbgzxUNzAyYZtWpIORGgzC+MIXpfVC6UIF7VMui9/nh3nyGlpCrfHt
         n/XplCAjdbAdCTyO1zKL39KTFGSjyrII2I0iZWqVf51gN5EgAJS/1WbbKpp8CmmrIfa8
         ewvtO2INi2uA2JE7EssszQ/9Ma2ScyiuYW3yqu96MF12VW83udrJMgeGfxA37tEBOdKe
         tqyo1iUmSY9GlupGPZyL6dxRrVn1rTFpzMKH/Y0ncr22OHZxsrDzkM2eiIxErdl/W/D4
         ll3Q==
X-Gm-Message-State: AOAM530+7wCQi48WVIzyLk8EBdDylfF2inPDBR4ipqzy0lgml/5z0zEo
        WjmZ6g9uhwBdAV4Bqxiiezvp1SDFolhG5UzaFac=
X-Google-Smtp-Source: ABdhPJxbYzVEjN3soYUhXG6t+bnfQLBx2Yy5HTHKWAGI6fNDOsvW//f2Yfof+iOq6eSFbbcC6e+zMuK0u5QfSM4zq2U=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr9685824pjq.228.1591024175045;
 Mon, 01 Jun 2020 08:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200601133950.12420-1-johan@kernel.org> <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
 <20200601140117.GF19480@localhost> <CAHp75VdSLb7bnd4v52wYD8KfqcDxjkirBgJVEYMWo=cwdeLzsg@mail.gmail.com>
 <20200601142947.GG19480@localhost>
In-Reply-To: <20200601142947.GG19480@localhost>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jun 2020 18:09:23 +0300
Message-ID: <CAHp75VewzTiHnO0PZ6O47cLs4VyssFsqvrc2CORK6LbW+Gm3bQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] leds: fix broken devres usage
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 1, 2020 at 5:29 PM Johan Hovold <johan@kernel.org> wrote:
> On Mon, Jun 01, 2020 at 05:08:40PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 5:01 PM Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, Jun 01, 2020 at 04:51:01PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jun 1, 2020 at 4:42 PM Johan Hovold <johan@kernel.org> wrote:
> > > > >
> > > > > Several MFD child drivers register their class devices directly under
> > > > > the parent device (about half of the MFD LED drivers do so).
> > > > >
> > > > > This means you cannot blindly do devres conversions so that
> > > > > deregistration ends up being tied to the parent device, something which
> > > > > leads to use-after-free on driver unbind when the class device is
> > > > > released while still being registered (and, for example, oopses on later
> > > > > parent MFD driver unbind or LED class callbacks, or resource leaks and
> > > > > name clashes on child driver reload).
> > > >
> > > > Shouldn't MFD take reference count for their children?
> > >
> > > That's not the issue here. The child driver is allocating memory for the
> > > class device (for example using devres), and that will end up being
> > > freed on unbind while said device is still registered. The child driver
> > > may then even be unloaded. No extra reference can fix this.
> >
> > Okay, I didn't still get how dropping devres will help here.
> >
> > Say, we have
> >
> > ->probe()
> > {
> >  return devm_foo_register();
> > }
> >
> > and no ->remove()
> >
> > vs.
> >
> > ->probe()
> > {
> >   return foo_register();
> > }
> >
> > ->remove()
> > {
> >  foo_unregister();
> > }
> >
> > So, basically what you seem to workaround is that ->remove() is not
> > getting called?
>
> Any driver which frees a resource before making sure it's no longer used
> it is just plain broken. Unfortunately, devres makes this harder to
> reason about and people get it wrong. This is roughly the current
> situation with these drivers:
>
>         drv->probe(dev)
>           foo = devm_kzalloc(dev);

>           devm_foo_register(dev->parent, foo);  // NOTE: dev->parent

A-ha! Thanks for this detail.
But why are they doing so?

>         drv->remove(dev)
>         devres_release_all(dev)
>           kfree(foo);                           // foo still registered

> but foo remains registered until the parent driver is unbound.

Since the last fixes against kobject elimination, shouldn't be this
simple fixed by not supplying dev->parent above?

-- 
With Best Regards,
Andy Shevchenko
