Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C0C219A4F
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 09:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgGIH6V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 03:58:21 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37378 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgGIH6U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 03:58:20 -0400
Received: by mail-ed1-f68.google.com with SMTP id g20so1087596edm.4
        for <linux-leds@vger.kernel.org>; Thu, 09 Jul 2020 00:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yR6pxNGghAqjQCFNVJyq9TLK5aC6NP+PapZSIBghnBw=;
        b=WivJpFUNTRRW+3cWAuw8hxza+iea91/9mkVPadRGKBFyrYqXytoqmHCiz3I6Hv8IR8
         m1oH40qtj+lfIaeb3eZXWdDGRK9wgSzmXY5J45NhizPwkbg5ycwjRdetIAu9JHz5aeTs
         nXgWRo0nqvefTqsd6sYYgPrz7kPT0jf5Dc/4Q3Mx5uSUWTJvD+oeB2+L5X1hvm6YKsN2
         yQMCtUgREWxVw6uXP144IBa+faKKrrfT7jqoKODzrOjEHLqiMMfz4st+hFkELTx18vFR
         5dkI5TS+GFKeUIC79cVY2GUt8gA3oWLo4ehcZHkpxkrWGHcFModPh26izvpeQ2ZIAI29
         Ccvw==
X-Gm-Message-State: AOAM533EUPmGsO4cH2DMCCDNYjcsUXF0nVlA4Q33oiQyLu6hHUw5v0Hl
        5KiexIbZJsI9cYYpXWmN2Ok=
X-Google-Smtp-Source: ABdhPJwKvNDthg/oDNpKajjNxA6iWKUZhdCmIgtlcFZdQGPAYG/cnaI0edZXnp3nKBbBaNl4vpe4xw==
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr59678808edy.152.1594281498545;
        Thu, 09 Jul 2020 00:58:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id a25sm1365723eds.77.2020.07.09.00.58.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 00:58:17 -0700 (PDT)
Date:   Thu, 9 Jul 2020 09:58:15 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2] leds: s3c24xx: Convert to use GPIO descriptors
Message-ID: <20200709075815.GA19494@kozik-lap>
References: <20200708071149.770334-1-linus.walleij@linaro.org>
 <70bc78d5-c4b1-cc4e-9f5b-04acefff0b7a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70bc78d5-c4b1-cc4e-9f5b-04acefff0b7a@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 08, 2020 at 10:08:58PM +0200, Jacek Anaszewski wrote:
> Hi Linus,
> 
> Thanks for addressing the remarks.
> 
> On 7/8/20 9:11 AM, Linus Walleij wrote:
> > This converts the s3c24xx LED driver to use GPIO descriptors
> > and also modify all board files to account for these changes
> > by registering the appropriate GPIO tables for each board.
> > 
> > The driver was using a custom flag to indicate open drain
> > (tristate) but this can be handled by standard descriptor
> > machine tables.
> > 
> > The driver was setting non-pull-up for the pin using the custom
> > S3C24xx GPIO API, but this is a custom pin control system used
> > by the S3C24xx and no generic GPIO function, so this has simply
> > been pushed back into the respective board files.
> > 
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Fix two GPIO lookups in the smdk-common.c
> > - Rename the lookup table for the backlight LED in the
> >    Mini2440 to feature the name "backlight"
> > - Simplify the logical operation in s3c24xx_led_set() to
> >    use boolean clamping with !!value.
> > ---
> >   arch/arm/mach-s3c24xx/common-smdk.c        | 67 +++++++++++++++-------
> >   arch/arm/mach-s3c24xx/mach-mini2440.c      | 63 +++++++++++++++++---
> >   arch/arm/mach-s3c24xx/mach-n30.c           | 54 +++++++++++++++--
> >   arch/arm/mach-s3c24xx/mach-qt2410.c        | 12 +++-
> >   arch/arm/mach-s3c24xx/mach-vr1000.c        | 38 +++++++++++-
> >   drivers/leds/leds-s3c24xx.c                | 36 +++---------
> >   include/linux/platform_data/leds-s3c24xx.h |  6 --
> >   7 files changed, 199 insertions(+), 77 deletions(-)
> 
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thanks, applied.

Linus, please Cc the samsung-soc mailing list (get_maintainers points it).

Best regards,
Krzysztof

