Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0E43DFC18
	for <lists+linux-leds@lfdr.de>; Wed,  4 Aug 2021 09:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbhHDHap (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Aug 2021 03:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbhHDHap (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Aug 2021 03:30:45 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8611C0613D5;
        Wed,  4 Aug 2021 00:30:30 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c16so2056513plh.7;
        Wed, 04 Aug 2021 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gNzKH1dtCwPVST8/mI3ucxuJYuJYd4b8kKwOymbhvvs=;
        b=RnAUfCnPqUIfoOnDUpLZ8UIfPJYTSa7CSsrXygSXKctW2h8txh3sy/EAKaA9gxu2uR
         tIhWly248ceYZxw7/mpPdu/rvOkXzA9YCqK4YD71hBZ5rvppWTukJz53U81DGU5MkNo1
         eY8biEa5PxwhV/0je+ojeUkktVFMYN9cMeFY+Wr4y96q/wiWbQrh+wsmByvDJrP4iFzm
         de4Z9bpVnAFyWeui2k8rEPw6bHLDjE46/4lB8EtB6X6iBHTymkjUKA/1vPCW2E/3yRwN
         BoZFL9Vq7rk84xTO4gwFIps9Ip/4KYPJIpu9JqmZQt1M3mA9XjNIMlYe8oT/CHpbLA/6
         7ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gNzKH1dtCwPVST8/mI3ucxuJYuJYd4b8kKwOymbhvvs=;
        b=cgBZIJ/Mnzltm9PYz76xeVmNFnejHqOyg7I1p57AAwSeLgCNKFid7J3YjtMc7LEJKu
         henoKAN6v07cSK9Vd0a5c1xKd1YlZ9poKQuDrYB0Tk1rXfLF1H2pkc0nTOfIO9HzxElv
         9bLY0EnNcpdk1lOkRcOIqvr3FDj27G4qyQhqFgLG0hFoPqo79hUfeHElUggiiQsGQnBZ
         jwUl9jKrO1kBL23c4sb4+f9HeMREvJrt5x9QRgU2JPqLNhNAuWArBwo0V7djnOxLOhad
         ffuAUvQqfpZ0GYpxAc/2su4tel+kAywSLFvDgUvYdVYCyyOF4Sb5/cJK7JLOFJbcogWR
         4+ZA==
X-Gm-Message-State: AOAM530DZ6JTzYjaFFl0nTBmtTCfed9w9Fj6rhx1h4Whe72VoGOiw1ME
        uSL4oweWKXAeRGcp//za71f1Jw7fj6tlCa8mzdh/5Xa4nR8=
X-Google-Smtp-Source: ABdhPJzTrmmCkg6ofrdBZ3GOgJJZOBDld7Hyu7nJ1Fhb1lYqEnm1NT2F4jZcSG/iHem2BDKRejCC7DZrynupwonK5jE=
X-Received: by 2002:a17:90b:912:: with SMTP id bo18mr26947781pjb.228.1628062230315;
 Wed, 04 Aug 2021 00:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <20210728103551.GA31304@amd> <179c4bce-ce9b-c9a8-4f24-cb4b3397e0f0@redhat.com>
 <20210803215821.GE30387@amd>
In-Reply-To: <20210803215821.GE30387@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Aug 2021 10:29:54 +0300
Message-ID: <CAHp75VczUTTN3f=fv5d_kRa+OP=MMhJTSVfSu-t2PURTGkycfw@mail.gmail.com>
Subject: Re: LED subsystem lagging maintenance
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Aug 4, 2021 at 12:58 AM Pavel Machek <pavel@ucw.cz> wrote:
> > >> I have noticed that in the last couple of cycles the LED subsystem is
> > >> a bit laggish in terms of maintenance (*). I think it's time that
> > >> someone can help Pavel to sort things out.
> > >>
> > >> In any case, I wonder if we have any kind of procedure for what to do
> > >> in such cases. Do we need to assume that the subsystem is in a
> > >> (pre-)orphaned state? If so, who is the best to take care of patch
> > >> flow?
> > >
> > > To be honest, patches were not applied because they were not that
> > > important to begin with, because of lacking explanation, and because
> > > you pushed a bit too hard.
> > >
> > > Yes, I'm quite busy in -rc1 to -rc3 timeframe with stable reviews. No,
> > > LED subsystem is not orphaned.
> >
> > It is good to hear that you are still actively maintaining the LED
> > subsystem, thank you.
> >
> > This thread does remind me that I was planning on re-sending this
> > LED patch which seems to have fallen through the cracks:
> >
> > https://lore.kernel.org/alsa-devel/20210221115208.105203-1-hdegoede@redhat.com/
> >
> > Can you pick this one up please? Or shall I resend it?
>
> Thanks, applied.

Thank you, Pavel! Sorry for being a bit pushy.


-- 
With Best Regards,
Andy Shevchenko
