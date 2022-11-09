Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B999622C0C
	for <lists+linux-leds@lfdr.de>; Wed,  9 Nov 2022 14:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiKINA1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Nov 2022 08:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiKINAR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2022 08:00:17 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B0A20F51
        for <linux-leds@vger.kernel.org>; Wed,  9 Nov 2022 05:00:15 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id e16so10959066vkm.9
        for <linux-leds@vger.kernel.org>; Wed, 09 Nov 2022 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+S5RqoJR7eNe+UaJkaYqcNTqaJzBg/EYLhKrA3XeTJU=;
        b=rel5ChBGOWyyPrddCcExdpNk6z2wGkv02sSJ3Ur8AgAiG81XQo6uyS7ekn5oSKkVD/
         0K2A7M8rKye5Ef9vzj5Q+WX+6PdEllkM5zevX9Y2XeNeOTo5gK3ozm/jCMy6HaV08zLt
         Jgnjft+gnVJNZa37xueaFYjkxwLXGOUs0MaZ9/RCKaW55DVX02GaFXZYi8qmaP3/NQGo
         NACh6/96YRotOn/YrO5Z8u8dTj5tT1R3eoG4tWmY4LqHzL7OMTnUNMlB7R2AQZfSZD0F
         Cklf7yVZx0xKA/oKNLeNdsHmdpqEvzMElzN81Jw0LF7/dw2u44YCixewsXkQbfCsGNeZ
         sC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+S5RqoJR7eNe+UaJkaYqcNTqaJzBg/EYLhKrA3XeTJU=;
        b=DIoHfbJH/cmFmo9IXHKno198uXPO1cg0aBeLKozmoGQh9i6K2cUntEolBJUbDuBUjD
         oibwdPOuJ6LAa3KaEBMxsw6ERj+02UauUMojPjNv3G3B4EuG4SBYcAgqHMJXB/mLYnwD
         tacxLJqfkbja+ID3e9cl+BnCcBPfGwppHUIbCh7Q93p3rr0jjeecC0YC08Bvr7iq+RrM
         P2AuRT373s0F5A3uLGPeI/kEZN0VB4zQ2WaEWUdjssgGvUhOcQBMbSbSk/GD6pf/UIYO
         uY379dEWWdn++GrUXRcgH5zQaFpjgRXV6PO7nKsmKAtPnAJYib/RPluXxD9jaGJF2k0T
         asrQ==
X-Gm-Message-State: ACrzQf1QRoEk6y1ym1GbjEkOei+8o401/Oesh5X36Qb0NBKhs8ny4pXb
        kmgs4zw8Id7RCQVHs5BKQAg+iAyArdoTa8VESHGYcDlNxCs=
X-Google-Smtp-Source: AMsMyM4Hv8fvC//1o6S/UqfJLdecKRfXQBgB0zlcBIQd3tRd5vJVClWy+ngarqMcUdi0XfIgwMKO7msMaawfJQHUAPc=
X-Received: by 2002:a05:6122:2219:b0:3b8:7fbd:9554 with SMTP id
 bb25-20020a056122221900b003b87fbd9554mr10547205vkb.27.1667998814618; Wed, 09
 Nov 2022 05:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20220902-get_gpiod_from_child-remove-v1-0-1e47125df20f@gmail.com>
 <YyzYKmsjKflqT1xZ@google.com> <Y1aCgJihNIqExUR2@google.com>
 <CAMRc=McvJ7AvhKdP7cv8K1+rzMf8-ptg2SnU+XOAwERhRx1Eyw@mail.gmail.com> <CACRpkdaPDXBWKQgNnmBLBmaXDo6roEDSpe1wrvMi_aG5F52K4g@mail.gmail.com>
In-Reply-To: <CACRpkdaPDXBWKQgNnmBLBmaXDo6roEDSpe1wrvMi_aG5F52K4g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Nov 2022 14:00:03 +0100
Message-ID: <CAMRc=Mf5va=ZbV5zhz30hqEVW_fGi3B4Qe+tBcU-P3DT3zxQmg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Get rid of devm_fwnode_get_[index_]gpiod_from_child()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Nov 8, 2022 at 11:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Oct 25, 2022 at 5:48 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Mon, Oct 24, 2022 at 2:18 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Thu, Sep 22, 2022 at 02:48:26PM -0700, Dmitry Torokhov wrote:
> > > > Hi Pavel, Marek,
> > > >
> > > > On Fri, Sep 02, 2022 at 05:55:24PM -0700, Dmitry Torokhov wrote:
> > > > > This drops the last uses of devm_fwnode_get_[index_]gpiod_from_child()
> > > > > from the tree and drops the stubs implementing this API on top of
> > > > > devm_fwnode_gpiod_get_index().
> > > > >
> > > > > Note that the bulk of users were converted in 2019, the couple of LED
> > > > > drivers are all that have remained.
> > > > >
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > >
> > > > > ---
> > > > > Dmitry Torokhov (3):
> > > > >       leds: gpio: switch to using devm_fwnode_gpiod_get()
> > > > >       leds: lgm-sso: switch to using devm_fwnode_gpiod_get()
> > > > >       gpiolib: remove devm_fwnode_get_[index_]gpiod_from_child()
> > > > >
> > > > >  drivers/leds/blink/leds-lgm-sso.c |  5 ++---
> > > > >  drivers/leds/leds-gpio.c          |  5 ++---
> > > > >  include/linux/gpio/consumer.h     | 21 ---------------------
> > > > >  3 files changed, 4 insertions(+), 27 deletions(-)
> > > > > ---
> > > > > base-commit: 7fd22855300e693668c3397771b3a2b3948f827a
> > > > > change-id: 20220902-get_gpiod_from_child-remove-a62638849e91
> > > > >
> > > >
> > > > Could you please consider picking this up for 6.1? Or would you be OK
> > > > with this going through other tree (GPIO maybe)?
> > >
> > > *ping* Could this go through GPIO tree? Dropping this API helps with
> > > some outstanding work that I have...
> > >
> >
> > Sure! I'll let it wait for another week - it would be great to get an
> > ack from Pavel - but in case of no response I'll take it through my
> > tree.
>
> I'd say just apply it at this point.
>

Right. Applied to gpio/for-next.

Thanks!
Bartosz
