Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04071EA58D
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 16:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgFAOIw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFAOIw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 10:08:52 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC70C05BD43;
        Mon,  1 Jun 2020 07:08:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so2011880pjb.1;
        Mon, 01 Jun 2020 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NC4cdVwV5ZWinWX2PA33+wBFB2lTWR6HjkPGrQ12+PQ=;
        b=aQQtHrNHR5DMlWm32EVjD/0gXcE8RqA4Ys6ssYXt5S4MS/LH0m+xW7bZT0Dxb8dlF4
         gsnWLO0n0xFT6UTNO4VI+4bMebUirYHtNkkYpe5O9Lf3sM9Bu9AYDiTO573bAk97D7tY
         rioil27yTpeF00QK3iKkF3Dlhrc2vP7wQ7HBuvPjn0UKZ4rV5BC7J03HT4/EH7dGOpjc
         1MktXEewr+75QvFdHrVXQggaQPuOsyzRXJslmBvA4C/wgMxaRCVFkn9vJyXaYpZot5PO
         CIg0dIWYNl8z9dSIZ8uf1VE56fzvIPLmicYen7/l0vM5nMfLoTnC9o9Xdn77tsdQhlmh
         fz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NC4cdVwV5ZWinWX2PA33+wBFB2lTWR6HjkPGrQ12+PQ=;
        b=q7/Ixd0o5faJ5RZhJZzWpjnMsUWXacO8QOdAyUBDfZxs5L7kJ/KWguhxXxg3q6e3nv
         Nl70EbThhSOS0+Egrr/KyUNC2uGMqADukGsK734COrUDWlyeRrM6mRAgEycBD7v7Tud+
         7JiN222zGJw5vBqv851p/xXYpS0wjk/9OE7D2LWlfZy7zVgXJC47Hm/jmphOXCP/MjHE
         lJf5ine9rE3Z1QlT1G/5O1MK1EHBs3+HVAAYxHIR6lR4SY8aXwDBY49nJv1UzkCavA7o
         YknWzhDz0iWc9wAHAgzSKv4xOerL9A3FeW4CSH/kPRvxTMFZpocDcTE4/m9hG8v3RBJv
         DDvA==
X-Gm-Message-State: AOAM5319H7tl9jIgj9TRYHqSJlyKfUwcZQETNuoFH23aD9weZXno3Pm1
        Glqpl0jE5Fb4DlpeVoaWV0AkPE9mY7W9aM6snKc=
X-Google-Smtp-Source: ABdhPJyexHXPtWLBkDsHGH4tmiveftaIBH4ulS960Vk8grr1GPpQrezhKc3s44XenJQ7mhWd1MWwTqJqRm1HFmathZU=
X-Received: by 2002:a17:90a:1704:: with SMTP id z4mr23257144pjd.181.1591020531758;
 Mon, 01 Jun 2020 07:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200601133950.12420-1-johan@kernel.org> <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
 <20200601140117.GF19480@localhost>
In-Reply-To: <20200601140117.GF19480@localhost>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jun 2020 17:08:40 +0300
Message-ID: <CAHp75VdSLb7bnd4v52wYD8KfqcDxjkirBgJVEYMWo=cwdeLzsg@mail.gmail.com>
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

On Mon, Jun 1, 2020 at 5:01 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Jun 01, 2020 at 04:51:01PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 4:42 PM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > Several MFD child drivers register their class devices directly under
> > > the parent device (about half of the MFD LED drivers do so).
> > >
> > > This means you cannot blindly do devres conversions so that
> > > deregistration ends up being tied to the parent device, something which
> > > leads to use-after-free on driver unbind when the class device is
> > > released while still being registered (and, for example, oopses on later
> > > parent MFD driver unbind or LED class callbacks, or resource leaks and
> > > name clashes on child driver reload).
> >
> > Shouldn't MFD take reference count for their children?
>
> That's not the issue here. The child driver is allocating memory for the
> class device (for example using devres), and that will end up being
> freed on unbind while said device is still registered. The child driver
> may then even be unloaded. No extra reference can fix this.

Okay, I didn't still get how dropping devres will help here.

Say, we have

->probe()
{
 return devm_foo_register();
}

and no ->remove()

vs.

->probe()
{
  return foo_register();
}

->remove()
{
 foo_unregister();
}

So, basically what you seem to workaround is that ->remove() is not
getting called?

-- 
With Best Regards,
Andy Shevchenko
