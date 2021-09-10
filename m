Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7454065A0
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 04:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhIJCS1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 22:18:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:33054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229628AbhIJCS1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 22:18:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDD0860F94;
        Fri, 10 Sep 2021 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631240237;
        bh=c3RRvTlhhK0ZHI/AL1jQEm27c30eexogLcOnN7PKsdQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GBh6KPY8KGsZnBUrLVJHkfpVmFJ0F4wvxUnXwaYUFlQwgGBnE58WfIAK5LKN2YDsi
         fGQaSHOQ1JQ1h7p1adt94UKUhxZ19qspyTFSvPONf4tcXdU2/i9eA6p4eAZ388URaC
         llA+6EFoLWaZBJTDthsn1k8aPV26ttdcCr0TsyGl/trS8Aot8N3Gx2ZPvOAby8t5E/
         0a16f9bEhHYnfFWof9HCf1+jIjgHu2/Cs6dqa4kyS3hQVSd7KcMekF9cGfx+t0qJG0
         9GIPIXL94/NPSueE5rvI+ld+Fx8HCm4mjh4K3bl9Uy5evyBJSonCmbfi+XMI8nq1x3
         u25n6NTZhihAg==
Date:   Fri, 10 Sep 2021 04:17:13 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 09/15] leds: trigger: blkdev: Check devices for
 activity and blink LEDs
Message-ID: <20210910041713.4722760a@thinkpad>
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

> +static void blkdev_update_disk(struct ledtrig_blkdev_disk *const disk,
> +			       const unsigned int generation)
> +{
> +	const struct block_device *const part0 = disk->gd->part0;
> +	const unsigned long read_ios = part_stat_read(part0, ios[STAT_READ]);
> +	const unsigned long write_ios = part_stat_read(part0, ios[STAT_WRITE])
> +				+ part_stat_read(part0, ios[STAT_DISCARD])
> +				+ part_stat_read(part0, ios[STAT_FLUSH]);

So your code allows me to use a partition block device (like sda2) to
register with the blkdev LED trigger, but when I do this, the code will
disregard that I just want the LED to blink on activity on that one
partition. Instead you will blink for whole sda, since you are looking
at stats of only part0.

Am I right?

If so, this in unacceptable. The whole point of blkdev trigger is that
you can reliably use it for any block device, and then it will blink
the LED for that device, be it partition or whole disk.

Marek

