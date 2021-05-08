Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DADB37740E
	for <lists+linux-leds@lfdr.de>; Sat,  8 May 2021 22:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhEHUod (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 May 2021 16:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhEHUod (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 8 May 2021 16:44:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF41C061574
        for <linux-leds@vger.kernel.org>; Sat,  8 May 2021 13:43:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so17637398lfl.11
        for <linux-leds@vger.kernel.org>; Sat, 08 May 2021 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aMRJw//SgbViPdOeA6h0zsJSuw6jNbbh0oon3PGvyY=;
        b=xUz3VzAZXxiP9IJ122gdnyhWsC3/pyCOzi5CquMSC/KbBDhcZmTZbzklQ11/01yGYw
         nlx/k54zYyMrI8R62MwuvJhpxEU0MelIXIGZMXCmSsD+PEb9f6WX1I23DAtjL1XXctD+
         RAq9QlJBgBNzdM8PqpDYGFfgzX1zPVWB6VfZoSmR/m3JEfWU5ar2oxnW0MU+FF5jcZsO
         NV0sKjJixoyW9BrerzZnb2Dn4atxiZIs4Gdz/h6RAJVWgaLcB/f+sfyE3MunHODAAnNL
         X/ScyayHvY+FZ7A1iC/G2Di5EkIr0oYPZj2XA/JPIKAyhimtQaUREC5iHh31lUrEkbSa
         94jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aMRJw//SgbViPdOeA6h0zsJSuw6jNbbh0oon3PGvyY=;
        b=qXplA26sFO57yDOSE6Ee3J90e8wC9JKkZVz8/tmIHL8s1bVyDqd5sTVFaHCqJB+HOx
         lAYyO1GaASx5L8mI++wzUIUIAVlvs3NI18bhAyZyZgSKabiXjsus/ewcVd30jbnxFPrR
         XEM40IHf2XqZx2hrASduVLBc8eCRzyGQvSPOapk1Io82OWjrkiX0VdmAKudd1et8R4Br
         p23oOFGEGaR/y4CboyKNULJv9o+iyH7PPVzLfu5f+B/A90ebsD1/MZNjCw9TkH/VJboQ
         /GwVeL50EufN4+Iaw5VHXLGBtq+HGbhaDADHmfmga07rSULVzy9R9RS0I9AG3a2Qqv+1
         YS+g==
X-Gm-Message-State: AOAM531T1Fd6DRvaXnEynbYjwvmg0bCrYski9J7CgJkIZFzN4vJJfhOB
        hE5sCWceaXODMiNPtP7QU1iiVn87uchq6DFNNd7yDQ==
X-Google-Smtp-Source: ABdhPJwZYa3bAx7J/5xfnit9RQ+FLyfuoiPGR8UdtS/99Kp/0oPeXA9F60gcFLgEVYDlOAnYt+vHVa132TrfTDWB+CE=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr10650964lfl.291.1620506610252;
 Sat, 08 May 2021 13:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210508193654.2596119-1-clabbe@baylibre.com>
In-Reply-To: <20210508193654.2596119-1-clabbe@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 May 2021 22:43:18 +0200
Message-ID: <CACRpkdYyD+MkDKd3L6CShJ_pnUSjriwnYvSRmjkTN2dZe0BWfA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: common: add disk write/read and usb-host
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 8, 2021 at 9:37 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> The triggers enum misses 3 cases used by gemini DT.
> usb-host was added via commit 0cfbd328d60f ("usb: Add LED triggers for USB activity")
> so we add also as valid trigger usb-gadget which was added along in this
> commit.
>
> disk-read/disk-write were added by commit d1ed7c558612 ("leds: Extends disk trigger for reads and writes")
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
