Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E39F2B3AA8
	for <lists+linux-leds@lfdr.de>; Mon, 16 Nov 2020 00:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgKOXzW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Nov 2020 18:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgKOXzW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 Nov 2020 18:55:22 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D58C0613CF
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2020 15:55:21 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id y16so18188589ljh.0
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2020 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rg6F0h6ruc4uMsumIqafiPh49tcZmyvtzNR9XGYeSiI=;
        b=vnDbwY0uz4LgrVArol569n8Y2hLV02BxvOF7h+XBwEa4gjWhxRQUwouS/TVWaB4N42
         ajCA2F5NATcgFcaXG6DMxJjlHyBXFFK4FCCq34tfJsVxMkvMr/JoxaBvFiiHGl1jGv8p
         Nn2rgAe51IeXHpnHR/kuHBCtmcaCKwrRzvrmnPQogwmk8TXDED2MTuM6lT9SJ/xaZjMk
         v0rRjYgrxhE3yeitN4gKW1oURLlFuqAkJ6zwSlQzMdFY4vpVhicpsjzsOgPWv65wBkTE
         ZtzHplIAqQ4C+rVYQ7JWA9go8sWNjXYG0G+Y8Ha7siSA5x3n3R55SQwrIpraL+RUyT8e
         XqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rg6F0h6ruc4uMsumIqafiPh49tcZmyvtzNR9XGYeSiI=;
        b=oP2vDkyjz85KC+OAl5/4G3rPt6DB5rjBsIL1w69QC1zCB5Askg1Sg6mGJd8eaq+tUR
         mLZbHxX8IGhBrYi5zPNRQiNOOLaS1jkVvjEgSaNK+Gh4V3rtRjsDkyn8TZOIQUB9pOjv
         XnJLmK/ZpdaW9+/fwecF66sXOMvn3e38er96dE4GQAgN0Hbx/Bt9rcAyrjniVEHETBYr
         TvGmZsywXNVzHVSv1SjVnsKrQjgHH7p0LvYpo9GryxMEqlINd+yJ4oNyiSAf48mHYyrq
         XRcInv6dYyxP3pc55mNANqysMSct8je1cOEz3qgt5u7W0Jr31VRSwxqIJ4z08qODMl7S
         aR+A==
X-Gm-Message-State: AOAM530huOc1uNc5EJiChPrnXUBDh6JeMdddiVt2ngZHoQS5pKmsVywq
        lp+C0MH27sQbHdZ1fy5IryCc5nnxaWdlBf0DfTOB6A==
X-Google-Smtp-Source: ABdhPJwCwfUREpzNJZbbW+3Dz6HulYaHf3A/yDpyNzotgLfVccKa8/VQgcpHjcFVe78zFxVNE+pMNQKqJbZdE7Ro3d0=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr5702695ljy.293.1605484519331;
 Sun, 15 Nov 2020 15:55:19 -0800 (PST)
MIME-Version: 1.0
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Nov 2020 00:55:08 +0100
Message-ID: <CACRpkdbGs-LEWie2uzZEHxrac-0tuHqRtdDP0D22KnXKQ3rqGQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 LED controller
To:     cy_huang <u0084500@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        cy_huang@richtek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Nov 2, 2020 at 3:42 AM cy_huang <u0084500@gmail.com> wrote:

>  drivers/leds/flash/Kconfig       |  17 ++
>  drivers/leds/flash/Makefile      |   2 +
>  drivers/leds/flash/leds-rt4505.c | 430 +++++++++++++++++++++++++++++++++++++++

Hm Pavel also asked me to create this directory and structure,
so if this gets applied to the MFD tree there will be some
serious clash.

I can rebase on this patch set if Lee applies it first, they you
need an immutable branch from Lee first to set up the build
infrastructure in the LEDs tree, and then I can rebase on your
tree once you have pulled in that.

Yours,
Linus Walleij
