Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CA9B5931
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 03:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfIRBNb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 21:13:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42479 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbfIRBNa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 21:13:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id c195so4327589lfg.9
        for <linux-leds@vger.kernel.org>; Tue, 17 Sep 2019 18:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z9sK1ngN/n6Bki2rTXsaIHGzKhpD8qU//AwbTzCHcEM=;
        b=Lv1OlFB+vE/8hyhp6ljiiZQvJidCEy0ZgSymKjsTaYB5I3jEEpIO7SIuzdDDctYw3m
         z3Togu0rcN6U6Ol4q1onK9YPtDhox0+GJJH6YXbIiIlo70XiKJ/4a/pyYOsczsv4fhPu
         nWhCU33cEfqauY+INzFZh1Ld3jQnuh8pymZGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9sK1ngN/n6Bki2rTXsaIHGzKhpD8qU//AwbTzCHcEM=;
        b=lFbjCTXuLVmMPuACTlMFwqcqxndEdkepljqD3rHAxN2KAw+/iA2IJsoB04+8MIjpB6
         IVLV3UVRWSBr9w+qHMhojxeehdnEDc9VX8MfxkIeSU02CciVy0fBNduQn1J2bz0FIbwB
         Q2YpOlXcV60QBLYmqTB1OvoPCVHOJcjRjp4f/8v9SoYx+S4o6kKUy8+xl0zimBStJJMK
         jhNaiXdTWLJXSyXHjIslP7A/nGJGcS7SqYxeeHFVFhd6BKaCkvQkpYGRLP0XnlLOfk2d
         /ZiKpAuObT98H1+V2ss5RzGuXCkjggaSWgP90unEtpSG6s9Qc61+YTEYxrzXWSgFaO/V
         XC2Q==
X-Gm-Message-State: APjAAAXyKkZLdMwx1kQWMAY9GXl3FbuRdwOVrswei6s2RXQNf8EL4jfr
        RJuNJmCN+ytXN+UhXsArKjebPyJ+5VM=
X-Google-Smtp-Source: APXvYqy5MfsHgyG1Njd3qTeoxnc5cInwIFUUYJaNSA8/SvYEJrfUZ471sJnJNkstDQY2YwwlNl126w==
X-Received: by 2002:a19:f204:: with SMTP id q4mr567506lfh.29.1568769207548;
        Tue, 17 Sep 2019 18:13:27 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 207sm836519lfn.0.2019.09.17.18.13.25
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 18:13:26 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id q64so5409990ljb.12
        for <linux-leds@vger.kernel.org>; Tue, 17 Sep 2019 18:13:25 -0700 (PDT)
X-Received: by 2002:a2e:2c02:: with SMTP id s2mr632522ljs.156.1568769205183;
 Tue, 17 Sep 2019 18:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
In-Reply-To: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 17 Sep 2019 18:13:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
Message-ID: <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
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
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 16, 2019 at 3:21 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> There is one merge of tag with generic_lookup_helpers since
> LED class has been made using class_find_device_by_name() helper:
>
>     Merge tag 'generic_lookup_helpers' into for-next
>     platform: Add platform_find_device_by_driver() helper
>     drivers: Add generic helper to match any device
>     drivers: Introduce device lookup variants by ACPI_COMPANION device
>     drivers: Introduce device lookup variants by device type
>     drivers: Introduce device lookup variants by fwnode
>     drivers: Introduce device lookup variants by of_node
>     drivers: Introduce device lookup variants by name

So this is fine and I've pulled it, but I have to say that I
absolutely detest how this device.h header keeps just growing
endlessly:

  [torvalds@linux]$ wc include/linux/device.h
   1921  8252 66021 include/linux/device.h

that's almost 2k of header file, and it's included a _lot_:

  [torvalds@linux]$ git grep include.*linux/device.h | wc
   2518    5085  144875

and many of those includes are actually from other core header files,
so it's effectively included from even more trees.

Yes, yes, many of those 2k lines are comments. But still... Do we
really want to have that humongous 65kB, 2kloc header file, and keep
growing it forever?

Greg?

                  Linus
