Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D099A401069
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 16:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhIEOwb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 10:52:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:58448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhIEOwb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Sep 2021 10:52:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAC2460E8B;
        Sun,  5 Sep 2021 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630853488;
        bh=t3oulGHmvh0ljQzyC2lnqRmieg6o62g2HWHn8rcwr7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QyfLKQyDEct3wXczImkmsqvrCXfnE8vb/f6HyfRMO2qwvf3BreDdXKzdMfbzZ/NFJ
         9tm6KVDLR524IpYhQ6oozkvQ3yYOKAUi6jpRHHa66CaTgdktRgN/ExXztArV+PzZn6
         oKhv84gLDF6KqyBJ622u1Pjh/gIwEJJDQJRQYqTM=
Date:   Sun, 5 Sep 2021 16:51:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
Message-ID: <YTTZbYOSZ1IJsj/b@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com>
 <YTMLVrCokErmYxEU@kroah.com>
 <2791db8c-9049-adbe-604e-ff010aef03fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2791db8c-9049-adbe-604e-ff010aef03fa@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 04, 2021 at 05:35:29PM -0500, Ian Pilcher wrote:
> On 9/4/21 12:59 AM, Greg KH wrote:
> > DEVICE_ATTR_RO()?  Or something like that?  Do not use __ATTR() for
> > device attributes if at all possible, worst case, use DEVICE_ATTR()
> > here.
> 
> For some reason, it didn't click until now that these are device
> attributes (because I was focused on the fact that I was working on the
> LED trigger).
> 
> DEVICE_ATTR*() it is.
> 
> > And the mode settings are odd, are you sure you want that?
> 
> Yes.  These are write-only attributes.

DEVICE_ATTR_WO() then please.

> > > +	if (name_len == 0) {
> > > +		pr_info("blkdev LED: empty block device name\n");
> > 
> > Looks like debugging code, please remove.
> 
> It's really more of an error message for the system administrator.  So
> as with my earlier note, dev_info() would be my preference.

Nope, dev_err() for real errors please.

> > And how can this ever happen?
> 
> The blkdev_skip_space() and blkdev_find_space() calls effectively find
> the first non-whitespace token in the buffer (disk_name) and its length
> (name_len).  If the buffer only contains whitespace (e.g. echo > $ATTR),
> then name_len will be 0.

That's a crazy interface, as others pointed out, don't do that please.

thanks,

greg k-h
