Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAE8CB6886
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 18:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732035AbfIRQyU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 12:54:20 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35284 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731169AbfIRQyU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 12:54:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id m7so671192lji.2
        for <linux-leds@vger.kernel.org>; Wed, 18 Sep 2019 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8VwfblmZ+e4fyFQouNlegNYvYNoRSmskQXhNh9EkLBA=;
        b=hTbF/x1sm3Jzq49oZHqZoPNaFRwFunpf+5C65yxk9Rufw+9lbUdhUCNI9WxNFqYDhI
         rEB8phARLo8Z30aVvWYY34efW+2WUH/E6AMzHD5MXBWOPqrWzUnOCMyObhZnc3yIs0ku
         858p8fUsW9juBx8tfEpR6YaCHicSskxD1u2Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8VwfblmZ+e4fyFQouNlegNYvYNoRSmskQXhNh9EkLBA=;
        b=am7ySpmoUsw0y9WcYn7d9j4Oxs/l525toNChT/hUW2SeET3Vaa3+eFhzcFu8CtS+ff
         xvqKovfvlnKO7tv2JhvlvrST0JBogkkJguUewR5r+tENH3ZSZOAhGVSmU5CcgBNQBjg0
         P4T+wSVstW6R/pO6oA2H5Cu1YByZP6DGMoGzsVkNI8ZB0fEnMPtmiuwStrnvz2Hb6PqG
         Q6NZ19kV7v+0KsqeB6/gkwQzqM0qsnM8lbcNRPAzxd6ltkCoXQW3e50W68jA9UUg6Ym4
         AFKoTuU5DsxMztc9LZjvpvuPWAcvgB1lp8J3Lryv/RgupSM9Z1f6hjMHrZapQxF0Uqgq
         j3MQ==
X-Gm-Message-State: APjAAAWgKgNm5tioU2x/dBPc/ORroXvG4yVrJamCWYCGZk3q3hEOwbVY
        EwpucKdVLe6r/x8PtA1pCn58ZiJGSDU=
X-Google-Smtp-Source: APXvYqzPu5HRQsWrChy17b/nF9QusCnjFi6FW1CYIT1lOzZsNQ88FshGnS9iK86vL9yP+uFwApvSPA==
X-Received: by 2002:a2e:919a:: with SMTP id f26mr2735685ljg.124.1568825656256;
        Wed, 18 Sep 2019 09:54:16 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id f5sm1093495lfh.52.2019.09.18.09.54.14
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 09:54:15 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id q11so169916lfc.11
        for <linux-leds@vger.kernel.org>; Wed, 18 Sep 2019 09:54:14 -0700 (PDT)
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr2656966lfp.134.1568825654331;
 Wed, 18 Sep 2019 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
 <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
 <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
 <CAHk-=wjm422bg+ZPuKkjU6NffbAyysY2n8iLRFyiNKin4cvWgg@mail.gmail.com> <CAHp75Vdn5_U3rCvuK1_P_nf5gEO63r342dgp_wk77diPU8k06Q@mail.gmail.com>
In-Reply-To: <CAHp75Vdn5_U3rCvuK1_P_nf5gEO63r342dgp_wk77diPU8k06Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 18 Sep 2019 09:53:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=whg7WLb8mriT46iuMXCSj34FheRxGRPcifNsaLGuowiGw@mail.gmail.com>
Message-ID: <CAHk-=whg7WLb8mriT46iuMXCSj34FheRxGRPcifNsaLGuowiGw@mail.gmail.com>
Subject: Re: [GIT PULL] LED updates for 5.4-rc1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 18, 2019 at 12:30 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> I hope you have a chance to read my previous email.
> We still need that function.

Your email came in after I did the merge with the fixup, so the kernel
now has the broken code (but without the warning).

I think (hope) the fixup commit is in one of Greg's pull requests that
are now pending in my queue.

              Linus
