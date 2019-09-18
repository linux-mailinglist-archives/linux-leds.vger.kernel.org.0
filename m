Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF0BB5938
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 03:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfIRBWD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 21:22:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39373 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfIRBWD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 21:22:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id 72so4351065lfh.6
        for <linux-leds@vger.kernel.org>; Tue, 17 Sep 2019 18:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XZNPfc6roJDRqmm7Hq8AaswPkY6LR6E77xlBLQ/HJ7I=;
        b=FzJhEyBPVTskda0cSucuaFKcE8AEsBpYdGOJjLPClHwFKc2AS/i3sV9dJdFatrdl9/
         d0bWr9ZHhztIufS7u+2stdRbWIRLzOK/Bwm0TtRbjePzxKxcyg40NuanmOr9EE+lFHAf
         T09bX7Lwf4TX2HtwM0RbKJPmFyV4HubOteVNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XZNPfc6roJDRqmm7Hq8AaswPkY6LR6E77xlBLQ/HJ7I=;
        b=U3GJe+Vnu3kBahPs/7lGHEydIQw74WUu4VcdW1HCwmnKyoAdIBkGqd81u8gNLYHbgA
         LZAmQOll4zDf2JR9BeYogPApkQsVZNMWp2E/k6hbpEHdsvLZdSJPZcAMdgcgAshkSxdq
         jYtYg/ygQgsoD+IRkwT3N6AaEFpu7GaOKxdKw56QKutVDYEURlyGDYTPgff9OqgR1xFQ
         BzsqzFJ8YGsx54yCY3676ogpEd5kQyed9MWkTX7CNmuA3sY5WGDVhkaGkwZl/Q/bjDd4
         5K1ltOsffl8NGbt9NSYIfOq1h2yoDn4EVpz8QMB8RahRkjCXOm40rbSG8LK9BJplQoCF
         6JTg==
X-Gm-Message-State: APjAAAXNxp7LcdhXxU2YY29vpI6YroYVQc5r5m3ekvL0TZc6afG22Pz3
        i8UlHt+TuKWvKf1uTG36/uWs4oT5r3c=
X-Google-Smtp-Source: APXvYqzxPCG+I9kOVqia6x05wuGpzUoEeKSe4ZhUJKJSzwHHdV29kt0IaDhz4RAuEoOaWBk0g9fS0g==
X-Received: by 2002:ac2:510c:: with SMTP id q12mr558265lfb.163.1568769720417;
        Tue, 17 Sep 2019 18:22:00 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id p9sm737671lji.107.2019.09.17.18.22.00
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 18:22:00 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id u28so4345328lfc.5
        for <linux-leds@vger.kernel.org>; Tue, 17 Sep 2019 18:22:00 -0700 (PDT)
X-Received: by 2002:ac2:50cb:: with SMTP id h11mr580490lfm.170.1568769268404;
 Tue, 17 Sep 2019 18:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com> <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
In-Reply-To: <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 17 Sep 2019 18:14:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
Message-ID: <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
Subject: Re: [GIT PULL] LED updates for 5.4-rc1
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, ada@thorsis.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        christophe.jaillet@wanadoo.fr, dmurphy@ti.com,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>, info@metux.net,
        Joe Perches <joe@perches.com>, kw@linux.com,
        Linus Walleij <linus.walleij@linaro.org>,
        nishkadg.linux@gmail.com, nstoughton@logitech.com, oleg@kaa.org.ua,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Tony Lindgren <tony@atomide.com>, wenwen@cs.uga.edu,
        wsa+renesas@sang-engineering.com,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 17, 2019 at 6:13 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So this is fine and I've pulled it,

Famous last words. I now get a new warning:

drivers/i2c/i2c-core-acpi.c:347:12: warning:
=E2=80=98i2c_acpi_find_match_adapter=E2=80=99 defined but not used [-Wunuse=
d-function]
  347 | static int i2c_acpi_find_match_adapter(struct device *dev,
const void *data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~

with this pull request.  I'll have to look at it after dinner.

              Linus
