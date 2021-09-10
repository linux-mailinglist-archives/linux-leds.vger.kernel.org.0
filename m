Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9A2406E1F
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 17:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbhIJPYQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 11:24:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:52638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234130AbhIJPYQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Sep 2021 11:24:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 214F4611C5;
        Fri, 10 Sep 2021 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631287385;
        bh=f6IGIRfV123I4IcfOc4p0tfcPsKkBQX6eNQa6E4tcZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rzf4b2AfXmMpJpcNbzfURmoGer7xDxR2DZjD4StBmP0Qd49F5YuGnL2Om9ijH28cV
         IUeVvtHQmzlxHNykZ2fN7Q+YbLw3oQfFH6n3kTLdMo9Tkq+OiqhL6CtF5Coa3BJgfp
         my13zyQ25DbCWWbKJ6RCQ+Gh30Hu0k623WG4Bvmc=
Date:   Fri, 10 Sep 2021 17:23:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH v2 06/15] leds: trigger: blkdev: Add function to get
 gendisk by name
Message-ID: <YTt4VZLXZRTgwppY@kroah.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-7-arequipeno@gmail.com>
 <YTr+8h12z7kMLlV/@kroah.com>
 <d4c6bc27-6595-2e95-cae8-d3e8e349955e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4c6bc27-6595-2e95-cae8-d3e8e349955e@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 10, 2021 at 10:17:03AM -0500, Ian Pilcher wrote:
> On 9/10/21 1:45 AM, Greg KH wrote:
> > You now have bumped the reference count on this structure.  Where do you
> > decrement it when you are finished with it?
> 
> That happens when I "unlink" the block device from the LED in
> blkdev_disk_unlink_locked() at ledtrig-blkdev.c:410.

I have no context here anymore, so I have no idea if this is really true
:(

