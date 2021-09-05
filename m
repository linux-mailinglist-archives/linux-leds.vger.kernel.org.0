Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67254010EA
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 18:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhIEQon (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 12:44:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231804AbhIEQon (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Sep 2021 12:44:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9913760234;
        Sun,  5 Sep 2021 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630860220;
        bh=a3rULTOaBwVgT4bjE7RhkGxdcArdrISZDSheXe+9zjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYkEYHdpauiWDfoe8SjhCNhKw8ccV4bnU6LDEpvMTOuOoEjnqzjo1b6u08OQ4JHaU
         qW8/AmFxO358eJAXZBBWU3skDeftxn95ASjgHvHKmb8dhxO1p/B+Z7tMj5HzWWNxcg
         J9KhV1PYxH4L4ds47+aLdmtT/YrDVnoZESWo8FAg=
Date:   Sun, 5 Sep 2021 18:43:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
Message-ID: <YTTzuVHBDgT2Hv9r@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com>
 <YTMLVrCokErmYxEU@kroah.com>
 <2791db8c-9049-adbe-604e-ff010aef03fa@gmail.com>
 <YTTZbYOSZ1IJsj/b@kroah.com>
 <06cd179e-b5d6-43ac-3402-26c30f3ecfed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06cd179e-b5d6-43ac-3402-26c30f3ecfed@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 05, 2021 at 10:33:08AM -0500, Ian Pilcher wrote:
> On 9/5/21 9:51 AM, Greg KH wrote:
> > > It's really more of an error message for the system administrator.  So
> > > as with my earlier note, dev_info() would be my preference.
> > 
> > Nope, dev_err() for real errors please.
> 
> Just to clarify, the error in this case is the system administrator
> writing an incorrect value to a sysfs attribute (likely via a udev
> rule), i.e. a "pilot error."
> 
> One of the reviewers of one of my RFC patch sets commented that those
> should be INFO level at most.
> 
> So dev_err() or dev_info() for that sort of thing (always given that
> only the root user has permission to write to trigger the error
> message)?

Really you should not have any kernel log messages for invalid data sent
to a sysfs file, just return -EINVAL and be done with it.

> > > The blkdev_skip_space() and blkdev_find_space() calls effectively find
> > > the first non-whitespace token in the buffer (disk_name) and its length
> > > (name_len).  If the buffer only contains whitespace (e.g. echo > $ATTR),
> > > then name_len will be 0.
> > 
> > That's a crazy interface, as others pointed out, don't do that please.
> 
> As Pavel noted, it would be ideal to use symlink()/unlink() in the LED's
> block_devices directory for this.  As far as I know however, sysfs
> doesn't support doing that.  I'd be happy to learn otherwise.  I would
> also welcome any other suggestions for a better interface for setting up
> the many-to-many relationships that the trigger supports.

sysfs does not allow that as that is not what sysfs is for.  Perhaps you
want to use configfs, as that is exactly what that is for.

> That said, I don't know what that has to do with blkdev_skip_space() and
> blkdev_find_space(), which are just helper functions that I use to parse
> the device name out of the buffer passed to the store function.
> Ultimately, the store function does need to handle the case where the
> system administrator (or a broken udev rule) writes an all-whitespace
> string to the attribute.

Handling invalid data is fine, but having to parse multiple values in a
single sysfs file violates the rules of sysfs.  Please use something
else instead.

thanks,

greg k-h
