Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3631EC47B
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2020 23:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgFBVop (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jun 2020 17:44:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgFBVop (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 2 Jun 2020 17:44:45 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB9B32072F;
        Tue,  2 Jun 2020 21:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591134285;
        bh=RD9EKSCos9t5KWXaUrSg2lxghv7osMiq6fJVWqm1DcM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wndE0u+oyr1lH3hL5DSdXt0ghMpCarEAbNp2SXxd2ztDhnsDj18IIlvsqx3RFBThK
         aC0A1ElckfSo3V9CEcNpClimk5drm+H5oi61IWEWz+jKhS8m8nL7TNHP8qf5PwMwfe
         6wnUGwncf0PwgQunRETVXjzRmGWhx15D3skuDh0A=
Received: by mail-oi1-f182.google.com with SMTP id x202so12923690oix.11;
        Tue, 02 Jun 2020 14:44:44 -0700 (PDT)
X-Gm-Message-State: AOAM531b1qnjF1U90WwLdRC32HWqQk2Kq5Q4v0MQPb8Je0EyquHeGn93
        iPu4GAVBD4O7Re+iK9kLjm1ZfUJpxrOJvmRcAw==
X-Google-Smtp-Source: ABdhPJyeT+tuBgCUMDYUN5j0DvXJ8oPU/gX6Ew9CsUYdJY/L4SylbM54wz1QNKunxx/7K8jnj3AcaYYeBSm8iWfGR+0=
X-Received: by 2002:a05:6808:7cb:: with SMTP id f11mr4493977oij.152.1591134284288;
 Tue, 02 Jun 2020 14:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200526164652.2331-1-dmurphy@ti.com> <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus> <20200527133948.GA5011@amd>
 <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com> <20200602200436.GA6535@amd>
In-Reply-To: <20200602200436.GA6535@amd>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 2 Jun 2020 15:44:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLaycpi4EtXK-7GV49fm0GbPmPsrNwz2WSBFFO_zdQG0Q@mail.gmail.com>
Message-ID: <CAL_JsqLaycpi4EtXK-7GV49fm0GbPmPsrNwz2WSBFFO_zdQG0Q@mail.gmail.com>
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

On Tue, Jun 2, 2020 at 2:04 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Wed 2020-05-27 08:35:06, Rob Herring wrote:
> > On Wed, May 27, 2020 at 7:39 AM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > Hi!
> > >
> > > Thanks for reviews!
> > >
> > > > > +additionalProperties: false
> > > > > +...
> > > > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > > >
> > > > This isn't a binding file. Belongs in another patch.
> > >
> > > These constants are directly related to the binding. It makes sense to
> > > go in one patch...
> >
> > Yes, the header does go in this patch, but kernel subsystem files do not.
> >
> > Part of the reason for separating is we generate a DT only repository
> > which filters out all the kernel code. Ideally this is just filtering
> > out commits and the commit messages still make sens
>
> Well, but the patch can't be split like that. Otherwise we risk null
> pointer dereferences when one part is applied but not the second one.

There's no risk because you are supposed to apply both patches. I
don't apply binding patches that are a part of a series like this.

Rob
