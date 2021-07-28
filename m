Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A733D8C76
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jul 2021 13:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhG1LIj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 07:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhG1LIj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 07:08:39 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C85CC061757;
        Wed, 28 Jul 2021 04:08:38 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so9348661pja.5;
        Wed, 28 Jul 2021 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RaGdX69TfOUF+PA+iG3LI1pAqLNvsYxS1NTTMaqEKBo=;
        b=AKvjPRgIeM2YflVn6Kb+Snz34nSZTkgEHfQj9L6q+lPpNPI/M69KTdvhyXdsPgbU9a
         j3ULwI8FueA8h3Uh+/MTn2lUcZ2rFjXSLZq++FWb0AoFwV2HtPCvSCEr1ioBRS44ZiXQ
         yIjoJE0ZUXLJGgU6Gae4S3cDp65yA3R+ZPnQHbDRCRry3aar0jOHIXm976UOn/dC9/Md
         9uMguwZ1VigioKOI9wt7ae/LlPnDZR9TT+lolMgs5m+YX67SHR08CIDo14tcGqbCPmGG
         x2lrYi3xh2x8eo6Yc7LsKgNtqyZ0xZN/8ndAQHvpNfOz/oNdX0xE6Jg6xQIZmAEYwEFk
         V50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RaGdX69TfOUF+PA+iG3LI1pAqLNvsYxS1NTTMaqEKBo=;
        b=JHx7sipVV4Xu08eugmhX9nrdi4eXAcSdJVUvFCBTvC6Pab92EsQWYmRZKhvaYehOfs
         Bya3i5aekfboCP6C9hP8tehtOjptmQKKar7JDxUHxJhPFxWX/+dwt8c+K7t0Bz3vYAVQ
         ZlVnyQhUIuqn/gH8iurLzsIET7c2ra2VFUAbFiguSmmyyN++ZmfP9NIpGBilnrCfPlrO
         9OUAC99LafZqtEvqBXnedFQE6/MYD8aIZ6ZYc0OliSyhFjeaM2NzScrwd8NAsvf7msQh
         ZLtEDKZZ0XXo+q9HWRt+z0+jH+M86AJFBqeWAScNtaK1VTKMnG0+ZRlOsOmYcv5ghMZD
         fZOQ==
X-Gm-Message-State: AOAM5336o33fkfgiTJr2zPQcixY9QVJOLqBKo56PbtmTZ/l1aYKvra/D
        dihIW8vc+h9etT9ulgu5RchXhV64aGgwd8duQZI=
X-Google-Smtp-Source: ABdhPJwjjUD6gn//02i/musk032RNIg5zcsK5ykLCg6MxOtsxwc2zmGCleIuDO+JWdrLhVdIGbrkRjIn6INQwhjXVqE=
X-Received: by 2002:a17:90a:7146:: with SMTP id g6mr1681484pjs.228.1627470517649;
 Wed, 28 Jul 2021 04:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <20210728103551.GA31304@amd>
In-Reply-To: <20210728103551.GA31304@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Jul 2021 14:07:58 +0300
Message-ID: <CAHp75VcrYRkzGwe=K98Augy=jb2RtWjiF6P6kietN8Lz7f_okA@mail.gmail.com>
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

On Wed, Jul 28, 2021 at 1:35 PM Pavel Machek <pavel@ucw.cz> wrote:

Thanks for your _prompt_ response!

> > I have noticed that in the last couple of cycles the LED subsystem is
> > a bit laggish in terms of maintenance (*). I think it's time that
> > someone can help Pavel to sort things out.
> >
> > In any case, I wonder if we have any kind of procedure for what to do
> > in such cases. Do we need to assume that the subsystem is in a
> > (pre-)orphaned state? If so, who is the best to take care of patch
> > flow?

> To be honest, patches were not applied because they were not that
> important to begin with,

Reference counting disbalance is not critical, but what is then?

> because of lacking explanation,

According to the thread
https://lore.kernel.org/linux-leds/20210529111935.3849707-1-andy.shevchenko@gmail.com/T/#u
you haven't commented a word on them. Can you, please, elaborate?

> and because
> you pushed a bit too hard.

Huh?!
It was two month and nothing from you. Good that this thread does
something about it.

> Yes, I'm quite busy in -rc1 to -rc3 timeframe with stable reviews. No,
> LED subsystem is not orphaned.

Thank you!

-- 
With Best Regards,
Andy Shevchenko
