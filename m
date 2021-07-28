Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C183D8CCA
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jul 2021 13:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbhG1Lc0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 07:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbhG1LcZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 07:32:25 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D6AC061757;
        Wed, 28 Jul 2021 04:32:23 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so9535597pjb.0;
        Wed, 28 Jul 2021 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLjK74rSDii26o2+bmGEvFRa9gDgHeDosVZc4fFTb3A=;
        b=mV0U6bextZQi7jhcgMXmmovxIQGBy9TYdBL7EzBCDpW4rSPaMPFQ2TEcENppq9NQ8r
         R+SyfLV1OZSU1s4Mxjh/Byg6V0wCbiLW0Xd+gXOAJC9aRTORTqDo4JAZMljr4lH6O4IR
         /eEiGlYEUsEDh3e2gPlb7xuBHN0azOfgTYrhnAMeYHo7DculIS0b4oKP2b9LeuubmOt2
         LdNE13bTSA/BBwDDOfTrI24/VCEOPZnk38wI9cTqu8y3qBgjvCPTy+ynGUUnhPNT6it2
         5yHhUmSrRK50CPq6G3GIR5lClnKdruJR6QLmU2zkO9/ZUAaoxVE/7mRtqAjtO+5jyex9
         qUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLjK74rSDii26o2+bmGEvFRa9gDgHeDosVZc4fFTb3A=;
        b=cvvh4DDnt+DzqVktL8RyaQtH5rZkhZscYYJX0GhzeUwqAY6E/Uc3r4JBKNI+FE+ww8
         LvryjehlBFr8ePRMr3m82AhYmfs2x/sfjI/YLxJJqt6VHqkHLnOwuJKsFxtSQU7qyN9I
         S5DUc4JmO4Ma6UeHFYKmbHVmXbEUdBoJfg4d+6d1o5oJ1yoFKbzYglwSDjc6iCPgA6Bi
         NczXtzxNRnFltaAjp5ZK48mutmxUhdeCdVHeAheICj212ktDEtzqQQ18jhVRW2jHGq6U
         AkIg3AdPtr6Cj1gZRf4kSK5Mv6LuX2Ww2PbMaWaiCQey0YafvaRJiWP8/pWMGHJQOppc
         hr6A==
X-Gm-Message-State: AOAM533tViHfVUJe4MJzZvhU+Dd/CgEnTVe6Q8h3JKSqtnh+l+RTwJ71
        APdoGfi0jDV8oUVmCmYM+kzoQNDGWz4j0z9iFeQ=
X-Google-Smtp-Source: ABdhPJx5H6W7k5XPlKtzhyHwyyXXs86IPgX+GmGETmLR+O7K4ve6SrhrPEP0U67IOjZOmPWGe1dAHHqkOUJTmhtM6qU=
X-Received: by 2002:a62:84cb:0:b029:3a6:3dad:e271 with SMTP id
 k194-20020a6284cb0000b02903a63dade271mr1302061pfd.40.1627471943109; Wed, 28
 Jul 2021 04:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <20210728103551.GA31304@amd> <CAHp75VcrYRkzGwe=K98Augy=jb2RtWjiF6P6kietN8Lz7f_okA@mail.gmail.com>
 <20210728111701.GA894@amd>
In-Reply-To: <20210728111701.GA894@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Jul 2021 14:31:43 +0300
Message-ID: <CAHp75VdAN30qE_St3d3+6uy9m0tAJErAyobMoPAnPu3Pd3MXvA@mail.gmail.com>
Subject: Re: LED subsystem lagging maintenance
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 28, 2021 at 2:17 PM Pavel Machek <pavel@ucw.cz> wrote:

...

> > > To be honest, patches were not applied because they were not that
> > > important to begin with,
> >
> > Reference counting disbalance is not critical, but what is then?
>
> Things with end-user impact. What is end-user impact here? How much
> memory is leaked in usual config?

Not sure what "usual" means, but if the user has a device in question,
then it's struct fwnode_handle (7 pointers + u8, unpacked) per each
modprobe. Taking into account that there are usually not so many of
the same LED devices in the system  and the user rarely does
rmmod/insmod cycle, I can say a few dozens of bytes.


-- 
With Best Regards,
Andy Shevchenko
