Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D158422657
	for <lists+linux-leds@lfdr.de>; Tue,  5 Oct 2021 14:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhJEM01 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Oct 2021 08:26:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233784AbhJEM0W (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 5 Oct 2021 08:26:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3CB861425;
        Tue,  5 Oct 2021 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633436671;
        bh=PMEu3vu3IEOanN6r5ndzxe4q8fSyh9+dWvBFRR9BaU4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tXpWRCmizUMIdKoGi+34DQpQ8yjB8VZfZuGBYKwEsVJE95rErXQd16rtLbaK8T4tL
         FMz3pnUPtz8MTPuOiojzK7LfrTdjUDhKSza7M2k2I9srzqT5+AJnm7vhLiFNqU9nMO
         OxPnpGQkoaDqcr1FJXVlgQVINMf3yEBsH4zpf9ZSXebLbpNXSMHLqnv/UumJWC/gPu
         yeFuVTA2iyfTHZ25he/VIvCeoTltppl/LmBHUbl5OCqDH4Otg7/yC2CNGtbYc9Ucrl
         MIAmhlIPqeCeUBwrD13yzyS29FGn1vKlushOQ5+RVpC8ZlYAQZ4krIxEaC96hdzUNN
         7rgt0rfSTp+dQ==
Date:   Tue, 5 Oct 2021 14:24:28 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Ian Pilcher <arequipeno@gmail.com>, pavel@ucw.cz,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Message-ID: <20211005142428.6c6c83c8@dellmb>
In-Reply-To: <YUgtqL4zUEV2YPnQ@infradead.org>
References: <20210916202127.1216994-1-arequipeno@gmail.com>
        <20210916202127.1216994-2-arequipeno@gmail.com>
        <YUQzdyG+WWoiJ2I9@kroah.com>
        <e09257e0-ce95-623c-3a04-cc033aa9fec2@gmail.com>
        <YUWQSlXjIb58eCJZ@kroah.com>
        <YUgtqL4zUEV2YPnQ@infradead.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 20 Sep 2021 07:43:52 +0100
Christoph Hellwig <hch@infradead.org> wrote:

> On Sat, Sep 18, 2021 at 09:07:54AM +0200, Greg KH wrote:
> > > Honestly, I wasn't particularly enthusiastic about it in the first
> > > place; it feels like something that should be done in user space.
> > >  I wouldn't have included it if I didn't have to make a writable
> > > copy of the buffer anyway, in order to trim a trailing newline.
> > > 
> > > I can certainly remove the re-check logic.  The end result will
> > > be an API that is slightly less "user friendly" in return for
> > > saving a bit of pointer arithmetic and a 5-byte memcpy().  
> > 
> > Just use the kernel block device name and that way you do not have
> > to parse anything as it is unique and no paths are having to be
> > followed.
> > 
> > That's the way that other LED apis are working, right?  
> 
> The "kernel block device name" is the a block device special path
> that a normal VFS path lookup is done on.  This is the preferred block
> device API used by everyone.  And yes, this includes resolving
> symlinks. The only other API is by dev_t, but it is highly
> discouraged and should really not grow any new users.

Christoph,

/sys/class/block lists block devices' kernel object names.
I don't understand why can't blk API provide a function returns a block
device given such name as seen in /sys/class/block directory.

Can you elaborate on this?

It seems really strange to me to not be able to do
  cd /sys/class/leds/<LED>
  echo blkdev >trigger
  echo sda1 >block_device
and instead having to do (as the last command)
  echo /dev/sda1 >block_device

And whas should we show when /dev/sda1 is paried to the trigger, and
userspace reads the block_device sysfs file? Should we show the full
path which was given when pairing, even if it may not be valid anymore?
(Such as when the device file is removed from /dev.)

Marek
