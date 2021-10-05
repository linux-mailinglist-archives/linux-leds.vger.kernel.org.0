Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5424232D2
	for <lists+linux-leds@lfdr.de>; Tue,  5 Oct 2021 23:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236625AbhJEV3f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Oct 2021 17:29:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235845AbhJEV3f (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 5 Oct 2021 17:29:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1916260ED4;
        Tue,  5 Oct 2021 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633469264;
        bh=rzpwmOibjz/RTfWHqebQHtast+nMbYYH01BASoYRVz0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aQT6wdf4wapAfsUBMTQ6AmRwaQBsai6g0NEig2DD4L3QM5NNkWglXxXx1xuu4Q1uD
         72EhWIjP0ZwCKhKGrvVNCXIVCtxDifRqLgQQr8k2WbCxAm1jKLElPG+o5HXSpe/Xn4
         sLUXD58Tv3xrcv0gghKSa9a1jj8aI4xlHqeyw7j6Pg9C4O19VBdRCSVOyvBzmQPC1I
         ad+FwRSWhYdEQH7oYENLCLyLMlu3cAlnWZls5xcWufiKvuACs7Nd4FpzWSwJaQfMKb
         3l1L6tfxJmIby36LRzoaHgrImH0pHV7rKEm+4sfBf1GoPJ5uN9FNSvBKFewWVU6xeG
         HfOQDOO9V7SQA==
Date:   Tue, 5 Oct 2021 23:27:38 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        hch@infradead.org
Subject: Re: [RESEND PATCH v5 2/2] leds: trigger: Add block device LED
 trigger
Message-ID: <20211005232738.371df6b8@thinkpad>
In-Reply-To: <20211004155546.1120869-3-arequipeno@gmail.com>
References: <20211004155546.1120869-1-arequipeno@gmail.com>
        <20211004155546.1120869-3-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Ian,

first, as I replied in one of the previous versions: it is not customary
to use the const keyword in Linux the way you do use it, i.e.
  int f(const int var)
Your argument was that this makes the code more safe when changes are
made in the future. Maybe this is true (although in my opinion it is
not), but since this isn't done anywhere in kernel AFAIK, please drop it
in this proposal. If you want to introduce it, you can try sending
proposals to other kernel subsystems. I am almost sure they will be
rejected. Also, I won't give my Reviewed-by for this patch unless you
drop it (or if Pavel or some other long-term maintainer thinks it
should be used).

Second, I really would like to solve the problem looking up the block
device, given name. Since block API does not provide such function, I
think we should try to add it. It does not make sense to not be able to
set, for example "sda1" to trigger a LED, when /sys/class/block/sda1
exists, but someone deleted the /dev/sda1 device file.

Anyway, see other comments below:

On Mon,  4 Oct 2021 10:55:46 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> +/* Device activity type that will make LED blink */
> +enum led_bdev_led_mode {
> +	LED_BDEV_MODE_RO	= 0,
> +	LED_BDEV_MODE_WO	= 1,
> +	LED_BDEV_MODE_RW	= 2
> +};

Please use a bitmap as the netdev trigger does.

> +struct led_bdev_lbd {

Could this be renamed to trig_bdev?

> +struct led_bdev_led {

And this to trig_led?

Also, the led_bdev prefixes everywhere make the code a little confusing,
IMO.
Could this prefix be changed to blkdev_trig? This would be similar to
netdev trigger.

> +/* Delayed work to periodically check for activity & blink LEDs */
> +static DECLARE_DELAYED_WORK(led_bdev_work, led_bdev_process);
>
> +/* How often to run the delayed work - in jiffies */
> +static unsigned int led_bdev_interval;

This is wrong. The interval can't be same for all triggers, this does
not make sense. I want to be able to set different intervals for
different LEDs, as in netdev trigger. Sure maybe not many people will
use it, but the possibility should be there.

The work will then also be per LED and your structures should become
more simple. You won't need to have NxM mapping between LEDs and block
devices.

> +static int led_bdev_activate(struct led_classdev *const led_cdev)
> +{
> +	struct led_bdev_led *led;
> +	int ret;
> +
> +	if (led_bdev_next_index == ULONG_MAX) {

I don't understand why this must be done.

> +		ret = -EOVERFLOW;
> +		goto exit_return;

exit_return label only returns. The whole idea behind using goto in such
a way is to avoid code duplication. Instead you do the opposite. You
can simply do
  return -EOVERFLOW;

> +	}
> +
> +	led = kmalloc(sizeof(*led), GFP_KERNEL);

kzalloc

> +	if (led == NULL) {
> +		ret = -ENOMEM;
> +		goto exit_return;

return -ENOMEM.

> +	}
> +
> +	led->index = led_bdev_next_index++;

This variable led_bdev_next_index never gets subtracted from, it only
increases. So if I enable and disable blkdev trigger ULONG_MAX times,
I won't be able to enable it anymore since you return -EOVERFLOW ?
This doesn't make any sense.

> +	led->led_cdev = led_cdev;
> +	led->blink_msec = LED_BDEV_BLINK_MSEC;
> +	led->mode = LED_BDEV_MODE_RW;
> +	xa_init(&led->linked_lbds);
> +
> +	ret = mutex_lock_interruptible(&led_bdev_mutex);
> +	if (ret != 0)

	if (ret)

we don't do if(ret == 0) and if(ret != 0) normally, instead we do
if(!ret) and if(ret). Explicitly mentioning 0 makes sense when you have
something like
  if (byte == 0x03 || byte == 0x00)

> +		goto exit_free;

> +static ssize_t link_device_store(struct device *const dev,
> +				 struct device_attribute *const attr,
> +				 const char *const buf, const size_t count)
> +{
> +	struct led_bdev_led *const led = led_trigger_get_drvdata(dev);
> +	struct led_bdev_lbd *lbd;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&led_bdev_mutex);
> +	if (ret != 0)
> +		goto exit_return;
> +
> +	lbd = led_bdev_get_lbd(buf, count);
> +	if (IS_ERR(lbd)) {
> +		ret = PTR_ERR(lbd);
> +		goto exit_unlock;
> +	}
> +
> +	if (xa_load(&lbd->linked_leds, led->index) != NULL) {
> +		ret = -EEXIST;
> +		goto exit_put_lbd;
> +	}
> +
> +	ret = led_bdev_link(led, lbd);
> +
> +exit_put_lbd:
> +	if (ret != 0)
> +		led_bdev_put_lbd(lbd);
> +exit_unlock:
> +	mutex_unlock(&led_bdev_mutex);
> +exit_return:
> +	return (ret == 0) ? count : ret;

	return ret ? : count;

> +static struct block_device *led_bdev_get_bdev(const char *const buf,
> +					      const size_t count,
> +					      const fmode_t mode)
> +{
> +	struct block_device *bdev;
> +	char *path;
> +
> +	path = kmemdup(buf, count + 1, GFP_KERNEL);  /* include null */
> +	if (path == NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (path[count - 1] == '\n')
> +		path[count - 1] = 0;
> +
> +	bdev = blkdev_get_by_path(path, mode, THIS_MODULE);

And this is what we should discuss with blk API people. I would really
like to find the block device by name as seen in /sys/class/block.

> +static void led_bdev_update_lbd(struct led_bdev_lbd *const lbd)
> +{
> +	unsigned long read_ios, write_ios;
> +
> +	if (lbd->generation != led_bdev_generation) {
> +
> +		read_ios = part_stat_read(lbd->bdev, ios[STAT_READ]);
> +
> +		write_ios = part_stat_read(lbd->bdev, ios[STAT_WRITE])
> +				+ part_stat_read(lbd->bdev, ios[STAT_DISCARD])
> +				+ part_stat_read(lbd->bdev, ios[STAT_FLUSH]);

Wrong indentation.

Also discards and flushed should be separate (I want to be able to set
"blink on dicard" and "blink on flush").

> +
> +		if (lbd->read_ios != read_ios) {
> +			lbd->read_act = true;
> +			lbd->read_ios = read_ios;
> +		} else {
> +			lbd->read_act = false;
> +		}

	lbd->read_act = lbd->read_ios != read_ios;
	lbd->read_ios = read_ios;

> +		lbd->generation = led_bdev_generation;

I don't like this led_bdev_generation. Can't we somehow do this without
a static variable??

Marek
