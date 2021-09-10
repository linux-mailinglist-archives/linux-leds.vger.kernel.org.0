Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FD6406762
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 08:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhIJGuL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 02:50:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:38756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231223AbhIJGuK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Sep 2021 02:50:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA6960F9C;
        Fri, 10 Sep 2021 06:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631256540;
        bh=vXJAXbhhRVXEIInC57PKl2Etg+1VL0ZTnPPtyJWXfQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g3/0iqK+l0/n6VvnkF0pXW7nCoy+Qy8uqoRX55nHBcMT0rP5IStNe5aBlGnE1+QwB
         kLAu3CKJ2LXdPiiA5s3jmDP6SeIBhDT57NHkAj562QrzcJhJlra+qy7kSITaDZ16MC
         ITYahQcfTmvsQqQ49FxBdevomUXLMuf14NIXAujo=
Date:   Fri, 10 Sep 2021 08:48:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH v2 11/15] leds: trigger: blkdev: Enable linking block
 devices to LEDs
Message-ID: <YTr/2bflThomjHqL@kroah.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-12-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909222513.2184795-12-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 09, 2021 at 05:25:09PM -0500, Ian Pilcher wrote:
> Add /sys/class/leds/<led>/link_device sysfs attribute
> 
> If this is the first LED associated with the device, create the
> /sys/block/<disk>/blkdev_leds directory.  Otherwise, increment its
> reference count.
> 
> Create symlinks in /sys/class/leds/<led>/block_devices and
> /sys/block/<disk>/blkdev_leds
> 
> If this the first device associated with *any* LED, schedule delayed work
> to periodically check associated devices and blink LEDs
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-blkdev.c | 160 ++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
> index 6f78a9515976..26509837f037 100644
> --- a/drivers/leds/trigger/ledtrig-blkdev.c
> +++ b/drivers/leds/trigger/ledtrig-blkdev.c
> @@ -71,6 +71,9 @@ static unsigned int ledtrig_blkdev_interval;
>  static void blkdev_process(struct work_struct *const work);
>  static DECLARE_DELAYED_WORK(ledtrig_blkdev_work, blkdev_process);
>  
> +/* Total number of device-to-LED associations */
> +static unsigned int ledtrig_blkdev_count;
> +
>  
>  /*
>   *
> @@ -220,6 +223,162 @@ static int blkdev_activate(struct led_classdev *const led_dev)
>  }
>  
>  
> +/*
> + *
> + *	link_device sysfs attribute - assocate a block device with this LED
> + *
> + */
> +
> +/* Gets or allocs & initializes the blkdev disk for a gendisk */
> +static int blkdev_get_disk(struct gendisk *const gd)
> +{
> +	struct ledtrig_blkdev_disk *disk;
> +	struct kobject *dir;
> +
> +	if (gd->ledtrig != NULL) {
> +		kobject_get(gd->ledtrig->dir);

When do you decrement this kobject?

> +		return 0;
> +	}
> +
> +	disk = kmalloc(sizeof(*disk), GFP_KERNEL);
> +	if (disk == NULL)
> +		return -ENOMEM;
> +
> +	dir = kobject_create_and_add("linked_leds", &disk_to_dev(gd)->kobj);
> +	if (dir == NULL) {
> +		kfree(disk);
> +		return -ENOMEM;
> +	}
> +
> +	INIT_HLIST_HEAD(&disk->leds);
> +	disk->gd = gd;
> +	disk->dir = dir;
> +	disk->read_ios = 0;
> +	disk->write_ios = 0;
> +
> +	gd->ledtrig = disk;
> +
> +	return 0;
> +}
> +
> +static void blkdev_put_disk(struct ledtrig_blkdev_disk *const disk)
> +{
> +	kobject_put(disk->dir);
> +
> +	if (hlist_empty(&disk->leds)) {
> +		disk->gd->ledtrig = NULL;
> +		kfree(disk);

This should happen in the kobject release function, not here, right?

Did you try this out with removable block devices yet?

thanks,

greg k-h
