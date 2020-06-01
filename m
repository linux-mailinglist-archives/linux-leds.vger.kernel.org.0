Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D641EA54C
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 15:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgFANvN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 09:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgFANvN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 09:51:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486EBC05BD43;
        Mon,  1 Jun 2020 06:51:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d10so3530493pgn.4;
        Mon, 01 Jun 2020 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V07abGvLsBx8obB0OPoaIdlm7yOU8GObbMFWPclA3w4=;
        b=dD/yk3Kqs9wBRoh13WBxCkUhJ3JcJiAPWBhSLPE1naboNb7zvVECBjrObtzyTamB9r
         VoaBVVOQ0JqonlH0PLXL66j/A9rU2ZeFiUcZeoH54uUrNLrLGeB8cFWMSTYlUUkw70En
         GyxyMvlhYp+pZMuwuVvJ5ekpbMcwG/vwwCKGR2fV/qQIHKkjFfasrB3qEbPo6VxpG6xF
         ccok/HTo9acBS19SgYW5vZ3OfSf9IW3EKg97HNxzufjE1qJpscguZ8kbfFr1uZ4VeOXA
         jlK9qVqZaB/LeTwDyLeDw6dvls3VtTLEATaIf7DqYtP7yHhxLUzoa5Mfqk3wRctqWRjq
         23qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V07abGvLsBx8obB0OPoaIdlm7yOU8GObbMFWPclA3w4=;
        b=QsqFZx6mnIVfr2qjtmW5jZ7U4fQ/aLIBRiREerA/zVHFfdpNvgSBDZ25prvGe5XR8Y
         DhIaEltxh6CHJAHlglyc71cV0Yfnj7cl3Hto2OaG7iDrI3tDK93f/eQo2caA/fBHuLOi
         rtUA7NWtHuYV1EE3WjwVAkjCmcfb0/UV9T9DOUcchqYf/6oy/sUZPzBpbhA7zNM74U40
         trbzVnoUvFp5YQrGSuCbdXGZtJsoTo9PxgW9SuTnb+f5FSAqmylG/4rR4bmW/Ch9bVu1
         uh0TKeMJ7reZsYpn1lv/RfiF5uhd3rbeC1+rRSUk4nGLNDd63QpiWWJK0O25D5bRCQWF
         zb0Q==
X-Gm-Message-State: AOAM532CN3GJCi6sSrUCtjGjiJ59oSGFgxuB7EKHULnCQGb/7s1p0hCU
        SBQWGpYCWpbE3CtGH+XRfPxqdmjKNEsQwrqp1CXJM5P4zAg=
X-Google-Smtp-Source: ABdhPJwhhsub9MERbTsMYc3VaYkN6I9l2QjYeJZh0Dzf9d0CRw6M1Bl0HbE5yLMBXPaMIR8EEAe05meTESQVIdsB+D0=
X-Received: by 2002:a62:148f:: with SMTP id 137mr19895197pfu.130.1591019472784;
 Mon, 01 Jun 2020 06:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200601133950.12420-1-johan@kernel.org>
In-Reply-To: <20200601133950.12420-1-johan@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jun 2020 16:51:01 +0300
Message-ID: <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
Subject: Re: [PATCH 0/6] leds: fix broken devres usage
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 1, 2020 at 4:42 PM Johan Hovold <johan@kernel.org> wrote:
>
> Several MFD child drivers register their class devices directly under
> the parent device (about half of the MFD LED drivers do so).
>
> This means you cannot blindly do devres conversions so that
> deregistration ends up being tied to the parent device, something which
> leads to use-after-free on driver unbind when the class device is
> released while still being registered (and, for example, oopses on later
> parent MFD driver unbind or LED class callbacks, or resource leaks and
> name clashes on child driver reload).

Shouldn't MFD take reference count for their children?

-- 
With Best Regards,
Andy Shevchenko
