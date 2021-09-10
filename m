Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E2940675A
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 08:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhIJGqT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 02:46:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231223AbhIJGqT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Sep 2021 02:46:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71E3E6109F;
        Fri, 10 Sep 2021 06:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631256308;
        bh=zs4kHzRc2dEOg/Ypc3inBLRklRqv/MDp+aMdgAMUJvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arZpI6Vbkd1Q4i3uXv3VOMwXkAB9fZUzJYRhC8canCV48cmeaid4vVaHL6S35gBYk
         1r2JfmDm9NFy+1X6JVvhICj3bQFHl/EVf52LImze8YXwP8PGLdAUmQV84ndyDMvxTv
         NXCgtswiAFDW6aYrzFAElN/he9LdzZHmHPxjjlG0=
Date:   Fri, 10 Sep 2021 08:45:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH v2 06/15] leds: trigger: blkdev: Add function to get
 gendisk by name
Message-ID: <YTr+8h12z7kMLlV/@kroah.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-7-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909222513.2184795-7-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 09, 2021 at 05:25:04PM -0500, Ian Pilcher wrote:
> Add ledtrig_blkdev_get_disk() to find block device by name and increment
> its reference count.  (Caller must call put_disk().)  Must be built-in to
> access block_class and disk_type symbols.
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-blkdev-core.c | 20 ++++++++++++++++++++
>  drivers/leds/trigger/ledtrig-blkdev.h      |  3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-blkdev-core.c b/drivers/leds/trigger/ledtrig-blkdev-core.c
> index d7b02e760b06..5fd741aa14a6 100644
> --- a/drivers/leds/trigger/ledtrig-blkdev-core.c
> +++ b/drivers/leds/trigger/ledtrig-blkdev-core.c
> @@ -33,3 +33,23 @@ void ledtrig_blkdev_disk_cleanup(struct gendisk *const gd)
>  
>  	mutex_unlock(&ledtrig_blkdev_mutex);
>  }
> +
> +/* class_find_device() callback.  Must be built-in to access disk_type. */
> +static int blkdev_match_name(struct device *const dev, const void *const name)
> +{
> +	return dev->type == &disk_type
> +			&& sysfs_streq(dev_to_disk(dev)->disk_name, name);
> +}
> +
> +/* Must be built-in to access block_class */
> +struct gendisk *ledtrig_blkdev_get_disk(const char *const name)
> +{
> +	struct device *dev;
> +
> +	dev = class_find_device(&block_class, NULL, name, blkdev_match_name);
> +	if (dev == NULL)
> +		return NULL;

You now have bumped the reference count on this structure.  Where do you
decrement it when you are finished with it?

thanks,

greg k-h
