Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06F81C7505
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 17:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgEFPfx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 May 2020 11:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbgEFPfx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2020 11:35:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F517C061A0F;
        Wed,  6 May 2020 08:35:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z25so1580395otq.13;
        Wed, 06 May 2020 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ckjD+FqBC50sSOZnIMh6YuZzBECHbpinchtFk/oKQF4=;
        b=tifmsMUFw9bEuTEv2gjVfZHkd1NY2XfzRLvDQefmRMGi1NWZoJuf5ItxXUGdp3zVm4
         dq+AgmcDZlfhHz14d9uTRmy7IgS4zbA/ZoqI+sDhjmK0WKhoqiQ6Xmr9wmwqTvxMYm5c
         cdc7rZ0Bzzb4i2JHMyYfKGECz9Am32LMNaXNygAHL9Fmyqir+QWeppkJ4OSFz6fvLXmy
         l6uPTF/s2mJBh1nY4zOU5TzKYxndCEMdW4aT4iqurU70QKeC+nFioUl/lh5iu9IwVpyf
         YL3fIL3swQhF7rCu14kBo0t/KmIemnTuyfV1BAdW/8vvo+yiY37nol6xvqbElHyOIBcG
         h4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ckjD+FqBC50sSOZnIMh6YuZzBECHbpinchtFk/oKQF4=;
        b=AweIZ2x4l6ZMyfFMcHek61jUX/iiGa6Q6XmEYox44kpIX+vOQ538yJNElJjPEX1kdv
         Wwpf653kv00qmfVKKLcYUHhuxrThci5WP8YEGmKx0Csr2X/Nv26rONnpqyMqdEaPqyRB
         8/Zt/Tk5CHqwfQGlXYRN3Qy3brZXM4Mc8SwY/jE/pEV4zjU9+E1TGbw6XOZKeQHSDtgX
         093c1f0jCtO0d1OQrhYa0I0PIE56m3Krb4jpdmihUp56m4mK92yifI2Bm8lJ5Mx6LocT
         f6r06PSB2wThYmnBYagPVKPctkhkwB5Js3ro8XChB8f5rfu23Cf9sm1NSPGTeXcer6rW
         Z2bQ==
X-Gm-Message-State: AGi0Puam/IyGOOmv6YsuLvDPmQj0Lq87+VpUTK0z9mdWSuUUy+hpFYxi
        EDo7A8VZARDP+YGHuMlU0xg=
X-Google-Smtp-Source: APiQypJB16GivY77dA72L6q2je+mXnq7kxlSwCV722zlkaQ9FQBpPDIV87Khv7+RFTaKPEi2TMBDhQ==
X-Received: by 2002:a05:6830:1e49:: with SMTP id e9mr6817601otj.184.1588779352509;
        Wed, 06 May 2020 08:35:52 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t15sm672971oov.32.2020.05.06.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 08:35:51 -0700 (PDT)
Date:   Wed, 6 May 2020 08:35:50 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Bryan Wu <bryan.wu@canonical.com>,
        "G.Shark Jeong" <gshark.jeong@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] leds: lm355x: avoid enum conversion warning
Message-ID: <20200506153550.GB1213645@ubuntu-s3-xlarge-x86>
References: <20200505141928.923428-1-arnd@arndb.de>
 <20200506024416.GB415100@ubuntu-s3-xlarge-x86>
 <CAK8P3a3wqiXAx2GuKJjY90qLGNnyBNTst6LW7n6tRDvzvBQVVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3wqiXAx2GuKJjY90qLGNnyBNTst6LW7n6tRDvzvBQVVQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, May 06, 2020 at 04:19:45PM +0200, Arnd Bergmann wrote:
> On Wed, May 6, 2020 at 4:44 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Tue, May 05, 2020 at 04:19:17PM +0200, Arnd Bergmann wrote:
> > > clang points out that doing arithmetic between diffent enums is usually
> >                                                  ^ different
> > > a mistake:
> > >
> > > drivers/leds/leds-lm355x.c:167:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
> > >                 reg_val = pdata->pin_tx2 | pdata->ntc_pin;
> > >                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> > > drivers/leds/leds-lm355x.c:178:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
> > >                 reg_val = pdata->pin_tx2 | pdata->ntc_pin | pdata->pass_mode;
> > >                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> > >
> > > In this driver, it is intentional, so add a cast to hide the false-positive
> >
> > Not sure that I would call this a false positive. The warning is correct
> > that there is a bitwise operation between different enumeration types
> > but we do not care since we are just using the enumerated type for its
> > integer value in lieu of a #define VAR value.
> 
> Right, I meant that the code works as intended and said "false positive"
> to avoid claiming the driver is broken when this was a deliberate
> design point.

Ack.

> We do want clang to warn about this though as you say, so I can
> rephrase it to explain that both the driver and the compiler work
> as intended but they clash in their views of how to do it ;-)

Yes, that would be good if we don't go a different direction based on
your commends below.

> > > -             reg_val = pdata->pass_mode;
> > > +             reg_val = (u32)pdata->pass_mode;
> >
> > Is this cast needed? I don't think there should be warning from going
> > from an enumerated type to unsigned int.
> 
> This cast is not needed for warnings, I added it for consistency because
> it seemed odd to cast only four of the five enums. I can remove if though
> if you think it's clearer without the cast.

I don't really have a strong opinion but I do think that not having the
cast makes the patch a little more specific/precise.

> There may also be a different solution in completely removing the
> lm355x_chip_init() function, as it was added at a time when we
> were converting the last board files into devicetree, and there has
> never been a board file defining lm355x_platform_data.
> 
> There is unfortunately no DT support either in it, so I assume we
> could just remove the driver completely, or change it to use a
> DT binding similar to
> Documentation/devicetree/bindings/leds/leds-lm36*.txt
> 
> LED maintainers, any opinions on this?
> 
>      Arnd

Cheers,
Nathan
