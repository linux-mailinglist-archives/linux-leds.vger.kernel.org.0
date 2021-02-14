Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A028631B290
	for <lists+linux-leds@lfdr.de>; Sun, 14 Feb 2021 21:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhBNU4u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Feb 2021 15:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhBNU4t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2021 15:56:49 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CECAC061756
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 12:56:09 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e17so5471190ljl.8
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 12:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MvIet1hUFo7wVMBNV+UfDaANQC7eRKzYGZc7SbqGVq4=;
        b=Nt+NXAJDYBOjuawoWGi0jtiZwyIh4tcmTBzegkgRWbglQUyhrP5YHUuLrgATNkTcMn
         DhoMxYA3jQAzq3Bhu0BMnXWoQOXXylzFXV0wgy5jV3L5CC40hJlZAdAmBsXpSvKB6j7d
         y1H8Ou2bR0UoK/6DZbzdnUmikDco97EiAQx1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MvIet1hUFo7wVMBNV+UfDaANQC7eRKzYGZc7SbqGVq4=;
        b=uZ9KbWiZx6cQDvHlWGez/5ffI1paUhOqOawjAdfIesXI83QApQakFts05rAz47XNbL
         ybhGtq2GlP1c9UDfbu/w0v+OcLivJUJXveR12HOJjtA1akFiCpcgVpMdxp6NIOAjCGsL
         kF+A9z02JExpLosxFrvWkkzoXIK+Y7fTVpI1auDwUqUXBe/wrnKT5VS6FNnw2chzCoGs
         yDqhP8Nuq3Zl4AwQ8uxP0dx4EpVXvnnvVYYoGyAzPLaWuaVWgklWUJPHwCoHwVRAk4V4
         rpAHBWwhk0T6yqRmiHllsLgKUuZ68Z+x0FrGGvMpQmYEHWjMuMTjT3BIY8btQ/6ajIxy
         W0zA==
X-Gm-Message-State: AOAM530Sik9R/aU0zc+/4FMpN+ntRopiSLZTOOuSpjp3wb9KakcrUTay
        T4MIyKH7+xNxdKNkYU8Rt0sRvHMCYD6Tbw==
X-Google-Smtp-Source: ABdhPJwO5ALsmBUXZx0sVOgUy1RNeFwHplS1YwZKeHV7taoFjyxvMn/p5B2kdmvx6UcLsVopHSOx7Q==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr4343100ljk.304.1613336167165;
        Sun, 14 Feb 2021 12:56:07 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id a2sm2545203lff.156.2021.02.14.12.56.06
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 12:56:06 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id c8so3261949ljd.12
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 12:56:06 -0800 (PST)
X-Received: by 2002:a2e:8590:: with SMTP id b16mr7775464lji.507.1613336165860;
 Sun, 14 Feb 2021 12:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20210214171328.GA5314@duo.ucw.cz> <CAHk-=wgCp5n3sB_hDmOLSPiJcwJm9RErBHN_6ABhRWyVEkY4Xw@mail.gmail.com>
 <20210214203138.GA22191@amd>
In-Reply-To: <20210214203138.GA22191@amd>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 14 Feb 2021 12:55:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgmB6qH7Ho433B066S0=B-CtDNFtaZWOM3PMGWB0ERKSw@mail.gmail.com>
Message-ID: <CAHk-=wgmB6qH7Ho433B066S0=B-CtDNFtaZWOM3PMGWB0ERKSw@mail.gmail.com>
Subject: Re: [GIT PULL 5.11-rc8] LED fix
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Feb 14, 2021 at 12:31 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> 92bf22614b21 is my rc7, and it is parent of the commit I want you to
> apply.

Oh, right you are. I looked at your leds-cleanup-for-pavel branch for
some reason, which was much older.

Anyway, it does the remote lookup with git ls-remote, and doesn't find
any matching ref for that 92bf22614 commit you gave it as a base, so
that's why it complains. You _could_ fix that by just pushing all the
tags you have locally to your remote too.

Have you changed your behavior wrt git request-pull lately? Because
that whole model you use is broken.

The "end" commit shouldn't be my tag (and it shouldn't be a SHA1). It
should be *your* branch name.

So what you *should* have used is something like

    git request-pull master
git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
for-rc8-5.11

(assuming "master" is the upstream branch - which would be my
v5.11-rc7) without any odd SHA games or anything like that.

              Linus
