Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71050394B62
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2Jn3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhE2Jn1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:43:27 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25026C061574;
        Sat, 29 May 2021 02:41:49 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 6so4410052pgk.5;
        Sat, 29 May 2021 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BhmzpOge1ugSk/b76qU2OK3P2aRPPQAhF5XEsVbHEOQ=;
        b=jWnNbjNCBpqvtp3i0o1QlrRtBsElXIXxM1qT5bC8x3ntyAXoAEgIuL2s39KnbAB6ty
         qqHNm7KQypc4KlHN5TYbIP8UHN3whNnVQRUqemJY7aXnDyBQAtNQNh4M4V8fgM9RqITy
         VYm0H7RJNITZ+Uv6iXIZNQfLIIEzF7pn2fsDmmTE2IOONX43Ji6/uVZ1scbO+NSQZuF0
         2pjF74bycvRGviW6R8n4yKxQ3gPZ0uT/7f9M00X1QlJtkyJgfngB7i88jOVQumnot7+7
         j+1t+F/CDvOilk+XuvTx445nbuyAXUAUd2lnOZcVaLtxgPl18LQT5EQU2Q/X25Jrg7Et
         RmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BhmzpOge1ugSk/b76qU2OK3P2aRPPQAhF5XEsVbHEOQ=;
        b=F/VP2muPLP9fBqXO9V5iKzUcPzNV2g9ygfnKWcQenagEjNZv/q+EK+1oxY/uINvnh6
         GLUgL2UHQbrGV7HL4u6VvIGrVSls+Ii5wDB4ICBmW3GVzbZlH5b8nqo9H6sx+Z559WRj
         GCmAO1rvAVxxai/oNxjgxlIZ+YoO6e/tFzOeoPPmxRBVcusxZK4vW1m09mCFfrkGkGhR
         uRppcDBQSDxU5o4MJA2NtTWq1Xz8fo6mm//UBGq0oO+YIgDObSWIaviV51rSIe+RzwCF
         75WegRLWm21fTygH9ImqEq+oMYaxOdOOsWv9BhjeEs2BljDtRqPMJEIU72Lbtfj1cqAu
         krLQ==
X-Gm-Message-State: AOAM532BS8iDEeAYgyFwktvrfuzGZqJ03rbvksMewN5mG0IHGsFhKSc9
        599EusQtIWLzXOaEmalOOWRmpxDIW8ZSapdT3QE=
X-Google-Smtp-Source: ABdhPJxTpV1q70CkKdVXMWLe4tI2MuhERQRSKAD+XRBe7QrLK75mlvD14i4mHmFzQcFX5iABSjA78FUoaf4ty7YBkBU=
X-Received: by 2002:a63:4145:: with SMTP id o66mr13231146pga.4.1622281308767;
 Sat, 29 May 2021 02:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-4-andy.shevchenko@gmail.com> <20210528100440.GE2209@amd>
 <YLDJy5NE+xKmGL21@smile.fi.intel.com>
In-Reply-To: <YLDJy5NE+xKmGL21@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:41:32 +0300
Message-ID: <CAHp75VdxXoYwX3pSTqddF2TEQBbRcjD3-MUoCGkzTg2rBr6btQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/28] leds: el15203000: Give better margin for usleep_range()
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

On Fri, May 28, 2021 at 1:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 12:04:40PM +0200, Pavel Machek wrote:
> > On Mon 2021-05-10 12:50:20, Andy Shevchenko wrote:
> > > 1 microsecond with 20 millisecond parameter is too low margin for
> > > usleep_range(). Give 100 to make scheduler happier.
> > >
> > > While at it, fix indentation in cases where EL_FW_DELAY_USEC is in use.
> > > In the loop, move it to the end to avoid a conditional.
> >
> > Its not like unhappy schedulers are problem...
>
> Any hints then? To me it sounds like torturing scheduler is the real problem
> and that's why scheduler is unhappy.

Okay, I have rephrased the commit message.

-- 
With Best Regards,
Andy Shevchenko
