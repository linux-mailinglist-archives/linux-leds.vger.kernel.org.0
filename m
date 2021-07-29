Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC1F3DA2B4
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 14:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234231AbhG2MAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 08:00:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234610AbhG2MAD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Jul 2021 08:00:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCA4760F21;
        Thu, 29 Jul 2021 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627560000;
        bh=dVlivW1G35KXO37f2DhxEdxNU8sqEfSwmTd1QUrB7vE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JxwqEzyYPYymuA8cRC/Zbn9293xfgv72Y/v8+W5+YllJsHUaHm+agVxifF87zv4PA
         Sy53L3qxsQQhlRuVFG+E6BpwdOW/ruhUAQ4RKG1eEsz8adfjh9Rzai6OsfgfWzs7Sh
         OW0jxVXq/dbHGVrSPIwx+Ia1cn/Ygc4XY7Spvpte0kqmcbw59/L/V85UT0lpJBu4An
         cNvD7MmOHns+xNk2fEIj/1fQEoKZESe0Ek67qwX3djur/c2QLaomNQqh/4JgIKII9/
         fSjDPjBPMBT7ftwBi4RUhafe/er+7s4Qmfak9qrX65wpMd+aJ/TiEOP54iQahf+afx
         ufUOA8wUpCEnA==
Date:   Thu, 29 Jul 2021 13:59:55 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH 1/8] docs: Add block device LED trigger
 documentation
Message-ID: <20210729135955.3e3f591c@thinkpad>
In-Reply-To: <20210729015344.3366750-2-arequipeno@gmail.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
        <20210729015344.3366750-2-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dear Ian,

On Wed, 28 Jul 2021 20:53:37 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> * Document the sysfs attributes (/sys/class/block/led_trigger_*
>   and /sys/class/block/${DEV}/led_trigger) that can be used to
>   create, list, and delete block device LED triggers and to
>   set and clear device/trigger associations.
> 
> * Pull API documentation from block/blk-ledtrig.c (once it
>   exists).
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>

thank you for this proposal.

I don't really see the purpose for having multiple different block
device LED triggers. Moreover we really do not want userspace to be
able to add LED triggers with arbitrary names, and as many as the
userspace wants. There is no sense in making userspace be able to
create 10000 triggers. Also if userspace can create triggers with
arbitrary names, it could "steal" a name for a real trigger. For
example if netdev trigger is compiled as a module, and before loading
someone creates blockdev trigger with name "netdev", the loading of
netdev trigger will fail.

I would like the blkdev trigger to work in a similar way the netdev
trigger works:
- only one trigger, with name "blkdev"
- when activated on a LED, new sysfs files will be created:
  * device_name, where user can write sda1, vdb, ...
  * read (binary value, 1 means blink on read)
  * write (binary value, 1 means blink on write)
  * interval (blink interval)
  Note that device_name could allow multiple names, in theory...
  Also some other disk states may be included, like error, or something
- also the blinking itself can be done as is done netdev trigger: every
  50ms the work function would look at blkdev stats, and if current
  stat (number of bytes read/written) is different from previous, then
  blink the LED

Marek
  
