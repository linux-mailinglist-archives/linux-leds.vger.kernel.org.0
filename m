Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672F725516A
	for <lists+linux-leds@lfdr.de>; Fri, 28 Aug 2020 00:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgH0W6f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Aug 2020 18:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgH0W6f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Aug 2020 18:58:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CF6C061232
        for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2020 15:58:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t6so8286002ljk.9
        for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2020 15:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oCzQ+/wqUikD+aAl1YCGu3tQueIna1hb5C2fVP7BNbI=;
        b=Y8WUm2uDoCL7HpKSQPP7HHTEM/UxNU6XPbQU7wOQD0rYehdyN0NcZxd89TVTeL8/tQ
         O6knIodyMnqPlNkhEcEgJMS0NswYyXYpAX5SZ9oh7sWc6eJXKK/1Ui2SZLbpuGhzlEL5
         Lfz2Lqb6wwCfI+qbzGRoJlAv/NdYlII4qR2a+BQrH2qMksXam9K2Nb4EpBO9kGLTJyzL
         puWHKvjt4HX1ZQ5PDXBFdwD96dhbzvOdNU5kFTP08+PLNzCnsi/V84ilmmHZ1mOnLFoC
         SIjewu3Vovoni2EMSZSYka8Jy3EjJj+19aZwx9YJKgeHTEIa9jHEqb3gr3J2YUya8gsp
         AxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oCzQ+/wqUikD+aAl1YCGu3tQueIna1hb5C2fVP7BNbI=;
        b=EDf0DWIUySkK6EYTj2YzftxEhLScdnz8EwLvgGbqdISjfU1DaFciVKLcCMScxSPO/B
         WsgcKnh42R6mICEbhIAIhDl9301AvM/PsxMAmmfo1Ah94BmIesnrlJwAU21l5wGcw3lP
         7rwOhZAnzZjUm3Ila2UhJcUuS0NY5vv9qhcSHKaPYuBfwzm47wDXrj6/AFZLl6KDbTR4
         75VJFVsPosNEc7PBrbzcG/FT+/nmTCA/06rk2gWnFmoBRyZKNosOATOhMJvU2dVv8trg
         mPSVUX2nuQhSUCzF0QGgpCCQTAtswVoJWvfxnuWP0DRy16QCiK8lBdR9/XiVybVk16Aj
         lkJQ==
X-Gm-Message-State: AOAM530JbuPPR2ByiWE9Wqa09OAhsZvWEjz5UKFEkewNfvf72T2nZl8E
        ArtSSmjydBJfCa0OKZujulwgfJ7NXUBySa6mZyJoug==
X-Google-Smtp-Source: ABdhPJz1AxU61I8U3K9H6NnKFR2hKoTTR/TjK+UC3pD/9X+pK6Kc4nN8lO1KSarHy0CMR1IU4DoNa1V7WmiMy5TpZW4=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr11119691ljb.283.1598569113336;
 Thu, 27 Aug 2020 15:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200812195020.13568-1-dmurphy@ti.com> <20200812195020.13568-7-dmurphy@ti.com>
In-Reply-To: <20200812195020.13568-7-dmurphy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 00:58:22 +0200
Message-ID: <CACRpkdY1pCcUONFhEXeyXa3f+JFB=Wg1nSB-qRJF5njM=L+CVw@mail.gmail.com>
Subject: Re: [PATCH v33 6/6] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Aug 12, 2020 at 9:50 PM Dan Murphy <dmurphy@ti.com> wrote:

> Add the reg property to each channel node.  This update is
> to accommodate the multicolor framework.  In addition to the
> accommodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I don't knof if I should just apply these two patches or if there are
dependencies that need to go in first. I guess yes?

Yours,
Linus Walleij
