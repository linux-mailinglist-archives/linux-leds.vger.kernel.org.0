Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08E41AE70C
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 22:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgDQU6h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 16:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgDQU6h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2020 16:58:37 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D4CC061A0C
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2020 13:58:36 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q22so3494289ljg.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2020 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lyY6jPKsu1FVGgSIui4Sn98as2+INTmU8CABvqhknnQ=;
        b=YFzWAvy5NeSj9D7VSjLj9zstjQFjLr61dKRjqLxS3wO5qA5AW3i7nyDqVst005f/nc
         uHKSIlU+D77RtyVUvpTyPHjKuGO1OgeHvnpPHgrJwFdIiQJBH74W7YizOMc0QxTktvoJ
         NAA/LN5K1HFJvWmvz9SrL4oxvNd9htcx1H3jWyn+xtLQoS76Aw4oT6fJNFa8BeFji5ae
         GbhY/S/8otDrFgwVNHK0SqNIuCm6c24YheN718jR52CTlLuaiRPF/7B7Mi5PvOOvtyeX
         SmQzVyEcb721Htzl9d+1cpZJOR6N7Q12xoqCbChzF9xSaJ5/+qJTQxaopYKfQe9fX3JU
         8TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyY6jPKsu1FVGgSIui4Sn98as2+INTmU8CABvqhknnQ=;
        b=N2TVvTpxXYoM0h7uJs3h4LC7carlITZydv56sp8vnKD/+ETSx5LCRyOfpY3jodVhi1
         N4UCxuRlr5gF0TFH3rKL4x2D8PDBTjU0pf+WqMmJlWCdgXQjr8I/4s95x4zTa/3dyGjX
         YJGIWnkVVm8q2VTHy4UtrO6XwpQUagnt/FIov1cw6wUBJd+Q0x/ccHaY1/hWwAaBPnMH
         cEnO4b87EVrux021w5OyiRzgGvFgFpU1v9A4+OPOJA8N/LhfZRYpkzPf77ihuzqPEwv7
         SlSOZl8GCKvcwWg9ZOw4yoHZBZBzC+ibm2T0oBy+B62jJWfH32zMkw+XLhT4/8IRKjxc
         l6ow==
X-Gm-Message-State: AGi0PuYVk1KfjYkRqoiABsY2ReWOdKM+7TFYIgmiSqjTwC7fQM3DxfMP
        J8FZpsMd4ypZdghgrCUF8gyKRmpvsEJ7/FrUimT0qubV
X-Google-Smtp-Source: APiQypL85cofhXla6KmkDi+YwsMMHsX9ukGfXfKDBpMtxs1nEro/BWfn51ZL4xQzSexuH7oJx+8TjDWus+5v7sjNhcI=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr3102443ljn.125.1587157115448;
 Fri, 17 Apr 2020 13:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200415145139.155663-1-linus.walleij@linaro.org>
 <20200417125219.GC19028@duo.ucw.cz> <20200417180746.GD15254@kw.sim.vm.gnt>
In-Reply-To: <20200417180746.GD15254@kw.sim.vm.gnt>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 22:58:24 +0200
Message-ID: <CACRpkdaBTeVt-Fp2OVOS_T_E1T7q1wTFUDCQ=foN72SdhJnHjw@mail.gmail.com>
Subject: Re: [PATCH] leds: netxbig: Convert to use GPIO descriptors
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Apr 17, 2020 at 8:07 PM Simon Guinot <simon.guinot@sequanux.org> wrote:
> On Fri, Apr 17, 2020 at 02:52:19PM +0200, Pavel Machek wrote:
> > Hi!
> >
> > > This converts the NetXbig LED driver to use GPIO descriptors
> > > instead of using the legacy interfaces in <linux/of_gpio.h>
> > > and <linux/gpio.h> to iteratively parse the device tree for
> > > global GPIO numbers.
> > >
> > > Cc: Simon Guinot <simon.guinot@sequanux.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Nothing obviously wrong here, but I'd not mind some testing.
>
> Hi Pavel and Linux,
>
> If you are not in a hurry, then I'll try it next week.

No hurry, take the time you need. If it explodes, please help me fix it!

Yours,
Linus Walleij
