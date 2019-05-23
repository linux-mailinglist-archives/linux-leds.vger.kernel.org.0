Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE83E277FD
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 10:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfEWIbf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 04:31:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54283 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfEWIbe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 04:31:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id i3so4820110wml.4
        for <linux-leds@vger.kernel.org>; Thu, 23 May 2019 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wCfGcDm9Z73CKKAlzNjn/GW2GoLJ80Qj1IJGooCZbwc=;
        b=dAQolkKF1Ws5EuNRmBB6wU8UztDOWTmF866CRJ+UaGiat5fz1y5Iardnrpx9/uhAFw
         7m34qBAxSI5J9uhJ9yii+KJOm6rVClsyl2T0PSFceIOCjL7RDujE+/bvKNQ+Xs0BiLSB
         zaTiP75q+Djc+JqmG2wJmxOBmwIjC41wmedoxkMLrG3AwGXA38v/k+/SdSCOk5jYSKVL
         z2OolKa2BsQ9XWftkYrKYF9C6SOAr+fYdjQwvA4fuROOOmY4wMefFjSkYlFghvejgnMW
         nFcbr/2pttOTEP+A0h8GOscpKy9+vMrttelqud8XvvIrie1hOpwoJBwFD5/JWYTSLHFG
         9T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wCfGcDm9Z73CKKAlzNjn/GW2GoLJ80Qj1IJGooCZbwc=;
        b=JVCrJrVINBdOQoiJou2DDaNwywlyrAacMSXaXfu+SeNLkAJdKxFzoXwbzOAVB82eyZ
         wBYbWFTsbBeC9Tdr2We07FsM+BCYFi2SdofBcTLGuDUUuQEExRjx5gGaTc9traDfKLlN
         fRqzWDhENqmYqvD+4m3QX37aBfny9YDTJaqCRQJr/kWx3ErLcB2V+3fR11ZpzYndAhYA
         zA5rcB+UquH9woXXyXocOMGThopyGbvMX31Vm2ujE8AjhD3fYreKoUoW2SMBT7fGGmF4
         Z7Nf8z7llwH51TeN2Ux7gDj51arLmaqueYMijcGr3YC8MNWTxxDl9hUMtCwLfg+IKH4i
         n0dg==
X-Gm-Message-State: APjAAAWrW21gDdb4QvAhfhBwc2gKLaBmaTq+hXHnaHTZG3hL4wDlCOrr
        E+1JKoYKjZ87o+YypqRs3aRNLVmlm08=
X-Google-Smtp-Source: APXvYqxLDV8L3XA83uIj2nyC1xgdtL6GxOA8voLcuQbIB1G6V0X5Ev6oUdduL+EdBaOTbbXECwTqTw==
X-Received: by 2002:a1c:9eca:: with SMTP id h193mr10459372wme.125.1558600291851;
        Thu, 23 May 2019 01:31:31 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 91sm41718572wrs.43.2019.05.23.01.31.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 01:31:31 -0700 (PDT)
Date:   Thu, 23 May 2019 09:31:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Message-ID: <20190523083129.GH4574@dell>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell>
 <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 22 May 2019, Jacek Anaszewski wrote:

> On 5/22/19 7:42 AM, Lee Jones wrote:
> > On Tue, 21 May 2019, Jacek Anaszewski wrote:
> > 
> > > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> > > 
> > >    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> > > 
> > > are available in the git repository at:
> > > 
> > >    git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
> > > 
> > > for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
> > > 
> > >    leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > TI LMU LED support rework and introduction of two new drivers
> > > with DT bindings:
> > > 
> > > - leds-lm3697 (entails additions to lm363x-regulator.c)
> > > - leds-lm36274
> > > ----------------------------------------------------------------
> > > Dan Murphy (12):
> > 
> > >        dt-bindings: mfd: LMU: Add the ramp up/down property
> > >        dt-bindings: mfd: LMU: Add ti,brightness-resolution
> > >        mfd: ti-lmu: Remove support for LM3697
> > >        mfd: ti-lmu: Add LM36274 support to the ti-lmu
> > 
> > These patches were Acked "for my own reference", which means I'd
> > at least expect a discussion on how/where they would be applied.
> > 
> > It's fine for them to go in via the LED tree in this instance and I do
> > thank you for sending a PR.  Next time can we at least agree on the
> > route-in though please?
> 
> Usually ack from the colliding subsystem maintainer means he
> acknowledges the patch and gives silent approval for merging
> it via the other tree.

Usually the type of Ack you mention takes this form:

  Acked-by: Lee Jones <lee.jones@linaro.org>

However, the one I provided looks like this:

  For my own reference:
    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Which clearly says "for my own reference" and not to be taken as an
indication that it's okay for the patch(es) to go in via another
tree.

> This is the usual workflow e.g. in case of massive reworks
> of commonly shared kernel APIs.
> 
> Your Acked-for-MFD-by tag is not documented anywhere and I've just
> found out about its exact meaning :-) Note also that it percolated
> to the mainline git history probably because people mistakenly assumed
> it was some new convention (despite that checkpatch.pl complains about
> it). So far there are 12 occurrences thereof in git. I must admit that
> I once unduly made my contribution to that mess.

Being MFD maintainer presents an uncommon and awkward scenario.  MFD
is special in that it means we have to work more cross-subsystem than
most (any?).  The default for MFD related patch-sets which traverse
multiple subsystem is for them to go in via MFD with Acks from all the
other maintainers.  I'm always happy to discuss different merge
strategies, but using the MFD repo is the norm.

The Acked-*-by you see above came as a result of a conversation
between myself and Maintainers I work with the most.  It was seen as
the most succinct way of saying that the patch has been reviewed,
whilst providing the least amount of confusion w.r.t. whether it's
okay to be applied to another tree or not.  The "for my own reference"
should be clear enough that I provide that tag for my own purposes,
rather than an okay for others to merge it.

> Of course, now being taught about the exact meaning of the tag,
> I will proceed accordingly.

I'd appreciate that, thank you.

> Regarding this one - please hold on for a while with pulling
> the stuff, since we may have some updates from REGULATOR maintainers
> (hopefully Acked-by).

I haven't pulled this yet, but please bear in mind ...

Once an immutable branch is created, it should never, ever change.  I
think this is the second pull-request I've had from you [0] and the
second one you've wanted to retract.  That should not happen!

This is precisely why I usually find it better for patches to go in
via the MFD tree.

[0] [GIT PULL] LM3532 backlight support improvements and relocation

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
