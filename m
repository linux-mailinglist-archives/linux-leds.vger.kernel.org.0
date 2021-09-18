Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCF0410497
	for <lists+linux-leds@lfdr.de>; Sat, 18 Sep 2021 09:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242036AbhIRHJh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 18 Sep 2021 03:09:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242021AbhIRHJh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 18 Sep 2021 03:09:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FE7460EE5;
        Sat, 18 Sep 2021 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631948894;
        bh=RTpQEuMUGhtUQ5EDOaFVd573uXaXVHf0F7g2WhiYtHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hwQ4voZbimVrkNN7QHW7Yge+rRO5yBJ3tohgELoNfhuJzVqKU9B/WsmBjF8pPNfkc
         BcMo0XzV9sThPgiqbFflhX3HksGnqIbSZ0Ekv3BRCNh5vrllfEHLaNSFUZIgpXEQBl
         rXDWAdLqb6AqmhRjk+4HRgUcVuxmIIEF29a4bH5Y=
Date:   Sat, 18 Sep 2021 09:07:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     hch@infradead.org, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH v4 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Message-ID: <YUWQSlXjIb58eCJZ@kroah.com>
References: <20210916202127.1216994-1-arequipeno@gmail.com>
 <20210916202127.1216994-2-arequipeno@gmail.com>
 <YUQzdyG+WWoiJ2I9@kroah.com>
 <e09257e0-ce95-623c-3a04-cc033aa9fec2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e09257e0-ce95-623c-3a04-cc033aa9fec2@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 17, 2021 at 03:46:55PM -0500, Ian Pilcher wrote:
> Combining 2 related threads ...
> 
> On 9/17/21 01:19, Greg KH wrote:
> > On Thu, Sep 16, 2021 at 03:21:26PM -0500, Ian Pilcher wrote:
> > > +What:		/sys/class/leds/<led>/link_device
> > > +Date:		September 2021
> > > +Contact:	Ian Pilcher <arequipeno@gmail.com>
> > > +Description:
> > > +		Associate a block device with this LED by writing the path to
> > > +		the device special file (e.g. /dev/sda) to this attribute.
> > > +		Symbolic links are followed.  Optionally, the leading "/dev/"
> > > +		may be omitted.
> > 
> > No, please don't follow symlinks, stick with kernel names here,
> > otherwise you have a mismatch between that and the list of devices in
> > this file:
> > 
> > > +What:		/sys/class/leds/<led>/linked_devices
> 
> I did update the documentation to mention that fact.
> 
> Following symlinks is the behavior of blkdev_get_by_path(), not some-
> thing that my code is doing.
> 
> As far as using kernel names, that would be my preference, but I simply
> don't know of any way to do so with the existing block API.  To my
> knowledge, there simply isn't anything like a blkdev_get_by_name() API.
> 
> This the reason that I added the "retry" logic to led_bdev_get().  It
> doesn't prevent the system administrator from using a symbolic link (or
> an oddly named special file), but it does make an unqualified name like
> "sda" work if the expected special file exists in /dev.
> 
> However ...
> 
> On 9/17/21 00:53, Christoph Hellwig wrote:
> > On Thu, Sep 16, 2021 at 03:21:27PM -0500, Ian Pilcher wrote:
> > > +static struct block_device *led_bdev_get(const char *const buf,
> > > +					 const size_t count, fmode_t mode)
> > > +{
> > > +	static const char dev[] = "/dev/";
> > > +	struct block_device *bdev;
> > > +	char *dev_path, *path;
> > > +
> > > +	/* sizeof(dev) includes terminating null */
> > > +	dev_path = kmalloc(sizeof(dev) + count, GFP_KERNEL);
> > > +	if (dev_path == NULL)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	/* sizeof(dev) - 1 is compile-time equivalent of strlen(dev) */
> > > +	memcpy(dev_path, dev, sizeof(dev) - 1);
> > > +	path = dev_path + sizeof(dev) - 1;
> > > +	memcpy(path, buf, count + 1);  /* include terminating null */
> > > +	strim(path);
> > > +
> > > +try_blkdev_get:
> > > +	bdev = blkdev_get_by_path(path, mode, THIS_MODULE);
> > > +	if (IS_ERR(bdev) && PTR_ERR(bdev) == -ENOENT && path != dev_path) {
> > > +		path = dev_path;
> > > +		goto try_blkdev_get;
> > > +	}
> > > +
> > > +	kfree(dev_path);
> > > +	return bdev;
> > 
> > Please just required the user to put in the whole path and remove all
> > this garbage.  There is no need to build your own broken wrappers around
> > the VFS path resolution.
> 
> Please be specific about what is broken.
> 
> If you see an actual bug in the code, please tell me what it is.
> 
> If (as I suspect) you disagree with the basic idea of retrying with
> "/dev/" prepended to the supplied path, please say that.
> 
> Honestly, I wasn't particularly enthusiastic about it in the first
> place; it feels like something that should be done in user space.  I
> wouldn't have included it if I didn't have to make a writable copy of
> the buffer anyway, in order to trim a trailing newline.
> 
> I can certainly remove the re-check logic.  The end result will be an
> API that is slightly less "user friendly" in return for saving a bit of
> pointer arithmetic and a 5-byte memcpy().

Just use the kernel block device name and that way you do not have to
parse anything as it is unique and no paths are having to be followed.

That's the way that other LED apis are working, right?

thanks,

greg k-h
