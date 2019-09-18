Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D70BFB5F45
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 10:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbfIRIdS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 04:33:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfIRIdS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 18 Sep 2019 04:33:18 -0400
Received: from localhost (unknown [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0D4420856;
        Wed, 18 Sep 2019 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568795597;
        bh=bhRFbJTVCCXdGlg9G8DHJvi0UBcENXr89PrBpqx+QZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TRGsR9PVcN6p7jD2NzQGbYZXK/ftjna43SLxyxBP6P5ExhX11W2IjaLMnWCY4+fMS
         fP214uw5fMbjx6ggIu/cJeeGTNFhcix30z0MmTamWGnk3C3j3JPpVo2k7NOwTdSY2c
         Pd44Z2Ks2OwUP0Fe83DYX9AY5zZV4pFcVetfoXkE=
Date:   Wed, 18 Sep 2019 08:22:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
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
Subject: Re: [GIT PULL] LED updates for 5.4-rc1
Message-ID: <20190918062247.GA1855305@kroah.com>
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
 <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 17, 2019 at 06:13:09PM -0700, Linus Torvalds wrote:
> On Mon, Sep 16, 2019 at 3:21 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
> >
> > There is one merge of tag with generic_lookup_helpers since
> > LED class has been made using class_find_device_by_name() helper:
> >
> >     Merge tag 'generic_lookup_helpers' into for-next
> >     platform: Add platform_find_device_by_driver() helper
> >     drivers: Add generic helper to match any device
> >     drivers: Introduce device lookup variants by ACPI_COMPANION device
> >     drivers: Introduce device lookup variants by device type
> >     drivers: Introduce device lookup variants by fwnode
> >     drivers: Introduce device lookup variants by of_node
> >     drivers: Introduce device lookup variants by name
> 
> So this is fine and I've pulled it, but I have to say that I
> absolutely detest how this device.h header keeps just growing
> endlessly:
> 
>   [torvalds@linux]$ wc include/linux/device.h
>    1921  8252 66021 include/linux/device.h
> 
> that's almost 2k of header file, and it's included a _lot_:
> 
>   [torvalds@linux]$ git grep include.*linux/device.h | wc
>    2518    5085  144875
> 
> and many of those includes are actually from other core header files,
> so it's effectively included from even more trees.
> 
> Yes, yes, many of those 2k lines are comments. But still... Do we
> really want to have that humongous 65kB, 2kloc header file, and keep
> growing it forever?
> 
> Greg?

Yeah, it is getting big, I'll look into splitting it up.

thanks,

greg k-h


> 
>                   Linus
