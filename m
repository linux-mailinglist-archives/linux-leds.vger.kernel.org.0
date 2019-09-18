Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FC9B5E08
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 09:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfIRHaM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 03:30:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38279 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfIRHaM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 03:30:12 -0400
Received: by mail-pf1-f193.google.com with SMTP id h195so3788003pfe.5;
        Wed, 18 Sep 2019 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QUTOW7SYGhvEuMpoMsqm9wPl2xVghInSIZpBh/SUcUk=;
        b=LM26Nt9HJM92nBkzwhuKXJ/TFFVRvuPeXdw8cueU2lG5HAMsOx3m0oVi3iwu/5Xk+Y
         N4UzRamAPxp3eisEFchdP7nJknejziYf4sjcaGa4q8PwmYhNaQa1FvtUeJC17ILQkXxj
         vIRSQpB59FX4R1DOVKhF7ZtTCf2oF0BfTa+U3qb2A7mjYc+XP/15lROqYEdBtYxIzFxt
         Bc3+KuA39F6qudCLEZlxoydeCM9ADrpsebBbqgucIb9cHCfp4FZCs/GRY2F1K5UwR6hC
         urYCyzc5uuFWdEiM+AGGCfrhVvpiktNKFPJFaTK7eSUGM42vwGHdP2e6MJh3VVsrm4wa
         BnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QUTOW7SYGhvEuMpoMsqm9wPl2xVghInSIZpBh/SUcUk=;
        b=q2s3Z7pdWJ2C+yw+TCdKkNpqKHea00gcIGbJ1sOUE3F3F7dZMe2VTw68lxDYGTWbGO
         +P+u6gMZpGDYXgJWUrk/G3NIYkko1vX96PL47o1mYB3+vmjUdyjIoXsSHarg0VNSkI57
         IV4xOG7B13yeE3qZaxF7BKCq/cr2gAY2dDXr30jp0Mo52TNUliwbFCxQBy32vjJe2Hs9
         +Svp68WFbd63OJtuCaULqywwLX3H2R3k413zzLk27DLdKFfNspKHbgWVlrHzt7oDj8CX
         HOiEhV8RBUBabYuEyhDzsqPsY+lJMyWTapf28++LhLu0JICvD3SNomgqLxc3lDUso0rv
         Cb0A==
X-Gm-Message-State: APjAAAWhdA8fZm4zLGNSqemRgalIc6QDWOBTfotU5+WKJNFqNUTlxz+F
        cAfMyVTtREYqLbfWfpIOh3H4lwfOPFFSWcRPgkQ=
X-Google-Smtp-Source: APXvYqxODHAnGNoo1M+FYBIaBIgkbTTYcS9ntGYAZGLVoHlN4Qo7fAGTV8pIM8b6s3rawj73lTeVjkJu886kGqrWRm0=
X-Received: by 2002:a63:c842:: with SMTP id l2mr2685854pgi.4.1568791811184;
 Wed, 18 Sep 2019 00:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
 <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
 <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com> <CAHk-=wjm422bg+ZPuKkjU6NffbAyysY2n8iLRFyiNKin4cvWgg@mail.gmail.com>
In-Reply-To: <CAHk-=wjm422bg+ZPuKkjU6NffbAyysY2n8iLRFyiNKin4cvWgg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 Sep 2019 10:29:59 +0300
Message-ID: <CAHp75Vdn5_U3rCvuK1_P_nf5gEO63r342dgp_wk77diPU8k06Q@mail.gmail.com>
Subject: Re: [GIT PULL] LED updates for 5.4-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        ada@thorsis.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Murphy <dmurphy@ti.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Joe Perches <joe@perches.com>, kw@linux.com,
        Linus Walleij <linus.walleij@linaro.org>,
        nishkadg.linux@gmail.com, nstoughton@logitech.com, oleg@kaa.org.ua,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Tony Lindgren <tony@atomide.com>, wenwen@cs.uga.edu,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 18, 2019 at 10:24 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 17, 2019 at 6:14 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Famous last words. I now get a new warning:
> >
> > drivers/i2c/i2c-core-acpi.c:347:12: warning:
> > =E2=80=98i2c_acpi_find_match_adapter=E2=80=99 defined but not used [-Wu=
nused-function]
>
> Commit 00500147cbd3 ("drivers: Introduce device lookup variants by
> ACPI_COMPANION device") removed the use of that matching function, but
> didn't remove the function.
>
> It also removed the use of i2c_acpi_find_match_device(), but in that
> case it _did_ remove the function.

I hope you have a chance to read my previous email.
We still need that function.

--=20
With Best Regards,
Andy Shevchenko
