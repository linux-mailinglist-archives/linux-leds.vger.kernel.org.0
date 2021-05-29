Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412D2394B76
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhE2J4i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2J4i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:56:38 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0378EC061574;
        Sat, 29 May 2021 02:55:00 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v12so2784193plo.10;
        Sat, 29 May 2021 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uwzsSdKgzn/kebYhjXBy5CDgFXUgTHtFy8BkWP9N4LU=;
        b=M+9xe+541bbdHjTxDj4RajHGbgEIDtaRBWkxNpxqPL07LGGu/a7q4RzEbdgOcE/tTU
         /d4j1yYrygEwPKWBHN16fpDgBd/J2uf/c989TNxl/vrw407+98bTzK0g1Js6KIEX/NCY
         jJtIo/TM7Eb9lhTWqLEJGQ7C/jQiQOdlUu1h2Ggjv769ixSWX7iLhAjsXS8BJMIHtH5g
         ZpltmDb7u8aOyyuffAqqF7VpzOmLoQDqcUdbGLqPFI4kU36v/I/UPL3nVZJulcxHQxnN
         ahclDRKfdkBq00cAEyvw4JqhUFzuqUd8waEvaXxKRCMA6fuvto/Nr6P9WVHyZx+WnUKu
         5ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uwzsSdKgzn/kebYhjXBy5CDgFXUgTHtFy8BkWP9N4LU=;
        b=cEG/HPXnPbcq/y8qAc2WAtQXfEHDC1j3zuKOrjXPZY5JfF3QC3rUAUFzu9+JFFnd9P
         ebqW6+rxvIWDFJD9dYko7KzbX1yx6X+3TGY15OyTcUAp1PtPxkaXAOEePs5fsiLW/Fou
         tOzl6nxnD6bx43zsu0AuOVsnI61J3W4Aijiz9MhgdtZAxauPGWICsoNIICuYktkCJd5C
         hsxmjLUerocSZBVQfw92Q/0SpluzzZ+vp+jm0ke0zRZ4Kmhx43+JBmO7STiUTCB9rZpS
         5W9AvcWHpYDuYpVqcUtegY8w9jQp32qH03gX8IW7oKzpsb56SjVcbsunRlCX2RyLc7RA
         yduQ==
X-Gm-Message-State: AOAM530s9hYhKuEJIJKp+yMYySCPzoCKB2WHwkAuhjIp66AaTcQrV4mw
        Nqhkwffoi/88rqk4AI6Ruud6pAbdH8tVjvVjCt8=
X-Google-Smtp-Source: ABdhPJwPrnwlN4Fts0O5cer53WOvBPdentRhcg7qUcalJScGiTIX2Tr+TtvdOJjCb1+to9Rmsb26yO6eNPNdolT/+9w=
X-Received: by 2002:a17:902:a3cb:b029:f0:6ebe:3530 with SMTP id
 q11-20020a170902a3cbb02900f06ebe3530mr12044231plb.21.1622282100301; Sat, 29
 May 2021 02:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-10-andy.shevchenko@gmail.com> <20210528101122.GI2209@amd>
 <YLDKSqXDeZTWm5XP@smile.fi.intel.com>
In-Reply-To: <YLDKSqXDeZTWm5XP@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:54:44 +0300
Message-ID: <CAHp75VezKM_Wp3JNe6pOxt6nLHMP=OZNwBcyjtoA+H3eM8as6A@mail.gmail.com>
Subject: Re: [PATCH v1 09/28] leds: lgm-sso: Don't spam logs when probe is deferred
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

On Fri, May 28, 2021 at 1:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 12:11:22PM +0200, Pavel Machek wrote:
> > On Mon 2021-05-10 12:50:26, Andy Shevchenko wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > When requesting GPIO line the probe can be deferred.
> > > In such case don't spam logs with an error message.
> > > This can be achieved by switching to dev_err_probe().
> > >
> > > Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
> > > Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > From: does not match signed-off here.
>
> True, I have noticed this later, because I have used existing commit as
> template. I'll fix all such occurrences.

Fixed in v2.

-- 
With Best Regards,
Andy Shevchenko
