Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA82C410F9A
	for <lists+linux-leds@lfdr.de>; Mon, 20 Sep 2021 08:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhITGqh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Sep 2021 02:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbhITGqg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Sep 2021 02:46:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF3AC061574;
        Sun, 19 Sep 2021 23:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=3Sy/rEGgIqKcMWpTMiQbwNJaSJE3pv4762nDAuPaBrI=; b=he667LqfnFO1EieNx8AAe5GaTQ
        GTPR4ubHrX5lNhUEp/E/QwW26YOAALFn2E9HOICZVh+gkZARqQNV+4RU3syr3jWcqJaalUZP37egP
        TUr/VyO7Ry/7JKLYRbsyfqf3qTlhYfLK3dcR5r1ddyUVSGbbJOfuSSZTjhg2pSKaO29JrPmZdMqEc
        mNFuQmlEDZ8Q65nqa61Nq2PHp/e/ZTJv3iy14rWAtMRuxa4FJfR3A0Q1413SBwcCf+P6Ba5Fv33NH
        K2+PsJ51fFyWRGHDAnwtPKny07xHp90Tn4zBD7qR4Ar38b+Q3xpj4j5ror7MPSGemq0C6eN/sM+gi
        3iHhGLag==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mSD1s-002QwW-Gw; Mon, 20 Sep 2021 06:44:15 +0000
Date:   Mon, 20 Sep 2021 07:43:52 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Ian Pilcher <arequipeno@gmail.com>, hch@infradead.org,
        pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH v4 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Message-ID: <YUgtqL4zUEV2YPnQ@infradead.org>
References: <20210916202127.1216994-1-arequipeno@gmail.com>
 <20210916202127.1216994-2-arequipeno@gmail.com>
 <YUQzdyG+WWoiJ2I9@kroah.com>
 <e09257e0-ce95-623c-3a04-cc033aa9fec2@gmail.com>
 <YUWQSlXjIb58eCJZ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUWQSlXjIb58eCJZ@kroah.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 18, 2021 at 09:07:54AM +0200, Greg KH wrote:
> > Honestly, I wasn't particularly enthusiastic about it in the first
> > place; it feels like something that should be done in user space.  I
> > wouldn't have included it if I didn't have to make a writable copy of
> > the buffer anyway, in order to trim a trailing newline.
> > 
> > I can certainly remove the re-check logic.  The end result will be an
> > API that is slightly less "user friendly" in return for saving a bit of
> > pointer arithmetic and a 5-byte memcpy().
> 
> Just use the kernel block device name and that way you do not have to
> parse anything as it is unique and no paths are having to be followed.
> 
> That's the way that other LED apis are working, right?

The "kernel block device name" is the a block device special path
that a normal VFS path lookup is done on.  This is the preferred block
device API used by everyone.  And yes, this includes resolving symlinks.
The only other API is by dev_t, but it is highly discouraged and should
really not grow any new users.
