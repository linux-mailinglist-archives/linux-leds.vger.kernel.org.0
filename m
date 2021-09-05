Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120BF401066
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 16:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhIEOvY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 10:51:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhIEOvY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Sep 2021 10:51:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CB7C60F56;
        Sun,  5 Sep 2021 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630853421;
        bh=FEybAdpiS1hYOWHcM3Dkw6cVjxzDuK4bSKXHV9lUvaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hcGVOh3nMJHiUEshvDtZJsPLJrBzWG5p5xRG6xF2GrWvyan5lyGlqmhAbxTk6DRsp
         wp112C5lP5xLC7azpHggtIdbLNtoxUVsi2407nx9zMWheFCuETuMNdE6Dz4H2VONU1
         m+fakYmOK0kAdp/Tdh25eHSWcr0bzaoAElv1C14s=
Date:   Sun, 5 Sep 2021 16:50:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH 17/18] ledtrig-blkdev: Add mode (read/write/rw) sysfs
 attributue
Message-ID: <YTTZKreRVV6Upf/E@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-18-arequipeno@gmail.com>
 <YTMKwJUyKX3bxDuK@kroah.com>
 <ceed6f65-6feb-b97d-7582-57dae6e4f838@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceed6f65-6feb-b97d-7582-57dae6e4f838@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 04, 2021 at 04:01:56PM -0500, Ian Pilcher wrote:
> On 9/4/21 12:57 AM, Greg KH wrote:
> > Also, you are now allowing any user to spam the kernel log, this shold
> > be a dev_dbg() call at the most, if it is even needed at all.  Same for
> > the other pr_info() call in this function, please remove them all.
> 
> Greg -
> 
> A bit of a "philosophical" question, if I may ...
> 
> Is allowing the root user to "spam" the kernel log really a concern?

Yes.

> (The permissions on the attribute don't allow non-root users to write
> to it.)

Ah, but that was not obvious :)

> As a system administrator working with a sysfs API (or writing udev
> rules to do so), I know that I appreciate having a meaningful message in
> the log when something doesn't work.

That's fine, but do not allow a "normal" user to do so please.

> Given that only the root user can trigger these messages, would you be
> OK with dev_info()?

For a sysfs file failure, use dev_err().  If things are working
properly, your kernel code should be totally silent.

thanks,

greg k-h
