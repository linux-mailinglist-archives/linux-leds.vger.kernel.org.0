Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66BC3D8BEF
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jul 2021 12:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhG1KgO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 06:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232231AbhG1KgJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 28 Jul 2021 06:36:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEC2160F9B;
        Wed, 28 Jul 2021 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627468567;
        bh=mviEGy4qjzfn1sZWnEi7AAvBd5mtP0LY/xM21mCMajY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wdU0Gpbbfnm0j30cBFdyzK3L0O4taBxz9XVFuxMypjhmSQDedhwOLnP6GjgnWaoEb
         i93fg1fyra9wDcOLv4Z7UMxha2SDRqXm1cFdsKePUpRyIyB1gLsW+MJ41m0tFWygNv
         uTiGietfYCMwd7HaWObBh/fFjX0CkA7brPj9nFLU=
Date:   Wed, 28 Jul 2021 12:36:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Pavel Machek <pavel@denx.de>
Subject: Re: LED subsystem lagging maintenance
Message-ID: <YQEzFYPWVdZFqLVC@kroah.com>
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 28, 2021 at 01:26:20PM +0300, Andy Shevchenko wrote:
> Hi!
> 
> I have noticed that in the last couple of cycles the LED subsystem is
> a bit laggish in terms of maintenance (*). I think it's time that
> someone can help Pavel to sort things out.
> 
> In any case, I wonder if we have any kind of procedure for what to do
> in such cases. Do we need to assume that the subsystem is in a
> (pre-)orphaned state? If so, who is the best to take care of patch
> flow?

What outstanding patches have not been handled?  Have you talked to
Pavel about this?

> *) e.g. I have a series against a few drivers in LED with actual fixes
> and it is missed v5.13 (okay, that time Pavel had comments which I
> have addressed at ~rc7 time frame), missed v5.14 and seems on the
> curve to miss v5.15.

If you address something at -rc7 you should not expect the changes to be
merged in time for the next release, what would you do if you were on
the other end?

> P.S. I Cc'ed lately active, AFAICS, in that area people + Greg for his opinion.

I think that Pavel should be the one asking for help here if he needs
it.

greg k-h
