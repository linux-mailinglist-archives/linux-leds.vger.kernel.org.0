Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED9FB595E
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 03:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfIRBkz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 21:40:55 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45429 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfIRBkz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 21:40:55 -0400
Received: by mail-lf1-f68.google.com with SMTP id r134so4326684lff.12
        for <linux-leds@vger.kernel.org>; Tue, 17 Sep 2019 18:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fxZxgQXB1oaMwYliKzbFMQ3wWmFlE3pkMrUM3WHegTI=;
        b=gll0QwYPhJXC5RJZMPEoVL65l3AwY9HheCrApLkuz9bM8z5Y6nQmWdcjiFnXXZD66l
         wbKE8dQqumz0IA0gcfqzd7tQEKcaTkP2a0TZtm2uaU1XJ4P4e2jMjulleFNtwgmEhhT2
         wZmpXrgJ61REEDlo/x/getB7PUdm6g7R/DNGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fxZxgQXB1oaMwYliKzbFMQ3wWmFlE3pkMrUM3WHegTI=;
        b=h8iSieaEQrx8giHyhWtfnxZgsUl/qzf+oWo0Lc6CKuI/GTvK0wUiIdIfEGHGHcsY5g
         gdduNchLQm/xk8fkF7Wne4JAkv2SueGzxbYJ0pGq+DUmqV1nFpEF9gBH+lYugXtBGwqP
         vlcXv7fy7A+y2z597+IBSVArIohZOlQwh8ZLPpLGh3lf4LLpUHRLw1ESOhUHNpghVr6q
         s6fAP935U2LC2ZbvkuKaU3AUNUR+1/4B3m9VUzNpNSLpOS7F/nutEHq0Bbfz6yzQW+/6
         4NmRLBDPELkQuLhBwpxblw00BxbJeIjHsz3SC6glEuj0IdTjKQGI4HVJPt0wxgxKEgox
         msHg==
X-Gm-Message-State: APjAAAWKL9/vxzh31I7p2G6hsucKtMUBFndAYVocbC0H8eGqxmM91m66
        QgyozKusVc7Hr/N4nr9F0kK/HDzQbbc=
X-Google-Smtp-Source: APXvYqxsJHiX1oiqsVzk33VOnfVDc1KL1b5hZraM1kbm/ZZPZIzfCNXttRDZfbMhcgul53JHboiUWA==
X-Received: by 2002:a05:6512:14c:: with SMTP id m12mr597504lfo.27.1568770851118;
        Tue, 17 Sep 2019 18:40:51 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id m10sm727599lfo.69.2019.09.17.18.40.49
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 18:40:49 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id d5so5460851lja.10
        for <linux-leds@vger.kernel.org>; Tue, 17 Sep 2019 18:40:49 -0700 (PDT)
X-Received: by 2002:a2e:2c02:: with SMTP id s2mr678446ljs.156.1568770848787;
 Tue, 17 Sep 2019 18:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
 <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com> <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 17 Sep 2019 18:40:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjm422bg+ZPuKkjU6NffbAyysY2n8iLRFyiNKin4cvWgg@mail.gmail.com>
Message-ID: <CAHk-=wjm422bg+ZPuKkjU6NffbAyysY2n8iLRFyiNKin4cvWgg@mail.gmail.com>
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

On Tue, Sep 17, 2019 at 6:14 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Famous last words. I now get a new warning:
>
> drivers/i2c/i2c-core-acpi.c:347:12: warning:
> =E2=80=98i2c_acpi_find_match_adapter=E2=80=99 defined but not used [-Wunu=
sed-function]

Commit 00500147cbd3 ("drivers: Introduce device lookup variants by
ACPI_COMPANION device") removed the use of that matching function, but
didn't remove the function.

It also removed the use of i2c_acpi_find_match_device(), but in that
case it _did_ remove the function.

And apparently nobody bothers checking warnings. Tssk tssk.

                Linus
