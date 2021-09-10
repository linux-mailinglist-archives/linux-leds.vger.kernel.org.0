Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF08406564
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 03:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhIJBty (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 21:49:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:54510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhIJBtw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 21:49:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1135D61101;
        Fri, 10 Sep 2021 01:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631238522;
        bh=4rEbcia9klYRhMFk/xM9Aun4Pm5+wzcxNJqHpHv6N24=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Cd1xvSkX6QDqPQTuZ8Z5JfPye1PwZKNKBwQcdAxXpPiQ4Wv4/YO4bu7392VM1NImm
         XuqIRhXVDQOmNq6KSr8rWzexPOcCPMDghVxucL/kYlgg2NEUou0rGKI4DQIyM2g3Fy
         mTI9iVfW7eexcWE6vVBtjxAQvSmoU7mFjQLMDUwSWuju4wbAJbEuu/6ThH0xt17RqL
         SIS1ANlgNOPIEgRj4P/eVVLtktiFqy/YnCHyHLePIE2xLTjWgYF7zbT0aY/6PRyG/c
         Lhk66ZB9V/wbFnuqyPdyND3JA8N/JXNsLfrWL+k3ZMB/mEgVAI6ETvK757e2MJofFD
         yJthpusIGSAFA==
Date:   Fri, 10 Sep 2021 03:48:38 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 09/15] leds: trigger: blkdev: Check devices for
 activity and blink LEDs
Message-ID: <20210910034838.4331512d@thinkpad>
In-Reply-To: <20210909222513.2184795-10-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
        <20210909222513.2184795-10-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu,  9 Sep 2021 17:25:07 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> +static void blkdev_blink(const struct ledtrig_blkdev_led *const led)
> +{

Why are you declaring the led variable as const? This is not needed.
Sure, you do not change it, but I have never seen this being used in
this way in kernel.

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

Again, yes, you do not change part0, read_ios or write_ios in this
function, but this does not mean you need to declare them const.

Const is good when you want to declare that a place where a pointer
points to should be constant. You don't need to do it for the pointer
itself, I don't see any benefit from this.

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
> +static bool blkdev_read_mode(const enum ledtrig_blkdev_mode mode)
> +{
> +	return mode != LEDTRIG_BLKDEV_MODE_WO;
> +}
> +
> +static bool blkdev_write_mode(const enum ledtrig_blkdev_mode mode)
> +{
> +	return mode != LEDTRIG_BLKDEV_MODE_RO;
> +}

It would be better to simply do the comparison where it is needed,
since it is so short. These functions aren't needed, they do not
shorten code in any significant way, nor do they make it more readable
(in fact, they make it a little less readable).

> +
> +static void blkdev_process(struct work_struct *const work)

You are again using const where it is not needed.
In fact the work_func_t type does not have it:
  typedef void (*work_func_t)(struct work_struct *work);

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

These two blinks should be one blink, i.e.
  if ((read_act && read_mode) || (write_act && write_mode))
    blink();

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
> +}
> +
>  
>  /*
>   *

