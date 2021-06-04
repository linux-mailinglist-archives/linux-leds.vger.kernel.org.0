Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5944739C34F
	for <lists+linux-leds@lfdr.de>; Sat,  5 Jun 2021 00:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhFDWMO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Jun 2021 18:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhFDWMN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Jun 2021 18:12:13 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E73AC061767
        for <linux-leds@vger.kernel.org>; Fri,  4 Jun 2021 15:10:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p17so15455706lfc.6
        for <linux-leds@vger.kernel.org>; Fri, 04 Jun 2021 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMx9d/KwaGXDIgZMt2DPtgDzNG9hC9FHDEasqs2eylw=;
        b=RnWNqREAbgLaek095trmxYAB2A32y6JnXwwCOEqCb69fAeTbDadtF8FlgfjScSVIAl
         VeeTs+PRgOCjPxTkkncXbvDpFdnykroIPzWS3ZkrcA5V09EUCUjR2N8eDmWGi1aSTldj
         sWGtkpZHNt+L8zQ1rec0frnXufrW6BYnmCPrTRRO9+m7pZcPtC+Qyxnn28G7ujhDYXAE
         byQy4rVnCqQe1KCfjRh86UTCzrbOPPbCEQHJjzcVwYU80D4Pmn7eHSaFdFucq0thDew9
         mwIt+3FVhKJjw3+1RBYgxxjHifqmUr8neCsMcwOWZH12A84wexGKmonNSgDqwYVy2GKf
         ERww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMx9d/KwaGXDIgZMt2DPtgDzNG9hC9FHDEasqs2eylw=;
        b=cwYgWoegccQXGkGJmnurTNjryMuZghcX/Pn/jXvYOrs+NpeYvilAQhVoGI/2a3oqwx
         fNTM89UEVUOYxu5DlVAwLuRZ+/20JpjXUPbp4DRYwznEGxEwNoWnTmYrzTjsP8ux1xDK
         MxSrxyp4YMN35jiO8rsOdZ/OaQ+/tQZu5a9nW/oBG/+3s5gVutTbnnLNEpm1MR9gz7mx
         toZ4rx3qjS5/2NVDaOcYQJFcPFDXspSvId1Up/9mtKsH3R6uEpkExe+nQvjV04DmWUy4
         rwWDsjf4r16UAs0uqVQsCr2RfeZj51R6yDr6VaIbBn9FnpsIp7QSEqzYBBHKhfiXeeCT
         fYVQ==
X-Gm-Message-State: AOAM532xO2STSNwI+UwcvcARIknCPAeBO4zJz10PGoEiioZYUBTBY4rn
        /sTKCmDw+LDrOfE/vWDnDYXVTLNhZGbuwLaiQKjBXg==
X-Google-Smtp-Source: ABdhPJx69CXrOaH6IjDUNE/NOqbho2qNWe/t0l5SmoR6GFbzHw8h1llh1Vq5RtbcLkcaqfSzMyNyoSf5YZK3GJZYikI=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr4065245lfn.465.1622844614933;
 Fri, 04 Jun 2021 15:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622713678.git.sander@svanheule.net> <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
In-Reply-To: <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:10:03 +0200
Message-ID: <CACRpkdYzhC=Lt5CKpbZNK81z=0CRp2CknMqp=zk8cHVfo0wm0g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: Add RTL8231 pin control and GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 3, 2021 at 12:01 PM Sander Vanheule <sander@svanheule.net> wrote:

> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.
>
> Debouncing is only available for the six highest GPIOs, and must be
> emulated when other pins are used for (button) inputs. Although
> described in the bindings, drive strength selection is currently not
> implemented.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Wow this looks really good. Thanks for going the extra mile
and fix this. Special thanks to Andy for the thorough review.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
