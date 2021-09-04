Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406954009F6
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 08:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhIDGCp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 02:02:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhIDGCo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Sep 2021 02:02:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F21260F56;
        Sat,  4 Sep 2021 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630735303;
        bh=SrDxuptF3EM7MY1cjNB3mCBrnNxv5wMFsvQMgUyB3bY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VS/BplqC9kTTm4G7UKDbbRH0vIGFT/8bBxMwQBkFiAYIV0Nqsl62HTzCvkFLuoGOy
         JbVlIu/AIA+B21B4nJnWRFDC+JIjhL9Emt22A8Ww/IlcLYIKj56L9S8ITk3dbOEYld
         rQr/1yDNwzXeKpT2W8le+SqzPUA+sImHb3jJKAeA=
Date:   Sat, 4 Sep 2021 08:01:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH 09/18] ledtrig-blkdev: Periodically check devices for
 activity & blink LEDs
Message-ID: <YTMLxdQ3TFKPN+WH@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-10-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903204548.2745354-10-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 03, 2021 at 03:45:39PM -0500, Ian Pilcher wrote:
> Use a delayed workqueue to periodically check configured block devices for
> activity since the last check.  Blink LEDs associated with devices on which
> the configured type of activity (read/write) has occurred.
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-blkdev.c | 88 +++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
> index 1f319529c3be..37ba9bb3542e 100644
> --- a/drivers/leds/trigger/ledtrig-blkdev.c
> +++ b/drivers/leds/trigger/ledtrig-blkdev.c
> @@ -7,7 +7,9 @@
>   */
>  
>  #include <linux/ctype.h>
> +#include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/part_stat.h>
>  
>  #include "ledtrig-blkdev.h"
>  
> @@ -68,6 +70,10 @@ static unsigned int ledtrig_blkdev_count;
>  /* How often to check for drive activity - in jiffies */
>  static unsigned int ledtrig_blkdev_interval;
>  
> +/* Delayed work used to periodically check for activity & blink LEDs */
> +static void blkdev_process(struct work_struct *const work);
> +static DECLARE_DELAYED_WORK(ledtrig_blkdev_work, blkdev_process);
> +
>  
>  /*
>   *
> @@ -110,3 +116,85 @@ static bool blkdev_write_mode(const enum ledtrig_blkdev_mode mode)
>  {
>  	return mode != LEDTRIG_BLKDEV_MODE_RO;
>  }
> +
> +
> +/*
> + *
> + *	Periodically check for device acitivity and blink LEDs
> + *
> + */
> +
> +static void blkdev_blink(const struct ledtrig_blkdev_led *const led)
> +{
> +	unsigned long delay_on = READ_ONCE(led->blink_msec);
> +	unsigned long delay_off = 1;	/* 0 leaves LED turned on */
> +
> +	led_blink_set_oneshot(led->led_dev, &delay_on, &delay_off, 0);
> +}
> +
> +static void blkdev_update_disk(struct ledtrig_blkdev_disk *const disk,
> +			       const unsigned int generation)
> +{
> +	const struct block_device *const part0 = disk->gd->part0;
> +	const unsigned long read_ios = part_stat_read(part0, ios[STAT_READ]);
> +	const unsigned long write_ios = part_stat_read(part0, ios[STAT_WRITE])
> +				+ part_stat_read(part0, ios[STAT_DISCARD])
> +				+ part_stat_read(part0, ios[STAT_FLUSH]);
> +
> +	if (disk->read_ios != read_ios) {
> +		disk->read_act = true;
> +		disk->read_ios = read_ios;
> +	} else {
> +		disk->read_act = false;
> +	}
> +
> +	if (disk->write_ios != write_ios) {
> +		disk->write_act = true;
> +		disk->write_ios = write_ios;
> +	} else {
> +		disk->write_act = false;
> +	}
> +
> +	disk->generation = generation;
> +}
> +
> +static void blkdev_process(struct work_struct *const work)
> +{
> +	static unsigned int generation;
> +
> +	struct ledtrig_blkdev_led *led;
> +	struct ledtrig_blkdev_link *link;
> +	unsigned long delay;
> +
> +	if (!mutex_trylock(&ledtrig_blkdev_mutex))
> +		goto exit_reschedule;
> +
> +	hlist_for_each_entry(led, &ledtrig_blkdev_leds, leds_node) {
> +
> +		hlist_for_each_entry(link, &led->disks, led_disks_node) {
> +
> +			struct ledtrig_blkdev_disk *const disk = link->disk;
> +
> +			if (disk->generation != generation)
> +				blkdev_update_disk(disk, generation);
> +
> +			if (disk->read_act && blkdev_read_mode(led->mode)) {
> +				blkdev_blink(led);
> +				break;
> +			}
> +
> +			if (disk->write_act && blkdev_write_mode(led->mode)) {
> +				blkdev_blink(led);
> +				break;
> +			}
> +		}
> +	}
> +
> +	++generation;
> +
> +	mutex_unlock(&ledtrig_blkdev_mutex);
> +
> +exit_reschedule:
> +	delay = READ_ONCE(ledtrig_blkdev_interval);
> +	WARN_ON_ONCE(!schedule_delayed_work(&ledtrig_blkdev_work, delay));

You just rebooted a machine if it hit this :(

Please never use WARN_ON() in new code unless the machine is really
broken and you can not do anything else here.

thanks,

greg k-h
