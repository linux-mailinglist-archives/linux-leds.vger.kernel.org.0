Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1423240675F
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 08:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbhIJGsv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 02:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231223AbhIJGsu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Sep 2021 02:48:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9181B60F9C;
        Fri, 10 Sep 2021 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631256460;
        bh=crSpq5ICLhrGcyCk8g/i2I+2A4dAPEqJQN8kWgi2sMo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yn2VgPqTNQ6U+hj4FE74WjU/2QCYrnc3z1Yilzm4P9ConEQNAsVcYiqdX1Q7+44zC
         ICuC+UWf0SlEZy+1O+jITagBVz4DLwexYMqXSyagv75cV388SDW6NHIaJaXZFAoj8m
         vlf2xOE/md3LGhxfwdp+F+pspxnBbLWCIHwpUVk8=
Date:   Fri, 10 Sep 2021 08:47:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH v2 10/15] leds: trigger: blkdev: Add LED trigger activate
 function
Message-ID: <YTr/iQBYclqjFri2@kroah.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-11-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909222513.2184795-11-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 09, 2021 at 05:25:08PM -0500, Ian Pilcher wrote:
> Allocate per-LED data structure and initialize with default values
> 
> Create /sys/class/leds/<led>/block_devices directory
> 
> Increment module reference count.  Module can only be removed when no LEDs
> are associated with the trigger.
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-blkdev.c | 57 +++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
> index 40dc55e5d4f3..6f78a9515976 100644
> --- a/drivers/leds/trigger/ledtrig-blkdev.c
> +++ b/drivers/leds/trigger/ledtrig-blkdev.c
> @@ -164,6 +164,62 @@ static void blkdev_process(struct work_struct *const work)
>  }
>  
>  
> +/*
> + *
> + *	Associate an LED with the blkdev trigger
> + *
> + */
> +
> +static int blkdev_activate(struct led_classdev *const led_dev)
> +{
> +	struct ledtrig_blkdev_led *led;
> +	int ret;
> +
> +	/* Don't allow module to be removed while any LEDs are linked */
> +	if (WARN_ON(!try_module_get(THIS_MODULE))) {

That pattern is racy and broken and never ever ever add it to the kernel
again please.  All existing in-kernel users of it are also wrong, we
have been removing them for decades now.

> +		ret = -ENODEV;		/* Shouldn't ever happen */
> +		goto exit_return;
> +	}
> +
> +	led = kmalloc(sizeof(*led), GFP_KERNEL);
> +	if (led == NULL) {
> +		ret = -ENOMEM;
> +		goto exit_put_module;
> +	}
> +
> +	led->led_dev = led_dev;
> +	led->blink_msec = LEDTRIG_BLKDEV_BLINK_MSEC;
> +	led->mode = LEDTRIG_BLKDEV_MODE_RW;
> +	INIT_HLIST_HEAD(&led->disks);
> +
> +	ret = mutex_lock_interruptible(&ledtrig_blkdev_mutex);
> +	if (ret != 0)
> +		goto exit_free;
> +
> +	led->dir = kobject_create_and_add("linked_devices",
> +					  &led_dev->dev->kobj);

You have created a "raw" kobject in the device tree now, which means
that userspace will not be notified of it and will have a "hole" in it's
knowledge.  Why not just create a named attribute group to this device
instead?

> +	if (led->dir == NULL) {
> +		ret = -ENOMEM;
> +		goto exit_unlock;
> +	}
> +
> +	hlist_add_head(&led->leds_node, &ledtrig_blkdev_leds);
> +	led_set_trigger_data(led_dev, led);
> +	ret = 0;
> +
> +exit_unlock:
> +	mutex_unlock(&ledtrig_blkdev_mutex);
> +exit_free:
> +	if (ret != 0)
> +		kfree(led);
> +exit_put_module:
> +	if (ret != 0)
> +		module_put(THIS_MODULE);

Again, racy and broken, please do not do this.

thanks,

greg k-h
