Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2859C1EB770
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2020 10:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFBIdH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jun 2020 04:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgFBIdH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jun 2020 04:33:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BFDC061A0E;
        Tue,  2 Jun 2020 01:33:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fs4so1030728pjb.5;
        Tue, 02 Jun 2020 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/4ExNlqdWV2hoIghGjyaIkzWD98mgAYBeMg/elBA1qo=;
        b=UhNf2nuuRyPkwzqG4dKTLLo2Wit4J2x13DHLDWuOBlKE0WslqrlfaJSMDrz6jSNF5B
         3Yejecg4kn6QM9b6r9ikjfFelZi7UVJE2nfQos511Lyi0ackkDMWZeFks5kIl6Fl00+I
         c6RqlJ6wv/eMDjSDx+DS1fOiSRb9FDIH1XSGWzKA29sctAC99949qA5LtASK6RliJEKm
         DT1L05dJD0TwWWeQmI6UBoXggNHyHCBk8j027hd0JqHphJkDx9Qkz7KQYXK1dLo37/E/
         tUv1jPPZqPq+EHCo2NmuZW9JH5kXXvhXc2fTNEP6ZGd7yMTb+5UIvoeg27ZL8kj64kHt
         N8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/4ExNlqdWV2hoIghGjyaIkzWD98mgAYBeMg/elBA1qo=;
        b=LBNlZGjhoOhl8Iegq6YCJ2rvAFR9e7CFylpgmiRc5flZ+NjALvb3QJmKEdPeuKlsEv
         meTxMTAJPt4cAD6cX9FnqTT4Iy4rRDIOcNT0ftzHOxv118KLsfNRDCki4ZMAjGlrkXIE
         iJe+pfSzdM3+Wf9f4/ai3dh6A3+fB+6+XpekUpHxIWIzyrFRAQp57EoS+AYpBTb9kGSp
         cFP2iDkfkW0dneDrp3FL5LXwTNy7QNy1csIagRX2AKcuH3l1GONsF6XHRZrP8EtFNtmg
         H+pogD6xY8/4YLZWz9tss2Irf0pXvyjlh2Ww/m2eOUShctwfV9DaULTQzFT1dc4X1SEG
         vnTA==
X-Gm-Message-State: AOAM532QgREvpDWhkh6dh+FTsgHbAXwqvJYPo89maxt2/LT5emh+8HEU
        44tAmZGCSHkO09fJh7/OLo8IEsk8UOmxnAb8TEk=
X-Google-Smtp-Source: ABdhPJx+xMYrQhgIXWpHWyEKUMgBuWLmqvHuJeDFzfURAStttX7BixO5vHVMGcZsWuY1Stp+8rpVFZJjTn0AspYNvrM=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr4248152pjq.228.1591086786656;
 Tue, 02 Jun 2020 01:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200601133950.12420-1-johan@kernel.org> <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
 <20200601140117.GF19480@localhost> <CAHp75VdSLb7bnd4v52wYD8KfqcDxjkirBgJVEYMWo=cwdeLzsg@mail.gmail.com>
 <20200601142947.GG19480@localhost> <CAHp75VewzTiHnO0PZ6O47cLs4VyssFsqvrc2CORK6LbW+Gm3bQ@mail.gmail.com>
 <20200601153104.GH19480@localhost>
In-Reply-To: <20200601153104.GH19480@localhost>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Jun 2020 11:32:55 +0300
Message-ID: <CAHp75VcnWcCE_BW5JULRss5kLioyOvvCMyFqiqv-NVckGdjC-w@mail.gmail.com>
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

On Mon, Jun 1, 2020 at 6:31 PM Johan Hovold <johan@kernel.org> wrote:
> On Mon, Jun 01, 2020 at 06:09:23PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 5:29 PM Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, Jun 01, 2020 at 05:08:40PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jun 1, 2020 at 5:01 PM Johan Hovold <johan@kernel.org> wrote:
> > > > > On Mon, Jun 01, 2020 at 04:51:01PM +0300, Andy Shevchenko wrote:

...

> > > > > That's not the issue here. The child driver is allocating memory for the
> > > > > class device (for example using devres), and that will end up being
> > > > > freed on unbind while said device is still registered. The child driver
> > > > > may then even be unloaded. No extra reference can fix this.
> > > >
> > > > Okay, I didn't still get how dropping devres will help here.
>
> > > Any driver which frees a resource before making sure it's no longer used
> > > it is just plain broken. Unfortunately, devres makes this harder to
> > > reason about and people get it wrong. This is roughly the current
> > > situation with these drivers:
> > >
> > >         drv->probe(dev)
> > >           foo = devm_kzalloc(dev);
> >
> > >           devm_foo_register(dev->parent, foo);  // NOTE: dev->parent
> >
> > A-ha! Thanks for this detail.
> > But why are they doing so?
>
> As I mentioned in a commit message, we have quite a few MFD drivers that
> register class devices under the parent device directly and have been
> doing so for a very long time.
>
> As this is reflected in sysfs and we may have users relying on the
> current topology, changing this shouldn't be taken too lightly (drivers
> may also depend on it). And in any case, it wouldn't be stable material
> to fix the regressions at hand.

I see.

> > >         drv->remove(dev)
> > >         devres_release_all(dev)
> > >           kfree(foo);                           // foo still registered
> >
> > > but foo remains registered until the parent driver is unbound.
> >
> > Since the last fixes against kobject elimination, shouldn't be this
> > simple fixed by not supplying dev->parent above?
>
> No, that's a separate issue as it also changes the device tree.

Thanks for elaboration.

-- 
With Best Regards,
Andy Shevchenko
