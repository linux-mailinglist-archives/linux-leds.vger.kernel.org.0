Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BBA1EEDC2
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 00:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgFDWfZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 18:35:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgFDWfY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Jun 2020 18:35:24 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC44E207D0;
        Thu,  4 Jun 2020 22:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591310123;
        bh=MEOgu/bZys0u6+e1umJ8QePVm2Ua1OaSBE4AWlWpoQg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BE/cimWL1fxy2xDBjfBdbGWHjejXHv+zobgC3vWXLf6g7cBqxIYp6OPWSRKn7npbJ
         AkT21BNXT/LHUigkFl2RnBEMRGlAANYhXzWc4tt8o+Gf0EAUynRaZ3JODmdMKkOJVx
         uoEojIOOqAiv5F77Uw0elTvUl2yfo/mq3UB7+LtI=
Received: by mail-ot1-f46.google.com with SMTP id k15so6093932otp.8;
        Thu, 04 Jun 2020 15:35:23 -0700 (PDT)
X-Gm-Message-State: AOAM533sD7BiCgStOWpO0B0JHbb9tvyL2rS9UB3QOJwAqlOccH2WQptD
        MdcRGZ3QPI8kPk832RrvS4T+R9/Wi1RhQd1atQ==
X-Google-Smtp-Source: ABdhPJzkQ0ECUGnTkq9aILlT8NpeEXpYUdHrewIf+FkntnjfP0WzjzXVahCaByGUnjlH4byjrUqVIMhUJuUYcnWRjxs=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr5557846ots.192.1591310123034;
 Thu, 04 Jun 2020 15:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200526164652.2331-1-dmurphy@ti.com> <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus> <20200527133948.GA5011@amd>
 <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
 <20200602200436.GA6535@amd> <CAL_JsqLaycpi4EtXK-7GV49fm0GbPmPsrNwz2WSBFFO_zdQG0Q@mail.gmail.com>
 <20200604125111.GA7222@duo.ucw.cz>
In-Reply-To: <20200604125111.GA7222@duo.ucw.cz>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 4 Jun 2020 16:35:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1XOYXyqj_VO2cFigVT=k5NTX3BO6RsDqQ-+pDBNJsrw@mail.gmail.com>
Message-ID: <CAL_JsqJ1XOYXyqj_VO2cFigVT=k5NTX3BO6RsDqQ-+pDBNJsrw@mail.gmail.com>
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings documention
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 4, 2020 at 6:51 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Tue 2020-06-02 15:44:32, Rob Herring wrote:
> > On Tue, Jun 2, 2020 at 2:04 PM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > On Wed 2020-05-27 08:35:06, Rob Herring wrote:
> > > > On Wed, May 27, 2020 at 7:39 AM Pavel Machek <pavel@ucw.cz> wrote:
> > > > >
> > > > > Hi!
> > > > >
> > > > > Thanks for reviews!
> > > > >
> > > > > > > +additionalProperties: false
> > > > > > > +...
> > > > > > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > > > > >
> > > > > > This isn't a binding file. Belongs in another patch.
> > > > >
> > > > > These constants are directly related to the binding. It makes sense to
> > > > > go in one patch...
> > > >
> > > > Yes, the header does go in this patch, but kernel subsystem files do not.
> > > >
> > > > Part of the reason for separating is we generate a DT only repository
> > > > which filters out all the kernel code. Ideally this is just filtering
> > > > out commits and the commit messages still make sens
> > >
> > > Well, but the patch can't be split like that. Otherwise we risk null
> > > pointer dereferences when one part is applied but not the second one.
> >
> > There's no risk because you are supposed to apply both patches. I
> > don't apply binding patches that are a part of a series like this.
>
> Yes, this is always guaranteed to happen, because "git bisect"
> understand patch series. Oh, wait.

What!? If the binding patch with the header comes first, how would
bisect build the driver change without the header?

> Patches are supposed to be correct on their own. If your repository
> filtering can not handle that, you need to fix that...

I'm just asking you to follow the process that *everyone* else is
following and works. It's not really about the repository filtering.
That doesn't care. A binding ABI is defined by the schema and any
defines it has. That is the logical unit that stands on its own.

Rob
