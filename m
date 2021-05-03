Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445D6371105
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 06:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhECEtQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 00:49:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:46104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhECEtQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 May 2021 00:49:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26E3261376;
        Mon,  3 May 2021 04:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620017303;
        bh=qe2K2dUFSTQlgYuxLKpqQv9oEVpXzWC972TvWmceQo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NsEvbIL3Fr3SiFCcxYiI0OzPicwzJwdxaY1zA6ecSslUnUtwWOE3sFeD8+qbBvBcV
         etoX/WSuUwj7KKQKYqcZIrYMZuGYR+ONL+s5JPj8fFsCD0RmUNRowBpGxOFvHPBxUL
         0tMWwlWJVdSAV26Eg/gJrOcXUXSaNoi8HaYf64XU=
Date:   Mon, 3 May 2021 06:48:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Enzo Matsumiya <ematsumiya@suse.de>
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] block: export block_class and disk_type symbols
Message-ID: <YI+AlTtCl7KMyR6G@kroah.com>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-2-ematsumiya@suse.de>
 <YIz0EBqKTHhB+n8N@kroah.com>
 <20210503023649.a437epxpd7tkgkwx@hyori>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503023649.a437epxpd7tkgkwx@hyori>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 02, 2021 at 11:37:35PM -0300, Enzo Matsumiya wrote:
> On 05/01, Greg Kroah-Hartman wrote:
> > On Fri, Apr 30, 2021 at 03:32:10PM -0300, Enzo Matsumiya wrote:
> > > Export symbols to be used by _for_each_blk() helper in LED block
> > > trigger.
> > > 
> > > Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
> > > ---
> > >  block/genhd.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/block/genhd.c b/block/genhd.c
> > > index 8c8f543572e6..516495179230 100644
> > > --- a/block/genhd.c
> > > +++ b/block/genhd.c
> > > @@ -1218,6 +1218,7 @@ static void disk_release(struct device *dev)
> > >  struct class block_class = {
> > >  	.name		= "block",
> > >  };
> > > +EXPORT_SYMBOL(block_class);
> > > 
> > >  static char *block_devnode(struct device *dev, umode_t *mode,
> > >  			   kuid_t *uid, kgid_t *gid)
> > > @@ -1235,6 +1236,7 @@ const struct device_type disk_type = {
> > >  	.release	= disk_release,
> > >  	.devnode	= block_devnode,
> > >  };
> > > +EXPORT_SYMBOL(disk_type);
> > > 
> > >  #ifdef CONFIG_PROC_FS
> > >  /*
> > 
> > Please please no.  These should not be needed by anything.
> > 
> > And if they really do, they must be EXPORT_SYMBOL_GPL().
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thanks. I was indeed skeptical about submitting this particular change.
> 
> Do you think it's more acceptable if I implement a for_each_blk() helper
> (cf. patch 2 on this series) on block code?
> 
> I couldn't find any other way to do this (get all block devices on the
> system), so please let me know if I missed something.

Why would you want a list of all block devices in the system?  What are
you going to do with such a thing?  How does the block core handle other
random drivers getting references to the things it thinks it controls?

thanks,

greg k-h
