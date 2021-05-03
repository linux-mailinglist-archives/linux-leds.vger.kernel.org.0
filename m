Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8683D372060
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 21:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhECT2N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 15:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECT2N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 15:28:13 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0EFC06174A
        for <linux-leds@vger.kernel.org>; Mon,  3 May 2021 12:27:18 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e12so5898733ljn.2
        for <linux-leds@vger.kernel.org>; Mon, 03 May 2021 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5+rXtfYwt5hA3eVlBgy6ypO0la6kLZqFvjAuXbEY2Q=;
        b=hvAa0s4YtClyTcUl4el7UKtwkSYEgd2BPYWxTetXd5cwBHCoJzJPMy/BfwQZ/dWe0D
         b7l1Tb6pE6j39sbeSBwyIMRbNetK1cZonLR/5obZ+66wSodsu93ph915v4YpbICZJzFg
         UGL3LjGbVaym+KekpEp35y5qPOkOddCwIBhJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5+rXtfYwt5hA3eVlBgy6ypO0la6kLZqFvjAuXbEY2Q=;
        b=HoD/kEkhcc8DzxGbhLHh4IAacwyEHAw5gU1RhJ2TdEXiRcL+gZLIPbHK/0kCsrKxsQ
         kOngONUB9lBdOirmTW8roTAZUElud7RoG93C8CseTQ7dNCg/fWMJDa1I55t0MDxI+5Yc
         Qyd7LRv5Jh+Btot9sKXWZxxfvVCGA99n7yR4dVcEXTL3AUlkB5yGywBIgdxJAj1Yio4n
         30MMy+OQW4/NQ8WWtBXM26c4UvUNmmJ08kr6QgDxuYkY5SAKUZzgDOgmzd02nfJMA98X
         02At8qxjkzcyRv5nvd6ponmJyngv5e0QoANWu26ubp1kV+M8gTrtjo3nky2+fs82a/k4
         A4dg==
X-Gm-Message-State: AOAM532DqyM1Ph4vJhgrxqacfENh8RZF//n+OnOI9xj5zWxo5dHVAwLO
        y+YjztpDGk354VH/4Ay0JilRov2zLlz5dgMn4iY=
X-Google-Smtp-Source: ABdhPJxFXISHu9se5GoaBEXvsGWZ0pffz8Tn/zGX/Ko2cInaQKPPF2FS0HrjoQP1J9ds/hSxUSj+rA==
X-Received: by 2002:a05:651c:1314:: with SMTP id u20mr14850116lja.36.1620070037283;
        Mon, 03 May 2021 12:27:17 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id o21sm46052lfl.297.2021.05.03.12.27.16
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 12:27:16 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id h4so2103960lfv.0
        for <linux-leds@vger.kernel.org>; Mon, 03 May 2021 12:27:16 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id a11mr4581761lfs.377.1620070036091;
 Mon, 03 May 2021 12:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210502220519.GA24775@duo.ucw.cz>
In-Reply-To: <20210502220519.GA24775@duo.ucw.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 May 2021 12:27:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0Cvmxk58f0waakTKo8G5wPWarVw5b2=11f35vBAOYUw@mail.gmail.com>
Message-ID: <CAHk-=wg0Cvmxk58f0waakTKo8G5wPWarVw5b2=11f35vBAOYUw@mail.gmail.com>
Subject: Re: [GIT PULL] LEDs changes for v5.13-rc1
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 2, 2021 at 3:05 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> This modifies MAINTAINER's file to remove Dan Murphy's email that is
> bouncing (and does it globally). I hope that does not conflict too badly.

Well, it caused conflicts, but it's not like they were hard to resolve.

In fact, the resolution was to ignore your changes, because those
email addresses had been removed by the other branches I already
merged, so they were gone even before your merge (and the conflicts
were just due to other changes around it)

                 Linus
