Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF8F3A5173
	for <lists+linux-leds@lfdr.de>; Sun, 13 Jun 2021 02:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFMAXi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Jun 2021 20:23:38 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:44592 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFMAXh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Jun 2021 20:23:37 -0400
Received: by mail-lf1-f52.google.com with SMTP id r198so14547032lff.11
        for <linux-leds@vger.kernel.org>; Sat, 12 Jun 2021 17:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TofpLR5WbO4L4sqebkQj8lhl0paD+VPJ18+ddxHLW1Q=;
        b=F8mOGbkO3sF4ZNvUJ+F5Fd51Yp0FDAxTQNfRkncVeBSN7FynNaDC4Q6RilZvGKCPxF
         Q66KMM+/Zq/iDOOySGMFjZhrAllIXtdu52/XpDCqXMwuCud3XZPJa0d9sp20iWEVWUSn
         TKV1lgUSIaCS3zEAaBJ+gWrWDJL3DyUTKvE7tRdu988fKwHgUcjiyv8DJ+fbeooGdVG5
         51+27mcNV66C8XPpeY1BKaJ2+JNVs6YXg6Pafr/UcaBzvn+6hzfIGZQNkiVRj6/BXZnK
         iIHEmRIHst5vMIzi/iS42ZLN0RnpkM5pGYRxJRXzi5zlf/Ycy63OogybW3td77kXZSS8
         7S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TofpLR5WbO4L4sqebkQj8lhl0paD+VPJ18+ddxHLW1Q=;
        b=D0ui66Q0dpt+bDsPBidBDnU8WX/2ybPrs4TnXzPwtg9nN4dkQ2YOi2OE3qCm/phYS+
         caKkrj0EBB6i+RhmaR9+3WIfPUitCoYp6Edc5NUeZxJrkvR2ykuhBbHRB/J7X9EOAglg
         8bTJOo+gbgXjAKUrzNRJQZ3Dq3u4XI6ceL+RYGxhXPdPqMKMD2DasD+CAnedNQyDw2tN
         cwa7C2DalgO4d5O8mz9Kx7Ftano7fS95OjhjlHQ9wvaf7kcKp/dGF3CbK7AzyigRzG+U
         F9GzOuqgzMxDlCVOD5UKs5N1ufVyfFRBSaECY8bTy4VzCA6/CYRAAXc/yJzwHrjBmHpa
         evFg==
X-Gm-Message-State: AOAM530XEUHX8/2KW7pfMfHfGyfrfV0lcZVX9lcOl1Ya7iK7lMngCJMz
        EZ7yO/8HVKCd6icg+7pk4IpUUMtVWwn43ZlPZzBf0Q==
X-Google-Smtp-Source: ABdhPJxYZPQOCl2yJcmUXHfEEO1ZTmaIMG4LNuYIojVQXDP7Fne0jZOz1o7CQc9yPDnxKRVCiRnI+ZD0CTyykWewlRQ=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr6891124lfr.649.1623543620740;
 Sat, 12 Jun 2021 17:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210613000302.421268-1-linus.walleij@linaro.org>
In-Reply-To: <20210613000302.421268-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 13 Jun 2021 02:20:09 +0200
Message-ID: <CACRpkdZnCb50kuHDPe36YLZqKarPEak4OhHV18aAbe=SBZBe-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: davinci: dm644x: Convert LEDs to GPIO descriptor table
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Jun 13, 2021 at 2:05 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> This converts the DaVinci DM644x LEDs to use GPIO
> descriptor look-ups.
>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Rebase on v5.13-rc1
> - Resend
> - LED maintainers: please apply this patch, it is ACKed by a DaVinci
>   maintainer

Scratch that! I realized I have an old mail from Sekhar and there are
some issues with the patch that I have to drill into and fix.

Sorry for the confusion, do not apply this.

Yours,
Linus Walleij
