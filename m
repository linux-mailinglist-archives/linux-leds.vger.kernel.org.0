Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92374B68B7
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 19:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731572AbfIRRKW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 13:10:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34672 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731053AbfIRRKV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 13:10:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id r22so254624lfm.1
        for <linux-leds@vger.kernel.org>; Wed, 18 Sep 2019 10:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=drcDcqj4KDDXGJKr6wejeR7kG1o047hONACm2WK24V0=;
        b=Xm+EKOIf7gY8Lht4lxteOIc8tLcVkeM5+f2m7l34dDTGKP1poNujvqM5z2/t3tLLqi
         r0Lt9a5hW8elneXXf+OUNcuOTJo2yJNwp7uNGGOS5d3XWKTaRRJy01+ugVTpoA2MJKm7
         u9UdC41LiWVuqBY1TJ9E6tEuZzGgycTPdiImE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=drcDcqj4KDDXGJKr6wejeR7kG1o047hONACm2WK24V0=;
        b=UQEkSu5ZKofkmxpGMaYrg9yPIvZ03LNDIDyUhDVJ1fjnPv7lOIe4Jcq1nddsF3bkiz
         vR2+gNPRPItBut0NxvCFF6iqxqPfzC222KtHP8PhfK3uhmX4WLt9oftP5s4AR17iVoE4
         VVuA6W43qBpAm0rn9X48Dufi5K/SQIRZd+r6gUhI1dhg3dSXIPjJfN+6LW79K7u85evC
         /Bmdr4zZ0gJZVnejvWnpF2dt4jmm1pb9e+Vc/gfYISDYModLZ/FuukqO8Hyb07kc0fh7
         1jij9ACZ4IHpHF2e95sCt6zSDL8nzHLsRiySSftIWb6FHIPfiawZfIlkXkFaNn5tQddM
         4WGA==
X-Gm-Message-State: APjAAAXww/Ct07HmofJ0NmpQPeZUki0qgWgDTja+0i506P6Y+7UH5fi3
        9A36Fy+Qf6f9RB6QY1wtSHuNyS5fNkw=
X-Google-Smtp-Source: APXvYqybjeBpKrq+eNe4rkTi5S0C/Ty+l3wK3a2bt5c1o4Zkznq0/mmr6052xU2B6VKsJy6aZee/UQ==
X-Received: by 2002:a05:6512:202:: with SMTP id a2mr2609523lfo.175.1568826617903;
        Wed, 18 Sep 2019 10:10:17 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id w13sm1100085lfk.47.2019.09.18.10.10.14
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:10:15 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id a22so740041ljd.0
        for <linux-leds@vger.kernel.org>; Wed, 18 Sep 2019 10:10:14 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr2923609ljj.72.1568826614107;
 Wed, 18 Sep 2019 10:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
 <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
 <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
 <CAHk-=wjm422bg+ZPuKkjU6NffbAyysY2n8iLRFyiNKin4cvWgg@mail.gmail.com>
 <CAHp75Vdn5_U3rCvuK1_P_nf5gEO63r342dgp_wk77diPU8k06Q@mail.gmail.com> <CAHk-=whg7WLb8mriT46iuMXCSj34FheRxGRPcifNsaLGuowiGw@mail.gmail.com>
In-Reply-To: <CAHk-=whg7WLb8mriT46iuMXCSj34FheRxGRPcifNsaLGuowiGw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 18 Sep 2019 10:09:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0J3Jn+gHJAitQ3cDzPi6Z4JQHdtf9ruW8g2NnFhGD-w@mail.gmail.com>
Message-ID: <CAHk-=wg0J3Jn+gHJAitQ3cDzPi6Z4JQHdtf9ruW8g2NnFhGD-w@mail.gmail.com>
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
        nishkadg.linux@gmail.com, nstoughton@logitech.com,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Tony Lindgren <tony@atomide.com>, wenwen@cs.uga.edu,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 18, 2019 at 9:53 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think (hope) the fixup commit is in one of Greg's pull requests that
> are now pending in my queue.

Yup, confirmed.

I was planning to do them later today, but I'm doing them now to get
that regression out of the way.

              Linus
