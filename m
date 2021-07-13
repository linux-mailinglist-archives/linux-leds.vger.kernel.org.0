Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF7C3C6B47
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jul 2021 09:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhGMHiR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Jul 2021 03:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbhGMHiQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jul 2021 03:38:16 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56110C0613DD;
        Tue, 13 Jul 2021 00:35:27 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v7so20873844pgl.2;
        Tue, 13 Jul 2021 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDXX6aLRLFwz2lfT6sXQWOct2gpF65UcPwyHGrne0Co=;
        b=FuDtjjEEv8z4K71c2XZNdoUpw/GLqIkymVWoS0dExrqNTrNVncs9H7Nj3TxK17kJgP
         AOmxt5MuCyqGpf+U5ZUOGw8z7K1gmB0gxSa4rroTIQe8V16Zdk0KEHNmSAwhn4YNaqLe
         oi9wWsQi4aRjiyQAJABg56p3S/HsAluDXqZCXo6hryVHu9DffgYKvuqfe9HhKCTH+kVl
         pMLO0vw+cfs65f2suu/5JDSBlSV2Py2JKvobQBCa6Nmvaduwz4tTw7ayrRu54OmJCSYU
         u+yhdDbUnT/nMocKsL2ptMcTraQDO8GhVUVLzHFGObiPSeyglliCGdMqRGNFj74dggOL
         J+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDXX6aLRLFwz2lfT6sXQWOct2gpF65UcPwyHGrne0Co=;
        b=cSxcXvZRz3c5d0R3Gn2k2LLRvNekGjDpQZF6Bwrj++RtTzyBHUN7IBE8oDcYf3sMTc
         iZ2PH1uD5ItMspuZAfds+XqxHPPnNyr/XzaJV83i7YyFaCVfTak8gx6jvZonZFirU18M
         qRfW8zbcUj4KncPlKdMRP0aQl3Sx10Jmr6xj1SiAokjwRt27txlh67HzgONHJ5oPIb4l
         +b3wuTfQrSvOaAbP8r68KugVfQte/lNt+Xt7kPQjVgHljgCu9O+1MrLt0NKgjzKPblvP
         JiWKCjJ82CaIo7cwG3CLIOcmB07uGjbbQXpitcyzUuuPqX5w4Qeh4ZDwRfz1xmCC5E02
         dGSw==
X-Gm-Message-State: AOAM532xFScP+5XrTwTB+2IGlrxcqojgKJ4/9p/1b9mEaGYtHHWuCwSd
        MTkebHsxKIp3MyoS57BbXNLTXHIyPOKJnG+/TlA=
X-Google-Smtp-Source: ABdhPJzhTjL9ZI8zsvkBliQ7IYB+YYzPt6Bu37UPa4OIsdmd3BNZmELfrm3UQrUzTm/ZfEqad9mvifZvRXWvxyjxNJs=
X-Received: by 2002:a05:6a00:2451:b029:329:df3d:62f2 with SMTP id
 d17-20020a056a002451b0290329df3d62f2mr3293864pfj.7.1626161726846; Tue, 13 Jul
 2021 00:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com> <YNMz59WLCMwr0rVD@smile.fi.intel.com>
In-Reply-To: <YNMz59WLCMwr0rVD@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Jul 2021 10:34:50 +0300
Message-ID: <CAHp75VcsaPs3GGEZDBxDj=0oEpTWPcqUP75kFOo8LG_JfQkhmA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] leds: core: The -ENOTSUPP should never be seen
 by user space
To:     Pavel Machek <pavel@ucw.cz>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Jacek Anaszewski <j.anaszewski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jun 23, 2021 at 4:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, May 29, 2021 at 02:19:23PM +0300, Andy Shevchenko wrote:
> > Luckily there is no user which checks for returned code and actually
> > returns it, but since the function is exported any user may try to return
> > an error code from it to user space, usually during probe phase,
> >
> > Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported function.
>
> There were no issue reported by bots, no comments from people (except one tag),
> can we do something about this series or should I amend it?

Pavel, do I need to resend this series? It mostly should be the part
of v5.14 cycle (half of it is the fixes).

-- 
With Best Regards,
Andy Shevchenko
