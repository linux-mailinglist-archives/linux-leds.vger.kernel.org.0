Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703C21EA5D7
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 16:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgFAO35 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 10:29:57 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32889 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFAO35 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 10:29:57 -0400
Received: by mail-lf1-f66.google.com with SMTP id j12so1322032lfh.0;
        Mon, 01 Jun 2020 07:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HCoYCmoXVqqB+5qqUc02BKBIxQT4G4JQI2PDe3pyTm8=;
        b=WH7gnXP6JTqEwkJOUi2lPxYG5GMjla15ehND8MuuOMMCo0XmxjuaHPtxvzX8BDSsiI
         kolYPitZ6PKm3QLq3Kl9FenBFPCUe06m2OuFV1dt/pfBgM6POmVr5+wGwBqdHOT9kGc7
         fBhz8EDq4axLWG9UugdZohuJ3SNdkYSugsNUQWL4u676ffrSSyyVmaUfupVp4qBaNDva
         RCK2v98bclHzznfsDL/M4xwZB5qQzn1RwdmG9rXlC0XMEWgyLDbPBIolTt88I57uLhG5
         GyUYps1TlmYK5POmG0BV91CM1V1QAgHVlnuOEv7W1EsjfWKmZHqGsRq6j4565lsqQ6ok
         Nqpg==
X-Gm-Message-State: AOAM531AY0CmfjSXYbi3+KIryFFtcsX3w9ZSO7d1O8F33CntgQVT/get
        M4IkbrU2ZyInj8mMAjH1OgdQWCIz
X-Google-Smtp-Source: ABdhPJx6P6s8kP724GN6W4h9IUxsY5GY85jYUyZIAG8qocqznqAng6qzmmoQuFsS9RVpfBC72YHemQ==
X-Received: by 2002:ac2:54a8:: with SMTP id w8mr11359031lfk.53.1591021794539;
        Mon, 01 Jun 2020 07:29:54 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a1sm572272ljk.133.2020.06.01.07.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:29:53 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jflRj-0003YD-0a; Mon, 01 Jun 2020 16:29:47 +0200
Date:   Mon, 1 Jun 2020 16:29:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] leds: fix broken devres usage
Message-ID: <20200601142947.GG19480@localhost>
References: <20200601133950.12420-1-johan@kernel.org>
 <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
 <20200601140117.GF19480@localhost>
 <CAHp75VdSLb7bnd4v52wYD8KfqcDxjkirBgJVEYMWo=cwdeLzsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdSLb7bnd4v52wYD8KfqcDxjkirBgJVEYMWo=cwdeLzsg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 01, 2020 at 05:08:40PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 1, 2020 at 5:01 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Jun 01, 2020 at 04:51:01PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jun 1, 2020 at 4:42 PM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > Several MFD child drivers register their class devices directly under
> > > > the parent device (about half of the MFD LED drivers do so).
> > > >
> > > > This means you cannot blindly do devres conversions so that
> > > > deregistration ends up being tied to the parent device, something which
> > > > leads to use-after-free on driver unbind when the class device is
> > > > released while still being registered (and, for example, oopses on later
> > > > parent MFD driver unbind or LED class callbacks, or resource leaks and
> > > > name clashes on child driver reload).
> > >
> > > Shouldn't MFD take reference count for their children?
> >
> > That's not the issue here. The child driver is allocating memory for the
> > class device (for example using devres), and that will end up being
> > freed on unbind while said device is still registered. The child driver
> > may then even be unloaded. No extra reference can fix this.
> 
> Okay, I didn't still get how dropping devres will help here.
> 
> Say, we have
> 
> ->probe()
> {
>  return devm_foo_register();
> }
> 
> and no ->remove()
> 
> vs.
> 
> ->probe()
> {
>   return foo_register();
> }
> 
> ->remove()
> {
>  foo_unregister();
> }
> 
> So, basically what you seem to workaround is that ->remove() is not
> getting called?

Any driver which frees a resource before making sure it's no longer used
it is just plain broken. Unfortunately, devres makes this harder to
reason about and people get it wrong. This is roughly the current
situation with these drivers:

	drv->probe(dev)
	  foo = devm_kzalloc(dev);
	  devm_foo_register(dev->parent, foo);	// NOTE: dev->parent

	drv->remove(dev)
	devres_release_all(dev)
	  kfree(foo);				// foo still registered

but foo remains registered until the parent driver is unbound.

Johan
