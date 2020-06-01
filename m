Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99ED71EA6E6
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 17:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgFAPbP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 11:31:15 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40806 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgFAPbP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 11:31:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id z13so8646262ljn.7;
        Mon, 01 Jun 2020 08:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8C865u5fQgRUPYWZYIz0cmw5GVaDjvSJ+9VWjTxjBKQ=;
        b=r0qgdbeQiwXlD88HKaXh5S4tDOPFhbC163rb0przHBEeLLHmCvw7fnku1huU0XoaHL
         lrM2Zt4jOU1jWxY91fpmIDp98sM165oc7xC0i4wdhrmeHo8h+/qe5b0G3JHw+Ps8iIKL
         YZzgrcCMSkl+Nq2QYbyrpKfXwUI16OqqGFd0M9r9fZ+2hvxCT8rNYCogy9b1HIFpawBH
         aXg40IPyTLpqJ+HkKyUPFqPFmzvPrXuy6SNBuT6owLAuMuBeeaIslQUzXRDogDlfYmaF
         OviSt7BGpZ2IbkMyNi3MGcLyu+Us9n4dIRPy4Dfavn1d75UAPVo0Djw+pPrdemfiBgMA
         PxlQ==
X-Gm-Message-State: AOAM531E/O2RFpjeftfZktQ3zAfCXD/hw4XtJOE37Y4+NmGzJ+Hk3L8X
        Ed0qRAkRK2OLMiucZ7ddC3Y=
X-Google-Smtp-Source: ABdhPJwQaq1DiLADdyWnMM2t7Xlt3fsiMRMOHyinMO3sEgkh5mcrYFd0htzo8Cm1+GciNyFtGcm3uQ==
X-Received: by 2002:a2e:8743:: with SMTP id q3mr11622783ljj.84.1591025471843;
        Mon, 01 Jun 2020 08:31:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id q26sm4120782ljj.84.2020.06.01.08.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 08:31:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jfmP2-0003oC-BJ; Mon, 01 Jun 2020 17:31:04 +0200
Date:   Mon, 1 Jun 2020 17:31:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] leds: fix broken devres usage
Message-ID: <20200601153104.GH19480@localhost>
References: <20200601133950.12420-1-johan@kernel.org>
 <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
 <20200601140117.GF19480@localhost>
 <CAHp75VdSLb7bnd4v52wYD8KfqcDxjkirBgJVEYMWo=cwdeLzsg@mail.gmail.com>
 <20200601142947.GG19480@localhost>
 <CAHp75VewzTiHnO0PZ6O47cLs4VyssFsqvrc2CORK6LbW+Gm3bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VewzTiHnO0PZ6O47cLs4VyssFsqvrc2CORK6LbW+Gm3bQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 01, 2020 at 06:09:23PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 1, 2020 at 5:29 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Jun 01, 2020 at 05:08:40PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jun 1, 2020 at 5:01 PM Johan Hovold <johan@kernel.org> wrote:
> > > > On Mon, Jun 01, 2020 at 04:51:01PM +0300, Andy Shevchenko wrote:
> > > > > On Mon, Jun 1, 2020 at 4:42 PM Johan Hovold <johan@kernel.org> wrote:
> > > > > >
> > > > > > Several MFD child drivers register their class devices directly under
> > > > > > the parent device (about half of the MFD LED drivers do so).
> > > > > >
> > > > > > This means you cannot blindly do devres conversions so that
> > > > > > deregistration ends up being tied to the parent device, something which
> > > > > > leads to use-after-free on driver unbind when the class device is
> > > > > > released while still being registered (and, for example, oopses on later
> > > > > > parent MFD driver unbind or LED class callbacks, or resource leaks and
> > > > > > name clashes on child driver reload).
> > > > >
> > > > > Shouldn't MFD take reference count for their children?
> > > >
> > > > That's not the issue here. The child driver is allocating memory for the
> > > > class device (for example using devres), and that will end up being
> > > > freed on unbind while said device is still registered. The child driver
> > > > may then even be unloaded. No extra reference can fix this.
> > >
> > > Okay, I didn't still get how dropping devres will help here.

> > Any driver which frees a resource before making sure it's no longer used
> > it is just plain broken. Unfortunately, devres makes this harder to
> > reason about and people get it wrong. This is roughly the current
> > situation with these drivers:
> >
> >         drv->probe(dev)
> >           foo = devm_kzalloc(dev);
> 
> >           devm_foo_register(dev->parent, foo);  // NOTE: dev->parent
> 
> A-ha! Thanks for this detail.
> But why are they doing so?

As I mentioned in a commit message, we have quite a few MFD drivers that
register class devices under the parent device directly and have been
doing so for a very long time.

As this is reflected in sysfs and we may have users relying on the
current topology, changing this shouldn't be taken too lightly (drivers
may also depend on it). And in any case, it wouldn't be stable material
to fix the regressions at hand.

> >         drv->remove(dev)
> >         devres_release_all(dev)
> >           kfree(foo);                           // foo still registered
> 
> > but foo remains registered until the parent driver is unbound.
> 
> Since the last fixes against kobject elimination, shouldn't be this
> simple fixed by not supplying dev->parent above?

No, that's a separate issue as it also changes the device tree.

Johan
