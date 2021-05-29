Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEDD394B72
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhE2JwR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhE2JwQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:52:16 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F34C061574;
        Sat, 29 May 2021 02:50:39 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e15so2809245plh.1;
        Sat, 29 May 2021 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=heSbeKnkf/YRODJx9dLasThOYDv/4QTyX4oM4+A1KbU=;
        b=KICq5J1rjzpmUPZF4slEVk9u8pI5+AGIiijzcA2WDpFajsflRW16Xcj6qdMiQHll8D
         6iG1bDtTq8JjQbN1oEzbgYmaHHZWGkSbkt3xfuJZE2L1fXiqwaMEFkgJLsnKnLqKBtn1
         8HpgJ7VOSrLNl+If2N0ddXTRsdGo+XLPgJqhsOD+p6iBvc9zkWfMvVZimtan1uTiveC0
         +kW9Hy68ZaEDQLshrU7+TuPHHDqGii88z/oS5ZqIIfmF9bZSq0FMXvB2yvM+zPuWgoEX
         qUv61KBPn4HTcf2bseoyRS7HvqwNSN9hh35J2wyW8uD3nRmjjXWnBcuoxsKQGFDKuqef
         /xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=heSbeKnkf/YRODJx9dLasThOYDv/4QTyX4oM4+A1KbU=;
        b=Y8hwlP/m0S8gwHDf+ldDKINRdnYT2TxEvFG3vx1XImoEM/IonOTkJaqJq2IvsSsaV8
         AgSb0M5ovEMNMSl5U3Bd+Da8P3n15dw0mr1wLeRWXq7pBCXX+delln4BhnZ4irNNxZPA
         +aV5i2elyYA9Ca0VqTjMt/TBLWfkMf7gUHuBoMtzoInk7s0SqFlMwKiou6UCfNPrwBg5
         1+g8fY2mIds+9V+plxWaFfyCSKYK+PoSRouH6muNwjs8VdE9Tz1xQ0imZbVad1GtX4tE
         vq0iYp9QnPmr36B4isM11ETC3/+8S5Y+M8nZIg9cOgpIuDh4izu5GkX/1znuaEbaClcl
         SqAQ==
X-Gm-Message-State: AOAM531il8yRf8/FpZr4zm7sZ3ykf6eVI3pDlPhuYdKchdThdkryTNQk
        RusQQJEJc3ixjNuKxl9ePmUrYycmNEPVwpCUukU=
X-Google-Smtp-Source: ABdhPJw5RcjzGXqVIMWN5RzEFUQaPXZLeNx1IzyDvMGv9wZrO9p8eZl8QiOXpcCHwfDtHxZ88Ftex300ktyrGQr9nV0=
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr9084247pjq.228.1622281839254;
 Sat, 29 May 2021 02:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-22-andy.shevchenko@gmail.com> <20210528101057.GH2209@amd>
 <YLDLEQ0IALoBbY7T@smile.fi.intel.com>
In-Reply-To: <YLDLEQ0IALoBbY7T@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:50:23 +0300
Message-ID: <CAHp75VfC4vpkxghLCC9rsP+p1kezSh3HLCbjV6gqLgdtPJzX1w@mail.gmail.com>
Subject: Re: [PATCH v1 21/28] leds: lm3697: Make error handling more robust
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 1:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, May 28, 2021 at 12:10:57PM +0200, Pavel Machek wrote:
> > On Mon 2021-05-10 12:50:38, Andy Shevchenko wrote:
> > > It's easy to miss necessary clean up, e.g. firmware node reference counting,
> > > during error path in ->probe(). Make it more robust by moving to a single
> > > point of return.
> > >
> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > You are now putting the handle even in the success case. Is that
> > right?
>
> Let's put it this way: it's no-op in successful case.
>
> But yeah, I would prefer to have a separate case for error, I'll revisit this.

I have added return 0; for a successful case.

-- 
With Best Regards,
Andy Shevchenko
