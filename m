Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976974009F0
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 07:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhIDGAy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 02:00:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:58234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhIDGAx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Sep 2021 02:00:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 521A160F5D;
        Sat,  4 Sep 2021 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630735192;
        bh=tG/hZjZBD+mK/NOd2y4t2p8n2AmYLkMolOGzE2ed7G4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AJixo2N7tIbmQVjrcfEhDg7X80YkkdnfaASoWogkT39aPHd6Zpk+ndGaNESyQb1Hf
         mXZfZ2hZ7iLcx/LKt8OQMp3Dwxod92YZC5sQEI3MUTe7A1j4a5ReRgiewG3C3zfp3d
         Iz6WGSj+4s+ok5rmO5u98IBv8X67F0X38dPBsTio=
Date:   Sat, 4 Sep 2021 07:59:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
Message-ID: <YTMLVrCokErmYxEU@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903204548.2745354-16-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 03, 2021 at 03:45:45PM -0500, Ian Pilcher wrote:
> /sys/class/leds/<led>/add_blkdev - to create device/LED associations
> 
> /sys/class/leds/<led>/delete_blkdev to remove device/LED associations
> 
> For both attributes, accept multiple device names separated by whitespace
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-blkdev.c | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-blkdev.c b/drivers/leds/trigger/ledtrig-blkdev.c
> index b2ec85b805d0..db82d37fc721 100644
> --- a/drivers/leds/trigger/ledtrig-blkdev.c
> +++ b/drivers/leds/trigger/ledtrig-blkdev.c
> @@ -509,3 +509,51 @@ static void blkdev_deactivate(struct led_classdev *const led_dev)
>  
>  	module_put(THIS_MODULE);
>  }
> +
> +
> +/*
> + *
> + *	sysfs attributes to add & delete devices from LEDs
> + *
> + */
> +
> +static ssize_t blkdev_add_or_del(struct device *const dev,
> +				 struct device_attribute *const attr,
> +				 const char *const buf, const size_t count);
> +
> +static struct device_attribute ledtrig_blkdev_attr_add =
> +	__ATTR(add_blkdev, 0200, NULL, blkdev_add_or_del);
> +
> +static struct device_attribute ledtrig_blkdev_attr_del =
> +	__ATTR(delete_blkdev, 0200, NULL, blkdev_add_or_del);

DEVICE_ATTR_RO()?  Or something like that?  Do not use __ATTR() for
device attributes if at all possible, worst case, use DEVICE_ATTR()
here.

And the mode settings are odd, are you sure you want that?

> +static ssize_t blkdev_add_or_del(struct device *const dev,
> +				 struct device_attribute *const attr,
> +				 const char *const buf, const size_t count)
> +{
> +	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
> +	const char *const disk_name = blkdev_skip_space(buf);
> +	const char *const endp = blkdev_find_space(disk_name);
> +	const ptrdiff_t name_len = endp - disk_name;	/* always >= 0 */
> +	int ret;
> +
> +	if (name_len == 0) {
> +		pr_info("blkdev LED: empty block device name\n");

Looks like debugging code, please remove.

And how can this ever happen?

> +		return -EINVAL;
> +	}
> +
> +	if (attr == &ledtrig_blkdev_attr_del) {
> +		blkdev_disk_delete(led, disk_name, name_len);
> +	} else {	/* attr == &ledtrig_blkdev_attr_add */
> +		ret = blkdev_disk_add(led, disk_name, name_len);

Why do you have a single attribute callback that does two totally
different things?  Just have 2 different callback functions please, it
makes things much easier to review and maintain over time.

thanks,

greg k-h
