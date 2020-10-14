Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B3328DF6A
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 12:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730423AbgJNKwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 06:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJNKwX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 06:52:23 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41965C0613D2
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2020 03:52:23 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id l2so3215661lfk.0
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2020 03:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+Bm1q8Wd1o8LXJJfeloOHhF8l9fz3lJzW7zhkVyulA=;
        b=HRq+149oYRUHEa0ZlPFC+B8N0Z73OpNT7e49YRhUhzYTlBiXsL3s1O/i5yCzYjJFSG
         qv73V41puLT/Od3m8j1N7zxlJZB0e9iMKLU3xZqBmxt+DfbmSrQMM92bU2N4zHLiz9Of
         TUJDeu3gaYQm4u6+fzeB+OB6ny4TD96kta5YpMT6HevRLAZYkRHO25PwzRBXvqyalgEW
         yF+UwqsO1w/oo1nglIALVOUmmjnzuqofH+qA09a3NQbwe6w4tZc4Nnn8xVM4f7JecKZ8
         2DVBRsLbkX7XgB0XTqxv1sOElv7ovGIaYokuhr45VvcF2u878mu/3Aw1uGzcOeqyBMZ0
         l1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+Bm1q8Wd1o8LXJJfeloOHhF8l9fz3lJzW7zhkVyulA=;
        b=cEVevO45AsXOHuJL28Vwm0vKzOQVYORIQGI28+NwfEnz4R+6G4PIZnSW3kqNJaYs6m
         6U5aTRmAQ87fp7tvgGrQCRf7rjxMzI9+aPfSoObCy398ycqw/LPW3xEhV7/xxGdBvUYs
         zBzkf6aQPQdEphwaS/abtI+Ok+aPtO8Huu8vm17Fq9VdX9fjn9Pl4QVb3iJLPddSBdIx
         O7GdYmYwo6ZWizr1R7ZFsS6lp162aIje5eRt4iD5ollJHzp9f6mIR1s21uHHbhnpojOH
         yC9NqnYy12zhvWlDNImFjMRCBtvTVqcQOJyghZjRG1ozAQEzhJXSfDR6lCZKC12PSWCn
         J3uA==
X-Gm-Message-State: AOAM5326N8uBUzrznX8TeiRYWYugtIcsNGwUIskpEOzAzUkaw/ICH1iP
        gYUxGiR9zAtcpBvaB7RJn2hUtXws2HyYy4cWmOaBlw==
X-Google-Smtp-Source: ABdhPJxAChlb/T6jV0dJCIy/l94YXNy1w3RwYSAAHWPRr2RwihUzfact8MV5Qnw31p8MBBd2NKsS4sAekGvnOmi2Cvg=
X-Received: by 2002:a19:e55:: with SMTP id 82mr1099586lfo.571.1602672741685;
 Wed, 14 Oct 2020 03:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
 <20200812090711.2644688-2-linus.walleij@linaro.org> <c45a2758-cb43-2ccb-4056-ed25d73fa3f8@gmail.com>
In-Reply-To: <c45a2758-cb43-2ccb-4056-ed25d73fa3f8@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Oct 2020 12:52:10 +0200
Message-ID: <CACRpkdYgf8OPc2EqmPu=O2dr+ns4e3kTGyVi3A2Thd9v1wQGuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: rt8515: Add Richtek RT8515 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jakub!

thanks for the review. I fixed all comments but I have a problem
with the below:

On Thu, Aug 13, 2020 at 11:04 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> On 8/12/20 11:07 AM, Linus Walleij wrote:

> > +     /* Init flash intensity setting */
> > +     s = &v4l2_sd_cfg->intensity;
> > +     s->min = 0;
> > +     s->max = rt->fled.led_cdev.max_brightness;
> > +     s->step = 1;
>
> struct v4l2_flash_config's intensity property tells V4L2 flash framework
> how to convert LED class brightness levels to microamperes used by
> the V4L2 flash subdevice.
>
> See max77693_init_v4l2_flash_config() in drivers/leds/leds-max77693.c
> for a reference.

I understand, but I'm a bit of lost here, because I do not have
any datsheet for the Richtek RT8515. The outoftree code
that exists for example for Asus Zenfone:
https://github.com/ZenfoneArea/android_kernel_asus_zenfone5/blob/master/linux/modules/camera/drivers/media/i2c/rt8515.c

The intensity is set to min/max in percent
(0-100%) so the numerals 1-100 step 1 so
the same as the brightness.

Is the V4L2 API such defined that if you don't know
what microamperes that correspond to a certain setting
it is better to simply not implement it? I can certainly
remove it.

I don't quite understand why V4L2 needs to control this
in uA but I suppose they have a good reason. It however
creates a really high bar for out-of-tree code from
non-cooperative vendors. I'll try to send a mail to
Richtek and ask for the datasheet though, stranger things
have happened.

Yours,
Linus Walleij
